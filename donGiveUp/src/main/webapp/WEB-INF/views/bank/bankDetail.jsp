<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기부 상세 페이지</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.js"></script>
<style>
.content-main{
margin:0 auto;
width: 1200px;
border: 1px solid #e0e0e0;
}

.content-main3{
margin:0 auto;
width: 1042px;
padding :49px 79px;
border: 1px solid #e0e0e0;
}
.main-img{
margin-top:20px;
height: 330px;
width:1200px;

background-color : rgba(0,0,0,.4);
position: absolute;
}
.main-img-div{


text-align: center;
margin: 0 auto;
line-height: 50px;
margin-top: 50px;
color: white;

}
.main-img-div-a1{
font-size: 40px;
font-weight: bold;
}
.content-main2{

margin:0 auto;
margin-top :350px;
width: 1200px;
height : 150px;

}
.content-main2-div1{
float:left;
width:299px;
height : 150px;
border-right: 1px solid #e0e0e0;
text-align: center;
font-size:22px;
line-height: 60px;
}
.content-main2-div3{

border-right:none;
}


.content-main2-div2{
background-color :#fafafa;
width:1200px;
text-align: center;
height :80px;
line-height: 80px;
border-top: 1px solid #e0e0e0;

}
.content-main2-div1-button{
	margin-top:45px;
	width: 60%;
	height: 40%;
	font-size: 18px;
	font-weight: 700;
	background-color:#0fbcff;
	color: white;
	border: none;
}
.main-img{
z-index: 100;
}
.main-img>img{
width: 100%;
height: 100%;
float: left;
z-index: 1;
 background-size:100%;
    opacity:0.5!important;
    filter:alpha(opacity=50);



}
.main-img-div{

position: absolute;
margin-left: 45%;

}


</style>
</head>
<body>

	<jsp:include page="/WEB-INF/views/main/header.jsp"></jsp:include>
	<div class="content">
		<div class="content-main">
			<div class="main-img">
			<img class="opac" src="/resources/upload/images/${detail.bankFilepath }">
			<div class="main-img-div">
				<a class="main-img-div-a1">${detail.bankTitle }</a><br>
				<a class="main-img-div-a2">시작일 ${detail.bankDate }</a><br>
				<a class="main-img-div-a3">${detail.bankWriter }</a>		
			</div>
			</div>
			<div class="content-main2">
			<div class="content-main2-div1"><a>총 저금액</a><br><a><b>${detail.bankNowMoney}</b>원</a></div>
			<div class="content-main2-div1"><a>목표 저금액</a><br><a><b>${detail.bankGoalMoney}</b>원</a></div>
			<div class="content-main2-div1"><a>남은  금액</a><br><a><b>1${money}</b>원</a></div>
			
			<form class="bankMoney">
				<input type="hidden" name="memberId" value="${sessionScope.member.memberId}">
				<input type="hidden" name="bankNowMoney" value="${detail.bankNowMoney}">	
				<input type="hidden" name="bankNo" value="${detail.bankNo }">
				<input type="hidden" name="bankOrganization" value="${detail.bankOrganization}">
				
			<div class="content-main2-div1 content-main2-div3">
			<c:if test="${not empty sessionScope.member }">	
			<button class="content-main2-div1-button" onclick="bankMoney('${detail.bankNo}','${detail.bankOrganization }','${detail.bankNowMoney}')" type="button">모금함 기부 하기</button>
			</c:if>
			<c:if test="${empty sessionScope.member }">	
			<button class="content-main2-div1-button" onclick="" type="button">모금함 기부 하기</button>
			</c:if>
			</div>
			
			</form>
			
			</div>
			<div class="content-main2-div2"><a>저금액의 <b style="color: #0fbcff">${detail.dnrPercent }%</b>가 기부되었습니다.</a></div>
		</div><br>
		<div class="content-main3">
			<h3>콩 저금통 소개</h3>
			<a>이 저금통은  <b style="color: #0fbcff">${detail.bankOrganization }</b>에서 기부합니다.</a><br><br>
			<a>${detail.bankContent }</a>
		
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/main/footer.jsp"></jsp:include>
	<script>
	function bankMoney(bankNo,bankOrganization,bankNowMoney) {
		console.log("시작");
		var memberId = "${sessionScope.member.memberId}";
		var url = "/bankMoney.don";
		var title = "bankMoney";
		var status = "left=500px, top=100px, width=500px, height=550px, menubar=no, status=no, scrollbars=yes";
		var popup = window.open("", title, status);
		$("input[name=memberId]").val(memberId);
		$("input[name=bankNo]").val(bankNo);
		$("input[name=bankNowMoney]").val(bankNowMoney);
		$("input[name=bankOrganization]").val(bankOrganization);
		$(".bankMoney").attr("action", url);
		$(".bankMoney").attr("method", "post");
		$(".bankMoney").attr("target", title);//새로 열린 popup창과 form태그를 연결
		$(".bankMoney").submit();
	}
	</script>
</body>
</html>