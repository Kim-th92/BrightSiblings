<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="resources/css/mypage_addinfo.css" />
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script type="text/javascript">

	function bmiCalculation1(){
		console.log('실행은됨');
		var height = $("#height1").val();
		var weight = $("#weight1").val();
		var bmi1 = weight/(height*0.01)**2;
		var bmic1 = bmi1.toFixed(2);
		document.getElementById('bmic1').value = bmic1;
	}


	function bmiCalculation(){
		console.log('실행은됨');
		var height = $("#height").val();
		var weight = $("#weight").val();
		var bmi = weight/(height*0.01)**2;
		var bmic = bmi.toFixed(2);
		document.getElementById('bmic').value = bmic;

	}
	
	function adviseCalculation(){
		var height = $("#height").val();
		var weight = $("#weight").val();
		var gender = $("#gender").val();
		var birth = $("#birthday").val();
		var birthday = birth.substring(0,4);
		var now = new Date();
		var age = now.getFullYear()-birthday;
		console.log(height);
		console.log(weight);
		console.log(gender);
		console.log(age);
		var advisekcal = 10*weight + 6.25*height-5*age+5
		console.log(advisekcal);
		document.getElementById('advisekcal').value = advisekcal;
	}
	
	function adviseCalculation1(){
		var height = $("#height1").val();
		var weight = $("#weight1").val();
		var gender = $("#gender1").val();
		var birth = $("#birthday").val();
		var birthday = birth.substring(0,4);
		var now = new Date();
		var age = now.getFullYear()-birthday;
		console.log(height);
		console.log(weight);
		console.log(gender);
		console.log(age);
		var advisekcal1 = 10*weight + 6.25*height-5*age+5
		console.log(advisekcal1);
		document.getElementById('advisekcal1').value = advisekcal1;
	}
	
	
	
	function changeRead(){
		$('.form-control-u').attr('readonly', false);
		alert("수정해주세요");
		$('#update-button').removeAttr("onclick");
		$('#update-button').removeAttr("value");
		$('#bmi1').append('<input type="button" onclick="bmiCalculation1()" value="확인">');
		$('#advise1').append('<input type="button" onclick="adviseCalculation1()" value="확인">')	;
		$('.hidegender').show();
		$('#update-button').attr("value","완료");
		$('#update-button').attr("onclick","end()");
	}
	
	function end(){
		$('#update-button').attr("type","submit");
	}
	
	/*
		if($('#update-button').val() == '완료'){
			console.log($('#update-button').val());
			$('#update-button').attr("type","submit");
		}
		*/
		
	function addinfo_popup(){
			$("#addinfo-insert").hide();
			
		}
		




