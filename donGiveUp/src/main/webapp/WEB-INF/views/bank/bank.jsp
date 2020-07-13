<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.3.1.js"></script>
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
	margin-left: 10%;
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
	margin-left: 882px;
	font-size: 15px;
}

.content-main {
	border: 1px solid gray;
	width: 1200px;
	height: 1150px;
	margin: 0 auto;
}

.content-main-top {
	width: 87%;
	height: 70px;
	margin: 0 auto;
	border-bottom: 0.3px solid gray;
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
	height: 970px;
	margin: 0 auto;
}

.pageNavi {
	font-weight: bold;
	font-size: 30px;
	width: 200px;
	line-height: 100px;
	margin-left: 49%;
}

.content-main-list1 {
	width: 1044px;
	margin: 0 auto;
	height: 150px;
	border-bottom: 0.1px solid gray;

	
}

.content-main-list2 {
	background-color: #0fbcff;
	text-align: center;
}

.content-main-list2-1 {
	width: 80%;
	height: 80px;
	margin-left: 10%;
	margin-top: 10px;
}

.content-main-list2-2 {
	width: 90%;
	height: 190px;
	margin-left: 15px;
	margin-top: 10px;
}

.content-main-list2-a {
	font-weight: blod;
	font-size: 30px;
}

.content-main-list2-a2 {
	font-weight: blod;
	font-size: 20px;
}

.content-main-list2-a3 {
	font-weight: blod;
	font-size: 15px;
}

.content-main-list1-img {
	width: 100%;
	height: 70%;
}

.content-main-list1-text {
	width: 100%;
	height: 30%;
}

.content-main-list1-img1 {
	width: 100%;
	height: 100%;
}

.content-main-list1-text-a {
	margin-left: 10px;
}

.content-main-list1-text-a2 {
	margin-left: 10px;
	font-size: 15px;
	color: gray;
}

.content-main-list1-text-a4 {
	margin-left: 10px;
}

.content-main-list1-text-a3 {
	color: green;
}

progress {
	width: 80%;
	height: 15px;
	margin-left: 2%;
}

i {
	font-size: 40px;
	color: #0fbcff;
}

.question_search {
	width: 70%;
	height: 45px;
	border: 0.5px solid rgb(56, 166, 241);
	margin-top: 45px;
	margin-left: 15%;
}

.i-class {
	border: none; position : absolute;
	margin-left: -55px;
	margin-top: 47px;
	height: 40px;
	background-color: white;
	position: absolute;
}
.list1-div1{
	width: 300px;
	height: 100%;
	float: left;
	margin-left: 20px;
}
.list1-div2{
width:300px;
	margin-left: 71%;
	text-align: right;
}
.list1-a1{
line-height: 100px;
text-decoration: none;
color: #0fbcff;
}
.list1-a3{


}
</style>

<jsp:include page="/WEB-INF/views/main/header.jsp"></jsp:include>

<div class="content">
	<div class="content-header">

		<form action="/bank.don" method="get">
		<input type="hidden" name="reqPage" value="1">
		<input type="hidden" name="type" value="0">
			<input type="text" class="question_search" name="keyword"
				value="${keyword }" placeholder="검색어를 입력해주세요">
			<button type="submit" class="i-class btn btn-outline-dark">
				<i class="fas fa-search"></i>
			</button>
		</form>


	</div>
	<div class="content-header2">
	<c:if test="${not empty sessionScope.member }">
				<a href="/bankInsertFrm.don" class="content-header2-tap">저금통
			개설</a></c:if>
		<c:if test="${empty sessionScope.member }">
				<a href="" class="content-header2-tap">저금통
			개설</a></c:if>
	</div>
	<div class="content-main">
		<div class="content-main-top">
			<a class="content-main-top1">검색결과 : <a style="color: #0fbcff;">${totalCount}</a></a><br>

		</div>
		<div class="content-main-list">
		
		<c:forEach items="${list }" var="b">
			<div class="content-main-list1">
				<div class="list1-div1">
			<a href="/bankDetail.don?bankNo=${b.bankNo }" class="list1-a1"><b>${b.bankTitle }</b></a><br>
					<a class="list1-a2"><a style="color: gray;">${b.bankWriter }</a></a>
				</div>
				<div class="list1-div2">
					<a class="list1-a1"><b>${b.bankGoalMoney }원 목표</b></a><br>
					<a class="list1-a3">총 <a style="color: #0fbcff;">${b.bankNowMoney }</a>원 저금</a>
				</div>
			</div>
			</c:forEach>
			
		
			<div class="pageNavi">
				<div>${pageNavi}</div>
			</div>
		</div>
	</div>
</div>
	<jsp:include page="/WEB-INF/views/main/footer.jsp"></jsp:include>


	
	</body>
</html>