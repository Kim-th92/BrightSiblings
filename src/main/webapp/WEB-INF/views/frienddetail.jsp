<%@page import="java.util.List"%>
<%@page import="com.bs.dabom.model.dto.Member_Dto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${dto.member_name} 님의 페이지 입니다. </title>
<%@include file="header.jsp" %>
<link rel="stylesheet" href="resources/css/frienddetail.css"/>
</head>
<body>

<div id="section">
	<div id="profile-section">
	<div id="main-container">
		<div id="mypage-photo">
			<div id ="mypage-profileimg">
				<img src="${dto.member_profile}"/>
			</div>
			<div>
				<h1>${dto.member_name }</h1>
			</div>
		</div>
		<div id="mypage-navbar">
			<ul>
				<li><a id="board" href="">게시글</a></li>
				<li><a id ="friends" href="">친구</a></li>
				<li><a id="food" href="">식단</a></li>
				<li><a id="exercise" href="">운동</a></li>
				
		
				<c:choose>
					<c:when test="${res eq 1}">
					<li><button onclick ="" class="friend"><i class=" fab fa-facebook-messenger"></i>메세지보내기</button>
					<button onclick="" class="friend"><i class=" fas fa-user-minus"></i>친구차단</button></li>
					</c:when>
					<c:otherwise>
					<li><button onclick="" id ="request-friend"> <i class="fas fa-user-plus"></i>친구추가</button></li>
					</c:otherwise>
				</c:choose>

			</ul>
		</div>
	</div>
	</div>
</div>

	<h1>${dto.member_name}의 페이지 입니다.</h1>
</body>
</html>