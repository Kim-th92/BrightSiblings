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



<h2>게시판</h2>
<div style ="width:100%;">
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
				<td><a href='detail?seq=${list.food_no }'>${list.food_name }</a></td>
				<td>${list.kcal }</td>
				<td>${list.serving_size } </td>
			</tr>
		</c:forEach>
		</tbody>
		
	</table>
	
	<div style="display: block; text-align: center;">		
		<c:if test="${paging.startPage != 1 }">
			<a href="foodlist.do?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
		</c:if>
		<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
			<c:choose>
				<c:when test="${p == paging.nowPage }">
					<b>${p }</b>
				</c:when>
				<c:when test="${p != paging.nowPage }">
					<a href="foodlist.do?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
				</c:when>
			</c:choose>
		</c:forEach>
		<c:if test="${paging.endPage != paging.lastPage}">
			<a href="foodlist.do?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
		</c:if>
	</div>
	<div class="inner-form" style="display: block; text-align: center;">
            <div class="input-field">
             <input id="search" type="text" placeholder="검색"  />
              <button class="btn-search" type="button">
					<i class="fas fa-search"></i>
              </button>
             
            </div>
          </div>
   
</div>
</div>
</body>
</html>