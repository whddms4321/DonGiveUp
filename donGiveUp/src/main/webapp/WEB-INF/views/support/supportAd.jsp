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
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap"
	rel="stylesheet">

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

.support_ad {
	width: 1200px;
	overflow: hidden;
	margin: 0 auto;
}

.support_ad>img {
	margin: 0;
	padding: 0;
	border: none;
}

.support_ad>.ad_img1 {
	width: 100%;
	height: 450px;
}

.support_ad>.ad_img2 {
	background-image:url("../../../resources/upload/images/%EB%AC%BC%ED%92%88%ED%9B%84%EC%9B%90%EA%B4%91%EA%B3%A02.png");
	background-size: contain;
	width: 100%;
	height: 220px;
	float: inherit;
    position:relative;
}

.ad_img3 {
	width: 100%;
	height: 450px;
	float: inherit;
}

.support_method {
	background-color: #6a60a9;
}

.support_method>h2 {
	text-align: center;
	color: black;
	font-weight: 700;
}

.win_open {
	width: 230px;
	height: 42px;
	margin: 0 auto;
	color: white;
	font-size: 19px;
	background-color: darkblue;
    border: none;
}

.support_table {
	width: 75%;
	overflow: hidden;
	margin: 0 auto;
}

.support_table_tr {
	border-top: 1.4px solid gray;
}

.lastborder {
	border-bottom: 1.4px solid gray;
}

.support_table_tr>th {
	color: white;
	width: 20%;
	text-align: center;
}

.support_table_tr>td {
	line-height: 25px;
	width: 50%;
	color: white;
	text-align: center;
	padding-top: 10px;
}

.support_table_tr p {
	font-size: 14px;
	color: darkgray;
}

.support_addr {
	text-align: center;
	font-size: 17px;
	line-height: 30px;
	color:white;
}

.support_addr>p {
	color: darkgray;
	font-size: 14px;
	text-align: center;
}

.donater_earning {
	overflow: hidden;
	position: relative;
	text-align: center;
}

.donater_earning>p {
	color: dimgray;
	font-size: 16px;
	position: absolute;
	z-index: 100;
	top: 350px;
	left: 420px;
	font-weight: 700;
}

.donater_earning>pre {
	font-size: 18px;
	position: absolute;
	z-index: 100;
	top: 380px;
	left: 300px;
	font-weight: 550;
}

.testtt {
	background: url(http://www.gfound.org/img/sub1_8_sum1.png) no-repeat
		#fff !important;
}

.support_kinds {
	width: 100%;
	height: 450px;
	background-color: #dedcee;
	padding-top: 40px;
}

.support_kinds_imags {
	margin: 0 auto;
	display: none;
}

.img_show {
	display: block;
}
 
 .support_kinds_imags img_show test{
 	background-image: url('http://www.gfound.org/img/sub1_8_sum1.png');
 }   
</style>
<script>
	function func1() {
        var test = '${sessionScope.member}';
     	alert("로그인 후 이용해 주세요.");
        if( test != ''){
            var win = window
				.open(
						"/supportWrite.don",
						"_blank",
						"toolbar=yes,scrollbars=yes,resizable=yes,top=100,left=500,width=450,height=600");
            
        }
		
	}
	
</script>
<body>
	<jsp:include page="/WEB-INF/views/main/header.jsp"></jsp:include>
	<div class="content">
		<div class="support_ad">
			<img class="ad_img1"
				src="../../../resources/upload/images/%EB%AC%BC%ED%92%88%ED%9B%84%EC%9B%90%EA%B4%91%EA%B3%A01.png">
			<div class="ad_img2">
				<a
					style="position: absolute; cursor:pointer; top: 146px; left: 503px; width: 188px; height: 38px;"
					alt="" title="" target="" onclick="func1();"> </a>

			</div>
			<div class="support_kinds">
				<div class="support_kinds_imag">
					<a class="support_kinds_imags img_show test">
					
					</a>
					<img class="support_kinds_imags"
						src="../../../resources/upload/images/sub1_8_banner_1.png">
					<img class="support_kinds_imags"
						src="../../../resources/upload/images/sub1_8_banner_2.png">
					<img class="support_kinds_imags"
						src="../../../resources/upload/images/sub1_8_banner_3.png">
					<img class="support_kinds_imags"
						src="../../../resources/upload/images/sub1_8_banner_4.png">
					<img class="support_kinds_imags"
						src="../../../resources/upload/images/sub1_8_banner_5.png">
					<img class="support_kinds_imags"
						src="../../../resources/upload/images/sub1_8_banner_6.png">
					<img class="support_kinds_imags"
						src="../../../resources/upload/images/sub1_8_banner_7.png">
					<img class="support_kinds_imags"
						src="../../../resources/upload/images/sub1_8_banner_8.png">
					<img class="support_kinds_imags"
						src="../../../resources/upload/images/sub1_8_banner_9.png">
						
						
				</div>
			</div>
			<div class="support_method">
				<br>
				<br>
				<br>
				<h2>물품 기증 방법</h2>
				<br>
				<br>
				<br>
				<table class="support_table">
					<tbody>
						<tr class="support_table_tr">
							<th>택배발송</th>
							<td>물품이 소량인 경우 택배를 이용해 후원물품을 포장하여 아래 주소로 발송해주세요. <br>
							<p>박스당 15kg무게가 넘지 않도록, 크기는 가로세로높이의 합이 120cm 이하로 발송해 주세요</p></td>
						</tr>
						<tr class="support_table_tr">
							<th>방문수거</th>
							<td>기업재고상품,대량물품의 경우 방문수거가 가능합니다.<br>
							<p>포장상태나 지역에 따라 거부될 수 있습니다.</p></td>
						</tr>
						<tr class="support_table_tr lastborder">
							<th>직접기증</th>
							<td>물류창고와 가까운 경우 직접 방문하여 기증하실 수 있습니다.<br>
							<p>방문 전,본사 담당자 번호 : 010-5252-5959로연락해주세요.</p></td>
						</tr>
					</tbody>
				</table>
				<br>
				<br>
				<div class="support_addr">
					물품 보내실 곳<br> 경기도 부천시 고강동 322-31번길 돈기브업 물류창고
					<p>돈기부업은 기부를 위한 사회적 기업입니다. 되도록 배송료를 선불로 지불해 주시면 감사하겠습니다.</p>

					문의 | 031-6446-614 &nbsp;&nbsp; 이메일 | donGiveUp@gmail.com <br>
					<br>
					<button class="win_open" onclick="func1();">물품 기부 신청하기</button>
					<br>
					<br>
				</div>

				<br>
				<br>
				<br>
				<br>
			</div>
			<div class="donater_earning">
				<img class="ad_img3"
					src="../../../resources/upload/images/%EB%AC%BC%ED%92%88%ED%9B%84%EC%9B%90%EA%B4%91%EA%B3%A04.jpg">
				<p>DonGiveUp은 지정기부금 단체로 기부해주신 금액에 따라</p>
				<pre>개인의 경우 소득금액의 30%, 법인의 경우 10%까지공제가 가능합니다.</pre>
			</div>
			<div class="testtt"></div>
		</div>

		<jsp:include page="/WEB-INF/views/main/footer.jsp"></jsp:include>
</body>
</html>