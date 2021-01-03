<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="resources/css/adminpage.css"/>
<script src="https://kit.fontawesome.com/a076d05399.js"></script>
</head>
<body>
	<input type="checkbox" id="check" />
	<label for="check">
		<i class="fas fa-bars" id="btn"></i>
		<i class="fas fa-times" id="cancel"></i>
	</label>
	<div class="sidebar">
		<header>Admin</header>
		<ul>
			
			<li><a href="admin.do"><i class="fas fa-users"></i>Member</a></li>
			
			<li><a href="admin_board_list.do"><i class="fas far fa-edit"></i>Board</a></li>
			
			<li><a href="admin_donation_list.do"><i class="fas fa-hand-holding-usd"></i>Donation</a></li>
			
			<li><a href="#"><i class="fas fa-qrcode"></i></a></li>
			
			<li><a href="#"><i class="fas fa-qrcode"></i></a></li>
			
			<li><a href="#"><i class="fas fa-qrcode"></i></a></li>
			
		</ul>
	</div>
	
<!-- 	<section> -->
		
<!-- 	</section> -->
</body>
</html>