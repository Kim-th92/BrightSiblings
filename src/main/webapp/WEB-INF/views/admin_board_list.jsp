<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="resources/css/main.css">
<link rel="stylesheet" type="text/css" href="resources/css/write.css">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="resources/js/write.js"></script>

<style type="text/css">
/* 스크롤 높이 확인 css */
#log {
	position: fixed;
	top: 0;
	left: 0;
	width: 100px;
	height: 50px;
	background-color: rgba(0, 0, 0, 0.7);
	color: white;
	text-align: center;
	line-height: 50px;
}
/* 스크롤 높이 확인 끝 */
</style>


</head>
<body>
	<%@include file="adminpage.jsp"%>
	<div class="admin_section">

		<!-- 		스크롤 높이 확인 -->
		<div id="container">
			<div id="log">0</div>
		</div>
		<!-- 		스크롤 높이 확인 끝 -->
		<!-- 		스크롤 더 보기 버든 -->
		<input type="button" value="글 더보기" onclick="start()" id="stopbutton" />

		<article id="mainWrap">

			<section id="board" style="background-color: ghostwhite;">
				<div id="boardDiv">
					<c:choose>

						<c:when test="${empty list }">
							<div class="writeWrap">
								<p>------------------------게시글이
									없습니다.------------------------</p>
							</div>
						</c:when>
						<c:otherwise>
							<c:forEach items="${list }" var="list" varStatus="status">
								<div class="feedWrap">
									<div class="feedProp">
										<img src="${np[status.index].member_profile }"> <span>${np[status.index].member_name }</span>
										<c:if test="${login.member_no eq list.member_no  }">
											<input type="button" value="수정"
												onclick="location.href='update.do?board_no=${list.board_no }'">
											<input type="button" value="삭제"
												onclick="location.href='delete.do?board_no=${list.board_no }'">
										</c:if>
									</div>
									<div class="feedContent">
										<p>${list.board_content }</p>
									</div>
									<div class="feedImage">
										<c:forEach items="${url[status.index]}" var="url">
											<img src="${url}">
										</c:forEach>
									</div>
									<div class="likeWrap">
										<img id="like" src="../../resources/image/red_heart.png"
											style="width: 15px; height: 15px;"> 0

										<!-- 좋아요-->
									</div>
									<div class="replyWrap">
										<c:forEach items="${reply[status.index] }" var="rep">
											<p>
												<span>${rep.member_id }</span>${rep.reply_content }</p>
										</c:forEach>

										<div class="replyProp">
											<img src="${login.member_profile }">
											${login.member_name}
											<form action="writeReply.do" method="post">
												<input type="hidden" value="${list.board_no }"
													name="board_no"> <input type="text"
													placeholder="댓글 작성" name="reply_content"> <input
													type="submit" value="입력" />
											</form>
										</div>

									</div>
								</div>
							</c:forEach>
						</c:otherwise>

					</c:choose>
					<div id="abctest"></div>

				</div>
			</section>
		</article>
	</div>
	<script type="text/javascript">
			function log(str) {
					$('#log').text(str);
			}
			// 스크롤 높이 확인 끝
			
			var currentPage = 1;
			var loginMemberNo = ${login.member_no};
			var scrollTab = 30;
			
			
			$(window).scroll(function() {
				var height = $(document).scrollTop();
				log(height);
			    if (scrollTab == height) {
					$.ajaxSettings.traditional = true;
					$.ajax({
						method: "POST",
						url: "admin_board_paging.do",
						data: {"currentPage" : currentPage},
						success: function(results) {
							currentPage++;
							
							scrollTab = scrollTab + 30;
							
							console.log(results);
							
							console.log('값 전달 성공');

							var pagingList = results.pagingList;
							var pagingNpList = results.pagingNpList;
							var pagingUrlList = results.pagingUrlList;
							var pagingRepList = results.pagingRepList;
							var pagingStop = results.pagingStop;	// 이벤트 막기 관련
							
							var str = '';
								    
							$.each(pagingList, function(i){
								str += '<div class="feedWrap">'
								     + '<div class="feedProp">'
								     + '<img src=' + pagingNpList[i].member_profile + '/> <span>' + pagingNpList[i].member_name + '</span>';
							
								if(loginMemberNo == results.pagingList[i].member_no) { 		
									str += '<input type="button" value="수정" onclick="location.href=' + "'" + pagingList[i].board_no +"'" + '">'
									     + '<input type="button" value="삭제" onclick="location.href=' + "'" + pagingList[i].board_no +"'" + '">';
								}
								str += '</div>'
									 + '<div class="feedContent">'
									 + '<p>' + pagingList[i].board_content + '</p>'
									 + '</div>';
								     + '<div class="feedImage">';
								     + '<img src="' + pagingUrlList[i] + '"/>'
									 + '</div>';
								     + '<div class="likeWrap">'
									 + '<img id="like" src="../../resources/image/red_heart.png" style="width: 15px; height: 15px;"> 0'
									 + '</div>'
									 + '<div class="replyWrap">';
				  					 + '<p><span>' + pagingRepList[i].member_id + '</span>' + pagingRepList[i].reply_content + '</p>';
								 str += '<div class="replyProp">'
									 + '<img src="${login.member_profile }">${login.member_name}'
									 + '<form action="writeReply.do" method="post">'
									 + '<input type="hidden" value="'+ pagingList[i].board_no +'" name="board_no">' 
									 + '<input type="text" placeholder="댓글 작성" name="reply_content">'
									 + '<input type="submit" value="입력" />'
									 + '</form>'
									 + '</div>'		//replyProp </div
									 + '</div>'		//replyWrap </div
									 + '</div>';	//feedWrap <div
							});
							$("#abctest").append(str);
							if(currentPage > pagingStop){
								alert(scrollTab)
							}
						}, error: function() {
							console.log('값 전달 실패');
						}
					});
				}
			});
					
	</script>	
</body>
</html>