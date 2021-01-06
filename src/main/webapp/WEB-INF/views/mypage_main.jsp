<%@ page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="resources/css/mypage_main.css" />
<body>
<jsp:include page="header.jsp"></jsp:include>
<jsp:include page="mypage_middle.jsp"></jsp:include>

	<div id= "mainWrapper">
		
		<div id="mainImages">
		
			<p>사진들</p>
			<hr style="width:90%; text-align:center; margin-left: 30px;">
			<div>
				<c:forEach var="url" items="${url }">
					<img src="${url }" style="width:30%; height:150px;">&nbsp;
				</c:forEach>
			</div>
		</div>
		
		
		<div id="mainWrite">
		
			<p>지금 당신의 상태를 알려주세요.</p>
			<hr style="width:90%; text-align:center; margin-left: 45px;">
			<c:choose>
				<c:when test="${empty list }">
							<p>첫 글을 작성해보세요 :D</p>
				</c:when>
				<c:otherwise>
						<c:forEach var="list" items="${list }">
							<div class="feedWrap">
								<div class="feedProp">
									<img src="${login.member_profile }">
									${login.member_id}
									<fmt:parseDate value="${list.board_regdate }" var="regdate" pattern="yyyy-MM-dd" />
									<fmt:formatDate value="${regdate }" pattern="MM월 dd일" /></p>
								</div>
								<div class="feedContent">
									${list.board_content }
								</div>
								<div class="feedImage">
									<c:forEach var="url" items="${list.urlList }" >
										<img src="${url }">
									</c:forEach>
								</div>
								
								<div class="feedReply">
									<c:forEach var="rep" items="${list.replyList }">
										<p>${rep }</p>
									</c:forEach>
									<form action="writeReply.do" method="post">
												<input type="hidden" value="mypage" name="root">
												<input type="hidden" value="${list.board_no }" name="board_no"> 
												<input type="text" placeholder="" name="reply_content" style="height:18px; font-size: 10pt;">
												 <input type="submit" value="입력" />

									</form>
									 
									
								</div>
							
							</div><!-- feedWrap -->
						</c:forEach>
				</c:otherwise>
			</c:choose>
			
		</div>
		
		
	</div>
</body>
</html>