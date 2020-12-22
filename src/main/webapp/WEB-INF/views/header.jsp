<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	response.setHeader("Pragma", "no-cache");
response.setHeader("Cache-Control", "no-cache");
response.setHeader("Cache-Control", "no-store");
response.setDateHeader("Expires", 0L);
%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<!-- 파비콘-->
<link rel="shortcut icon" href="resources/image/cherry-blossom.png">
<link rel="stylesheet" href="resources/css/header.css" />
<title>DABOM, 다이어트의 봄</title>

<!-- 제이쿼리 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- 아이콘 -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
</head>
<body>
	
	<header>
		<nav>
			<ul>
				 <li><a href="mainpage.do" id="dabom"><img style="width:30px;height:30px;" alt="로고" src="resources/image/cherry-blossom.png"/> </a> </li>
                <li id="search_wrapper">  
                <input type="text" class="search-input" placeholder="검색" />
                <button id="search_btn" onclick="search();" class="tooltip-" > <i class="fas fa-search"></i> </button> 
                </li>

				<li id="space2"></li>

		        <li> <a class="tooltip center-icon" data-tooltip="Home" href="mainpage.do" id="home"> <i class="fas fa-home"></i> </a> </li>
		        <li> <a class="tooltip center-icon" data-tooltip="Friends" href="friendsmainpage.do?member_no=${login.member_no}" id="group"> <i class="fas fa-user-friends"></i> </a></li>
                <li> <a class="tooltip center-icon" data-tooltip="Calories" href="#" id="calories"> <i class="fas fa-utensils"></i> </a> </li>
                <li> <a class="tooltip center-icon" data-tooltip="Youtube" href="#" id="youtube"> <i class="fab fa-youtube"></i> </a> </li>

				<li id="space1"></li>
				<li><a>${login.member_name }님 반갑습니다.</a></li>
				<li><a href="mypage_main.do" class="tooltip" data-tooltip="MYPAGE" id="btn_plus"><img 	style="width: 40px; height: 40px;" class="profileimg" alt="프로필사진"  src="${login.member_profile }"></a></li>
				<li><a class="tooltip" data-tooltip="Message" id="btn_msg"><i class="fab fa-facebook-messenger"></i></a></li> 		
				<li><a class="tooltip" data-tooltip="Notification"  id="btn_bell"> <i class="fas fa-bell"></i> <span 	class="noti-badge "></span></a></li>
				<li><a class="tooltip" data-tooltip="Settings" id="btn_profile"><i class="fas fa-cog"></i></a></li> 
				<li><a class="tooltip" data-tooltip="Donation" id="btn_donation"><i class="fas fa-hand-holding-usd"></i></a></li>

			</ul>
			<ul id="hide" class="hide">
				<li><a href="logout.do" class="hidecontent"><i class="fas fa-sign-out-alt"></i>로그아웃</a></li>
				<li><a onclick="deletemember();" class="hidecontent"><i	class="fas fa-user-minus"></i>회원탈퇴</a></li>
			</ul>
			<div id="msg-hide" class="msg-hide" style="overflow: scroll;">
					<div class="col-md-4 col-xl-3 chat"><div class="card mb-sm-3 mb-md-0 contacts_card">
					<div class="card-header">
						<div class="input-group">
							<input type="text" placeholder="검색" name="" class="form-control search">
							<div class="input-group-prepend">
								<span class="input-group-text search_btn"><i class="fas fa-search"></i></span>
							</div>
						</div>
					</div>
					<div class="card-body contacts_body">
						<ul class="chatroomlist">
					</ul>
					</div>
					<div class="card-footer"></div>
				</div>
				</div>
               </div>
           
			<div id="search-hide" class="search-hide">
			</div>
		</nav>
	</header>

	<script type="text/javascript">
	var member_no = ${login.member_no};
		$(document).ready(function(){
			$.ajax({
				url: "chatroomlist.do?member_no="+ member_no,
				type : "GET",
				success :function(data){
					if(data.check ==false|| data.chatroomlist ==null){
						var nomessage = "<div>채팅이 없네요 시작해보세용!!</div>"
 						$("#msgsearch").after(nomessage);
					}else{
						var chatroomlistarr = data.chatroomlist;
						var chatroomList ="";
						for(var i = 0; i < chatroomlistarr.length; i++){
							chatroomList +="<a onclick="+"\"window.open"+"('chatmsglist.do?chatroom_no="+chatroomlistarr[i].chatroom_no+"','popup','width=500px,height=530px')\""+" style='text-decoration:none; color:black; '><li><div class='d-flex bd-highlight'><div class=‘img_cont'><img src='"+chatroomlistarr[i].member_profile+"' class='rounded-circle user_img'><span class='online_icon offline'></span></div><div class='user_info'><span>"+chatroomlistarr[i].member_name+"</span><p>"+chatroomlistarr[i].last_message+"</p><p>"+chatroomlistarr[i].created+"</p></div></div></li></a>";
								
						}
						$(".chatroomlist").after(chatroomList);
						
						
					}
				},error:function(err){
					console.log(err );
				}
			})
		});
	
	
		function search() {
			var keyword = $(".search-input").val();
			if (keyword == '') {
				$("#search-hide").html('<p>검색어를 입력해 주세요</p>');
			} else {

				$.ajax({
							url : "search.do?keyword=" + keyword,
							type : "GET",
							success : function(data) {
								if (data.check == "OK") {
									var arr = data.searchlist;
									console.log(arr);
									var searchlist = '';
									for (var i = 0; i < arr.length; i++) {
										searchlist += "<p class='search-res'><img class='search-img'  style='width:40px;height:40px;border-radius:50% 50%;' src='"
												+ arr[i].member_profile
												+ "' alt='프로필사진'/><a class='search-a' href="
												+ "'friendDetail.do?member_no="
												+ arr[i].member_no
												+ "'><span>"
												+ arr[i].member_name
												+ "<i class='fas fa-arrow-alt-circle-right'></i></span></a><p>";

									}
									console.log(searchlist);
									$("#search-hide").html(searchlist);
								} else {
									var searchlist = "<p>검색하신 조건으로 조회된 결과가 없습니다.</p>"
									$("#search-hide").html(searchlist);
								}

							},
							error : function(err) {
							}

						});

			}

		}

		$("#search_btn").click(function() {
			$(".search-hide").stop().slideDown(500);
			return false; 
		});
		$(document).click(function(e) {
			if (e.target.className == "search-hide") {
				return false
			}
			$(".search-hide").stop().slideUp(500);

		});

		$("#btn_profile").click(function() {
			$("#hide").stop().slideDown(500);
			return false; 
		});
		$(document).click(function(e) {
			if (e.target.className == "hide") {
				return false
			}
			$("#hide").stop().slideUp(500);

		});

		$("#btn_msg").click(function() {
			$("#msg-hide").stop().slideDown(500);
			return false; 
		});
		$(document).click(function(e) {
			if (e.target.className == "msg-hide") {
				return false
			}
			$("#msg-hide").stop().slideUp(500);

		});

		/* 	var hoverbtn = document.getElementById("btn_profile");
		 hoverbtn.addEventListener("click",function(){
		 var hideul = document.getElementById("hide");

		 if(hideul.style.display=='none'){
		 hideul.style.display='block';
		 }else{
		 hideul.style.display='none'
		 } 
		 }); */
		 

		$(document).ready(function() {
			var jbOffset = $('header').offset();
			$(window).scroll(function() {
				if ($(document).scrollTop() > jbOffset.top) {
					$('header').addClass('headerFixed');
				} else {
					$('header').removeClass('headerFixed');
				}
			});
		});
		function deletemember() {
			var checkdelete = confirm("정말로 삭제하시겠습니까?");
			var member_no = ${login.member_no};
			var loginValue = {
				"member_no" : member_no
			}
			console.log(member_no)

			if (checkdelete) {
				$.ajax({
					type : "post",
					url : "/dabom/delete.do",
					data : JSON.stringify(loginValue),
					contentType : "application/json",
					success : function(msg) {
						if (msg.check > 0) {
							alert("이용해주셔서 감사합니다.회원탈퇴 성공하셨습니다.");
							location.href = "login.do";
						} else {
							alert("다시 시도해주세요")
						}
					},
					error : function(msg) {
						console.log(msg);
						alert("통신 실패");
					}
				});
			}
		}
	</script>
	<%@include file="insertdonation.jsp"%>	
	<script src="resources/js/header.js"></script>

</body>
</html>
