<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script type="text/javascript">

	
	
	$.ajax({
		url:'add_member_info.jsp',
		type:'POST',
		data{
			member_no:$("#member_no").val(),
			height:$("#inputHeight").val(),
			weight:$("#inputWeight").val(),
			gender:$("#inputGender").val(),
			targetweight:$("#inputTargetWeight").val(),
			bmi:("#inputBmi").val(),
			targetkcal:$("#inputTargetKcal").val(),
			advisekcal:$("#inputAdviseKcal").val()
			
		}, success: function(msg){
			console.log(msg);
			console.log('값 전달 성공');
		}, error:function(){
			console.log('값 전달 실패');
		}
		
	})


</script>
</head>
<body>

	<div id="container">
		<div id="addinfo">
			<form action="addinfo_insert" method="post">
				<h2>정보 추가</h2>


				<div>
					<h4>회원 정보</h4>
					<div class="addinfo" id="divHeight">
						<label for="inputHeight" class="">신장</label>
						<div class="eheck_font">
							<input type="text" class="form-control" id="height" data-rule-required="true"
								placeholder="신장을 입력하세요" maxlength="20">
						</div>
					</div>
					<div class="addinfo" id="divWeight">
						<label for="inputWeight" class="">체중</label>
						<div class="eheck_font">
							<input type="text" class="form-control" id="weight" data-rule-required="true"
								placeholder="체중을 입력하세요" maxlength="20">
						</div>
					</div>
					<div class="addinfo" id="divGender">
						<label for="inputGender" class="">성별</label>
						<div class="eheck_font">
							<select class="" id="gender">
								<option value="M">남성</option>
								<option value="W">여성</option>
							</select>
						</div>
					</div>
					<div class="addinfo" id="divTargetWeight">
						<label for="inputTargetWeight" class="">목표 체중</label>
						<div class="eheck_font">
							<input type="number" class="form-control" id="targetweight"
								data-rule-required="true" placeholder="목표 체중을 입력하세요"
								maxlength="10">
						</div>
					</div>
					<div class="addinfo" id="divBmi">
						<label for="inputBmi">BMI(체질량 지수)</label>
						<div class="eheck_font">
							<input type="number" class="form-control" readonly="readonly" value="">
						</div>
					</div>
					<div class="addinfo" id="divTargetKcal">
						<label for="inputTargetKcal" class="">목표 칼로리</label>
						<div class="eheck_font">
							<input type="number" class="form-control" id="targetkcal"
								data-rule-required="true" placeholder="목표 칼로리를 입력하세요"
								maxlength="10">
						</div>
					</div>
					<div class="addinfo" id="divAdviseKcal">
						<label for="inputAdviseKcal" class="">권장 칼로리</label>
						<div class="eheck_font">
							<input type="number" class="form-control" id="advisekcal" value="">
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
<script src="resources/js/addmemberinfo.js"></script>
</body>
</html>