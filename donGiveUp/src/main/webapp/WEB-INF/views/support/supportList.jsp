<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 부트스트림4 지원 메타 포트 -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- 부트스트림4 지원 메타 포트 종료-->
<title>후원 목록</title>
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
body{
	font-family: 'Noto Sans KR', sans-serif;
}
.content {
	
	overflow:hidden;
}
.content_wrap{
	width:70%;
	margin:0 auto;
	border: 1px solid pink;
}
.content_wrap>h1{
	text-align: center;
}
.support_try {
	margin: 0 auto;
	width: 400px;
	border: 1px solid black;
	height: 80px;
}

.support_try .apply {
	color: black;
	font-size: 16px;
	font-weight: 600;
	float: left;
	border: none;
	display: inline-block;
	width: 50%;
	height: 100%;
	line-height: 80px;
	text-align: center;
	background-color: lightgray;
}

.support_try>a:first-child>div {
	border-right: 1px solid black;
}

.category_div {
	position: relative;
	padding-left:50px;
}

.category_ul {
	list-style: none;
	display: none;
	padding: 0;
	position: absolute;
}
.supportList_ul{
	width:85%;
	
	overflow:hidden;
	list-style: none;
	padding:0;
	margin:0 auto;
}
.supportList_li{
	
	display:inline-block;
	border:none;
	margin: 25px;
	
}
.supportList{
	display:inline-block;
	width:220px;
	height:240px;
	border: 0.1px solid red;
	position:relative;
}
.supportList_img{
	width:100%;
	height:100%;
}
.supportList_img:hover{
	width:120%;
	height:120%;
	transition-duration:1s;
}
.supportList_img:not(:hover){
	width:100%;
	height:100%;
	transition-duration:1s;
}
.supportList_band{
    
	display:inline-block;
	width:60px;
	left:140px; 
	text-align:center;
	color:green;
	position:absolute;
		
}
#moreList{
	width:550px;
	height:70px;
	background-color:#0fbcff;
	border-radius:15px;
	display:block;
	margin:0 auto;
	font-size:22px;
	
}
#moreList:hover{
	opacity: 0.7;
}
.myband{
	background-color:yellow;
	
	
}
.supportList_name{
	color:gray;
}
/* .supportList_img{
	position:absolute;
	width:300px;
	hight:20
} */
</style>
<script>	
	$(function() {
		$(".category_content").click(function() {

			$(".category_ul").css("display", "block");

		});
	
		
	});
	$(function(){
		$("#moreList").click(function(){
					var count= $(this).val();
					console.log(count)
					
					$.ajax({
						url: "/moreList.don",
						data:{
							count:count
						},
						type: "post",
						success: function(data){
							$(this).remove();
							var html='';
							for(var i=0;i < data.length;i++){
								
								html += "<li class=\"supportList_li\"><div class=\"supportList\">";
								html += "<img class=\"supportList_img\" src=\"../../../resources/upload/test/dora_1.png\">";
								html += "<h2 class=\"supportList_name\">"+data[i]["supportNo"]+"</h2>";
								$(".support_ul").add(html);
								
							}
							
							
						},
						error : function(){
							console.log("실행 실패");
						}
					});
					
				});
		});

</script>
<body>
	<jsp:include page="/WEB-INF/views/main/header.jsp" />
	<div class="content">
		<div class="content_wrap">
			<br>
			<br>
			<br>
			<div class="support_try">
				<a href="/supportApplyAd.don">
					<div class="apply">물품 후원하기</div>
				</a> <a href="/supportList.don?count=1">
					<div class="apply">물품후원 리스트</div>
				</a>
			</div>
			<br><br><br><br>
			<h1>물품 후원 리스트</h1>
			<br><br><br>
			<div class="category_div">
				<span class="category_content">전체 ▽</span>
				<ul class="category_ul">
					<li >전체</li>
					<li>의류</li>
					<li>생리대</li>
					<li>화장품</li>
					<li>도서</li>
					<li>생활용품</li>
					<li>가전제품</li>
					<li>유아제품</li>
					<li>학용품</li>
				</ul>
			</div>
			<br>
			<ul class="supportList_ul">
				
				<c:forEach var="n" items="${list }">
					<li class="supportList_li">
						<div class="supportList">
							<img class="supportList_img" src="../../../resources/upload/test/dora_1.png">
							
							<!--<img src="${n.supportFilename }"> -->
							<h2 class="supportList_name">${n.supportName }</h2>
							<div>마감 기한 : ${n.enrollEndDate }</div>
							<div>물품 수량 : ${n.supportAmount }</div>
							<c:if test="${n.supportApplys == 0 }">
								<span class="supportList_band myband">요청중</span>
								<button class="supportListApply" value="${n.supportNo }"></button>
							</c:if>							 
					 		<c:if test="${n.supportApplys == 1 }">
								<span class="supportList_band">마감임박</span>
								<button class="supportListApply" value="${n.supportNo }">요청하기</button>
							</c:if>	 						
						</div>

					</li>

				</c:forEach>
				<span>${button }</span>
			</ul>
			
		</div>
	</div>
	<br><br><br><br>
	<jsp:include page="/WEB-INF/views/main/footer.jsp" />
	
</body>
</html>