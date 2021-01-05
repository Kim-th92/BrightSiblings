<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin_Member_List</title>
<link rel="stylesheet" type="text/css"
	href="resources/css/admin_member_list.css" />
</head>
<body>
	<%@include file="adminpage.jsp"%>
	<div class="admin_section" style="background-image: url('resources/image/background.png'); background-repeat: no-repeat; background-attachment: fixed; background-size: cover;" >
	<h1>MEMBER LIST</h1>
		<div class="admin_page">
			<table>
				<colgroup>
					<col width="50px" />
					<col width="100px" />
					<col width="100px" />
					<col width="70px" />
					<col width="150px" />
				</colgroup>
				<tr id="admin_memberlist_title">
					<td>No</td>
					<td>ID</td>
					<td>Email</td>
					<td>회원 탈퇴 여부</td>
					<td>회원가입 일자</td>
				</tr>
				<c:choose>
					<c:when test="${empty memberlist }">
						<tr class="admin_memberlist_content">
							<td colspan="7" align="center">------------------------회원이
								없습니다.------------------------</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach items="${memberlist }" var="dto" varStatus="loop">
							<tr style="text-align: left;"
								class="admin_memberlist_content ${loop.index % 2 == 0 ? 'even' : 'odd'}">
								<td>${dto.member_no }</td>
								<td><a href="admin_select_list.do?member_no=${dto.member_no }">${dto.member_id }</a></td>
								<td>${dto.member_email }</td>
								<td>${dto.member_delflag }</td>
								<td>${dto.member_regdate }</td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</table>
		</div>
	</div>
</body>
</html>