<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div id="container">

				<div id="addinfo-detail">
					<form action="addinfo_update" method="post">
						<h2>정보 추가</h2>


						<div>
							<h4>회원 정보</h4>
							<div class="addinfo" id="divHeight">
								<label for="inputHeight" class="">신장</label>
								<div class="eheck_font">
									<input type="text" class="form-control" data-rule-required="true" readonly="readonly" value="${addinfo.height}"/>
									cm
								</div>
							</div>
							<div class="addinfo" id="divWeight">
								<label for="inputWeight" class="">체중</label>
								<div class="eheck_font">
									<input type="text" class="form-control" data-rule-required="true" readonly="readonly" value="${addinfo.weight }"/>
									
								</div>
							</div>
							<div class="addinfo" id="divGender">
								<label for="inputGender" class="">성별</label>
								<div class="eheck_font">
									<c:choose>
										<c:when test="${addinfo.gender eq 'M' }">
											<input type="text" value="남성" readonly="readonly"/>
										</c:when>
										<c:otherwise>
											<input type="text" value="여성" readonly="readonly"/>
										</c:otherwise>
									</c:choose>
								</div>
							</div>
							<div class="addinfo" id="divTargetWeight">
								<label for="inputTargetWeight" class="">목표 체중</label>
								<div class="eheck_font">
									<input type="number" class="form-control" id="targetweight"
										data-rule-required="true" value="${addinfo.targetweight }" readonly="readonly">
								</div>
							</div>
							<div class="addinfo" id="divBmi">
								<label for="inputBmi">BMI(체질량 지수)</label>
								<div class="eheck_font">
									<input type="number" class="form-control" readonly="readonly"
										value="${addinfo.bmi }">
								</div>
							</div>
							<div class="addinfo" id="divTargetKcal">
								<label for="inputTargetKcal" class="">목표 칼로리</label>
								<div class="eheck_font">
									<input type="number" class="form-control" id="targetkcal"
										data-rule-required="true" value="${addinfo.targetkcal }" readonly="readonly">
								</div>
							</div>
							<div class="addinfo" id="divAdviseKcal">
								<label for="inputAdviseKcal" class="">권장 칼로리</label>
								<div class="eheck_font">
									<input type="text" class="form-control" id="advisekcal"
									data-rule-required="true" value="${addinfo.advisekcal }" readonly="readonly"/>
								</div>
							</div>
						</div>
						<input type="button" onclick="" value="수정">
						<input type="button" onclick="" value="삭제">
						
					</form>
				</div>
			

</body>
</html>