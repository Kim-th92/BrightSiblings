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
  <button class="submit" onclick="namecheck()"><span >인증번호 발송</span></button>
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
	var tempPw;
	var authkey;
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
						$('.authkey').show();
						timer();
						$.ajax({
							url:'mailsend.do?member_email='+member_email,
							type:'GET',
							success:function(mgg){
								console.log(mgg)
								alert(mag.authkey);
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


function check(){
	var authkeyinput = $('.authkey').val();
	if(!authkeyinput){
		alert("인증번호를 입력하세요");
		return false;
	}
	
	if(authkeyinput !=  authkey){
		alert("잘못된 인증번호입니다 인증번호를 다시 입력해주세요. ");
		authkeyinput.val = "";
		return false;
	}
	
	if(authkeyinput == authkey){
		alert("인증완료 ");	
		
	}
}




function timer(){
	//타이머 
 	var time = 180; //  3분시간 제한
 	var min = "";
 	var sec = ""; 
 	
 	//1초씩 실행되는 함수 
 	var x = setInterval(function(){
 		min = parseInt(time/60) ;//몫계산
 		sec = time%60;               //나머지 계산
 		
 		document.getElementById("countdown").innerHTML = min + ':' +sec ;
 		
 		if(time<0){
 			clearInterval(x); 
 			document.getElementById("countdown").innerHTML = "인증시간이 초과되었습니다. 다시 시도해주세요.";
 		}
 	},1000);

}

</script>
</html>