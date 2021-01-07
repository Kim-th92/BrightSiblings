<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>
		업로드 해볼랭
		<h1>
			프로필 이미지 : <img src="${login.member_profile }" style="width: 150px;"><br />
			당신의 회원번호 : ${login.member_no }<br /> 당신의 정보 : ${login.member_name }<br />
			당신의 이름 : ${login.member_name }<br />
			<form method="post" action="upload.do" enctype="multipart/form-data">
				<label>text:</label> <input type="text" name="text"> <label>파일:</label>
				<input type="file" name="file1" multiple> <br> <br>
				<input type="submit" value="upload">
			</form>
</body>
</html>