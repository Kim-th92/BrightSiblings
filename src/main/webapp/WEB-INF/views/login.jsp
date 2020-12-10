<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>다이어트에 봄이왔따 </title>
<link rel="stylesheet" href="resources/css/login.css">
<link rel="shortcut icon" href="resources/image/favicon.png">
 <script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js">
  </script>
  <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
  <script src="https://apis.google.com/js/client:platform.js?onload=start" async defer>
  </script>
  <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
  
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
  
<body>

	<div id="main-container">
		<div id="container-left">
			<div id="chartdiv"></div>
			<div id="content"><h1>다이어트의 봄이찾아올거예요~</h1></div>
		</div>
		<div id="container-right" data-aos="fade-left">
			<div id="login-form">
					<h1>로그인</h1>
					<div class="inputarea">
						<input type="text" id = "member_id" name="member_id"/> 
					</div>

					<div class="inputarea">
						<input type="password" id="member_pw" name="member_pw"/>
					</div>
					<table>
						<tr>
							<td colspan="2" class="err" style="padding: 10px 0px;"></td>
						</tr>
						<tr>
							<td colspan="2"><input type="button" value="로그인" onclick="login();"  class="logbtn"></td>
						</tr>
						<tr>
							<td colspan="2"><a href="${kakao_url}"><img style ="width:200px;"alt="카카오로그인" src="resources/image/kakao.png"></a></td>
						</tr>
						<tr>
							<td colspan="2"><a href="${naver_url}"><img style ="width:200px;"alt="네이버로그인" src="resources/image/naver.PNG"></a></td>
						</tr>
						
						<tr>
							<td colspan="2" style="text-align: center; margin-top: 10px;">
								<a href="findidpw.do">비밀 번호를 잊어버리셨나요? </a> <hr/>
								<a href="register.do">회원가입</a>
							</td>
						</tr>
					</table>
			</div>
		</div>

	</div>
	<div id="footer"></div>

	<script>
  AOS.init({
	  delay : 30,
	  
  });
</script>

	<script type="text/javascript">
	$(function(){
		
		$(".err").hide();
	});
	
	function login(){
		var memberid = $("#member_id").val().trim();
		var memberpw = $("#member_pw").val().trim();
		
		var loginValue = {
			"member_id" : memberid,
			"member_pw" : memberpw
		};

		if(memberid ==null ||memberid =="" || memberpw==null || memberpw==""){
			$(".err").show();
			$(".err").html("ID또는 PW를 제대로 입력해주세요!");
			$(".err").css("color","red");
		}else{
			$.ajax({
				type:"post",
				url: "/dabom/ajaxlogin.do",
				data: JSON.stringify(loginValue),
				contentType : "application/json",
				success: function (msg){
					if(msg.check == true){
						location.href="mainpage.do"
					}else {
						$(".err").show();
						$(".err").html("ID 혹은 PW가 잘못되었습니다.");
						$(".err").css("color","red");
					}
				},
				error:function(msg){
					console.log(msg);
					alert("통신 실패");
				}
			});
		}

	}


</script>

	<!-- 워드클라우드 임포트 코드-->
	<script src="https://cdn.amcharts.com/lib/4/core.js"></script>
	<script src="https://cdn.amcharts.com/lib/4/charts.js"></script>
	<script src="https://cdn.amcharts.com/lib/4/plugins/wordCloud.js"></script>
	<script src="https://cdn.amcharts.com/lib/4/themes/animated.js"></script>

	<script src="resources/js/wordcloud.js"></script>
</body>
</html>