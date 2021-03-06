<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.5.0/css/all.css"
	integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU"
	crossorigin="anonymous">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href='resources/css/chatroom.css' />
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.min.css">
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.min.js"></script>
<script type="text/javascript">
	var myno = ${login.member_no}

	$(document).ready(function(){
		var arr =$(".msgsending");
		var img = $(".img_cont_msg");
		var msgcont = $(".msg_cotainer")
		for (var i = 0 ; i <arr.length; i++){
			if( arr[i].getAttribute("title")== myno){
				arr[i].classList.add("justify-content-end");
				img[i].remove();
				msgcont[i].after(img[i]);
			}else if(arr[i].getAttribute("title") != myno){
				arr[i].classList.add("justify-content-start");
			}
		}
		 
	});
</script>

</head>
<body>
	<input type="hidden" name="chat_room_no" value="${roomno }" />
	<div class="col-md-12 col-xl-12 chat">
		<div class="card">
			<div class="card-header msg_head">
				<div class="d-flex bd-highlight">

			
							<c:choose>
							<c:when test="${memberlist[0].member_no eq login.member_no }">
												<div class="img_cont">
									<img src="${memberlist[1].member_profile }"
										class="rounded-circle user_img"> 
								</div>
								<div class="user_info">
									<span> ${memberlist[1].member_name} </span>
								</div>
							</c:when>
							<c:otherwise>
								<div class="img_cont">
									<img src="${memberlist[0].member_profile }"
										class="rounded-circle user_img"> 
								</div>
								<div class="user_info">
									<span> ${memberlist[0].member_name} </span>
								</div>
							
							</c:otherwise>
						</c:choose>




					<div class="video_cam">
						<span  onclick="window.open('https://localhost:3000/chat/${roomno}/membername/${login.member_name }','title','height=' + screen.height + ',width=' + screen.width + 'fullscreen=yes')">
						<i class="fas fa-video"></i>
						</span>					
						 <span onclick="disconnect()">나가기 </span>
					</div>
				</div>
				<span id="action_menu_btn"><i class="fas fa-ellipsis-v"></i></span>
				<div class="action_menu">

					<ul>
						<li><i class="fas fa-user-circle"></i> 친구페이지 가기</li>
						<li><i class="fas fa-ban"></i>차단하기</li>
					</ul>
				</div>
			</div>
			<div class="card-body msg_card_body" id="chatMessageArea">
				<c:choose>
					<c:when test="${empty chatmsglist}">
						<div>
							<span>대화를 시작해 보세요! </span>
						</div>
					</c:when>
					<c:otherwise>
						<c:forEach items="${chatmsglist }" var="dto">

							<div class="d-flex msgsending  mb-4" title="${dto.member_no}">
								<div class="img_cont_msg">
									<img src="${dto.memberDto.member_profile }"
										class="rounded-circle user_img_msg">
								</div>
								<div class="msg_cotainer">
									${dto.message } <span class="msg_time">${dto.sendingtime}</span>
								</div>
							</div>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</div>
			<div class="card-footer">
				<div class="input-group">

					<textarea name="" id="message" class="form-control type_msg" placeholder="Type your message..."></textarea>
					<div class="input-group-append">
						<span id="sendBtn" class="input-group-text send_btn"><i
							class="fas fa-location-arrow"></i></span>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript">

	
	
 var sock= new WebSocket('ws://localhost:8787/dabom/echo.do'); 
 var room_no = $("input[name='chat_room_no']").val();
	function disconnect(){
		sock.close();
		window.close();

	}
 
 $(function(){
		$('#chatMessageArea').scrollTop($('#chatMessageArea')[0].scrollHeight+20);
		
	})
	sock.addEventListener('open',function(evt){
		
		
		sock.send(room_no);
	});
 
 	sock.addEventListener('message',function(evt){
 		console.log('msg from server ',evt.data);
 		 var data = JSON.parse(evt.data);
		 console.log(data);
		 var $chat = "<div class='d-flex   justify-content-start mb-4' titile='"+data.member_no+"'>"+"<div class='img_cont_msg'>"+"<img src='"+data.member_profile+"'class='rounded-circle user_img_msg'></div><div class='msg_cotainer'>"+data.content+"<span class='msg_time'>"+data.sendingtime+"</span></div></div>";
		 $("#chatMessageArea").append($chat).stop().animate({scrollTop: $('#messages')[0].scrollHeight },1000);
		 
 	})

	 	sock.addEventListener('close', function(event)  {
	 console.log(event)
	  console.log('The connection has been closed successfully.');
	});

