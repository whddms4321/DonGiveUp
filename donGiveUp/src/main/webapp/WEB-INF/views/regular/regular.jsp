<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>재단 기부</title>
</head>
<link rel="stylesheet" href="/resources/css/regular/regular.css">
<body>
	<jsp:include page="/WEB-INF/views/main/header.jsp"></jsp:include>
	<div class="content">
		<div class="content-header">
			<div class="content-header-tap content-header-tap2">
				<a href="" class="content-header-tap1">전체</a>
			</div>
			<div class="content-header-tap">
				<a href="" class="content-header-tap1">아동</a>
			</div>
			<div class="content-header-tap">
				<a href="" class="content-header-tap1">어르신</a>
			</div>
			<div class="content-header-tap">
				<a href="" class="content-header-tap1">장애인</a>
			</div>
			<div class="content-header-tap">
				<a href="" class="content-header-tap1">다문화</a>
			</div>
			<div class="content-header-tap">
				<a href="" class="content-header-tap1">여성</a>
			</div>
			<div class="content-header-tap">
				<a href="" class="content-header-tap1">동물</a>
			</div>
			<div class="content-header-tap">
				<a href="" class="content-header-tap1">환경</a>
			</div>
			<div class="content-header-tap">
				<a href="" class="content-header-tap1">기타</a>
			</div>
		</div>
		<div class="content-header2">
			<a href="" class="content-header2-tap">단체 신청</a>
		</div>
		<div class="content-main">
			<div class="content-main-pre">
				<button class="content-main-pre-button1">&lt;</button>

				<button class="content-main-pre-button2">&gt;</button>
			</div>
			<div class="content-main-top">
				<a class="content-main-top1">단체 : 112개</a> <select
					class="content-main-top-select">
					<option>최신 등록순</option>
					<option>기부 모금순</option>
				</select>
			</div>
			<div class="content-main-list"></div>
			<button class="content-main-list-add">더보기</button>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/main/footer.jsp"></jsp:include>
</body>
</html>