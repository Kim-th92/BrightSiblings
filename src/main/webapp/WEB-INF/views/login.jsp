<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>다이어트에 봄이왔따 </title>
<link rel="stylesheet" href="resources/css/login.css">
<link rel="shortcut icon" href="resources/image/favicon.png">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<body>

	<div id="main-container">
		<div id="container-left">
			<div id="chartdiv"></div>
			<div id="content"><h1>다이어트의 봄이찾아올거예요~</h1></div>
		</div>
		<div id="container-right">
			<div id="login-form">
				<form action="/ajaxlogin.do" method="post">
					<h1>로그인</h1>
					<div class="inputarea">
						<input type="text" name="member_id"> <span data-placeholder="아이디"></span>
					</div>

					<div class="inputarea">
						<input type="password" name="member_pw"> <span
							data-placeholder="비밀번호"></span>
					</div>
					<table>
						<tr>
							<td colspan="2" class="err" style="padding: 10px 0px;"></td>
						</tr>
						<tr>
							<td colspan="2"><button type="submit" class="logbtn">로그인</button></td>
						</tr>
						<tr>
							<td colspan="2"><a href="${naver_url}"><img style ="width:200px;"alt="네이버로그인" src="resources/image/naver.PNG"></a></td>
						</tr>
						<tr>
							<td colspan="2"><a href="${google_url}"><img style ="width:200px;"alt="구글로그인" src="resources/image/google.png"></a></td>
						</tr>
						<tr>
							<td colspan="2" style="text-align: center; margin-top: 10px;">
								<a href="findidpw.do">아이디 패스워드 찾기</a> | <a href="register.do">회원가입</a>
							</td>
						</tr>
					</table>
				</form>
			</div>
		</div>

	</div>
	<div id="footer"></div>


	<script type="text/javascript">
	$(function(){
		
		$(".err").hide();
	});
	
	function login(){
		var memberid = $("[name='member_id']").val().trim();
		var memberpw = $("[name='member_px']").val().trim();
		
		var loginValue = {
			"member_id" : memberid,
			"member_pw" : memberpw
				
		};

		if(memberid ==null ||memberid =="" || memberpw==null || memberpw==""){
			alert("ID 혹은 PW를 확인해주세요");
		}else{
			$.ajax({
				type:"post",
				url:"ajaxlogin.do",
				data:JSON.stringify(loginValue),
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
				error:function(){
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