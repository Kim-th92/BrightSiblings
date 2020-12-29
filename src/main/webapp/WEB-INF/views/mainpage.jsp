<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="resources/css/main.css">
<link rel="stylesheet" type="text/css" href="resources/css/write.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="resources/js/write.js"></script>
</head>
<body>
<%@include file="header.jsp" %>


<article id="mainWrap">
	<section id="navi">
	left navi section<br/>
		<ul>
			<li>1st Navi</li>
			<li>2nd Navi</li>
			<li>3rd Navi</li>
			<li>4th Navi</li>
		</ul>
	</section>
	
	<section id="board" style="background-color: ghostwhite;">
		<div id="boardDiv">
					<c:choose>
					
						<c:when test="${empty list }">
							<div class="writeWrap">
								
								<a href="#layer1" class="btn-example">당신의 상태를 알려주세요.</a>	
								<div id="layer1" class="pop-layer">
									<div class="pop-container">
										<div class="pop-conts">
											<img src="${login.member_profile }" style="width:150px;"><br/>
											 ${login.member_name }<br/>
											<form method="post" action="upload.do" enctype="multipart/form-data">
												<p>text:<input type="text" name="text"></p>
												<p><input type="file" name="file1" multiple value="파일"></p>
												<input type="submit" value="작성">
											</form>
											<div class="btn-r">
												<a href="#" class="btn-layerClose">Close</a>
											</div>
										</div>	
									</div>
								</div>
	
							</div>
						</c:when>
						
						
						<c:otherwise>
						
							<div class="writeWrap">
								
								<a href="#layer1" class="btn-example">당신의 상태를 알려주세요.</a>	
								<div id="layer1" class="pop-layer">
									<div class="pop-container">
										<div class="pop-conts">
										
											<form method="post" action="upload.do" enctype="multipart/form-data">
												<textarea cols="40" rows="10" name="text" style="resize:none;"></textarea>
												<div id="forBg" style="width: 200px; height: 100px; background : url('resources/image/kakao.png'); border: 1px solid blue;"><label class="uploadButton" for="fileUpload" style="border: 1px solid red;  ">업로드</label></div>
												<input id="fileUpload" type="file" name="file1" multiple value="파일" style="display:none;">
												<input type="submit" value="작성">
											</form>
											<div class="btn-r">
												<a href="#" class="btn-layerClose">Close</a>
											</div>
										</div>	
									</div>
								</div>
	
							</div>
							
							<c:forEach items="${list }" var= "list" varStatus="status">
									<input id="boardMemberNo" type="hidden" value="${list.member_no }">
									<input id="loginMemberNo" type="hidden" value="${login.member_no }">
									<input id="loginMemberId" type="hidden" value="${login.member_id }">
									
									<input id="boardNo" type="hidden" value="${list.board_no }">
									<div class="feedWrap">
										<div class="feedProp">
											<img src="${np[status.index].member_profile }">
											<span>${np[status.index].member_name }</span>
											<c:if test="${login.member_no eq list.member_no  }">
												<input type="button" value="수정" onclick="location.href='update.do?board_no=${list.board_no }'">
												<input type="button" value="삭제" onclick="location.href='delete.do?board_no=${list.board_no }'">
											</c:if>
										</div>
										<div class="feedContent">
											<p>${list.board_content }</p>
										</div>
										<div class="feedImage">
												<c:forEach items="${url[status.index]}" var = "url">
													<img src="${url}">
												</c:forEach>
										</div>
										<div class="likeWrap">
											<img id="like" src="../../resources/image/red_heart.png" style="width:15px; height: 15px;"> 0
											
											<!-- 좋아요-->
										</div>
										<div class="replyWrap">
												<c:forEach items="${reply[status.index] }" var="rep">
													<p><span>${rep.member_id }</span>${rep.reply_content }</p>
												</c:forEach>
										
											<div class="replyProp">
												<img src="${login.member_profile }">
												${login.member_name}		
												<form action="writeReply.do" method="post">
													<input type="hidden" value="${list.board_no }" name="board_no">
													<input type="text" placeholder="댓글 작성" name="reply_content">
													<input type="submit" value="입력" />
												</form>
											</div>
											
										</div>
									</div>			
							</c:forEach>
						</c:otherwise>
						
					</c:choose>
			
		</div>
	</section>
	
	
</article>
	<script type="text/javascript">
		$('.btn-example').click(function(){
	        var $href = $(this).attr('href');
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
	                marginTop: -$elHeight /2,
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
	</script>

	<script type="text/javascript">
		function insertReply(board_no){
				var replyContent = $(".replyContent").val();
				// 댓글 내용
				console.log(board_no, replyContent)
				
				var replyData = {
						"board_no" : boardNo,
						"reply_content" : replyContent
			};
			// 데이터 한 곳에 뭉침 
			
			if (replyContent == null || replyContent == ""){
				return false;
				// 하나라도 없으면 false 리턴
			} else{
				// 아니라면 ajax
				$.ajax({
					type : "post",
					url : "/dabom/writeReply.do",
					data : JSON.stringify(replyData),
					contentType : "application/json",
					success : function(msg){
						console.log("결과는" + msg + "입니닷");
						location.reload();
					},
					error : function(err){
						console.log(err);
					}
				})				
			}
			
		}
	</script>
</body>
</html>