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
<script src="/resources/dahyun/js/8bd2671777.js" crossorigin="anonymous"></script>
<!-- <link rel="stylesheet" href="/resources/css/donation/donation.css"> -->
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
	font-weight: bold;
	text-decoration: none;
	line-height: 50px;
	margin-left: 250px;
	font-size: 15px;
}


.content-main {
	border: 1px solid gray;
	width: 1200px;
	height:1150px;
	margin: 0 auto;
}

.content-main-top {
	width: 87%;
	height:70px;
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
	height : 970px;
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
	width: 247px;
	height: 300px;
	border:0.1px solid black;
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
.content-main-list1-text-a2{
margin-left: 10px;
font-size: 15px;
color: gray;
}
.content-main-list1-text-a4{
text-align:right;
margin-left: 10px;
}

.text-aa{
text-align:right;
margin-right:10px;
}
progress{
width: 90%;
height: 15px;
margin-left: 2%;

}
	i{
	width:65px;
	height:65px;
	
		
		font-size: 48px;
		color: white;
	}		 		
			 	
</style>

	<jsp:include page="/WEB-INF/views/main/header.jsp"></jsp:include>

	<div class="content">
		<div class="content-header">
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
		</div>
		<div class="content-header2">
			<a href="/donation.don?reqPage=1&type=전체"
				class="content-header2-tap content-header2-tap1">일반기부</a> <a
				href="/regular.don?reqPage=1&type=전체" class="content-header2-tap">단체기부</a> 
				<c:if test="${not empty sessionScope.member }">
				<a href="/donationInsertFrm.don"
				class="content-header2-tap">기부 신청</a></c:if>
				<c:if test="${empty sessionScope.member }">
				<a href="#"
				class="content-header2-tap">기부 신청</a></c:if>
		</div>
		<div class="content-main">
			<div class="content-main-top">
				<a class="content-main-top1">모금함 : ${totalCount} 개</a> <!-- <select
					class="content-main-top-select">
					<option>최신 등록순</option>
					<option>마감 시간순</option>
					<option>기부 모금순</option>
				</select> -->
			</div>
			<div class="content-main-list">
			 	<div class="content-main-list1 content-main-list2">
			 	<div class="content-main-list2-1">
			 		<a class="content-main-list2-a">Today</a><br><br>
					<a class="content-main-list2-a2">${time2}</a><hr>
					</div>
					<div class="content-main-list2-2">
					<a class="content-main-list2-a3"><br><b>총 기부 금액</b><br>${typeTotalCount }원</a><br><br>
					<a class="content-main-list2-a3"><b>총 기부 참여자</b><br>${typeMemberCount }명</a><br><br>
					<a class="content-main-list2-a3"><b>오늘 기부 금액</b><br>${typeTodayCount }원</a><br>
					</div>
			 	</div>
			 	
			 	
			 	<c:forEach items="${list }" var="n">
				<div class="content-main-list1">
			 		<div class="content-main-list1-img" >
			 		<a href="/donationDetail.don?donationNo=${n.donationNo }&donationWriter=${n.donationWriter }">
			 			<img class="content-main-list1-img1" src="${n.donationFilepath}"></a>
			 		</div>
			 		<div class="content-main-list1-text">
			 			<a class="content-main-list1-text-a"><b>${n.donationTitle }</b></a><br>
			 			<a class="content-main-list1-text-a2">${n.donationWriter }</a><br>
			 			<a class="content-main-list1-text-a2"><progress value="${n.dnrPercent }" max="100"></progress></a><br>
			 			<div class="text-aa">
			 			<a class="content-main-list1-text-a4">모금<a style="color: #0fbcff;">${n.donationNowMoney }</a>원</a>
			 		</div></div>
			 	</div>
			 	</c:forEach>
			</div>
			<div class="pageNavi">
				<div>${pageNavi}</div>
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/main/footer.jsp"></jsp:include>


<script>
function reviewInsert() {
	console.log("시작");
	
	var url = "/donationMoney.don";
	var title = "donationMoney";
	var status = "left=500px, top=100px, width=400px, height=500px, menubar=no, status=no, scrollbars=yes";
	var popup = window.open("", title, status);
	$(".donationMoney").attr("action", url);
	$(".donationMoney").attr("method", "post");
	$(".donationMoney").attr("target", title);//새로 열린 popup창과 form태그를 연결
	$(".donationMoney").submit();
}

</script>
</body>





</html>