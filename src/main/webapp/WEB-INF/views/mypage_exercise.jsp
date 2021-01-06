<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style type="text/css">form {margin: 0 auto; width: 460px;}</style>
<style type="text/css">
#course{
	border:none;
	background-color:#ea97ad;
    padding: 10px 140px;
    border-radius: 5% 5%;
    }
#today{
	text-align:center;
}
.preview{	
	position: absolute;
	background-color: #ea97ad;
	width: 400px;
	height: 400px;
	text-align: center;
	line-height: 70px;
	border-radius: 40px 40px 40px 40px;
}
</style>
<link rel="stylesheet" href="resources/css/exercise.css" type="text/css">
<body>
<jsp:include page="header.jsp"></jsp:include>
<jsp:include page="mypage_middle.jsp"></jsp:include>
	<script type="text/javascript">
	
		function selectCheck(form) {
			form.submit();
		}
		
		function monthDown(form) {
			if (form.month.value > 1) {
				form.month.value--;
			} else {
				form.month.value = 12;
				form.year.value--;
			}
			form.submit();
		}
		
		function monthUp(form) {
			if (form.month.value < 12) {
				form.month.value++;
			} else {
				form.month.value = 1;
				form.year.value++;
			}
			form.submit();
		}
		
	</script>
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script src="https://html2canvas.hertzen.com/dist/html2canvas.min.js"></script>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e524d46f1f18a6a0be2977706f8edcc1"></script>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e524d46f1f18a6a0be2977706f8edcc1&libraries=services,clusterer,drawing"></script>
	<div id="map" style="width: 800px; height: 400px; margin: auto;"></div>

	<script>
		var container = document.getElementById('map');
		var options = {
			center : new kakao.maps.LatLng(33.450701, 126.570667),
			level : 4
		};
		var map = new kakao.maps.Map(container, options);
	</script>
	
	<script>
	
		if (navigator.geolocation) {
			navigator.geolocation.getCurrentPosition(function(position) {
				var lat = position.coords.latitude;
				var lon = position.coords.longitude;
				map.setCenter(new kakao.maps.LatLng(lat, lon));
				var locPosition = new kakao.maps.LatLng(lat, lon);
				var marker = new kakao.maps.Marker({
					map : map,
					position : locPosition
				});
				marker.setMap(map);
			});
		} else {
			var locPosition = new kakao.maps.LatLng(37.24065819884836, 131.86713661059272);
			var message = '<div style="padding:15px; margin:15px;">현재 위치에 대한 정보를 가져올 수 없는 브라우저입니다.</div>';
			var marker = new kakao.maps.Marker({
				map : map,
				position : locPosition
			});
			var infowindow = new kakao.maps.InfoWindow({
				content : message
			});
			infowindow.open(map, marker);
			map.setCenter(locPosition);
		}
	</script>

	<script>
		var mapTypeControl = new kakao.maps.MapTypeControl();
		map.addControl(mapTypeControl, kakao.maps.ControlPosition.BOTTOM);
		var zoomControl = new kakao.maps.ZoomControl();
		map.addControl(zoomControl, kakao.maps.ControlPosition.BOTTOMRIGHT);
	</script>

	<script>
		var drawingFlag = false;
		var moveLine;
		var clickLine;
		var distanceOverlay;
		var dots = {};
		kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
			
			var clickPosition = mouseEvent.latLng;
			
			if (!drawingFlag) {
				drawingFlag = true;
				deleteClickLine();
				deleteDistnce();
				deleteCircleDot();
				
				clickLine = new kakao.maps.Polyline({
					map : map,
					path : [ clickPosition ],
					strokeWeight : 3,
					strokeColor : 'pink',
					strokeOpacity : 1,
					strokeStyle : 'shortdash'
				});
				
				moveLine = new kakao.maps.Polyline({
					strokeWeight : 2,
					strokeColor : 'pink',
					strokeOpacity : 0.5,
					strokeStyle : 'solid'
				});

				displayCircleDot(clickPosition, 0);

			} else {

				var path = clickLine.getPath();
				path.push(clickPosition);
				clickLine.setPath(path);
				var distance = Math.round(clickLine.getLength());
				displayCircleDot(clickPosition, distance);
				
			}
		});

		kakao.maps.event.addListener(map, 'mousemove', function(mouseEvent) {
			if (drawingFlag) {

				var mousePosition = mouseEvent.latLng;
				var path = clickLine.getPath();
				var movepath = [ path[path.length - 1], mousePosition ];
				moveLine.setPath(movepath);
				moveLine.setMap(map);
				var distance = Math.round(clickLine.getLength() + moveLine.getLength());
				var content = '<div class="dotOverlay distanceInfo">총 거리 <span class="number">'
								+ distance + '</span>m</div>';
				showDistance(content, mousePosition);
				
			}
		});

		kakao.maps.event.addListener(map, 'rightclick', function(mouseEvent) {

			if (drawingFlag) {

				moveLine.setMap(null);
				moveLine = null;
				var path = clickLine.getPath();

				if (path.length > 1) {
					
					if (dots[dots.length - 1].distance) {
						
						dots[dots.length - 1].distance.setMap(null);
						dots[dots.length - 1].distance = null;
						
					}
					
					var distance = Math.round(clickLine.getLength());
					var content = getTimeHTML(distance);
					showDistance(content, path[path.length - 1]);
					
				} else {
					
					deleteClickLine();
					deleteCircleDot();
					deleteDistnce();
					
				}
				
				drawingFlag = false;
				
			}
			
		});

		function deleteClickLine() {
			
			if (clickLine) {
				clickLine.setMap(null);
				clickLine = null;
			}
			
		}

		function showDistance(content, position) {

			if (distanceOverlay) {

				distanceOverlay.setPosition(position);
				distanceOverlay.setContent(content);

			} else {

				distanceOverlay = new kakao.maps.CustomOverlay({
					map : map,
					content : content,
					position : position,
					xAnchor : 0,
					yAnchor : 0,
					zIndex : 3
				});
				
			}
			
		}

		function deleteDistnce() {
			if (distanceOverlay) {
				distanceOverlay.setMap(null);
				distanceOverlay = null;
			}
		}

		function displayCircleDot(position, distance) {

			var circleOverlay = new kakao.maps.CustomOverlay({
				content : '<div class="dot"></div>',
				position : position,
				zIndex : 1
			});

			circleOverlay.setMap(map);

			if (distance > 0) {
				var distanceOverlay = new kakao.maps.CustomOverlay(
						{
							position : position,
							yAnchor : 1,
							zIndex : 2
						});

				distanceOverlay.setMap(map);
			}

			dots.push({
				circle : circleOverlay,
				distance : distanceOverlay
			});
		}

		function deleteCircleDot() {
			var i;

			for (i = 0; i < dots.length; i++) {
				if (dots[i].circle) {
					dots[i].circle.setMap(null);
				}

				if (dots[i].distance) {
					dots[i].distance.setMap(null);
				}
			}

			dots = [];
		}

		function getTimeHTML(distance) {

			var walkkTime = distance / 67 | 0;
			var walkHour = '', walkMin = '';

			if (walkkTime > 60) {
				walkHour = '<span class="number">' + Math.floor(walkkTime / 60) + '</span>시간 '
			}
			
			walkMin = '<span class="number">' + walkkTime % 60 + '</span>분'

			var bycicleTime = distance / 227 | 0;
			var bycicleHour = '', bycicleMin = '';

			if (bycicleTime > 60) {
				bycicleHour = '<span class="number">'
						+ Math.floor(bycicleTime / 60) + '</span>시간 '
			}
			bycicleMin = '<span class="number">' + bycicleTime % 60
					+ '</span>분'

			var content =  '<ul class="dotOverlay distanceInfo">';
				content += '	<li>';
				content += '		<span class="label">총 거리</span><span class="number">' + distance + '</span>m';
				content += '	</li>';
				content += '	<li>';
				content += '		<span class="label">도보</span>' + walkHour + walkMin;
				content += '	</li>';
				content += '	<li>';
				content += '		<span class="label">자전거</span>' + bycicleHour + bycicleMin;
				content += '	</li>';
				content += '</ul>';
			
			document.getElementById('distance').value = distance;
			document.getElementById('burn_kcal').value = distance/20;
			
			return content;
		}
	</script>
	<br/>
	<br/>
	<form action="distanceres.do" method="post">
		코스 이름:
		<input type="text" name="course_name"/>
		<input type="submit" id="course" value="오늘의 코스로 등록"/>
		<input type="hidden" id="distance" name="distance"/>
		<input type="hidden" name="member_no" value="${login.member_no }"/>
		<input type="hidden" id="burn_kcal" name="burn_kcal" value=""/>
	</form>
	
	<h1>오늘의 기록</h1>

	<table id="today" border="1">
		<colgroup>
			<col width="400" />
			<col width="222" />
			<col width="222" />
		</colgroup>
		<tr>
			<th>코스</th>
			<th>뛴 거리</th>
			<th>소모 칼로리</th>
		</tr>
		<c:choose>
			<c:when test="${empty list }">
				<tr>
					<td colspan="3" align="center">---오늘의 코스를 등록해주세요---</td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach items="${list }" var="dto">
					<tr>
						<td>${dto.course_name }</td>
						<td align="center">${dto.distance }m</td>
						<td align="center">${dto.burn_kcal }kcal</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>
	
	<c:choose>
		<c:when test="${empty total }">
			<p>총합 뛴 거리		: 0</p>
			<p>총합 소모 칼로리	: 0</p>
		</c:when>
		<c:otherwise>
				<c:forEach items="${total }" var="dto">
					<p>총합 뛴 거리		: ${dto.total_distance }m</p>
					<p>총합 소모 칼로리	: ${dto.total_burn_kcal }kcal</p>
				</c:forEach>
		</c:otherwise>
	</c:choose>
	
	
	<br/>
	<br/>
	<br/><input type="hidden" class="n" value="${login.member_no }"/>
	
