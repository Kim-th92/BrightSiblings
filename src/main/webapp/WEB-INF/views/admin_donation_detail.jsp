<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@include file="adminpage.jsp"%>
	<div class="admin_section">

		<h1>특정회원 후원 내역</h1>

		<table border="1">
			<tr>
				<td>Member_Name</td>
				<td colspan="2" align="center">${admin_donation_name}</td>
			</tr>
			<tr>
				<td>Donation_No</td>
				<td>Donation</td>
				<td>Donation_Date</td>
			</tr>
			<c:forEach items="${admin_donation_detail}" var="dto">
				<tr>
					<td>${dto.donation_no}</td>
					<td>${dto.donation }</td>
					<td><fmt:formatDate value="${dto.donation_date }"
							pattern="yyyy-MM-dd HH:mm:ss" /></td>
				</tr>
			</c:forEach>
			<tr>
				<td>Donation_Sum</td>
				<td colspan="2" align="right">${select_donation_sum}</td>
			</tr>
			<!-- <tr>
			<td colspan="3" align="right">
				<input type="button" value="후원자 명단으로..." onclick="location.href='admin_donation_list.do'"/>
			</td>
		</tr> -->
		</table>
	</div>

</body>
</html>