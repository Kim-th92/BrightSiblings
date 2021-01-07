<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자용 후원자 명단</title>
<link rel="stylesheet" type="text/css"
	href="resources/css/admin_donation.css">
<link
	href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800&amp;subset=korean"
	rel="stylesheet">
</head>
<body>
	<%@include file="adminpage.jsp"%>
	<div class="admin_section"
		style="background-image: url('resources/image/background.png'); background-repeat: no-repeat; background-attachment: fixed; background-size: cover;">
		<h1>DONATION LIST</h1>
		<div class="admin_donaiton">
			<table>
				<colgroup>
					<col width="50" />
					<col width="100" />
					<col width="100" />
					<col width="100" />
				</colgroup>


				<tr id="admin_donationlist_title">
					<th>Donation_no</th>
					<th>Member_name</th>
					<th>Donation</th>
					<th>Donation_date</th>
				</tr>



				<c:choose>
					<c:when test="${empty admin_donation_list }">
						<tr>
							<td colspan="4" align="center">
								-------------------------------후원자가
								없습니다.-------------------------------</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach items="${admin_donation_list }" var="dto"
							varStatus="loop">
							<tr style="text-align: left;"
								class="admin_donationlist_content ${loop.index % 2 == 0 ? 'even' : 'odd'}">
								<td>${dto.donation_no }</td>
								<td><a
									href="admin_donation_detail.do?member_no=${dto.member_no }&member_name=${dto.member_name }">
										${dto.member_name } </a></td>
								<td>${dto.donation }</td>
								<td><fmt:formatDate value="${dto.donation_date }"
										pattern="yyyy-MM-dd" /></td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>

				<!-- <tr>
			<td colspan="4" align="right">
				<input type="button" value="관리자 메인페이지로..." onclick="location.href='#'"/>
			</td>
		</tr> -->
			</table>
		</div>
	</div>
</body>
</html>