<script type="text/javascript">
	$(function(){
		$(".daycount").hover(function(){
		
			var member_no = $(".n").val().trim();
			
			var countView = $(this);
			var year = $(".y").val().trim();
			var month = $(".m").val().trim();
			var day = countView.text().trim();
			
			var form = {
				member_no: member_no,
				yyyyMMdd: year + isTwo(month) + isTwo(day)
			}
			
			$.ajax({
				url: "calendarAjax.do",
				type: "POST",
				data: form,
				dataType: "json",
				success:function(map){
					
					var tk = map.tk;
					var tik = map.tik;
					var td = map.td;
					var tbk = map.tbk;
					
					countView.after("<div class='preview'>"+tk+"ㅎㅇ"+tik+"ㅎㅇ"+td+"ㅎㅇ"+tbk+"</div>");
					
				},
				error:function(){
					alert("서버 통신 실패");
				}
			});
			
		}, function(){
			$(".preview").remove();			
		});
	});
	
	function isTwo(n) {
		return (n.length<2)?"0"+n:n;
	}
</script>
	
<%

	//현재 날짜 정보
	Calendar cal = Calendar.getInstance();

	int year = cal.get(Calendar.YEAR);
	int month = cal.get(Calendar.MONTH);
	int date = cal.get(Calendar.DATE);
	
	//오늘 날짜
	String today = year + "." + (month + 1) + "." + date;
	
	//선택한 연도, 월
	String input_year = request.getParameter("year");
	String input_month = request.getParameter("month");
	
	if (input_month != null) {
		month = Integer.parseInt(input_month) - 1;
	}
	
	if (input_year != null) {
		year = Integer.parseInt(input_year);
	}
	
	// 1일부터 시작하는 달력을 만들기 위해 오늘의 연도,월을 셋팅하고 일부분은 1을 셋팅한다.
	cal.set(year, month, 1);
	
	// 셋팅한 날짜로 부터 아래 내용을 구함
	// 해당 월의 첫날를 구함
	int startDate = cal.getMinimum(Calendar.DATE);
	
	// 해당 월의 마지막 날을 구함
	int endDate = cal.getActualMaximum(Calendar.DATE);
	
	// 1일의 요일을 구함
	int startDay = cal.get(Calendar.DAY_OF_WEEK);
	
	int count = 0;
	