sock.addEventListener('error', function (event) {
	  console.log('WebSocket error: ', event);
	});
	 
	

	

	$(document).ready(function(){
		$('#action_menu_btn').click(function(){
			$('.action_menu').toggle();		
		});
	});
	
	 $(document).ready(function() {
		  $('#message').keypress(function(event){
		   var keycode = (event.keyCode ? event.keyCode : event.which);
		   if(keycode == '13'){
			   if($("#message").val().trim()==""||$('#message').val=="" ){
				   return false;
			   }else{
				 sendMsg();  
			   }
		   }
		   event.stopPropagation();
		  });

		  $('#sendBtn').click(function() { 
			  sendMsg();
		  });/* $('#enterBtn').click(function() { connect(); }); $('#exitBtn').click(function() { disconnect(); }); */
		 });
 
 var chatroom_no = $("input[name='chat_room_no']").val();
 console.log(chatroom_no);
 
 function sendMsg(){
	 console.log('보낼겁니당 ')
	 var msg = $("#message").val();
	 if(msg==''|| msg.trim() ==''){
		 return;
	 }else{
		message = {};
		 message.content = $("#message").val();
		 message.member_no = ${login.member_no}
		 message.sendingtime = getTimeStamp()
		 message.member_profile = "${login.member_profile}"
		 message.chatroom_no =  chatroom_no
	 }
	 console.log("message: ",message);
	 sock.send(JSON.stringify(message));
	 $("#message").val("");
	 $("#message").focus();
	 appendMessage(msg);
 }
 
 function getTimeStamp() {
	   var d = new Date();
	   var s =
	     leadingZeros(d.getFullYear(), 4) + '-' +
	     leadingZeros(d.getMonth() + 1, 2) + '-' +
	     leadingZeros(d.getDate(), 2) + ' ' +

	     leadingZeros(d.getHours(), 2) + ':' +
	     leadingZeros(d.getMinutes(), 2) + ':' +
	     leadingZeros(d.getSeconds(), 2);

	   return s;
	 }
 function leadingZeros(n, digits) {
	   var zero = '';
	   n = n.toString();

	   if (n.length < digits) {
	     for (i = 0; i < digits - n.length; i++)
	       zero += '0';
	   }
	   return zero + n;
	 }
 	
 function appendMessage(msg) {
	 if(msg == ''){
		 return false;
	 }else{
	 var t = getTimeStamp();
	 var msgDiv ="<div class='d-flex  justify-content-end mb-4' titile='${login.member_no}'><div class='msg_cotainer'>"+msg+"<span class='msg_time'>"+t+"</span></div><div class='img_cont_msg'><img src='${login.member_profile}' class='rounded-circle user_img_msg'></div></div>"
	 $("#chatMessageArea").append(msgDiv).stop().animate({scrollTop: $('#chatMessageArea')[0].scrollHeight },1000)
	
	 }
 }
 
 function startVideochat(){
	 var name = $('.user_info>span').val();
	 console.log(name);
	 var msgVideo ="<div class='d-flex  justify-content-end mb-4' titile='${login.member_no}'><div class='msg_cotainer'><form action='https://localhost:82/"+room_no +"' method='get'>"+
			"<input type='hidden' name='member_name' value='"+name+"'><button type='submit'>영상통화를 시작해 보세요! </button></form><span class='msg_time'>"+t+"</span></div><div class='img_cont_msg'><img src='${login.member_profile}' class='rounded-circle user_img_msg'></div></div>"
		
	 $("#chatMessageArea").append(msgVideo).stop().animate({scrollTop: $('#chatMessageArea')[0].scrollHeight },1000)
 }
 

 </script>

</body>
</html>