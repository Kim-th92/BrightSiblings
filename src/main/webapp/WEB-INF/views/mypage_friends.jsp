<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>

<%@include file="header.jsp" %>
<%@include file="mypage_middle.jsp" %>
<link rel="stylesheet"   href="resources/css/mypage_friends.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<body>


<div id= "friendwrapper">
	<div id="friendrequest">
		<div id = "requested">
		<h1>친구 요청목록 </h1>
		<c:choose>
					<c:when test="${empty requestlist }">
						<div>
							<span> 친구요청이 없네요 ! </span> <span>친구를 찾아보세요!! </span>
						</div>
					</c:when>
					<c:otherwise>
						<c:forEach items="${requestlist}" var="dto">
							<li><a href="friendDetail.do?member_no=${dto.member_no}"> <img	id="profile-img" src="${dto.member_profile}" />
									${dto.member_name}
							</a>
								<button onclick="accepted(${dto.member_no});">수락</button>
								<button onclick="dennided(${dto.member_no})">거절</button></li>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</div>
		<div  id="requesting">
		<h1>수락 기다리는 중..</h1>
			<c:choose>
					<c:when test="${empty requestinglist }">
						<div>
							<span> 친구요청을 한 것이 없네요~</span> <span>친구를 찾아보세요!! </span>
						</div>
					</c:when>
					<c:otherwise>
						<c:forEach items="${requestinglist}" var="dto">
							<li><a href="friendDetail.do?member_no=${dto.member_no}"> <img
									id="profile-img" src="${dto.member_profile}" />
									${dto.member_name}
							</a>
								<button onclick="cancel(${dto.member_no});">취소</button>

						</c:forEach>
					</c:otherwise>
				</c:choose>
		</div>
	</div>
	<div id="friendslist">
		<h1>친구목록 </h1>
		
		
			<c:choose>
			<c:when test="${empty list }">
				<div class="nofriend"> 
					<p>저런 친구가 없으시군용.. </p>
					<p>친구를 찾아보세요!</p>
				
				</div>
			</c:when>
			<c:otherwise>
				<c:forEach items="${list}" var="dto">
				
				<div id="borderdiv">
					<a href="friendDetail.do?member_no=${dto.member_no}"> <img id ="profile-img" src="${dto.member_profile}"/> ${dto.member_name}</a> 
						<span><button onclick="window.open('chatmsglist.do?member_no=${dto.member_no}','popup','width=500px,height=530px')"><i class="fab fa-facebook-messenger"></i></button></span>
						<span><button onclick="'"><i class="fas fa-user-minus"></i></button> </span>
				</div>
					
				
				</c:forEach>
			</c:otherwise>
		</c:choose>
	
	</div>
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
				console.log(err);
			}
		});
	}
	function dennied(member_no){
		$.ajax({
			url : "friendDenied.do?friend_no="+member_no,
			type: "GET",
			success:function(msg){
				console.log(msg);
				if(msg.result == 1){
					alert("친구거절 완료");
				}else{
					alert("친구거절 실패 죄송해여..");
				}
				
			},error:function(err){
				console.log(err);
			}
		});
	}
	
	function cancel(member_no){
		var myno = ${login.member_no}
		
		var friendrequest = {
				member_no : member_no,
				friend_no :myno
		};
		$.ajax({
			url:"friendRequestCancel.do",
			type:"POST",
			data:JSON.stringify(friendrequest),
			contentType : "application/json",
			success:function(msg){
				if(msg.result ==1){
					alert("친구 요청 취소완료했습니다!");
				}
			},error:function(err){
				console.log(err);
			}
			
		});
	}
</script>
</body>
</html>