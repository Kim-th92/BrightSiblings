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
<link rel="stylesheet" type="text/css" href="resources/css/insertdonation.css" />
</head>
<body>

	<!-- 팝업 시작 -->
	<div class="donation_popup">
		<h2>결제 정보 입력</h2>
		<div class="donation_popup_body">
			<strong class="donation_logo_pay"> <img
				src="//t1.daumcdn.net/kakaopay/tesla/20181010/pg_web/images/logo_pay.png"
				class="donation_logo_img" alt="카카오페이">
			</strong>
			<p class="donation_desc_payask">
				결제요청 메시지 전송을 위해<br>아래 정보를 입력해주세요.
			</p>
			<input type="hidden" id="donation_input_hidden" name="member_no" value="${login.member_no}" />
			<table id="donation_table">
				<tr>
					<th class="donation_ask">성명</th>
				</tr>
				<tr>
					<td class="donation_input"><input class="donation_text_color" type="text"
						name="donor" placeholder="예) 홍길동" style="color: #000000;" /></td>
				</tr>
				<tr>
					<th class="donation_ask">후원금액</th>
				</tr>
				<tr>
					<td class="donation_input"><input class="donation_text_color" type="text"
						name="donation"
						oninput="this.value = this.value.replace(/[^0-9.]/g,'').replace(/(^0+)/g,'');"
						placeholder="예) 1,000 &#10140 1000" style="color: #000000;" /></td>
				</tr>
				<tr>
					<td class="donation_submit">
						<input type="button" name="donation_btn" value="입력확인" style="cursor: pointer;" />
					</td>
				</tr>
			</table>
		</div>

		<a href="#none" class="donation_close"> <img
			src="//t1.daumcdn.net/kakaopay/tesla/20181010/pg_web/images/ico_close.png"
			class="donation_close_btn" alt="닫기">
		</a>
	</div>
	<div class="donation_background"></div>


	<script type="text/javascript"
		src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<!-- 	아임포트import -->
	<script type="text/javascript"
		src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
	<script type="text/javascript">
// 		클릭시 팝업
		$("#btn_donation").click(function() {
			$(".donation_popup").show();
			$(".donation_background").show();
 		});
		$(".donation_close>img").click(function() {
			$(".donation_popup").hide();
			$(".donation_background").hide();
		});
		

// 		아임포트api(kakao)
		$(".donation_submit>input").click(function(){
			$(".donation_popup").hide();
			$(".donation_background").hide();
			
			var IMP = window.IMP; // 생략가능
			IMP.init('imp33221017'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용

			IMP.request_pay({
				pg : 'kakaopay',
				pay_method : 'card',
			    merchant_uid : 'merchant_' + new Date().getTime(),
			    name : '후원금',		//결제할 상품?의 명칭
			    amount : $("input[name='donation']").val(),
			    buyer_name : $("input[name='donor']").val(),
			}, function(rsp) {
			    if ( rsp.success ) {
			        var msg = '결제가 완료되었습니다.\n';
			        console.log(rsp);
			        msg += rsp.name + '\n';
			        msg += '후원자 성명 : ' + rsp.buyer_name + '\n';
			        msg += '결제 금액 : ' + rsp.paid_amount + '원';
			    } else {
			        var msg = '결제에 실패하였습니다.';
			        msg += '에러내용 : ' + rsp.error_msg;
			    }
			    alert(msg);
			    $.ajax({
					type: "POST",
					url: "insertdonation.do",
					data: {
						"member_no" : $("#donation_input_hidden").val(),
						"donation" : $("input[name='donation']").val()
						},
					success: function(msg) {
						console.log(msg);
						console.log('값 전달 성공');
					}, error: function() {
						console.log('값 전달 실패')
					}
				});
			});
		});
		
		
	</script>
</body>
</html>