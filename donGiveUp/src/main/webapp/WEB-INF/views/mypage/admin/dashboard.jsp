<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 마이페이지 DashBoard</title>
<link href="/resources/adminMypage/css/bootstrap.min.css" rel="stylesheet">
<link href="/resources/adminMypage/css/font-awesome.min.css" rel="stylesheet">
<link href="/resources/adminMypage/css/datepicker3.css" rel="stylesheet">
<link href="/resources/adminMypage/css/styles.css" rel="stylesheet">

<link
	href="https://fonts.googleapis.com/css?family=Montserrat:300,300i,400,400i,500,500i,600,600i,700,700i"
	rel="stylesheet">
</head>

<body>
	<nav class="navbar navbar-custom navbar-fixed-top" role="navigation">
		<div class="container-fluid">
			<div class="navbar-header">
				
				<a class="navbar-brand" href="/dashboard.do"><span>Don</span> Give Up!</a>
				
				<!-- 홈, 로그아웃 -->
				<ul class="nav navbar-top-links navbar-right">
					<li class="dropdown">
						<a class="dropdown-toggle count-info" data-toggle="dropdown" href="#"> 
							<em class="fa fa-envelope"></em>
							<span class="label label-danger">15</span>
						</a>
					</li>
					<li class="dropdown">
						<a class="dropdown-toggle count-info" data-toggle="dropdown" href="#"> 
							<em class="fa fa-bell"></em>
							<span class="label label-info">5</span>
						</a>
					</li>
				</ul>
			</div>
		</div>
	</nav>
	
	<!-- 사이드바 메뉴 -->
	<div id="sidebar-collapse" class="col-sm-3 col-lg-2 sidebar">
		<ul class="nav menu">
			<li class="active">
				<a href="index.html">Dashboard</a>
			</li>
			<li>
				<a href="widgets.html">Widgets</a>
			</li>
			<li>
				<a href="charts.html">Charts</a>
			</li>
			<li>
				<a href="elements.html">UI Elements</a>
			</li>
			<li>
				<a href="panels.html">Alerts &amp; Panels</a>
			</li>
			<li class="parent ">
				<a data-toggle="collapse" href="#sub-item-1">Multilevel
				 <span data-toggle="collapse" href="#sub-item-1" class="icon pull-right">
				 	<em class="fa fa-plus"></em>
				 </span>
				</a>
				<ul class="children collapse" id="sub-item-1">
					<li><a class="" href="#"> <span class="fa fa-arrow-right">&nbsp;</span>
							Sub Item 1
					</a></li>
					<li><a class="" href="#"> <span class="fa fa-arrow-right">&nbsp;</span>
							Sub Item 2
					</a></li>
					<li><a class="" href="#"> <span class="fa fa-arrow-right">&nbsp;</span>
							Sub Item 3
					</a></li>
				</ul></li>
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
	<script>
		window.onload = function() {
			var chart1 = document.getElementById("line-chart").getContext("2d");
			window.myLine = new Chart(chart1).Line(lineChartData, {
				responsive : true,
				scaleLineColor : "rgba(0,0,0,.2)",
				scaleGridLineColor : "rgba(0,0,0,.05)",
				scaleFontColor : "#c5c7cc"
			});
		};
	</script>
</body>
</html>