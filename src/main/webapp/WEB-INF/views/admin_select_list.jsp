<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="resources/css/admin_select_list.css" />
</head>

</head>
<body>
	<%@include file="adminpage.jsp"%>
	<div class="admin_section">
		<div class="admin_page">

			<div class="position">
				<div class="profile">
					<img src="${memberselect.member_profile}" border="1" />
				</div>

				<table>
					<colgroup>
						<col width="100px">
						<col width="100px">
					</colgroup>
					<tr>
						<td>Name</td>
						<td>${memberselect.member_name}</td>
					</tr>
					<tr>
						<td>Email</td>
						<td>${memberselect.member_email}</td>
					</tr>
					<tr>
						<td>Phone</td>
						<td>${memberselect.member_phone}</td>
					</tr>
					<tr>
						<td>Birthday</td>
						<td>${memberselect.member_birthday}</td>
					</tr>
					<tr>
						<td>Zipcode</td>
						<td>${memberselect.member_zipcode}</td>
					</tr>
					<tr>
						<td>Firstaddr</td>
						<td>${memberselect.member_firstaddr}</td>
					</tr>
					<tr>
						<td>Secondaddr</td>
						<td>${memberselect.member_secondaddr}</td>
					</tr>
					<tr>
						<td>Donation Sum</td>
						<td>${donationselect}</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
</body>
</html>