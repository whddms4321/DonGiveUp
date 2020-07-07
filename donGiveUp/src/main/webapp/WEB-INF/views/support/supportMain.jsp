<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<!-- 부트스트림4 지원 메타 포트 -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- 부트스트림4 지원 메타 포트 종료-->
<title>물품 후원 메인</title>
<!--    부트스트랩(다운)과 jQuery 불러오기-->
<script type="text/javascript"
	src="/resources/jongeun/bootstrap4/js/jquery-3.3.1.js"></script>
<script type="text/javascript"
	src="/resources/jongeun/bootstrap4/js/bootstrap.min.js"></script>
<link type="text/css" rel="stylesheet"
	href="/resources/jongeun/bootstrap4/css/bootstrap.min.css" />
<!--    부트스트랩(다운)과 jQuery 불러오기 종료-->

<!-- 구글 content 폰트 -->
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">

<!--  폰트어썸 링크(부트4.3만 가능)-->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
	integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ"
	crossorigin="anonymous">
<!--    폰트어썸 종료-->

</head>
<style>
.content {
	font-family: 'Noto Sans KR', sans-serif;
	width: 1200px;
	margin: 0 auto;
}

div>img {
	width: 100%;
}
.calrousel-inner{
	width:100%;
}
.intro{
    text-align: center;
    height:150px;
    border: none;
}
.intro>p:first-child{
	font-size: 40px;
	font-weight: 700;
	
}
.intro>p:last-child{
	color:limegreen;
    font-size: 20px;
}
.carousel-item>img{
	height:400px;
	
}
.support_try{
    margin:0 auto;
    width:700px;
    
    height:80px; 
    padding:10px;
}
    .support_try div{
        color:white;
        font-size:22px; 
        font-weight: 600;
        float: left;
        border:none;
        display: inline-block;
        width: 40%;
        height: 90%;
        line-height: 52px;
        text-align: center;
        background-color: #0fbcff;
        border-radius: 22px;
        border:none;
        margin-left: 37px;
        
    }
    .support_try div:hover{
   		opacity: 0.6;
    }
    .support_try>a:first-child>div{
        
    }
</style>
<body>
	<jsp:include page="/WEB-INF/views/main/header.jsp"></jsp:include>
	<div class="content">
		<div id="demo" class="carousel slide" data-ride="carousel">

			<!-- Indicators -->
			<ul class="carousel-indicators">
				<li data-target="#demo" data-slide-to="0" class="active"></li>
				<li data-target="#demo" data-slide-to="1"></li>
				<li data-target="#demo" data-slide-to="2"></li>
			</ul>

			<!-- The slideshow -->
			<div class="carousel-inner complict">
				<div class="carousel-item active">
					<img src="/resources/upload/ckImg.png" alt="Los Angeles">
				</div>
				<div class="carousel-item">
					<img src="/resources/upload/test1.png" alt="Chicago">
				</div>
				<div class="carousel-item">
					<img src="/resources/upload/test2.png" alt="New York">
				</div>
			</div>

			<!-- Left and right controls -->
			<a class="carousel-control-prev" href="#demo" data-slide="prev">
				<span class="carousel-control-prev-icon"></span>
			</a> <a class="carousel-control-next" href="#demo" data-slide="next">
				<span class="carousel-control-next-icon"></span>
			</a>

		</div>
		<br><br>
		<div class="intro">
			<p>여러분의 후원이 필요합니다.</p>
			<p class="intro_buttom">기부금 영수증 발행으로 세전 해택</p>
			
		</div>
        <div class="support_try">
            <a href="/supportAd.don">
                <div class="apply">물품 후원하기</div>
            </a>
            <a href="/supportList.don?count=1">
                <div class="apply">물품후원 리스트</div>
            </a>
        </div>
		<!-- <img src="../../resources/upload/ckImg.png" class="img-thumbnail" alt="Cinque Terre"> -->
		
	</div>
    <br><br><br><br><br><br>
	<jsp:include page="/WEB-INF/views/main/footer.jsp"></jsp:include>

</body>
</html>