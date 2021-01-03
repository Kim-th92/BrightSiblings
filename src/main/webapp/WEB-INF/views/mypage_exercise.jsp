<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="resources/css/exercise.css" type="text/css">
<body>
<%@include file="header.jsp" %>
<%@include file="mypage_middle.jsp" %>

	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script src="https://html2canvas.hertzen.com/dist/html2canvas.min.js"></script>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e524d46f1f18a6a0be2977706f8edcc1"></script>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e524d46f1f18a6a0be2977706f8edcc1&libraries=services,clusterer,drawing"></script>
	<div id="map" style="width: 900px; height: 500px; margin: auto;"></div>

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
				content += '</ul>'
			
			document.getElementById('running_distance').value = distance;
			document.getElementById('burn_kcal').value = distance/20;
			
			return content;
		}
	</script>
	
	<style>form {margin: 0 auto; width: 460px;}</style>
	
	<form action="distanceres.do" method="post">
		<b>
		오늘 ${login.member_name }님이 달린 총 거리는
		<input readonly="readonly" id="running_distance" name="distance" type="text" style="width:70px;height:22px;"/>
		m 입니다
		</b>
		<input type="hidden" name="member_no" value="${login.member_no }"/>
		<input type="hidden" id="burn_kcal" name="burn_kcal" value=""/>
		<input type="submit" value="거리 등록"/>
	</form>
	
	<br/>
	<br/>
	<br/>
	<br/>
	<br/>
	<br/>
	<br/>
	<br/>
	<br/>
	<br/>
	<br/>
	<br/>
	<br/>

</body>
</html>