<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>다봄 회원가입 </title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<link rel="short cut" href ="resources/image/favicon.png">
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
	<div id="register">
		<form action="registerres.do" method="post">
			<h1>회원가입</h1>
			<div class="form-group"> 
				<label for="id">아이디</label> 
				<input type="text" style="width: 40%; display: inline;" class="form-control" id="member_id" name="member_id" placeholder="ID"> 
				<button type="button" class="btn btn-default" id ="idchk"><i class="fa fa-search"></i> 아이디 중복확인</button>
					<div class="eheck_font" id="id_check"></div> 
			</div> 
			<div class="form-group"> 
				<label for="pw">비밀번호</label> 
				<input type="password" class="form-control" id="member_pw" name="member_pw" placeholder="PASSWORD"> 
				<div class="eheck_font" id="pw_check"></div> 
			</div> 
			<div class="form-group"> 
				<label for="pw2">비밀번호 확인</label> 
				<input type="password" class="form-control" id="member_pw2" name="member_pw2" placeholder="Confirm Password"> 
				<div class="eheck_font" id="pw2_check"></div> 
			</div> 
			<div class="form-group"> 
				<label for="member_name">이름</label> 
				<input type="text" class="form-control" id="member_name" name="member_name" placeholder="Name"> 
				<div class="eheck_font" id="name_check"></div> 
			</div> 
			<div class="form-group"> 	
				<label for="member_birth">생년월일</label> 
				<input type="tel" class="form-control" id="member_birthday" name="member_birthday" placeholder="ex) 19990101"> 
				<div class="eheck_font" id="birth_check"></div> 
			</div> 
			<div class="form-group"> 
				<label for="member_email">이메일 주소</label> 
				<input type="email" class="form-control" id="member_email" name="member_email" placeholder="E-mail"> 
				<div class="eheck_font" id="email_check"></div> 
			</div>
			<div class="form-group"> 
				<label for="member_phone">휴대폰 번호('-'없이 번호만 입력해주세요)</label> 
				<input type="tel" class="form-control" id="member_phone" name="member_phone" placeholder="Phone Number"> 
				<div class="eheck_font" id="phone_check"></div> 
			</div> 
			<div class="form-group"> 
				<label for="member_zipcode">주소</label> <br/>
				<input class="form-control" style="width: 40%; display: inline;" placeholder="우편번호" name="member_zipcode" id="member_zipcode" type="text" readonly="readonly" > 
				<button type="button" class="btn btn-default" onclick="execPostCode();"><i class="fa fa-search"></i> 우편번호 찾기</button> </div> 
			<div class="form-group"> 
				<input class="form-control" style="top: 5px;" placeholder="도로명 주소" name="member_firstaddr" id="member_firstaddr" type="text" readonly="readonly" />
			</div> 
			<div class="form-group"> 
				<input class="form-control" placeholder="상세주소" name="member_secondaddr" id="member_secondaddr" type="text" /> 
			</div> 
			<div class="form-group text-center"> 
				<button type="submit" class="btn btn-primary">회원가입</button> 
			</div>
		</form>
	</div>
<script src="resources/js/register.js"></script>
</body>
</html>