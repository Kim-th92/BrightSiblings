<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="resources/css/admin_board_list.css">
<link rel="stylesheet" type="text/css" href="resources/css/write.css">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="resources/js/write.js"></script>

</head>
<body>
	<%@include file="adminpage.jsp"%>
		<div class="admin_section" style="background-image: url('resources/image/background.png'); background-repeat: no-repeat; background-attachment: fixed; background-size: cover;" >
	
	<!-- 스크롤 높이 확인 -->
	<div id="container">
		<div id=log></div>
	</div>

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
					<button class="loadmore" type="button" value="load more..." onclick="start()" id="stopbutton">Load more...</button>
				</div>
			</section>
		</article>
	</div>
	<script type="text/javascript">
	
	function log(str){
		$(log).text(str);
	}
	
	var currentPage = 1;   
    var loginMemberNo = ${login.member_no};
    var scrollTab = 30;     
    
    function start() {   // 스크롤이 바닥을 찍으면 동작하는 조건
          
             $.ajaxSettings.traditional = true;   // ajax 인코딩 문제로 추가
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
                   var pagingStop = results.pagingStop;   // DB에 저장된 게시글의 마지막 페이지 번호를 가져옴. 이벤트 막기
                   
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
                          + '</div>'      //replyProp </div
                          + '</div>'      //replyWrap </div
                          + '</div>';   //feedWrap <div
                   });
                   $("#abctest").append(str);
                   if(currentPage > pageingStop){
                	   alert(scrollTab)
                   }
                }, error: function() {
                   console.log('값 전달 실패');
                   }
             }); // ajax
          
       } // 스크롤 닫기
   

					
	</script>	
</body>
</html>