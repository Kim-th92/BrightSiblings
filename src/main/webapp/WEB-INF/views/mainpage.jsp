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

	$(window).load(function(){
		
	});

	
	
	
	
	$(function(){
			$.ajax({
				type : 'POST',
				url : 'showres.do?startPage=1',
				dataType : 'json',
				contentType: 'application/json', 
				success : function(responseData){
					var data = JSON.parse(responseData);
					if(!data){
						console.log("게시판이 비어있습니다.");
					}
					var res = "";
					console.log(json[0].member_no);
					console.log(json[0].board_no);
					console.log(json[0].files_url);
					
					 res += '<form class="form-signin" action="" id="ajax">';
			         res += '이름<input type="text" class="form-control"  name="name" value="'+data.first+'">';
			         res += '아이디<input type="text" class="form-control" name=id" value="'+data.second+'">';
			         res += '이메일<input type="text" class="form-control"  name="email" value="'+data.third+'">';
			         res += '비밀번호<input type="text" class="form-control" name="password" value="'+data.fourth+'">';
			         res += '</form>';
			            $("#feed").after(html); 
			            
				},
				error : function(error){
					alert("에러 발생");
					console.log(error);
				}
				
			});
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
				</div>
		</div>
	</section>
	
	

	
</article>
<script src="./resource/js/scroll.js"></script>
</body>
</html>