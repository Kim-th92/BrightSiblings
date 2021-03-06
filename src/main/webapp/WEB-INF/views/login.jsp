<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
    <% response.setHeader("Pragma", "no-cache"); 
    response.setHeader("Cache-Control", "no-cache"); 
    response.setHeader("Cache-Control", "no-store"); 
    response.setDateHeader("Expires", 0L); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>다이어트에 봄이왔따</title>
<link rel="stylesheet" href="resources/css/login.css">
<link rel="shortcut icon" href="resources/image/cherry-blossom.png">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Song+Myung&display=swap" rel="stylesheet">
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js">
	
</script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/animejs/2.0.2/anime.min.js"></script>

<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
<script src="https://apis.google.com/js/client:platform.js?onload=start"
	async defer>
	
</script>
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>

<body>

	<div id="main-container">
		<div id="container-left">
			<div id="chartdiv"></div>
			<div id="content">
				<h1 class="ml6">
					<span class="text-wrapper"> <span class="letters"><b style="color:#cc0044">다</b>이어터들에게 <b style="color:#cc0044">봄</b>이왔어요</span>
					</span>
				</h1>
			</div>
		</div>
		<div id="container-right" data-aos="fade-up">
			<div id="login-form">
				<img style="width: 100px; height: 100px;" alt="로고"
					src="resources/image/cherry-blossom.png">
				<h1>다봄</h1>
				<div class="inputarea">
					<input type="text" id="member_id" name="member_id"
						placeholder="아이디" />
				</div>

				<div class="inputarea">
					<input type="password" id="member_pw" name="member_pw"
						placeholder="비밀번호" />
				</div>
				<table>
					<tr>
						<td colspan="2" class="err" style="padding: 10px 0px;"></td>
					</tr>
					<tr>
						<td colspan="2"><button onclick="login();" class="logbtn">로그인</button></td>
					</tr>
					<tr>
						<td colspan="2" style="text-align: center; margin: 10px;"><a
							href="register.do">회원가입</a> | <a style ="cursor:pointer;" onclick="window.open('findpw.do','popup','width=500px,top=300,left=500,height=300px')">ID/PW찾기</a></td>
					</tr>
					<tr>
						<td colspan="2"><a href="${kakao_url}"><img
								style="width: 200px;" alt="카카오로그인"
								src="resources/image/kakao.png"></a></td>
					</tr>
					<tr>
						<td colspan="2"><a href="${naver_url}"><img
								style="width: 200px;" alt="네이버로그인"
								src="resources/image/naver.PNG"></a></td>
					</tr>


				</table>
			</div>
		</div>

	</div>

	<div id="footer">
		<p style="text-align:center;">&copy; 2020 BrightSiblings | <a href="#" style="text-decoration: none; color: black;" onclick="alert('규태 태형 서원 다희 보민 현준 / 20.01.07 KH')">Dabom</a></p>
	</div>

	<script>
		AOS.init({
			delay : 300,

		});
	</script>

	<script type="text/javascript">
		$(function() {

			$(".err").hide();
		});

		function login() {
			var memberid = $("#member_id").val().trim();
			var memberpw = $("#member_pw").val().trim();

			var loginValue = {
				"member_id" : memberid,
				"member_pw" : memberpw
			};

			if (memberid == null || memberid == "" || memberpw == null
					|| memberpw == "") {
				$(".err").show();
				$(".err").html("ID또는 PW를 제대로 입력해주세요!");
				$(".err").css("color", "red");
				$(".err").css("font-size","10pt");
			} else {
				$.ajax({
					type : "post",
					url : "/dabom/ajaxlogin.do",
					data : JSON.stringify(loginValue),
					contentType : "application/json",
					success : function(msg) {
						if (msg.check == true & msg.del != true) {
							if(msg.role == true){
								location.href = "admin.do"
							} else {
							location.href = "mainpage.do"
							}
						}else if(msg.check == true & msg.del ==true){
							$(".err").show();
							$(".err").html("탈퇴한 회원입니다. 재가입 해주세요!");
							$(".err").css("color", "red");
							$(".err").css("font-size","9pt");

						}else {
							$(".err").show();
							$(".err").html("ID 혹은 PW가 잘못되었습니다.");
							$(".err").css("color", "red");
							$(".err").css("font-size","10pt");
						}
					},
					error : function(msg) {
						console.log(msg);
						alert("통신 실패");
					}
				});
			}

		}
		

		var textWrapper = document.querySelector('.ml6 .letters');
	textWrapper.innerHTML = textWrapper.textContent.replace(/\S/g, "<span class='letter'>$&</span>");

		anime.timeline({loop: false})
			  .add({
			    targets: '.ml6 .letter',
			    translateY: ["1.1em", 0],
			    translateZ: 0,
			    duration: 1000,
			    delay: function(el, i){
			    	return  50 * i;
			    } 
			  }).add({
			    targets: '.ml6',
			    opacity: 1,
			    duration: 50,
			    easing: "easeOutExpo",
			    delay: 50
			  });
	
	</script>

	<!-- 워드클라우드 임포트 코드-->
	<script src="https://cdn.amcharts.com/lib/4/core.js"></script>
	<script src="https://cdn.amcharts.com/lib/4/charts.js"></script>
	<script src="https://cdn.amcharts.com/lib/4/plugins/wordCloud.js"></script>
	<script src="https://cdn.amcharts.com/lib/4/themes/animated.js"></script>

	<script src="resources/js/wordcloud.js"></script>
</body>
</html>