<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<title>메인 페이지</title>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100&display=swap" rel="stylesheet">
<style>
	.content{
		height: 800px;
		width: 1200px;
		margin: 0 auto;
	}
	
	/* Make the image fully responsive */
  .carousel-inner img {
    width: 100%;
    height: 600px;
  }
  
  
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.js"></script>

</head>
<body>
	<jsp:include page="/WEB-INF/views/main/header.jsp"></jsp:include>
	<div>
		<div id="demo" class="carousel slide" data-ride="carousel">
			<!-- Indicators -->
			<ul class="carousel-indicators">
				<li data-target="#demo" data-slide-to="0" class="active"></li>
				<li data-target="#demo" data-slide-to="1"></li>
				<li data-target="#demo" data-slide-to="2"></li>
			</ul>

			<!-- The slideshow -->
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img src="/imgs/banner3.jpg" alt="image" width="100%"
						height="300px">
				</div>
				<div class="carousel-item">
					<img src="/imgs/banner2.jpg" alt="image" width="100%"
						height="300px">
				</div>
				<div class="carousel-item">
					<img src="/imgs/banner1.jpg" alt="image" width="100%"
						height="300px">
				</div>
			</div>

			<!-- Left and right controls -->
			<a class="carousel-control-prev" href="#demo" data-slide="prev">
				<span class="carousel-control-prev-icon"></span>
			</a> <a class="carousel-control-next" href="#demo" data-slide="next">
				<span class="carousel-control-next-icon"></span>
			</a>
		</div>
	</div>
	<div class="content"></div>
	<c:if test="${not empty sessionScope.member }">
	<jsp:include page="/WEB-INF/views/main/chat.jsp"></jsp:include>
		
	</c:if>
	<jsp:include page="/WEB-INF/views/main/footer.jsp"/>
</body>
</html>