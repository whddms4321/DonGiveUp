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
<title>펀딩 글 ${funding.fundingNo }번</title>
</head>
<style>
	body {
	font-family: 'Noto Sans KR', sans-serif;
}
	a:hover{
		text-decoration: none;
		opacity: 0.7;
	}
	a{
		color:black;
	}
.content {
	overflow: hidden;
	
}
.content_wrap {
	width:1200px;
	
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
.btn-primary:not(:disabled):not(.disabled).active:focus, .btn-primary:not(:disabled):not(.disabled):active:focus, .show>.btn-primary.dropdown-toggle:focus {
    
    background-color: #0fbcff; 
    border-color: #0fbcff; 
}
</style>
<body>
	<jsp:include page="/WEB-INF/views/main/header.jsp" />
	<div class="content">
		<div class="content_wrap">
			
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/main/footer.jsp" />
</body>
</html>