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

<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.js"></script>

<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100&display=swap" rel="stylesheet">
<style>
	.content{
		height: 450px;
		width: 1200px;
		margin: 0 auto;
	}
	
	/* Make the image fully responsive */
  .carousel-inner img {
    width: 100%;
    height: 800px;
  }
  
  .companyIntro{
  	text-align: center;
  	margin: 0 auto;
  	
  }
  
  .imgGround{
  	width: 100%;
  	height: 700px;
  	margin: 0 auto;
	background-image: url("/imgs/바다.png");
	background-repeat: no-repeat;
	background-size: cover;
	background-position: 50%;
	opacity: 0.7;
  }
  
  .groundText{
  	width: 80%;
  	margin: 0 auto;
  	background-color: white;
  	height: 600px;
  	padding: 50px;
  	overflow: hidden;

  }
  
  .groundText>div{
  	float: left;
  }
  
  .sec1{
  	width: 50%;
  	height: 100%;
  	border-right: 1px solid grey;
  	
  }
  
  .sec2{
  	width: 45%;
  	height: 100%;
  	margin-left: 60px;
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
	<div class="content">
		<div class="companyIntro">
		<br><br>
			<h1>회사소개</h1>
			<hr>
			<span style="font-size: 60px; font-weight: bold; color: #0fbcff; ">Don Give Up</span><span style="font-size: 40px; font-weight: bold;">은<br>Donation(기부)을 Don't Give Up(포기하지 말라)는 <br>뜻에서 탄생한 새로운 단체의 이름입니다.</span>
		</div>
	</div>
	<div class="imgGround">
	<br><br>
		<div class="groundText">
			<div class="sec1">
				<span style="font-size: 75px; font-weight: bold; color: #0fbcff;">Funation</span><br><hr><br>
				<span style="font-size: 50px; font-weight: bold;">1. Fun(재미)</span><br>
				<span style="font-size: 50px; font-weight: bold;">2. Donation(기부)</span><br><br><br>
				<span style="font-size: 25px; font-weight: bold; color: black;">Don Give Up은 재미와 기부가 합쳐진 기부방식을<br> 추구하는 사회 공헌 단체입니다.</span>
			</div>
			<div class="sec2">
			<br><br>
				<span>
					77억명 모두가 걱정없이 살아갈 수 있는 방법은 무엇일까?<br>
					기부는 모두에게 해당하는 말이 될 수 없을까?<br>
					미래를 바꿀 수 있는 환경을 만들수 있을까?<br><br>
				</span><br>
				<span style="font-weight: bold;">
					우리가 당면한 수많은 질문들에 Don Give Up은<br>
					우리들의 생활에서 답을 찾기로 결심했습니다.<br>
					새로운 기회를 만들어가고<br>
					모든이에게 행복을 전하는<br>
				</span><br><br>
				<span style="font-weight: bold; font-size: 30px; text-decoration: underline;">
					우리는 오늘의 질문에<br>
					내일의 희망으로 모두에게 꿈을주는<br>
					<span style="color: #0fbcff;">Don Give Up</span> 입니다.
				</span>
			</div>
		</div>
	</div>
	<c:if test="${not empty sessionScope.member }">
		<jsp:include page="/WEB-INF/views/main/chat.jsp"></jsp:include>
	</c:if>
	<jsp:include page="/WEB-INF/views/main/footer.jsp"></jsp:include>


</body>
<script>

</script>

</html>