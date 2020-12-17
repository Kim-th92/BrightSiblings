<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="resources/css/main.css">
</head>
<body>
<%@include file="header.jsp" %>


<article id="mainWrap">
	<section id="navi">
	left navi section<br/>
	</section>
	
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
							<c:forEach items="${list }" var= "list" varStatus="status">
								<div class="feedWrap">
									<div class="feedProp">
										<img src="${np[status.index].member_profile }">
										<span>닉네임 : ${np[status.index].member_name }</span>
										<input type="button" value="수정" onclick="location.href='update.do?board_no=${list.board_no }'">
										<input type="button" value="삭제" onclick="location.href='delete.do?board_no=${list.board_no }'">
									</div>
									<div class="feedContent">
										<p>${list.board_content } + 어쩌구 뭐시기 뭐시기 뭐시기 컨텐츠다 컨텐츠</p>
									</div>
									<div class="feedImage">
										<img src="${url[status.index].files_url}">
									</div>
									<div class="likeWrap">
										<img src="#"> 0
										<!-- 좋아요-->
									</div>
									<div class="replyWrap">
										<div class="replyProp">
											<img src="${login.member_profile }">
											${login.member_name}		
											<input type="text" placeholder="댓글 작성" onclick="">							
										</div>
										
									</div>
								</div>			
							</c:forEach>
						</c:otherwise>
						
					</c:choose>
			
		</div>
	</section>
	
	<section id="friendList">
		<div id="friendDiv">
	friend list
		</div>
	</section>
	
</article>
</body>
</html>