<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>🍅나의 식단🍅</title>
<link rel="stylesheet" href="resources/css/mypage_food.css" />
</head>
<body>
	<%@include file="header.jsp"%>
	<%@include file="mypage_middle.jsp"%>
	<div id="foodwraper">
		<div id="food_dict">
			<div style="width: 100%;" id="fooddict-wraper">
				<h1>칼로리사전</h1>
				<div class="table-responsive" style="margin: auto; width: 80%;">
					<table class="table table-striped">
						<thead>
							<tr>
								<th align="center" class="col-xs-2">No.</th>
								<th class="col-xs-6">음식이름</th>
								<th class="col-xs-2">열량(kcal)</th>
								<th class="col-xs-2">1회제공량(g)</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${viewAll }" var="list" varStatus="idx">
								<tr class="${idx.count % 2 == 1 ? 'trOdd' : 'trEven'}">
									<td align="center">${list.food_no}</td>
									<td><a style="cursor:pointer;color:#ff1a8c; font-weight: bold;" onclick="fooddetail(${list.food_no})">${list.food_name }</a></td>
									<td>${list.kcal }</td>
									<td>${list.serving_size }</td>
								</tr>
							</c:forEach>
						</tbody>

					</table>

					<div style="display: block; text-align: center;">
						<c:if test="${paging.startPage != 1 }">
							<a
								href="mypage_food.do?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
						</c:if>
						<c:forEach begin="${paging.startPage }" end="${paging.endPage }"
							var="p">
							<c:choose>
								<c:when test="${p == paging.nowPage }">
									<b>${p }</b>
								</c:when>
								<c:when test="${p != paging.nowPage }">
									<a
										href="mypage_food.do?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
								</c:when>
							</c:choose>
						</c:forEach>
						<c:if test="${paging.endPage != paging.lastPage}">
							<a
								href="mypage_food.do?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
						</c:if>
					</div>
					<!-- pagination{e} -->

					<!-- search{s} -->

					<div class="form-group row justify-content-center">
						<div class="w300" style="padding-right: 10px">
							<input type="text" class="form-control form-control-sm"
								name="keyword" id="keyword">
						</div>

						<div>
							<button class="btn btn-sm btn-primary" name="btnSearch"
								id="btnSearch">검색</button>
						</div>
					</div>

					<!-- search{e} -->

				</div>



			</div>
		</div>

		<div id="foodright">
			<div id="food_today">
				<h1></h1>
				오늘 먹은 칼로리는?
				
			</div>
			<div id="food_water">
				<div>
					<h1>하루에 2L마시기!</h1>
					<div class="waterCont">

						<div class="waterContainer">
							<span class="countglass">1잔</span>
							<div class="glass">
								<div class="water"></div>
							</div>
						</div>
						<div class="waterContainer">
							<span class="countglass">2잔</span>
							<div class="glass">
								<div class="water"></div>
							</div>
						</div>

						<div class="waterContainer">
							<span class="countglass">3잔</span>
							<div class="glass">
								<div class="water"></div>
							</div>
						</div>
						<div class="waterContainer">
							<span class="countglass">4잔</span>
							<div class="glass">
								<div class="water"></div>
							</div>
						</div>
						</div>
						<div class="waterCont">
						<div class="waterContainer">
							<span class="countglass">5잔</span>
							<div class="glass">
								<div class="water"></div>
							</div>
						</div>
						<div class="waterContainer">
							<span class="countglass">6잔</span>
							<div class="glass">
								<div class="water"></div>
							</div>
						</div>
						<div class="waterContainer">
							<span class="countglass">7잔</span>
							<div class="glass">
								<div class="water"></div>
							</div>
						</div>
						<div class="waterContainer">
							<span class="countglass">8잔</span>
							<div class="glass">
								<div class="water"></div>
							</div>
						</div>
					</div>


				</div>
			</div>
		</div>
	</div>


<%@ include file="food_dailyrecord.jsp" %>
	<script>
	var today = new Date();
	var year = today.getFullYear(); //년도
	var month = today.getMonth()+1; //월 0부터 시작해서 1더해주기
	var date = today.getDate();
	var foodTodayTitle = $('#food_today h1');
	var day= year +"년"+ month + "월" + date + "일";
	foodTodayTitle.text(day);
	
	var glass;
	$(document).ready(function(){
		 glass= document.querySelectorAll('.glass');
		console.log(glass);
	});
	
		$(document).on('click', '#btnSearch', function(e) {
			e.preventDefault();
			var url = "mypage_food.do";
			url = url + "?keyword=" + $('#keyword').val();
			location.href = url;
			console.log(url);
		});
		$('.glass').click(function(){
			  $(this).children().css('background-position','top left');
			   $(this).children().css('height','11em');
			   $(this).children().addClass('drunk');
			   $(this).children().fadeIn();
			 /*   
			   $.ajax({
				   url:,
				   type:,
				   success:function(data){
					   
				   },
				   error:function(err){
					   
				   }
				   
			   }); */
			})
			
			function fooddetail(foodno){
		
		var foodname = document.getElementById('foodname')
		var foodkcal = document.getElementById('foodkcal')
		var servingsize = document.getElementById('servingsize')
		var carbo = document.getElementById('carbo')
		var protein = document.getElementById('protein')
		var fat= document.getElementById('fat')
		var sugar = document.getElementById('sugar')
		var sodium = document.getElementById('sodium')
		$('#food_popup').fadeIn();
		$('.food_background').fadeIn();
		$.ajax({
			url : 'fooddetail.do?food_no='+foodno,
			type:'get',
			success:function(data){
				var lst = data.fooddetail;
				console.log(lst)
				console.log(lst.food_name)
				foodname.innerHTML=lst.food_name;
				
				foodkcal.innerHTML=lst.kcal + 'kcal';
				servingsize.innerHTML =lst.serving_size;
				carbo.innerHTML=lst.carbohydrate;
				protein.innerHTML=lst.protein;
				fat.innerHTML=lst.fat;
				sodium.innerHTML =lst.sodium;
				sugar.innerHTML=lst.sugar;
				
				
			},error:function(data){
				alert(err);
			}
		});
	}
	
	</script>

</body>
</html>