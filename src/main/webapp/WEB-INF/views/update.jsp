<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>수정창</h1>
		<img src="${login.member_profile }">
		<p>${login_member_name }</p>
	<div>
		<form method="post" action="updateres.do" enctype="multipart/form-data">
			<input type="hidden" value="${dto.board_no }" name="board_no">
			<textarea cols="30" rows="30" name="board_content">${dto.board_content }</textarea>
			<div class="imgWrap">
				<c:forEach items="${url }" var="url">
					<img src="${url }">					
				</c:forEach>
			</div>
			<input type="file" name="file1" multiple>
			<input type="text" value="${dto.board_regdate}" readonly="readonly">
			<input type="submit" value="완료">
			<input type="button" value="뒤로" onclick="">
			
		</form>
	</div>

</body>
</html>