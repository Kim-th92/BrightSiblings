<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="resources/css/main.css">
<link rel="stylesheet" type="text/css" href="resources/css/write.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script type="text/javascript" src="resources/js/write.js"></script>
<script type="text/javascript">

	$(document).ready(function(){
		var startPage = ${startPage };
		getPage();
	});
	
	
	
	
	


</script>
</head>
<body>
<%@include file="header.jsp" %>


<article id="mainWrap">
	<section id="navi">
	left navi section<br/>
		<ul>
			<li>1st Navi</li>
			<li>2nd Navi</li>
			<li>3rd Navi</li>
			<li>4th Navi</li>
		</ul>
	</section>
	
	<section id="board" style="background-color: ghostwhite;">
		<div id="boardDiv">
				<table id="feedWrap">
					
				</table>
				<div id="feed">
				${startPage }
				<c:out value="${startPage }" />
				</div>
		</div>
	</section>
	
	

	
</article>
<script src="./resource/js/scroll.js"></script>
</body>
</html>