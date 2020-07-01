<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기부</title>
</head>
<!-- <link rel="stylesheet" href="/resources/css/donation/donation.css"> -->
<style>

.content {
	width: 100%;
}

.content-header {
	width: 100%;
	margin: 0 auto;
	height: 130px;
	background-color: #0fbcff;
}

.content-header2 {
	width: 100%;
	margin: 0 auto;
	height: 50px;
	background-color: rgb(56, 166, 241);
}

.content-header-tap {
	border: 1px solid lightgray;
	width: 60px;
	height: 60px;
	line-height: 60px;
	margin-top: 35px;
	text-align: center;
	border-radius: 50px 50px;
	background-color: lightgray;
	float: left;
	margin-right: 50px;
}

.content-header-tap2 {
	margin-left: 18%;
	background-color: darkgray;
}

.content-header-tap1:hover {
	background-color: darkgray;
	color: white;
}

.content-header2-tap:hover {
	color: white;
}

.content-header-tap1 {
	color: black;
	border-radius: 50px 50px;
	display: block;
	font-weight: bold;
	text-decoration: none;
}

.content-header2-tap {
	color: black;
	font-weight: bold;
	text-decoration: none;
	line-height: 50px;
	margin-right: 280px;
	font-size: 20px;
}

.content-header2-tap1 {
	margin-left: 350px;
}

.content-main {
	border: 1px solid gray;
	width: 1200px;
	
	margin: 0 auto;
}

.content-main-top {
	width: 90%;
	height: 9%;
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
	width: 250px;
	height: 300px;
	border:0.1px solid black;
	float: left;
	margin: 7px;
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
	
}

.content-main-list1-text{
	width: 100%;
	height: 30%;
	
}
.content-main-list1-img1{
width: 100%;
height: 100%;
}
.content-main-list1-text-a{
margin-left: 10px;
}
			 		
			 	
</style>

	<jsp:include page="/WEB-INF/views/main/header.jsp"></jsp:include>

	<div class="content">
		<div class="content-header">
			<div class="content-header-tap content-header-tap2">
				<a href="/donation.don?reqPage=1&type=전체"
					class="content-header-tap1">전체</a>
			</div>
			<div class="content-header-tap">
				<a href="/donation.don?reqPage=1&type=아동"
					class="content-header-tap1">아동</a>
			</div>
			<div class="content-header-tap">
				<a href="/donation.don?reqPage=1&type=어르신"
					class="content-header-tap1">어르신</a>
			</div>
			<div class="content-header-tap">
				<a href="/donation.don?reqPage=1&type=장애인"
					class="content-header-tap1">장애인</a>
			</div>
			<div class="content-header-tap">
				<a href="/donation.don?reqPage=1&type=다문화"
					class="content-header-tap1">다문화</a>
			</div>
			<div class="content-header-tap">
				<a href="/donation.don?reqPage=1&type=여성"
					class="content-header-tap1">여성</a>
			</div>
			<div class="content-header-tap">
				<a href="/donation.don?reqPage=1&type=동물"
					class="content-header-tap1">동물</a>
			</div>
			<div class="content-header-tap">
				<a href="/donation.don?reqPage=1&type=환경"
					class="content-header-tap1">환경</a>
			</div>
			<div class="content-header-tap">
				<a href="/donation.don?reqPage=1&type=기타"
					class="content-header-tap1">기타</a>
			</div>
		</div>
		<div class="content-header2">
			<a href="/donation.don?reqPage=1&type=전체"
				class="content-header2-tap content-header2-tap1">일반기부</a> <a
				href="#" class="content-header2-tap">단체기부</a> <a href="/donationInsertFrm.don"
				class="content-header2-tap">기부 신청</a>
		</div>
		<div class="content-main">
			<div class="content-main-top">
				<a class="content-main-top1">모금함 : ${totalCount} 개</a> <select
					class="content-main-top-select">
					<option>최신 등록순</option>
					<option>마감 시간순</option>
					<option>기부 모금순</option>
				</select>
			</div>
			<div class="content-main-list">
			 	<div class="content-main-list1 content-main-list2">
			 	<div class="content-main-list2-1">
			 		<a class="content-main-list2-a"><b>Today</a><br>
					<a class="content-main-list2-a2">2020-06-28</a><br><hr>
					</div>
					<div class="content-main-list2-2">
					<a class="content-main-list2-a3"><b>총 기부 금액</b><br>1,000,000,000,000원</a><br><br>
					<a class="content-main-list2-a3"><b>총 기부 참여자</b><br>120명</a><br><br>
					<a class="content-main-list2-a3"><b>오늘 기부 금액</b><br>1,000,000원</a><br>
					</div>
			 	</div>
			 	
			 	
			 	
				<div class="content-main-list1">
			 		<div class="content-main-list1-img" >
			 		<a href="/donationDetail.don?donationNo=1">
			 			<img class="content-main-list1-img1" src="#"></a>
			 		</div>
			 		<div class="content-main-list1-text">
			 			<a class="content-main-list1-text-a">Title : 두둥탁</a><br>
			 			<a class="content-main-list1-text-a">단체 : 하늘 보리</a><br>
			 			<a class="content-main-list1-text-a">목표금액  : 100,000,000원</a><br>
			 			<a class="content-main-list1-text-a">모금금액 : 100,000원</a>
			 		</div>
			 	</div>
			 	
			 	
			 	
			 	
			 	
			 	<div class="content-main-list1">
			 	
			 	</div>
			 
			 	<div class="content-main-list1">
			 	
			 	</div>
			 	<div class="content-main-list1">
			 	
			 	</div>
			 	<div class="content-main-list1">
			 	
			 	</div>
			 
			 	<div class="content-main-list1">
			 	
			 	</div>
			 	<div class="content-main-list1">
			 	
			 	</div>
			 	<div class="content-main-list1">
			 	
			 	</div>
			 
			 	<div class="content-main-list1">
			 	
			 	</div>
			 	<div class="content-main-list1">
			 	
			 	</div>
			 	<div class="content-main-list1">
			 	
			 	</div>
				




			</div>
			<div class="pageNavi">
				<div>${pageNavi}</div>
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/main/footer.jsp"></jsp:include>
</body>



<body>



</html>