<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/findpw.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<body>

  <h2><span class="entypo-key"></span> 비밀번호 찾기 </h2>
 
  <span class="entypo-user inputUserIcon">
     <i class="fa fa-user"></i>
   </span>
  <input type="text" class="member_id" placeholder="아이디를 입력해 주세요 	"/>
 
  <span class="entypo-mail inputPassIcon">
   </span>
  <input type="text" style ="width:300px;  display:inline-block;" class="member_email"placeholder="이메일을 입력해주세요 "/>  
  <button class="submit" onclick="namecheck()"><span >임시비밀번호 발급</span></button>
<p style="display:none;" class="err"></p> 
<input style =" display:none;" type="text" class="authkey" placeholder="인증번호를 입력해 주세요. 	"/>
  

  <span id="countdown"></span>
  <div id ="temppw"></div>
   
</body>
<script type="text/javascript">
$('document').ready(function(){
	$('.authkey').hide();
});

$(".user").focusin(function(){
  $(".inputUserIcon").css("color", "#e74c3c");
}).focusout(function(){
  $(".inputUserIcon").css("color", "white");
});

$(".pass").focusin(function(){
  $(".inputPassIcon").css("color", "#e74c3c");
}).focusout(function(){
  $(".inputPassIcon").css("color", "white");
});

function namecheck(){
	var member_id = $('.member_id').val().trim();
	var member_email = $('.member_email').val().trim();
	var checkValue = {
			'member_id' : member_id,
			'member_email' : member_email
	};
	
	if (member_id == null || member_id == "" || member_email == null
			|| member_email == "") {
		$(".err").show();
		$(".err").html("이름 또는 메일을 제대로 입력해 주세요!");
		$(".err").css("color", "red");
		$(".err").css("font-size","9pt");
	} else {
		$.ajax({
			type : "post",
			url : "findpwcheck.do",
			data : JSON.stringify(checkValue),
			contentType : "application/json",
			success : function(msg) {
				if (msg.check == 'true') {
						$.ajax({
							url:'mailsend.do?member_email='+member_email,
							type:'GET',
							success:function(data){
								console.log(data)
								if(data.res =='ok'){
									alert('임시비밀번호 정상발급 되었습니다!');
								}else{
									alert("실패");
								}
								
							},
							error:function(err){
								console.log(err)
								alert(err);
							}
							
						});	
					}else{
						$(".err").show();
						$(".err").html("입력하신 정보로 조회된게 없습니다.이름과 이메일을 다시 확인해 주세요. ");
						$(".err").css("color", "red");
						$(".err").css("font-size","9pt");
					}
			},
			error : function(msg) {
				console.log(msg);
				alert("통신 실패");
			}
		});
	}
}

</script>
</html>