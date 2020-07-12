<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<<<<<<< HEAD
<!-- 부트스트림4 지원 메타 포트 -->
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

<title>펀딩 메인</title>
</head>
<style>
body {
	font-family: 'Noto Sans KR', sans-serif;
}

.content {
	overflow: hidden;
}
	.test{
		width:100px;
		height:150px;
		
	}
</style>
<script type="text/javascript">
 window.onload=function(){
	 CKEDITOR.replace('p_content'
             , {height: 500
	 
       }
	 )};
	 
 
	 
 
</script>
	
<body>
	<jsp:include page="/WEB-INF/views/main/header.jsp" />
	<div class="content">
		<div class="content_wrap">
		<div>
			<img src="/resources/upload/images/펀딩아이콘_1번.png" class="test">
		</div>
		<textarea class="form-control" id="p_content"></textarea>
		
	</div>
	
		</div>
	<jsp:include page="/WEB-INF/views/main/footer.jsp" />
=======
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.js"></script>

	<script type="text/javascript" src="/resources/ckeditor4/ckeditor.js"></script>


</head>
<body>
	<textarea class="form-control" id="p_content"></textarea>
<script type="text/javascript">
 CKEDITOR.replace('p_content'
                , {height: 500
	 
                 });
</script>



>>>>>>> parent of 87b6781... Revert "Merge branch 'ssong-branch' of https://github.com/whddms4321/DonGiveUp into ssong-branch"
</body>
</html>