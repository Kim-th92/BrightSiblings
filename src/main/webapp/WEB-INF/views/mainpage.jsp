<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="resources/css/main.css">
<link rel="stylesheet" type="text/css" href="resources/css/scroll.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
</head>
<body>
<%@include file="header.jsp" %>


<article id="mainWrap">
	<section id="navi">
	left navi section<br/>
		<ul>
			<li>1st Navi</li>
			<li>2nd Navi</li>
			<li>3rd Navi</li>
			<li>4th Navi</li>
		</ul>
	</section>
</article>

<article id="newsFeed">	
	<section id="board">
		<div id="boardDiv">
					<c:choose>
					
						<c:when test="${empty list }">
							<div class="writeWrap">
								<input type="button" value="글쓰기" onclick="location.href='write.do'" />
							</div>
						
						</c:when>
						
						
						<c:otherwise>
							<div class="writeWrap">
								<input type="button" value="글쓰기" onclick="location.href='write.do'" />
							</div>
							<div class="container" id="container">
							<c:forEach items="${list }" var= "list" varStatus="status">
								<input id="boardMemberNo" type="hidden" value="글쓴놈의 회원번호 : ${list.member_no }">
								<input id="loginMemberNo" type="hidden" value="로그인한 놈의 회원번호 : ${login.member_no }">
								<div class="feedWrap" id="feedWrap">
									<div class="feedProp">
										<img src="${np[status.index].member_profile }">
										<span>${np[status.index].member_name }</span>
										<c:if test="${login.member_no eq list.member_no  }">
											<input type="button" value="수정" onclick="location.href='update.do?board_no=${list.board_no }'">
											<input type="button" value="삭제" onclick="location.href='delete.do?board_no=${list.board_no }'">
										</c:if>
									</div>
									<div class="feedContent">
										<p>${list.board_content }</p>
									</div>
									<div class="feedImage">
							
										<c:forEach items="${url[status.index] }" var = "url">
											<img src="${url }">
										</c:forEach>
									</div>
									<div class="likeWrap">
										<img src="/dabom/resources/profile_img/heart.png" style="width:15px; height: 15px;"> 0
										<!-- 좋아요-->
									</div>
									<div class="replyWrap">
										<div class="replyProp">
											<img src="${login.member_profile }">
											${login.member_name}		
											<input id="replyContent" type="text" placeholder="댓글 작성" id="writeReply">		
											<!--  <input onkeyup="enterkey();" type="hidden"	onclick="${list.board_no}" /> -->

										</div>
										
									</div>
								</div>			
							</c:forEach>
							</div>
						</c:otherwise>
						
					</c:choose>
			
		</div>
		
		<div class="loading">
        	<div class="ball"></div>
        	<div class="ball"></div>
        	<div class="ball"></div>
    	</div>
    
	</section>
	
	<section id="friendList">
		<div id="friendDiv">
	friend list
		</div>
	</section>
	
	<script type="text/javascript">
		function enterkey() {
		     if (window.event.keyCode == 13) {
		             // 엔터키가 눌렸을 때 실행할 내용
		             writeReply();
		     }
		}

		function writeReply(){
			
			var replyContent = $("#replyContent").val().trim();
			// 댓글 내용
			var boardNo = $("#boardNo").val().trim();
			// 게시판 번호
			
			var replyData = {
					"reply_content" : replyContent,
					"board_no" : boardNo
			};
			
			if (replyContent == null || replyContent == ""){
				return false;
			} else{
				$ajax({
					type : "post",
					url : "/dabom/writeReply.do",
					data : JSON.stringify(replyData),
					contentType : "application/json",
					success : function(msg){
						console.log(msg);
						location.reload();
					},
					error : function(err){
						console.log(err);
					}
				})				
			}
			
		}
	</script>
	
</article>


<script src="resources/js/scroll.js"></script>


</body>
</html>