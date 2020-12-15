<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>친구들</title>
<%@ include file="header.jsp"%>
<link rel="stylesheet" href="resources/css/friends_mainpage.css">
</head>


<body>

	<div id="friendcontainer">
		<div id="side">
			<ul>
				<c:choose>
					<c:when test="${empty requestlist }">
						<div>
							<span> 친구요청이 없네요 ! </span> <span>친구를 찾아보세요!! </span>
						</div>
					</c:when>
					<c:otherwise>
						<c:forEach items="${requestlist}" var="dto">
							<li><a onclick="iframe(${dto.member_no});"> <img
									id="profile-img" src="${dto.member_profile}" />
									${dto.member_name}
							</a>
								<button onclick="location.href=' '">수락</button>
								<button onclick="location.href=' '">거절</button></li>

						</c:forEach>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
		</div>
		<div id="main">

		</div>
	<script type="text/javascript">
	
</script>

</body>
</html>