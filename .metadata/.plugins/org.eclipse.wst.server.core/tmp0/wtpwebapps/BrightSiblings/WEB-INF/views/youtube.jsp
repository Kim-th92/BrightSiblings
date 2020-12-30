<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<title>Exercise List</title>
</head>
<body>
<%@include file="header.jsp" %>
    <div class="container mt-5 pt-5">
        <h1 class="display-4 text-center">Exercise</h1>
        <div class="row my-5" id="video-channel"></div>
        <br>
        <hr>
        <br>
        <h1 class="display-4 text-center">Latest Youtube Videos</h1>
        <div class="row my-5" id="video-container"></div>
    </div>
</body>
<script src="./resources/js/youtube_playlist.js"></script>

</html>