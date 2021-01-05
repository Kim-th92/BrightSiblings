<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file="header.jsp" %>
<title>Insert title here</title>
   <link href="https://fonts.googleapis.com/css?family=Poppins:400,800" rel="stylesheet" />
<link rel="stylesheet" href="resources/css/foodlist.css"/>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body>

<div style ="width:100%;" id ="fooddict-wraper">

<h2 style="text-align: center;margin:20px;">게시판</h2>
<div   style="text-align: center;margin:20px 0px;">
	<img style="width: 90%; height:150px;" src="./resources/image/foodbanner.jpg" alt="음식배너"/>
</div>
<div class="table-responsive" style="margin:auto; width:80%;"> 
	<table class="table table-striped" >
	<thead>
		<tr>
			<th align="center" class="col-xs-2">No.</th>
			<th class="col-xs-6" >음식이름</th>
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
				<td>${list.serving_size } </td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div style="display: block; text-align: center;">		
		<c:if test="${paging.startPage != 1 }">
			<a style="color:#ff1a8c;" href="foodlist.do?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
		</c:if>
		<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
			<c:choose>
				<c:when test="${p == paging.nowPage }">
					<b>${p }</b>
				</c:when>
				<c:when test="${p != paging.nowPage }">
					<a style="color:#ff1a8c;"  href="foodlist.do?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
				</c:when>
			</c:choose>
		</c:forEach>
		<c:if test="${paging.endPage != paging.lastPage}">
			<a style="color:#ff1a8c;"  href="foodlist.do?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
		</c:if>
	</div>
		<!-- pagination{e} -->

		<!-- search{s} -->

		<div class="form-group row justify-content-center">
			<div class="w300" style="padding-right:10px">
				<input type="text" class="form-control form-control-sm" name="keyword" id="keyword">
			</div>

			<div>
				<button class="btn btn-sm btn-primary" style="background-color: #ff1a8c; border:none;" name="btnSearch" id="btnSearch">검색</button>
			</div>
		</div>

		<!-- search{e} -->
   
</div>

<div id="footer">
		<div>© 2021 DABOM</div>
	</div>

<script>
	$(document).on('click', '#btnSearch', function(e){
		e.preventDefault();
		var url = "foodlist.do";
		url = url + "?keyword=" + $('#keyword').innerHTML();
		location.href = url;
		console.log(url);
	});	

	
	
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



</div>
<%@include file = "fooddetail.jsp" %>
</body>
</html>