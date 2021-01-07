<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/food_dailyrecord.css" />
</head>
<body>

	<!-- 팝업 시작 -->
	<div class="wrapper bg-white mt-sm-5" id="food_popup"
		style="display: none;">
		<div class="py-2">
			<table id="input" border="1px solid black">
				<colgroup>
					<col width="200px">
					<col width="400px">
				</colgroup>
				<tr>
					<th>음식 이름</th>
					<td id="foodname"><input type="hidden" id="foodno" /></td>
				</tr>
				<tr>
					<th>먹은 양</th>
					<td><input type="number" id="gram" style="width: 100%;"
						onkeyup="calc(this.value)" placeholder="섭취한 g(그램)을 입력해주세요. " /></td>
				</tr>
				<tr>
					<th>칼로리</th>
					<td><span id="intakekcal" style="font-size: 16pt;"></span></td>
				</tr>


			</table>

			<table id="detailtable" border="1px solid black">
				<colgroup>
					<col width="300px">
					<col width="300px">
				</colgroup>
				<tr>
					<th colspan="2" style="font-size: 20pt;" id="foodname"></th>
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
				<tr>
					<td colspan="2">
						<button onclick="record_kcal()" class=" btn btn-danger mr-3">저장
						</button>
						<button onclick="close_popup()" class=" btn btn-danger mr-3">닫기
						</button>

					</td>
				</tr>
			</table>

		</div>
	</div>
	<div class="food_background"></div>

	<script type="text/javascript">
		
	
		
		//그램 입력
		
		function calc(val){
			console.log("실행됨")
			
				 var gram =parseInt(val);
				   	var dbGram = $("#servingsize").text();
				    var dbKcal =$("#foodkcal").text();
				    var idx = dbKcal.lastIndexOf('k');
				    var dbkcal =  dbKcal.substr(0,idx);
				    
				    var intakekcal = parseInt((dbkcal*gram)/dbGram);
				    console.log(gram,dbGram,dbkcal)
				    if(val == ""){
				       $('#intakekcal').text( "0");
				    }else{
				        $('#intakekcal').text( intakekcal);
				    }
		}
function close_popup(){
	 $('#gram').val( "");
	 $('#intakekcal').text( "");
			$(".food_background").fadeOut();
			$('#food_popup').fadeOut();
		}
		
	
	</script>

</body>
</html>