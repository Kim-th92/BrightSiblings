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
								<button onclick="accepted(${dto.member_no});">수락</button>
								<button onclick="dennided(${dto.member_no})">거절</button></li>

						</c:forEach>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
	</div>
	<div id="main">
		<button onclick="location.href='basic.do'">웹소켓 테스트으으</button>
	</div>
	<script type="text/javascript">
	function accepted(member_no){
		console.log(member_no);
		$.ajax({
			url : "friendAccepted.do?friend_no="+member_no,
			type: "GET",
			success:function(msg){
				if(msg.result == 1){
					alert("친구가 되셨습니다!");
				}
			},error:function(err){
				
			}
		});
	}
	function dennied(member_no){
		$.ajax({
			url : "friendDenied.do?friend_no="+member_no,
			type: "GET",
			success:function(msg){
				if(msg.result == 1){
					alert("친구거절 완료");
				}
				
			},error:function(err){
				
			}
		});
	}
	
	
</script>

</body>
</html>