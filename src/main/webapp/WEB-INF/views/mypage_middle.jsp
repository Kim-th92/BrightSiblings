<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="resources/css/mypage_middle.css">
</head>
<body>
<div id="section">
	<div id="profile-section">
	<div id="main-container">
		<div id="mypage-photo">
			<div id ="mypage-profileimg">
				<img src="${login.member_profile}"/>
			</div>
			<div>
				<h1>${login.member_name }</h1>
			</div>
		</div>
		<div id="mypage-navbar">
			<ul>
				<li><a id="board" href="mypage_main.do">게시글</a></li>
				<li><a id ="friends" href="mypage_friends.do">친구</a></li>
				<li><a id="food" href="mypage_food.do">식단</a></li>
				<li><a id="exercise" href="mypage_exercise.do">운동</a></li>
				<li><button id ="infoupdatebtn">내 정보 편집</button></li>
			</ul>
		</div>
	</div>
	</div>
</div>
</body>
</html>