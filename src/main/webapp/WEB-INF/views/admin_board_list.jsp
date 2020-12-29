<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin_Board_List</title>
<link rel="stylesheet" type="text/css" href="resources/css/main2.css">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

</head>
<body>
	<%@include file="adminpage.jsp"%>
	<div class="admin_section">
		<article id="mainWrap">
			<!-- 		<section id="navi"> -->
			<!-- 			left navi section<br /> -->
			<!-- 			<ul> -->
			<!-- 				<li>1st Navi</li> -->
			<!-- 				<li>2nd Navi</li> -->
			<!-- 				<li>3rd Navi</li> -->
			<!-- 				<li>4th Navi</li> -->
			<!-- 			</ul> -->
			<!-- 		</section> -->

			<section id="board">
				<div id="boardDiv">
					<c:choose>

						<c:when test="${empty list }">
							<!-- 						<div class="writeWrap"> -->
							<!-- 							<input type="button" value="글쓰기" -->
							<!-- 								onclick="location.href='write.do'" /> -->
							<!-- 						</div> -->

						</c:when>


						<c:otherwise>
							<!-- 						<div class="writeWrap"> -->
							<!-- 							<input type="button" value="글쓰기" -->
							<!-- 								onclick="location.href='write.do'" /> -->
							<!-- 						</div> -->
							<c:forEach items="${list }" var="list" varStatus="status">
								<input id="boardMemberNo" type="hidden"
									value="글쓴놈의 회원번호 : ${list.member_no }">
								<input id="loginMemberNo" type="hidden"
									value="로그인한 놈의 회원번호 : ${login.member_no }">

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

										<c:forEach items="${url[status.index] }" var="url">
											<img src="${url }">
										</c:forEach>
									</div>
									<div class="likeWrap">
										<img src="/dabom/resources/profile_img/heart.png"
											style="width: 15px; height: 15px;"> 0
										<!-- 좋아요-->
									</div>
									<div class="replyWrap">
										<div class="replyProp">
											<img src="${login.member_profile }">
											${login.member_name} <input id="replyContent" type="text"
												placeholder="댓글 작성" id="writeReply">
											<!--  <input onkeyup="enterkey();" type="hidden"	onclick="${list.board_no}" /> -->

										</div>

									</div>
								</div>
							</c:forEach>
						</c:otherwise>

					</c:choose>

				</div>
			</section>

			<section id="friendList">
				<div id="friendDiv">friend list</div>
			</section>

			<script type="text/javascript">
// 				function enterkey() {
// 					if (window.event.keyCode == 13) {
// 						// 엔터키가 눌렸을 때 실행할 내용
// 						writeReply();
// 					}
// 				}

// 				function writeReply() {

// 					var replyContent = $("#replyContent").val().trim();
// 					// 댓글 내용
// 					var boardNo = $("#boardNo").val().trim();
// 					// 게시판 번호

// 					var replyData = {
// 						"reply_content" : replyContent,
// 						"board_no" : boardNo
// 					};

// 					if (replyContent == null || replyContent == "") {
// 						return false;
// 					} else {
// 						$ajax({
// 							type : "post",
// 							url : "/dabom/writeReply.do",
// 							data : JSON.stringify(replyData),
// 							contentType : "application/json",
// 							success : function(msg) {
// 								console.log(msg);
// 								location.reload();
// 							},
// 							error : function(err) {
// 								console.log(err);
// 							}
// 						})
// 					}

// 				}

							//스크롤
							//Javascript
// 							var count = 5;
// 							//스크롤 바닥 감지
// 							window.onscroll = function(e) {
// 								//추가되는 임시 콘텐츠
// 								//window height + window scrollY 값이 document height보다 클 경우,
// 								if ((window.innerHeight + window.scrollY) >= document.body.offsetHeight) {
// 									//실행할 로직 (콘텐츠 추가)
// 									count += 5;
// 						$(document).ready(function() {
//   							var win = $(window);

//   							// Each time the user scrolls
//   							win.scroll(function() {
//     						// End of the document reached?
//     							if ($(document).height() - win.height() == win.scrollTop()) {
									
//       								$.ajax({
// 										type: "POST",
// 										url: "boardscroll.do",
// 										data: {
// 											"end_no" : count
// 											},
// 										success: function(msg) {
// 											console.log(msg);
// 											console.log('값 전달 성공');
// 											location.href = "admin_board_list.do"
// 										}, error: function() {
// 											console.log('값 전달 실패')
// 										}
// 									});
// 								}
// 							}
// 						}
				var count = 0;
				$('#pageUpdate').click(function(){
					count += 5;
					$('input[type=hidden]').attr('value', count);
					$('input[type=submit]').submit();
				}
				);
			</script>
		</article>
	</div>
	<form action="admin_board_list2.do" method="post">
		<input type="hidden" name="end_no" value="5">
		<input type="submit" value="더보기">
		<input type="button" value="더보기" id="pageUpdate">
	</form>
</body>
</html>