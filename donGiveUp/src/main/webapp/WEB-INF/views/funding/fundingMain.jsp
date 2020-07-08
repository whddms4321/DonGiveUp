<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 부트스트림4 지원 메타 포트 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 부트스트림4 지원 메타 포트 종료-->
<!--    부트스트랩(다운)과 jQuery 불러오기-->
<script type="text/javascript"
	src="/resources/jongeun/bootstrap4/js/jquery-3.3.1.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>

<!-- 구글 content 폰트 -->
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap"
	rel="stylesheet">

<!--  폰트어썸 링크(부트4.3만 가능)-->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
	integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ"
	crossorigin="anonymous">
<!--    폰트어썸 종료-->
<!-- ck에디터 링크 -->
<script type="text/javascript" src="/resources/ckeditor4/ckeditor.js"></script>
<!--링크 종료  -->
<title>Insert title here</title>
<style>
body {
	font-family: 'Noto Sans KR', sans-serif;
}

.content {
	overflow: hidden;
}

.content_wrap {
	width: 80%;
	margin: 0 auto;
}
.content_wrap>h2{
	text-align: center;
	margin-top:10px;
}
.custom-control-input{
	width:50px;
	height:20px;
}
.custom-control-input:checked~.custom-control-label::before {
	background-color:#0fbcff;
	border-color:#0fbcff;
}
.btn-primary{
		background-color:#0fbcff;
		border-color:#0fbcff;
}
.btn-primary:hover {	
		opacity:0.7;
		background-color:#0fbcff;
		border-color:#0fbcff;
}
.col-lg-3{
	
	
}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/main/header.jsp" />
	<div class="content">
		<div class="content_wrap">
			<h2>펀딩목록</h2>
			<hr>
			<div class="content_top">
				<div class="dropdown">
					<button type="button" class="btn btn-primary dropdown-toggle"
						data-toggle="dropdown">전체 000개</button>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="#">aaa</a> <a class="dropdown-item"
							href="#">Link 2</a> <a class="dropdown-item" href="#">Link 3</a>
					</div>
				</div>
			</div>
			<div class="container">
				<form action="/action_page.php">
					<div class="custom-control custom-switch">
						<input type="checkbox" class="custom-control-input" id="switch1"
							name="example"> <label class="custom-control-label"
							for="switch1">마감된 펀딩만 보기</label>
					</div>
					<br>
					<button type="submit" class="btn btn-primary">Submit</button>
				</form>
			</div>
			<br>
			<div class="row funding_List">
				<%-- <c:forEach var="n" items="${list }"></c:forEach> --%>
				<div class="col-lg-3 funding_div">
					<img class="funding_img" src="/">
					<input type="hidden" name="fundingNo">
					<%-- <div class="funding_title">
						<span>${fundingTitle }</span>
					</div>
					<div class="funding_group">
						<span>${fundingGroup }</span>
					</div>
					<hr>
					<div class="funding_info">
						<span><c:set var= ${funding }</span>
					</div> --%>
				</div>
			</div>

		</div>
	</div>
	<jsp:include page="/WEB-INF/views/main/footer.jsp" />
</body>
</html>