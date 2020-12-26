<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css2?family=Song+Myung&display=swap" rel="stylesheet">
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js">
	
</script>

<%@include file="header.jsp" %>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/animejs/2.0.2/anime.min.js"></script>
<link href="resources/css/news_main.css" rel ="stylesheet"/>
<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
<script src="https://apis.google.com/js/client:platform.js?onload=start"
	async defer>
	
</script>
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
</head>
<body>


<div id ="background">
	<div id="chartdiv"></div>
	<div>
		<div id="img-background">
			<img  src="resources/image/bg_structure.png" alt="배경이미지"/>

		</div>
	
	</div>
</div>
<section class="news">
	<section class="news_section1_news_section">
	<c:choose>
					
						<c:when test="${empty list }">
							<div>
							
							<h1> 📰<br/>단어를 클릭해서 <br/>뉴스를 확인해 보세요</h1></div>
						</c:when>
						
						
						<c:otherwise>
						
							<c:forEach items="${list }" var= "dto" >
							
								<div class="news_section1_content"  onclick="location.href='${dto.link}'" style="cursor: pointer;">
									<div class="content_box">
										<div class="content_img_box">
											<a>
												<input type="hidden" value="${dto.link }">
												<img src="${dto.img }"/>
											</a>
										</div>
									</div>
									<div class="content_heart">
										<div class="background_bg"></div>
										<p class="content_title" onclick="location.href='${dto.link}'">
											${dto.title }
										</p>
									</div>
								</div>
									
							</c:forEach>
						</c:otherwise>
						
					</c:choose>
			
	</section>
</section>



	<!-- 워드클라우드 임포트 코드-->
	<script src="https://cdn.amcharts.com/lib/4/core.js"></script>
	<script src="https://cdn.amcharts.com/lib/4/charts.js"></script>
	<script src="https://cdn.amcharts.com/lib/4/plugins/wordCloud.js"></script>
	<script src="https://cdn.amcharts.com/lib/4/themes/animated.js"></script>
<script src ="resources/js/news_main.js" type="text/javascript"></script>

</body>
</html>