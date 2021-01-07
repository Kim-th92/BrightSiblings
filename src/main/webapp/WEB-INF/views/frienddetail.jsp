<%@page import="java.util.List"%>
<%@page import="com.bs.dabom.model.dto.Member_Dto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${dto.member_name} 님의 페이지 입니다. </title>
<%@include file="header.jsp" %>
<link rel="stylesheet" href="resources/css/frienddetail.css"/>
<link rel="stylesheet" href="resources/css/mypage_main.css" />

</head>
<body>

<div id="section">
	<div id="profile-section">
	<div id="main-container">
		<div id="mypage-photo">
			<div id ="mypage-profileimg">
				<img src="${dto.member_profile}"/>
			</div>
			<div>
				<h1>${dto.member_name }</h1>
			</div>
		</div>
		<div id="mypage-navbar">
			<ul>
				<li><a id="board" href="">게시글</a></li>
				<li><a id ="friends" href="">친구</a></li>
				<li><a id="food" href="">식단</a></li>
				<li><a id="exercise" href="">운동</a></li>
				
		
				<c:choose>
					<c:when test="${res eq 1}">
					<li><button onclick ="" class="friend"><i class=" fab fa-facebook-messenger"></i>메세지보내기</button>
					<button onclick="" class="friend"><i class=" fas fa-user-minus"></i>친구차단</button></li>
					</c:when>
					<c:otherwise>
					<li><button onclick="friendRequest(${dto.member_no});" id ="request-friend"> <i class="fas fa-user-plus"></i>친구추가</button></li>
					</c:otherwise>
				</c:choose>

			</ul>
		</div>
	</div>
	</div>
</div>

	<div id= "mainWrapper">
		
		<div id="mainImages">
		
			<p>사진들</p>
			<hr style="width:90%; text-align:center; margin-left: 30px;">
			<div>
				<c:forEach var="url" items="${url }">
					<img src="${url }" style="width:30%; height:150px;">&nbsp;
				</c:forEach>
			</div>
		</div>
		
		
		<div id="mainWrite">
		
					<div class="writeWrap">
								<div style="margin-top:25px;">
									<img src="${login.member_profile }">
									<a href="#layer1" class="btn-example" style="color:#593650;">당신의 상태를 알려주세요.</a>
								</div>	
								<div id="layer1" class="pop-layer">
									<div class="pop-container">
										<div class="pop-conts">
										
											<form method="post" action="upload.do" enctype="multipart/form-data">
												<textarea cols="45" rows="8"  name="text" style="resize:none;"></textarea>
												 <script>
												 CKEDITOR.replace( 'text' ,{ allowedContent: 'h1 h2 h3 p blockquote strong em;' +
													        'a[!href];' +
													        'table tr th td caption;' +
													        'span{!font-family};' +
													        'span{!color};' +
													        'span(!marker);' +
													        'del ins'
													    });
												 </script>
												
												<div id="forBg" style="width: 50px; height: 50px; background : url('resources/image/upload_img.png'); background-size: 50px 50px;">
													<label class="uploadButton" for="fileUpload" style="width: 50px; height: 50px;">.</label>
												</div>
												<input id="fileUpload" type="file" name="file1" multiple value="파일" style="display:none;">
												
											
											<div class="btn-r">
												<input type="submit" value="작성">
												<a href="#" class="btn-layerClose">Close</a>
											</div>
											</form>
										</div>	
									</div>
								</div>
	
							</div>
			
			
			
			
			<hr style="width:90%; text-align:center; margin-left: 45px;">
			<c:choose>
				<c:when test="${empty list }">
							<p>첫 글을 작성해보세요 :D</p>
				</c:when>
				<c:otherwise>
						<c:forEach var="list" items="${list }">
							<div class="feedWrap">
								<div class="feedProp">
									<p>
									<img src="${login.member_profile }">&nbsp;&nbsp;
									${login.member_id}&nbsp;
									<fmt:parseDate value="${list.board_regdate }" var="regdate" pattern="yyyy-MM-dd" />
									<fmt:formatDate value="${regdate }" pattern="MM월 dd일" /></p>
									<c:if test="${login.member_no eq list.member_no  }">
										<span style="float:right; margin-top: -50px;">
												<input class="upDel" type="button" value="수정" onclick="location.href='update.do?board_no=${list.board_no }'">
												<input class="upDel" type="button" value="삭제" onclick="deleteBoard(${list.board_no })">
												
												
												<a href="#layer1" class="btn-example" style="color:#593650;">수정하시겠습니까?</a></span>
															<div id="layer1" class="pop-layer">
																<div class="pop-container">
																	<div class="pop-conts">
																		<form method="post" action="updateres.do" enctype="multipart/form-data">
																			<input type="hidden" value="${list.board_no }" name="board_no">
																			<textarea cols="45" rows="8"  name="board_content" style="resize:none;"></textarea>
																			 <script>
																			 CKEDITOR.replace( 'board_content' ,{ allowedContent: 'h1 h2 h3 p blockquote strong em;' +
																				        'a[!href];' +
																				        'table tr th td caption;' +
																				        'span{!font-family};' +
																				        'span{!color};' +
																				        'span(!marker);' +
																				        'del ins'
																				    });
																			 </script>
																			
																			<c:forEach items="${url }" var="url">
																				<img src="${url }" style="width:200px; height: auto;">					
																			</c:forEach>
																			<input type="file" name="file1" multiple>
																			<input type="text" value="${list.board_regdate}" readonly="readonly">
																			<input type="submit" value="완료">
																		
																			<div class="btn-r">
																				<input type="submit" value="작성">
																				<a href="#" class="btn-layerClose">Close</a>
																			</div>
																			
																		</form>
																	</div>	
																</div>
															</div>
												
												
												
												
												
												
												
												
										
									</c:if>
									</p>
									<hr>
								</div>
								<div class="feedContent">
									${list.board_content }
								</div>
								<div class="feedImage">
									<c:forEach var="url" items="${list.urlList }" >
										<img src="${url }">
									</c:forEach>
								</div>
								<hr>
								<div class="feedReply">
									<c:forEach var="rep" items="${list.replyList }">
										<p>${rep }</p>
									</c:forEach>
									<form action="writeReply.do" method="post">
												<img src="${login.member_profile }">&nbsp;&nbsp;
												<input type="hidden" value="mypage" name="root">
												<input type="hidden" value="${list.board_no }" name="board_no"> 
												<input type="text" placeholder="댓글을 입력하세요." name="reply_content" style="width: 85%; height: 30px; border: none; border-radius:8px; background-color:#F8EEF8; padding-left:10px;">
									</form>
									 
									
								</div>
							
							</div><!-- feedWrap -->
						</c:forEach>
				</c:otherwise>
			</c:choose>
			
		</div>
		
		
	</div>
