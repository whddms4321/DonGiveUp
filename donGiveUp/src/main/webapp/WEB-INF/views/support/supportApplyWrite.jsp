<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- 부트스트림4 지원 메타 포트 종료-->
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
<title>후원품 신청하기</title>
</head>
	<style>
		body{
			font-family: 'Noto Sans KR', sans-serif;
		}
		.supportApply_form{
			width:400px;
			display:block;
			height:450px;
			margin:0 auto;
			margin-top: 25px;
			border: 3.5px solid #0fbcff;
			border-radius: 20px;
			padding: 10px;
		}
		.supportApply_form{
			font-size:28px;
			color:gray;
		}
	</style>
<body>

	<form class="supportApply_form" action="/supportApplyInsert.don" method="post" >
	
		<p>물품명</p>
		<p> ${support.supportName }</p>
		<input type="hidden" name="supportNo" value="${support.supportNo }">
		이미지 사진:
		<img src="${support.supportFilename }">
		<input type="hidden" name="supportApplyId" value="${sessionScope.member.memberId }">
		<br>
		<input type="text" name="supportApplyReason" placeholder="신청 사유" id="applyReason"
		style="width:200px; height:250px;"><br>
		<button onclick="exit()">돌아가기</button>
		<button type="submit">신청하기</button>
	
	</form>
	
</body>
</html>