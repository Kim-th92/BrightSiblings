<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dabom_mainpage</title>
<link rel="stylesheet" type="text/css" href="resources/css/main.css">
<link rel="stylesheet" type="text/css" href="resources/css/write.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="https://cdn.ckeditor.com/4.15.1/standard/ckeditor.js"></script>
<script type="text/javascript" src="resources/js/write.js"></script>
<style>
	*{
	list-style: none;
	}

	.btn-example:link {
		text-decoration: none;
		color: #e600ac;		
	}
	.btn-example:visited {
		text-decoration: none;
	}
	.btn-example:active {
		text-decoration: none;
	}
	.btn-example:hover {
		text-decoration: none;
		color : #800060;
	}
	
	#navi ul li{
		list-style: none;
		width: 80%;
		height: 80px;
		margin-top: 20px;
		margin-left: 20px;
		text-align: middle;
	}	
	#navi ul li a {
		color: black;
	}
	#navi a:hover{
		color:black;
	}
</style>

</head>
<body>
<%@include file="header.jsp" %>


<article id="mainWrap">
	<section id="navi">
	
		<ul>
			<li style="padding-top:25px;">
				<img src="${login.member_profile }" style="width:45px; height:45px; border-radius:20px; overflow: hidden;" >&nbsp;&nbsp;&nbsp;<a href="#"><c:out value="${login.member_name }" /></a>
			</li>
			<li style="padding-top:20px;">
				<img src="/dabom/resources/image/friend.png" style="width:50px; height:36px;">&nbsp;&nbsp;&nbsp;<a href="mypage_friends.do">친구 목록</a>
			</li>
			<li style="padding-top:15px;">
				<img src="/dabom/resources/image/videos.png" style="width:45px; height:45px;">&nbsp;&nbsp;&nbsp;&nbsp;<a href="youtube.do">동영상</a>
			</li>

	
		</ul>
		
		<div id="footer" style="
						position: absolute;
						bottom: 0px;
						width:100%; 
						height: 180px;
						color: black;
						background-color: #fee3ff">
			<p style="text-align:center; margin-top:30px;">&copy; 2020 BrightSiblings | <a href="#" style="text-decoration: none; color: black;" onclick="alert('규태 태형 서원 다희 보민 현준 / 20.01.07 KH')">Dabom</a></p>
			
		</div>
	</section>
	
	<section id="board" style="background-color: ghostwhite;">
		<div id="boardDiv">
			
				<c:choose>
						<c:when test="${empty list }">
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
						</c:when>
						
						
						<c:otherwise>
						
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
							
							
						<c:forEach items="${list }" var="list" varStatus="status">
								<div class="feedWrap">
									<div class="feedProp">
												<fmt:parseDate value="${list.board_regdate }" var="regdate" pattern="yyyy-MM-dd" />
											
												<p><img src="${np[status.index].member_profile }">&nbsp;&nbsp;
													${np[status.index].member_name }
													&nbsp;<span style="font-size:10pt;"><fmt:formatDate value="${regdate }" pattern="MM월 dd일" /></span></p>
											
											
											<c:if test="${login.member_no eq list.member_no  }">
														<span style="float:right; margin-top: -50px;">
														<input class="upDel" type="button" value="삭제"  onclick="location.href='delete.do?board_no=${list.board_no }'">
														<a href="#layer2" class="btn-example2" style="color:#593650;">수정</a>
														</span>
														<div id="layer2" class="pop-layer2">
															<div class="pop-container2">
																<div class="pop-conts">
																
																	<form method="post" action="updateres.do" enctype="multipart/form-data">
																	<c:forEach items="${url[status.index] }" var="url">
																		<img src="${url }" style="width:50%; height: auto;">					
																	</c:forEach>
																		<input type="hidden" value="${list.board_no }" name="board_no">
																		<textarea cols="45" rows="8"  name="board_content" style="resize:none;">${list.board_content }</textarea>
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
																		 </br>
																		<input type="file" name="file1" multiple>
																		
																	
																	<div class="btn-r2">
																		<input type="submit" value="작성">
																		<a href="#" class="btn-layerClose2">Close</a>
																	</div>
																	</form>
																</div>	
															</div>
														</div>
	
														
														
														
														
														
											</c:if>
										<hr>
									</div>
								
									<div class="feedContent">
										<p>${list.board_content }</p>
									</div>
									<div class="feedImage">
										<c:forEach items="${url[status.index]}" var="url">
											<img src="${url}">
										</c:forEach>
									</div>
								<hr>
									<div class="likeWrap">
										<img id="like" src="/dabom/resources/image/red_heart.png"> 0

										<!-- 좋아요-->
									</div>
									<div class="replyWrap">

										<div class="replyProp">
											
											<form action="writeReply.do" method="post">
												<img src="${login.member_profile }">&nbsp;&nbsp;
														<input type="hidden" value="main" name="root">
														<input type="hidden" value="${list.board_no }" name="board_no">
												<input type="text" placeholder="댓글을 입력하세요." name="reply_content" style="width: 85%; height: 30px; border: none; border-radius:8px; background-color:#F8EEF8; padding-left:10px;">
											</form>
										</div>
										<div class="replyList">
											<c:forEach items="${reply[status.index] }" var="rep">
												<p><span>${rep.member_id }&nbsp;&nbsp;&nbsp;</span>${rep.reply_content }</p>
											</c:forEach>
										</div>
									</div>
								</div>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</div>	
					<div id="abctest"></div>

		</div>
	</section>
	
</article>	


<script src="./resource/js/scroll.js"></script>



