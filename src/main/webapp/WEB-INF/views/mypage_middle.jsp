<%@page import="org.springframework.web.util.WebUtils"%>
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
				<div>
				<form method="post" id="uploadprofilepic" enctype="mulipart/form-data">
				<input type="file" name="file"  id="profile-file"  accept="image/gif,image/jpg,image/jpeg,image/png" style="display:none"/></form>
				<button id="profile-pic-add" title="사진편집" onclick="document.getElementById('profile-file').click();"><i class="fas fa-camera"></i></button></div>
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
				<li><a id="addinfo" href="mypage_addinfo.do">내 정보 편집</button></li>
			</ul>
		</div>
	</div>
	</div>
</div>
<script>


$('#profile-file').change(function(){
	
	var form = $('#uploadprofilepic')[0];
	console.log(form);
	var formData = new FormData(form);
	console.log(formData);
	$.ajax({
		url : "profilePicUpload.do"
			, type : "POST"
		        , processData : false
		        , contentType : false
		        , data : formData
		        , success:function(msg) {
		        	console.log(msg);
		        	alert("사진 수정 완료 !");
		        	location.reload();
		        },error:function(err){
		        	console.log(err)
		        }
	});
})



</script>

</body>
</html>
