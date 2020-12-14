<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=UTF-8");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>모달 레이아웃</title>
<link rel="stylesheet" type="text/css" href="resources/css/payinfo.css" />
</head>
<body>
	<a href="#" class="open">팝업</a>
	<!-- 팝업 시작 -->
	<div class="popup">

		<h2>결제 정보 입력</h2>

		<div class="popup_body">
			<strong class="logo_pay"> <img
				src="//t1.daumcdn.net/kakaopay/tesla/20181010/pg_web/images/logo_pay.png"
				class="img_g" alt="카카오페이">
			</strong>
			<p class="desc_payask">
				결제요청 메시지 전송을 위해<br>아래 정보를 입력해주세요.
			</p>
			<form action="payment.jsp" autocomplete="off">
				<input type="hidden" name="member_no" value="1" />
				<table>
					<tr>
						<th class="pay_ask">성명</th>
					</tr>
					<tr>
						<td class="pay_input"><input class="text_color" type="text"
							name="name" placeholder="예) 홍길동" style="color: #000000;" /></td>
					</tr>
					<tr>
						<th class="pay_ask">후원금액</th>
					</tr>
					<tr>
						<td class="pay_input"><input class="text_color" type="text"
							name="pay"
							oninput="this.value = this.value.replace(/[^0-9.]/g,'').replace(/(^0+)/g,'');"
							placeholder="예) 1,000 &#10140 1000" style="color: #000000;" /></td>
					</tr>
					<tr>
						<td class="submit"><input type="submit" value="입력확인"
							style="cursor: pointer;" /></td>
					</tr>
				</table>
			</form>
		</div>

		<a href="#none" class="close"> <img
			src="//t1.daumcdn.net/kakaopay/tesla/20181010/pg_web/images/ico_close.png"
			class="img_g" alt="닫기">
		</a>
	</div>
	<div class="background"></div>
	<script type="text/javascript"
		src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script type="text/javascript">
		$(".open").click(function() {
			$(".popup").show();
			$(".background").show();
		});
		$(".popup_body .close").click(function() {
			$(this).parent().hide();
			$(".background").hide();
		});
	</script>
</body>
</html>