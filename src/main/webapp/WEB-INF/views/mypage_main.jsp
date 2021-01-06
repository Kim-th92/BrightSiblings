<%@ page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.ckeditor.com/4.15.1/standard/ckeditor.js"></script>
<link rel="stylesheet" href="/dabom/resources/css/mypage_main.css">
</head>
<link rel="stylesheet" href="resources/css/mypage_main.css" />
<body>
<jsp:include page="header.jsp"></jsp:include>
<jsp:include page="mypage_middle.jsp"></jsp:include>

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
								<div>
									<img src="${login.member_profile }">
									<a href="#layer1" class="btn-example" style="color:#e600ac;">당신의 상태를 알려주세요.</a>
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
									<img src="${login.member_profile }">
									${login.member_id}
									<fmt:parseDate value="${list.board_regdate }" var="regdate" pattern="yyyy-MM-dd" />
									<fmt:formatDate value="${regdate }" pattern="MM월 dd일" /></p>
									<div class="upDel" style="text-align: right; ">
											<input type="button" value="수정" onclick="location.href='update.do?board_no=${list.board_no }'">
											<input type="button" value="삭제" onclick="deleteBoard(${list.board_no })">
									</div>
								</div>
								<div class="feedContent">
									${list.board_content }
								</div>
								<div class="feedImage">
									<c:forEach var="url" items="${list.urlList }" >
										<img src="${url }">
									</c:forEach>
								</div>
								
								<div class="feedReply">
									<c:forEach var="rep" items="${list.replyList }">
										<p>${rep }</p>
									</c:forEach>
									<form action="writeReply.do" method="post">
												<input type="hidden" value="mypage" name="root">
												<input type="hidden" value="${list.board_no }" name="board_no"> 
												<input type="text" placeholder="" name="reply_content" style="height:18px; font-size: 10pt;">
												 <input type="submit" value="입력" />

									</form>
									 
									
								</div>
							
							</div><!-- feedWrap -->
						</c:forEach>
				</c:otherwise>
			</c:choose>
			
		</div>
		
		
	</div>
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
</body>
</html>