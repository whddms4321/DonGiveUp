<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.js"></script>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기부</title>
</head>
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



<!--  폰트어썸 링크(부트4.3만 가능)-->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
	integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ"
	crossorigin="anonymous">
<!--    폰트어썸 종료-->
<script src="/resources/dahyun/js/8bd2671777.js" crossorigin="anonymous"></script>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100&display=swap" rel="stylesheet">
<style>

.content {
	width: 100%;
	
}

.content-header {
	width: 1200px;
	margin: 0 auto;
	height: 130px;
	background-color: #0fbcff;
	
}

.content-header2 {
	width: 1200px;
	margin: 0 auto;
	height: 50px;
	background-color: rgb(56, 166, 241);
}

.content-header-tap {
	font-family: 'Noto Sans KR', sans-serif;
	width: 60px;
	height: 80px;
	
	margin-top: 30px;
	text-align: center;
	
	float: left;
	margin-right: 50px;
}

 .content-header-tap2 {
	margin-left : 10%;
	
}

.content-header-tap1:hover {
	color: black;
}

.content-header2-tap:hover {
	color: black;
}

.content-header-tap1 {
	color: white;
	
	display: block;
	font-weight: bold;
	text-decoration: none;
}

.content-header2-tap {
	color: white;
	font-family: 'Noto Sans KR', sans-serif;
	font-weight: bold;
	text-decoration: none;
	line-height: 50px;
	margin-left: 250px;
	font-size: 15px;
}
.content-main {
	border: 1px solid gray;
	width: 1200px;
	height:1350px;
	margin: 0 auto;
}

.content-main-top {
	width: 87%;
	height: 70px;
	margin: 0 auto;
}

.content-main-top1 {
	line-height: 100px;
	font-weight: bold;
	font-size: 20px;
}

.content-main-top-select {
	margin-left: 735px;
	width: 200px;
	height: 35px;
}

.content-main-list {
	width: 90%;
	
	margin: 0 auto;
	
}
.pageNavi{
	font-weight: bold;
	font-size: 30px;
	width: 200px;
	line-height: 100px;
	margin-left: 49%;
}
.content-main-list1{

	width: 200px;
	height: 240px;
	float: left;
	margin: 10px;
}

.content-main-list2{
	background-color: #0fbcff;
	text-align: center;
	
}
.content-main-list2-1{
	width: 80%;
	height: 80px;
	
	margin-left: 10%;
	margin-top: 10px;
	
	
}

.content-main-list2-2{
	width: 90%;
	height: 190px;
	margin-left: 15px;
	margin-top: 10px;
	
	
}
.content-main-list2-a{
	font-weight: blod;
	font-size: 30px;
	
}

.content-main-list2-a2{
	font-weight: blod;
	font-size: 20px;
	
}

.content-main-list2-a3{

 font-weight: blod;
	font-size: 15px;
}
.content-main-list1-img{
	width: 100%;
	height: 70%;
	position:relative;
	cursor:pointer;
	 
}
.content-main-list1-img:hover .content-main-list1-img1{
	opacity: 0.5;
	border-radius: 20px 20px;
}
.content-main-list1-img:hover .content-main-list1-text{
	opacity: 1;
}
.content-main-list1-text{
position:absolute;
transition: .5s ease;
opacity: 0;
top:50%;
left:50%;
transform:translate(-50%, -50%);
color: white;
font-size: 1.5rem;

	
	
}
.content-main-list1-img1{
border-radius: 10px 10px;
width: 100%;
	height: 100%;
	opacity: 1;
	display: block;
	transition: .5s ease;
}
.content-main-list1-text-a{
margin-left: 10px;
}
.content-main-list1-text-a2{
margin-left: 10px;
font-size: 15px;
color: gray;
}
.content-main-list1-text-a4{
margin-left: 87%;
}
.content-main-list1-text-a3{
color: green;
}
progress{
width: 80%;
height: 15px;
margin-left: 2%;

}
.carousel-item{
	width: 100%;
	height: 400px;
}
.carousel-item>img {
	width: 100%;
	height: 400px;
}	
	 	i{
	width:65px;
	height:65px;
	
		
		font-size: 50px;
		color: white;
	}	
</style>

	<jsp:include page="/WEB-INF/views/main/header.jsp"></jsp:include>

	<div class="content">
			<!-- <div class="content-header">
		<div class="content-header-tap content-header-tap2">
			
				<a href="/donation.don?reqPage=1&type=전체"
					class="content-header-tap1"><i class="fas fa-globe-americas"></i>전체</a>
			</div>
			<div class="content-header-tap">
				<a href="/donation.don?reqPage=1&type=아동"
					class="content-header-tap1"><i class="fas fa-baby"></i>아동</a>
			</div>
			<div class="content-header-tap">
				<a href="/donation.don?reqPage=1&type=어르신"
					class="content-header-tap1"><i class="fas fa-blind"></i>어르신</a>
			</div>
			<div class="content-header-tap">
				<a href="/donation.don?reqPage=1&type=장애인"
					class="content-header-tap1"><i class="fas fa-wheelchair"></i>장애인</a>
			</div>
			<div class="content-header-tap">
				<a href="/donation.don?reqPage=1&type=다문화"
					class="content-header-tap1"><i class="fas fa-user-friends"></i>다문화</a>
			</div>
			<div class="content-header-tap">
				<a href="/donation.don?reqPage=1&type=여성"
					class="content-header-tap1"><i class="fas fa-female"></i>여성</a>
			</div>
			<div class="content-header-tap">
				<a href="/donation.don?reqPage=1&type=동물"
					class="content-header-tap1"><i class="fas fa-paw"></i>동물</a>
			</div>
			<div class="content-header-tap">
				<a href="/donation.don?reqPage=1&type=환경"
					class="content-header-tap1"><i class="fab fa-canadian-maple-leaf"></i>환경</a>
			</div>
			<div class="content-header-tap">
				<a href="/donation.don?reqPage=1&type=기타"
					class="content-header-tap1"><i class="fab fa-rocketchat"></i>기타</a>
			</div> 
		</div>-->
		<div class="content-header2">
			<a href="/donation.don?reqPage=1&type=전체"
				class="content-header2-tap content-header2-tap1">일반기부</a> <a
				href="/regular.don?reqPage=1&type=전체" class="content-header2-tap">단체기부</a> 
				<c:if test="${not empty sessionScope.member.companyName }">
				<a href="/regularInsertFrm.don"
				class="content-header2-tap">단체 신청</a></c:if>
					<c:if test="${empty sessionScope.member.companyName }">
				<a href=""
				class="content-header2-tap">단체 신청</a></c:if>
		</div>
		<div class="content-main">
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
		
			<div class="content-main-top">
				<a class="content-main-top1">단체 : ${count}개</a> 
			</div>
			
			 	<div class="content-main-list">
			 	<c:forEach items="${regular }" var="r">
				<div class="content-main-list1">
			 		<div class="content-main-list1-img" >
			 		<a href="/regularDetail.don?regularWriter=${r.memberId}">
			 			<img class="content-main-list1-img1 trans1" src="${r.companyFilepath}"></a>
			 			
			 		<div class="content-main-list1-text text">${r.companyName }<br>
			 		</div>
			 		</div>
			 	</div>
			 	</c:forEach>
			 	</div>
			</div>
			
		</div>

	<jsp:include page="/WEB-INF/views/main/footer.jsp"></jsp:include>
</body>



<body>



</html>