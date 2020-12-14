<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="resources/css/main.css">
</head>
<body>
<%@include file="header.jsp" %>
<h1>${login.member_name} </h1>

<article id="mainWrap">
	<section id="navi">
	left naviddddd<br/>
	</section>
	
	<section id="board">
		<div id="boardDiv">
	middle section
		<input type="button" value="글쓰기" onclick="location.href='write.do'">

			
		</div>
	</section>
	
	<section id="friendList">
		<div id="friendDiv">
	friend list
		</div>
	</section>
	
</article>
</body>
</html>