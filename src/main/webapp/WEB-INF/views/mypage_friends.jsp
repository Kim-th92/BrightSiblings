<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>


<link rel="stylesheet"   href="resources/css/mypage_friends.css">
<body>
<%@include file="header.jsp" %>
<%@include file="mypage_middle.jsp" %>

<div id= "wrapper">
	<div id="friendslist">
		<ul>
			
			<c:choose>
			<c:when test="${empty list }">
				<div class="nofriend"> 
					<p>저런 친구가 없으시군용.. </p>
					<p>친구를 찾아보세요!</p>
				
				</div>
			</c:when>
			<c:otherwise>
				<c:forEach items="${list}" var="dto">
					<li>
						<img src="${dto.member_profile}"/> <a href=""> ${dto.member_name}</a> 
						<button><i class="fas fa-user-plus"></i></button>
						<button><i class="fab fa-facebook-messenger"></i></button>
						<button> <i class="fas fa-user-minus"></i></button>
					</li>
				
				</c:forEach>
			</c:otherwise>
		</c:choose>
		</ul>
	</div>
</div>
</body>
</html>