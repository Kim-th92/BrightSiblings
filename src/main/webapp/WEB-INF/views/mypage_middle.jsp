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
			<div id ="mypage-profileimg" style="position: relative;">
				<img src="${login.member_profile}"/>
				<div>
				<form method="post" id="uploadprofilepic" enctype="mulipart/form-data">
				<input type="file" name="file"  id="profile-file"  accept="image/gif,image/jpg,image/jpeg,image/png" style="display:none"/></form>
				<button id="profile-pic-add" title="사진편집" onclick="document.getElementById('profile-file').click();"><i class="fas fa-camera"></i></button>
				</div>
				<form method="post" id="uploadprofilebgpic" enctype="mulipart/form-data">
				<input type="file" name="file"  id="profile-bg-file"  accept="image/gif,image/jpg,image/jpeg,image/png" style="display:none"/></form>
					<button id="profile-bg-add">배경사진편집</button>
			</div>
			<div id="hidemodal">
				<div class="modalcenter">
					<h1>사진을 선택하시거나, 원하는 사진을 업로드 해보세요!</h1>
						<div id="selectBG" style="display: grid;grid-gap: 10px; margin-left:40px;margin-bottom:60px; grid-template-rows: 200px 200px;grid-template-columns: 1fr 1fr 1fr 1fr;">
							
						</div>
						<input type="button"  class="modalbtn" onclick="document.getElementById('profile-bg-file').click();" value="배경사진 업로드">
						<input type="button" class="modalbtn"  onclick ="uploadByExsist();" value="선택한 사진으로 저장">
						<form method="post" id="uploadprofilebgpic" enctype="mulipart/form-data">
				<input type="file" name="file"  id="profile-bg-file"  accept="image/gif,image/jpg,image/jpeg,image/png" style="display:none"/></form>
				</div>
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
				<li><a id="exercise" href="mypage_exercise.do">런닝</a></li>
				<li><a id="exercise" href="mypage_pose.do">분석</a></li>
				<li><a id="addinfo" href="mypage_addinfo.do">내 정보 편집</a></li>
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
$('#profile-bg-add').click(function(){
	$('#hidemodal').toggle();
	
});


$(document).ready(function(){
	$('#hidemodal').hide();
	var bgProfile = "${login.member_bgprofile}";

	
	$('#mypage-profileimg').css("background-image","url('"+bgProfile+ "')");
	$('#mypage-profileimg').css("background-size","80% 400px");
	$('#mypage-profileimg').css("background-repeat","round");
	var div = "";
	for(var i =1; i < 9;i++){
		var imgSelect= "<div><img style='width:170px ;height:170px;' src='/dabom/resources/image/diet/diet0"+i+".jpg' alt='다이어트사진'>"
								+"<input type='radio' name='bg-select' value='/dabom/resources/image/diet/diet0"+i
								+".jpg'/>"
								+"</div>";
		div += imgSelect;
		
	}
	$('#selectBG').append(div);
	
});

//배경파일업로드시 
$('#profile-bg-file').change(function(){
	
	var form = $('#uploadprofilebgpic')[0];
	var formData = new FormData(form);
	console.log(formData);
	$.ajax({
		url : "profilePicBgUpload.do"
			, type : "POST"
		        , processData : false
		        , contentType : false
		        , data : formData
		        , success:function(msg) {
		        	console.log(msg);
		        	alert("배경사진 수정 완료 !");
		        	location.reload();
		        },error:function(err){
		        	console.log(err)
		        }
	});
})
//선택한 사진 저장할때
function uploadByExsist(){
	  var st = $(":input:radio[name=bg-select]:checked").val();
	  var data = {"bg_profile":st}
	  $.ajax({
			url : "profileExPicBgUpload.do"
				, type : "POST"
			        , data :data
			        , success:function(msg) {
			        	console.log(msg);
			        	alert("배경사진 수정 완료 !");
			        	location.reload();
			        },error:function(err){
			        	console.log(err)
			        }
		});
}


</script>

</body>
</html>
