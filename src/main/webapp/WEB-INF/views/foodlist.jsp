<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%@include file="header.jsp" %>

<h2>게시판</h2>

<div id="outter" style="width:100%;"> 
	<table border="1" style="margin:auto;">
		<colgroup>
			<col width="100px"/>
			<col width="300px"/>
			<col width="150px"/>
			<col width="150px"/>
			
		</colgroup>
		
		<tr>
			<th>No.</th>
			<th width="50%">음식이름</th>
			<th>열량(kcal)</th>
			<th>1회제공량(g)</th>
		</tr>
		<c:forEach items="${viewAll }" var="list">
			<tr>
				<td align="center">${list.food_no}</td>
				<td><a href='detail?seq=${list.food_no }'>${list.food_name }</a></td>
				<td>${list.kcal }</td>
				<td>${list.serving_size } </td>
			</tr>
		</c:forEach>
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
</div>

</body>
</html>