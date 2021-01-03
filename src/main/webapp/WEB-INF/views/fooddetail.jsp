<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>11</title>
<link rel="stylesheet" href="resources/css/fooddetail.css" />
</head>
<body>

	<!-- 팝업 시작 -->
	<div class="wrapper bg-white mt-sm-5" id="food_popup"
		style="display: none;">
		<div class="py-2">
			<table id="detailtable" >
				<colgroup>
					<col width="300px">
					<col width="300px">
				</colgroup>
				<tr>
					<th colspan="2"  style="font-size:40pt;"id ="foodname"></th>
				</tr>
				<tr>
					<th colspan="2">열량(1회 제공량 당)</th>
				</tr>
				<tr>
					<td colspan="2" id="foodkcal"></td>
				</tr>
				<tr>
					<th>1회 제공량(g)</th>
					<th>탄수화물</th>
				</tr>
				<tr>
					<td id="servingsize"></td>
					<td id="carbo"></td>
				</tr>
				<tr>
					<th>프로틴</th>
					<th>지방</th>
				</tr>
				<tr>
					<td id="protein"></td>
					<td id="fat"></td>

				</tr>
				<tr>
					<th>당류</th>
					<th>나트륨</th>
				</tr>
				<tr>
					<td id="sugar"></td>
					<td id="sodium"></td>
				</tr>
			</table>
			<button onclick="close_popup()" class=" btn btn-danger mr-3">닫기 </button>
		</div>
	</div>
	<div class="food_background"></div>
	
	<script type="text/javascript">
		function close_popup(){
			
			$(".food_background").fadeOut();
			$('#food_popup').fadeOut();
		}
	</script>

</body>
</html>