</script>
<style type="text/css">
</style>
</head>
<body>
	<%@include file="header.jsp"%>
	<%@include file="mypage_middle.jsp"%>

	<div id="container">

		<c:choose>
			<c:when test="${empty addinfo_dto.bmi }">
				<a>값이 없을 떄</a>
				<div id="addinfo-insert">
					<form action="addinfo_insert.do" method="post">
						<h2>정보 추가</h2>


						<div>
							<h4>회원 정보 수정</h4>
							<div class="addinfo" id="divHeight">
								<label for="inputHeight" class="">신장</label>
								<div class="eheck_font">
									<input type="text" class="form-control" id="height"
										data-rule-required="true" placeholder="신장을 입력하세요"
										maxlength="20" name="height"> <span class="span">CM</span>
								</div>
							</div>
							<br />
							<div class="addinfo" id="divWeight">
								<label for="inputWeight" class="">체중</label>
								<div class="eheck_font">
									<input type="text" class="form-control" id="weight"
										data-rule-required="true" placeholder="체중을 입력하세요"
										maxlength="20" name="weight" /> <span class="span">Kg</span>
								</div>
							</div>
							<br />
							<div class="addinfo" id="divGender">
								<label for="inputGender" class="">성별</label>
								<div class="eheck_font">
									<select class="form-control" id="gender" name="gender">
										<option value="M">남성</option>
										<option value="W">여성</option>
									</select>
								</div>
							</div>
							<br />
							<div class="addinfo" id="divTargetWeight">
								<label for="inputTargetWeight" class="">목표 체중</label>
								<div class="eheck_font">
									<input type="number" class="form-control" id="targetweight"
										data-rule-required="true" placeholder="목표 체중을 입력하세요"
										maxlength="10" name="targetweight"> <span class="span">Kg</span>
								</div>
							</div>
							<br />
							<div class="addinfo">
								<label for="inputBmi">BMI(체질량 지수)</label>
								<div class="eheck_font">
									<input type="number" class="form-control" readonly="readonly"
										id="bmic" value="" name="bmi"> <input type="button"
										onclick="bmiCalculation()" value="확인">
								</div>
							</div>
							<br />
							<div class="addinfo" id="divTargetKcal">
								<label for="inputTargetKcal" class="">목표 칼로리</label>
								<div class="eheck_font">
									<input type="number" class="form-control" id="targetkcal"
										data-rule-required="true" placeholder="목표 칼로리를 입력하세요"
										maxlength="10" name="targetkcal"> <span class="span">Calories/day</span>
								</div>
							</div>
							<br />
							<div class="addinfo" id="divAdviseKcal">
								<label for="inputAdviseKcal" class="">권장 칼로리</label>
								<div class="eheck_font">
									<input type="number" class="form-control" id="advisekcal"
										readonly="readonly" data-rule-required="true" value=""
										name="advisekcal"> <span class="span">Calories/day</span>
									<input type="button" onclick="adviseCalculation()" value="확인">
								</div>
							</div>
							<input type="hidden" value="${login.member_birthday }"
								id="birthday"> <input type="submit" value="확인"
								onclick="return addinfo_popup()" /> <input type="button"
								onclick="location.href='cancel.do'" value="취소" />
						</div>
					</form>
				</div>
				<div id="addinfo-background"></div>
			</c:when>

			<c:otherwise>


				<a>값이 있을 때</a>
				<div id="addinfo-update">
					<form action="addinfo_update.do" method="post">
						<h2>회원 추가 정보</h2>


						<div>
							<div class="addinfo_u" id="divHeight">
								<label for="inputHeight" class="">신장</label>
								<div class="eheck_font">
									<input type="text" class="form-control-u" id="height1"
										data-rule-required="true" placeholder="신장을 입력하세요"
										value="${addinfo_dto.height }" readonly="readonly"
										name="height" maxlength="20">
								</div>
							</div>
							<br />
							<div class="addinfo_u" id="divWeight">
								<label for="inputWeight" class="">체중</label>
								<div class="eheck_font">
									<input type="text" class="form-control-u" id="weight1"
										data-rule-required="true" placeholder="체중을 입력하세요"
										value="${addinfo_dto.weight }" readonly="readonly"
										name="weight" maxlength="20">
								</div>
							</div>
							<br />
							<div class="addinfo_u" id="divGender">
								<label for="inputGender" class="">성별</label>
								<div class="eheck_font">
									<c:choose>
										<c:when test="${ addinfo_dto.gender == 'M' }">
											<input type="radio" name="gender" value="M" checked="checked">남 
											<span class="hidegender" style="display: none;"> <input
												type="radio" name="gender" value="W">여
											</span>
										</c:when>
										<c:otherwise>
											<input type="radio" name="gender" value="W" checked="checked">여
											<span class="hidegender" style="display: none;"> <input
												type="radio" name="gender" value="M">남
											</span>
										</c:otherwise>

									</c:choose>
								</div>
							</div>
							<br />
							<div class="addinfo_u" id="divTargetWeight">
								<label for="inputTargetWeight" class="">목표 체중</label>
								<div class="eheck_font">
									<input type="number" class="form-control-u" id="targetweight1"
										data-rule-required="true" placeholder="목표 체중을 입력하세요"
										value="${addinfo_dto.targetweight }" readonly="readonly"
										name="targetweight" maxlength="10">
								</div>
							</div>
							<br />
							<div class="addinfo_u" id="divBmi">
								<label for="inputBmi">BMI(체질량 지수)</label>
								<div class="eheck_font" id="bmi1">
									<input type="number" class="form-control-u" readonly="readonly"
										step='0.01' name="bmi" id="bmic1" value="${addinfo_dto.bmi }">
								</div>
							</div>
							<br />
							<div class="addinfo_u" id="divTargetKcal">
								<label for="inputTargetKcal" class="">목표 칼로리</label>
								<div class="eheck_font">
									<input type="number" class="form-control-u" id="targetkcal1"
										data-rule-required="true" placeholder="목표 칼로리를 입력하세요"
										readonly="readonly" value="${addinfo_dto.targetkcal }"
										name="targetkcal" maxlength="10">
								</div>
							</div>
							<br />
							<div class="addinfo_u" id="divAdviseKcal">
								<label for="inputAdviseKcal" class="">권장 칼로리</label>
								<div class="eheck_font" id="advise1">
									<input type="number" class="form-control-u" id="advisekcal1"
										data-rule-required="false" placeholder="목표 칼로리를 입력하세요"
										readonly="readonly" value="${addinfo_dto.advisekcal }"
										step='0.01' name="advisekcal">
								</div>
							</div>
							<br /> <input type="button" onclick="changeRead()" value="수정"
								id="update-button" /> <input type="button"
								onclick="location.href='addinfo_delete.do'" value="삭제" />

						</div>
						<input type="hidden" value="${login.member_birthday }"
							id="birthday">
					</form>
				</div>
			</c:otherwise>

		</c:choose>
	</div>

</body>
</html>