%>
	<br/>
	<br/>
	<br/>
	<form method="post" action="mypage_exercise.do" name="change">
		<table width="400" cellpadding="2" cellspacing="0" border="0" align="center">
		
			<tr>
			<td width="140" align="right"><input type="button" value="◁" onClick="monthDown(this.form)"></td>
			<td width="120" align="center">
			<select class="y" name="year" onchange="selectCheck(this.form)">
				<%
					for (int i = year - 10; i < year + 10; i++) {
					String selected = (i == year) ? "selected" : "";
					String color = (i == year) ? "#CCCCCC" : "#FFFFFF";
					out.print("<option value=" + i + " " + selected + " style=background:" + color + ">" + i + "</option>");
				}
				%>
			</select>
			
			<select class="m" name="month" onchange="selectCheck(this.form)">
					<%
						for (int i = 1; i <= 12; i++) {
						String selected = (i == month + 1) ? "selected" : "";
						String color = (i == month + 1) ? "#CCCCCC" : "#FFFFFF";
						out.print("<option value=" + i + " " + selected + " style=background:" + color + ">" + i + "</option>");
					}
					%>
			</select>
			</td>
			
			<td width="140"><input type="button" value="▷" onClick="monthUp(this.form)"></td>
			
			</tr>
			
			<tr>
				<td align="right" colspan="3">
					<a href="mypage_exercise.do"><font size="2">오늘 : <%=today%></font></a>
				</td>
			</tr>
			
		</table>
	</form>
	<table width="400" cellpadding="2" cellspacing="0" border="1" align="center">
		<tr height="30">
			<td><font size="2">일</font></td>
			<td><font size="2">월</font></td>
			<td><font size="2">화</font></td>
			<td><font size="2">수</font></td>
			<td><font size="2">목</font></td>
			<td><font size="2">금</font></td>
			<td><font size="2">토</font></td>
		</tr>
		<tr height="30">
			<%
				for (int i = 1; i < startDay; i++) {
					count++;
			%>
			<td>&nbsp;</td>
			<%
				}
			
			for (int i = startDate; i <= endDate; i++) {
				String bgcolor = (today.equals(year + "." + (month + 1) + "." + i)) ? "#CCCCCC" : "#FFFFFF";
				String color = (count % 7 == 0 || count % 7 == 6) ? "red" : "black";
				count++;
			%>
			<td bgcolor="<%=bgcolor%>">
				<font class="daycount" size="10" color=<%=color%>>
					<%=i%>
				</font>
			</td>
			<%
				if (count % 7 == 0 && i < endDate) {
			%>
				</tr>	
				<tr height="30">
			<%
				}
			}
			
			while (count % 7 != 0) {
			%>
			<td>&nbsp;</td>
			<%
				count++;
			}
			%>
		</tr>
	</table>
	
	
	<br/>
	<br/>
	<br/>
	<br/>
	<br/>
	<br/>
	<br/>

</body>
</html>