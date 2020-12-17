<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자용 후원자 명단!!!!!!</title>
</head>
<body>

	<h1>후원자 명단</h1>
	
	<table border="1">
		<colgroup>
			<col width="50"/>
			<col width="100"/>
			<col width="100"/>
			<col width="100"/>
		</colgroup>
		<tr>
			<th>Donation_no</th>
			<th>Member_name</th>
			<th>Donation</th>
			<th>Donation_date</th>
		</tr>
		<c:choose>
			<c:when test="${empty list }">
				<tr>
					<td colspan="4" align="center">
					-------------------------------후원자가 없습니다.-------------------------------
					</td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach items="${list }" var="dto">
					<tr>
						<td>${dto.donation_no }</td>
						<td>
							<a href="detaildonation.do?member_no=${dto.member_no }&member_name=${dto.member_name }">
								${dto.member_name }
							</a>
						</td>
						<td>${dto.donation }</td>
						<td><fmt:formatDate value="${dto.donation_date }" pattern="yyyy-MM-dd"/></td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
		<tr>
			<td colspan="4" align="right">
				<input type="button" value="관리자 메인페이지로..." onclick="location.href='#'"/>
			</td>
		</tr>
	</table>


</body>
</html>