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
	<button onclick="location.href='basic.do'"> 웹소켓 테스트으으</button>
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