</body>

<script type="text/javascript">
	function friendRequest(member_no){
		var friend_no = ${login.member_no}
		var friendrequest = {
				member_no : member_no,
				friend_no : friend_no
		};
		$.ajax({
			url : "friendRequest.do",
			type:"POST",
			data:JSON.stringify(friendrequest),
			contentType : "application/json",
			success : function(msg){
			 	if(msg.result==1){
			 		alert("친구요청 되었습니다! 조금만기다려주시면 친구가 수락해주겠죠?!");
			 	}else{
			 		alert("실패..")
			 	}
			},error: function(err){
				console.log(err);
			}
		});
		
	}
</script>
<script type="text/javascript">

		$('.btn-example').click(function(){
	        var $href = $(this).attr('href');
	        // #Layer1
	        layer_popup($href);
	    });
		
	    function layer_popup(el){
	
	        var $el = $(el);    //레이어의 id를 $el 변수에 저장
	        var isDim = $el.prev().hasClass('dimBg'); //dimmed 레이어를 감지하기 위한 boolean 변수
	
	        isDim ? $('.dim-layer').fadeIn() : $el.fadeIn();
	
	        
	        var $elWidth = ~~($el.outerWidth()),
	            $elHeight = ~~($el.outerHeight()),
	            docWidth = $(document).width(),
	            docHeight = $(document).height();
			
			
	        // 화면의 중앙에 레이어를 띄운다.
	        
	        if ($elHeight < docHeight || $elWidth < docWidth) {
	            $el.css({
	                marginTop: -$elHeight/2,
	                marginLeft: -$elWidth/2,
	            })
	          
	        } else {
	            $el.css({top: 0, left: 0});
	        }
			
	        
	        
	        $el.find('a.btn-layerClose').click(function(){
	            isDim ? $('.dim-layer').fadeOut() : $el.fadeOut(); // 닫기 버튼을 클릭하면 레이어가 닫힌다.
	            return false;
	        });
	
	        $('.layer .dimBg').click(function(){
	            $('.dim-layer').fadeOut();
	            return false;
	        });
	
	    }
	    
	    function deleteBoard(board_no){
	    	$.ajax({
	    		url : 'mypage_delete.do?board_no='+board_no,
	    		type:"get",
	    		success:function(data){
	    			alert('삭제성공')
	    			location.reload();
	    		},error:function(data){
	    			alert('통신실패')
	    		}
	    		
	    	});
	    }
	
		function dateFormat(yyyymmdd){
			var sub = yyyymmdd.substring(5);
			sub.replace("-","\월");
			sub.append("일");
			return sub;
		}
	</script>
</html>