<script type="text/javascript">
	var currentPage = 2;   // 첫 페이지는 미리 화면에 띄워놓고 2번쨰 페이지 부터 ajax를 호출하기 위해 2로 정함.
    var loginMemberNo = ${login.member_no};
    var Stop = 0;      // ajax로 받아온 pagingStop 값을 쓰기 위한 일회용 변수 선언
    
    $(window).scroll(function() {
       var scrollTop_windowHeight = $(window).scrollTop() + $(window).height();
       var documentHeight = $(document).height();
       if (scrollTop_windowHeight == documentHeight) {   // 스크롤이 바닥을 찍으면 동작하는 조건
          if(stop == currentPage) {         // ajax로 받아온 pagingStop(마지막 페이지 번호)와 스크립스상 currentPage(현재 페이지)가 같을 경우 스크롤 페이징 멈춤.
             alert("더 이상 게시글은 없습니다.")
          } else {
             alert(scrollTop_windowHeight);    // if (scrollTop_windowHeight == documentHeight)의 값이 같은지 확인 
             alert(documentHeight);         // if (scrollTop_windowHeight == documentHeight)의 값이 같은지 확인 
             
             $.ajaxSettings.traditional = true;   // ajax 인코딩 문제로 추가
             $.ajax({
                method: "POST",
                url: "admin_board_paging.do",
                data: {"currentPage" : currentPage},
                success: function(results) {
                   currentPage++;
                   
                   console.log(results);
                   
                   console.log('값 전달 성공');

                   var pagingList = results.pagingList;
                   var pagingNpList = results.pagingNpList;
                   var pagingUrlList = results.pagingUrlList;
                   var pagingRepList = results.pagingRepList;
                   var pagingStop = results.pagingStop;   // DB에 저장된 게시글의 마지막 페이지 번호를 가져옴.
                   stop = pagingStop; // 젤 위의 var stop변수를 pagingStop 값과 같게 해줌.
                   var str = '';
                          
                   $.each(pagingList, function(i){
                      str += '<div class="feedWrap">'
                           + '<div class="feedProp">'
                           + '<img src=' + pagingNpList[i].member_profile + '/> <span>' + pagingNpList[i].member_name + '</span>';
                   
                      if(loginMemberNo == results.pagingList[i].member_no) {       
                         str += '<input type="button" value="수정" onclick="location.href=' + "'" + pagingList[i].board_no +"'" + '">'
                              + '<input type="button" value="삭제" onclick="location.href=' + "'" + pagingList[i].board_no +"'" + '">';
                      }
                      str += '</div>'
                          + '<div class="feedContent">'
                          + '<p>' + pagingList[i].board_content + '</p>'
                          + '</div>';
                           + '<div class="feedImage">';
                           + '<img src="' + pagingUrlList[i] + '"/>'
                          + '</div>';
                           + '<div class="likeWrap">'
                          + '<img id="like" src="../../resources/image/red_heart.png" style="width: 15px; height: 15px;"> 0'
                          + '</div>'
                          + '<div class="replyWrap">';
                            + '<p><span>' + pagingRepList[i].member_id + '</span>' + pagingRepList[i].reply_content + '</p>';
                       str += '<div class="replyProp">'
                          + '<img src="${login.member_profile }">${login.member_name}'
                          + '<form action="writeReply.do" method="post">'
                          + '<input type="hidden" value="'+ pagingList[i].board_no +'" name="board_no">' 
                          + '<input type="text" placeholder="댓글 작성" name="reply_content">'
                          + '<input type="submit" value="입력" />'
                          + '</form>'
                          + '</div>'      //replyProp </div
                          + '</div>'      //replyWrap </div
                          + '</div>';   //feedWrap <div
                   });
                   $("#abctest").append(str);
                }, error: function() {
                   console.log('값 전달 실패');
                   }
             }); // ajax 닫기
          } // else 조건 닫기
       } // 스크롤 if 조건 닫기
    }); // 스크롤 펑션 닫기
					
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
	</script>	
	
	<script type="text/javascript">

		$('.btn-example2').click(function(){
	        var $href = $(this).attr('href');
	        // #Layer2
	        layer_popup2($href);
	    });
		
	    function layer_popup2(el){
	
	        var $el = $(el);    //레이어의 id를 $el 변수에 저장
	        var isDim = $el.prev().hasClass('dimBg2'); //dimmed 레이어를 감지하기 위한 boolean 변수
	
	        isDim ? $('.dim-layer2').fadeIn() : $el.fadeIn();
	
	        
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
			
	        
	        
	        $el.find('a.btn-layerClose2').click(function(){
	            isDim ? $('.dim-layer2').fadeOut() : $el.fadeOut(); // 닫기 버튼을 클릭하면 레이어가 닫힌다.
	            return false;
	        });
	
	        $('.layer2 .dimBg2').click(function(){
	            $('.dim-layer2').fadeOut();
	            return false;
	        });
	
	    }
	</script>	
	
	
	<script type="text/javascript">
		function dateFormat(yyyymmdd){
			var sub = yyyymmdd.substring(5);
			sub.replace("-","\월");
			sub.append("일");
			return sub;
		}
	</script>
	
	
	<script>
	$(document).ready(function() {
		  var placeholderTarget = $('.textbox input[type="text"]');
		  
		  //포커스시
		  placeholderTarget.on('focus', function(){
		    $(this).siblings('label').fadeOut('fast');
		  });

		  //포커스아웃시
		  placeholderTarget.on('focusout', function(){
		    if($(this).val() == ''){
		      $(this).siblings('label').fadeIn('fast');
		    }
		  });
		});
	
	</script>
</body>
</html>