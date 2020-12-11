<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/mypage_main.css">
</head>
<body>
<%@include file="header.jsp" %>

<section>

	<div id="profile-section">
	<div id="main-container">
		<div id="mypage-photo">
			<div>
				<img src="${login.member_profile}"/>
			</div>
			<div>
				<h1>${login.member_name }</h1>
			</div>
		</div>
		<div id="mypage-navbar">
			<ul>
				<li><a href="#">게시글</a></li>
				<li><a href="#">친구</a></li>
				<li><a href="#">식단</a></li>
				<li><a href="#">운동</a></li>
				<li><button>프로필편집</button></li>
			</ul>
		</div>
	</div>
	</div>
</section>

</body>
</html>