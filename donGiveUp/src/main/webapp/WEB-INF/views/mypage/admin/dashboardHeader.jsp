<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link href="/resources/adminMypage/css/bootstrap.min.css" rel="stylesheet">
	<link href="/resources/adminMypage/css/font-awesome.min.css" rel="stylesheet">
	<link href="/resources/adminMypage/css/datepicker3.css" rel="stylesheet">
	<link href="/resources/adminMypage/css/styles.css" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Montserrat:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
</head>
<body>
	<nav class="navbar navbar-custom navbar-fixed-top" role="navigation">
		<div class="container-fluid">
			<div class="navbar-header">

				<a class="navbar-brand" href="/dashboard.don"><span>Don</span>
					Give Up!</a>

				<!-- 홈, 로그아웃 -->
				<ul class="nav navbar-top-links navbar-right">
					<li class="dropdown"><a class="dropdown-toggle count-info"
						data-toggle="dropdown" href="/"> Home </a></li>
					<li class="dropdown"><a class="dropdown-toggle count-info"
						data-toggle="dropdown" href="#"> Logout </a></li>
				</ul>
			</div>
		</div>
	</nav>

	<!-- 사이드바 메뉴 -->
	<div id="sidebar-collapse" class="col-sm-3 col-lg-2 sidebar">
		<ul class="nav menu">
			<li><a href="/boardRequestList.don?reqPage=1&type=all&title=&requestList=&sorting=date">글 등록 신청목록</a></li>
			<li><a href="/deadLineSupportList.don?reqPage=1">마감 후원물품</a></li>
			<li><a href="/companyRequestList.don?reqPage=1">후원단체 등록 신청목록</a></li>
			<li><a href="panels.html">회원관리</a></li>
			<li><a href="panels.html">후원단체 관리</a></li>
			<li><a href="panels.html">정기결제 해지 요청</a></li>
		</ul>
	</div>
	<script src="/resources/adminMypage/js/jquery-1.11.1.min.js"></script>
	<script src="/resources/adminMypage/js/bootstrap.min.js"></script>
	<script src="/resources/adminMypage/js/chart.min.js"></script>
	<script src="/resources/adminMypage/js/chart-data.js"></script>
	<script src="/resources/adminMypage/js/easypiechart.js"></script>
	<script src="/resources/adminMypage/js/easypiechart-data.js"></script>
	<script src="/resources/adminMypage/js/bootstrap-datepicker.js"></script>
	<script src="/resources/adminMypage/js/custom.js"></script>
	
</body>
</html>