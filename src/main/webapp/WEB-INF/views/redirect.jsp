<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script>
		var result = '${msg}';
		if(result == '탈퇴'){
			alert('탈퇴한 회원입니다. 다시 회원가입 해주세요.');
			location.href="/dabom/login.do";
		}
	</script>
</body>
</html>