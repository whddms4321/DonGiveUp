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
<title>펀딩 메인</title>
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
	width: 1200px;
	margin: 0 auto;
}
.content_wrap>h2{
	font-size: 35px;
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
.btn-primary:not(:disabled):not(.disabled).active:focus, .btn-primary:not(:disabled):not(.disabled):active:focus, .show>.btn-primary.dropdown-toggle:focus {
    
    background-color: #0fbcff; 
    border-color: #0fbcff; 
}
.first_menu>img{
	width:24px;
	height:24px;
	margin-bottom:5px;
}
.funding_tap{
	font-size: 22px;
}
.fa-angle-right{
	/* font-size:18px; */
	
}
.content_top{
	width:100%;
	
}
.container>*{

	float:right;

}
.funding_percent{
	position:absolute;
	top:220px;
	left:250px;
	width:50px;
	height:50px;
	border:1.5px solid #0fbcff;
	padding:0.3px;
	border-radius:50%; 
	text-align: center;
	font-size:18px;
	font-weight: 400;
	line-height: 45px;
	color:white;
	background-color:#0fbcff;	
}
.fundingPercent{
	
}
.percent{
	font-size:15px;
}
.dropdown{
	/* display:inline-block;
	float:left; */
}
.pageNavi_div{
 width:10%;
 margin:0 auto;
}
.pageNavi_div>div{
	margin:0 auto;
	width:100%;	
}
.fundingList_div{
	position: relative;
}
.funding_img{
	width:99%;
	height:220px;
	margin:0 auto;
	background-size:cover;
}
.dateLeft{
	float:left;
}
.funding_now_price{
	float:right;
}
.fundingList_a{
	display:block;
	width:100%;
	height:100%;
}
</style>
<script>
	
</script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/main/header.jsp" />
	<div class="content">
		<div class="content_wrap">
		<br><br>
			<h2>펀딩 &nbsp;목록</h2>
				<div class="funding_tap">
					<a href="/" class="first_menu"><img src="/resources/upload/images/펀딩아이콘_2번.png"></a>
					  &nbsp; &nbsp;<i class='fa fa-angle-right'></i> &nbsp;<span>${type }</span> 
				</div>
			<hr>
			<div class="content_top row">
				<div class="dropdown col-lg-2">
					<button type="button" class="btn btn-primary dropdown-toggle"
						data-toggle="dropdown">${type } ${totalCount } 개</button>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="/fundingMain.don?reqPage=1&type=0">공익 나눔</a> 
						<a class="dropdown-item" href="/fundingMain.don?reqPage=1&type=1">대안 상생</a>
						<a class="dropdown-item" href="/fundingMain.don?reqPage=1&type=2">미디어 창작</a>
					</div>
				</div>
				<div class="col-lg-6"></div>
				<div class="container col-lg-4">
						<div class="custom-control custom-switch">
							<input type="checkbox" class="custom-control-input" id="switch1"
								name="example"> <label class="custom-control-label"
								for="switch1">마감된 펀딩만 보기</label>
						</div>			
						<br>		
				</div>
			</div>
			<c:if test="${sessionScope.member.memberType eq 2 }">
				<a href="/fundingInsertFrm.don">펀딩 작성</a>
			</c:if>
			<br>
			<div class="row">
				<c:forEach var="n" items="${list }">
					<div class="col-lg-3 fundingList_div">
						<a class="fundingList_a" href="/fundingView.don?fundingNo=${n.fundingNo }">
							<img class="funding_img" src="/resources/upload/funding/${n.fundingFilepath }">
							<input type="hidden" name="fundingNo">
							<div class="funding_title">
								<span>${n.fundingTitle }</span>
							</div>
							<div class="funding_group_introduce">
								<span>${n.fundingGroupIntroduce }</span>
							</div>
							<div class="funding_percent">
							
								<span class="fundingPercent">${n.fundingPercent }</span>
								<Strong class="percent"> %</Strong>
							</div>
							<hr>
							<div class="funding_info">
								<span class="dateLeft">${n.dateLeft } 일 남음</span>
								<span class="funding_now_price">현재 금액 : ${n.fundingNowPrice }</span>
								
							</div>
						</a>
						<br><br><br><br> 
					</div>
				</c:forEach>
			</div>
		<br><br><br><br><br><br>
		<div class="pageNavi_div">
			<div>${pageNavi }</div>
		</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/main/footer.jsp" />
	
</body>
</html>