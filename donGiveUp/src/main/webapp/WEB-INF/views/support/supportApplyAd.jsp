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
<title>물품 후원 소개</title>
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
    .support_ad{
        width: 500px;
        height: 400px;
        margin: 0 auto;
        border: 0.5px solid black;
    
    }
    .win_open{
          margin: 0 auto;
        color: aqua;
    }
</style>
    <script>
	function func1(){
		var win = window.open("/supportApplyWrite.don", "_blank", "toolbar=yes,scrollbars=yes,resizable=yes,top=100,left=500,width=450,height=600");

	}
</script>
<body>
	<jsp:include page="/WEB-INF/views/main/header.jsp"></jsp:include>
	<div class="content">
		<div class="support_ad">광고창 들어갈 곳</div>
		<div class="win_open" onclick="func1();">
            물품 후원하기
        </div>
        
	</div>
  
	<jsp:include page="/WEB-INF/views/main/footer.jsp"></jsp:include>

</body>
</html>