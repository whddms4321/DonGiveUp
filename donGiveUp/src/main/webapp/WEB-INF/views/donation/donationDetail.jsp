<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인페이지</title>
<style>
.content-main{
margin:0 auto;
width: 1200px;
height : 1700px;
border: 0.1px solid black;
}
.content-main-left{
width: 80%;
height : 100%;
border: 0.1px solid red;
float: left;
}
.content-main-right{
margin-left:80%;
width: 20%;
height : 100%;
border: 0.1px solid blue;
}
.content-main-left-tap{
width: 100%;
height: 80px;
border: 0.1px solid blue;

}
.content-main-left-tap1{
color:gray;
margin-left: 20px; 
line-height: 70px;
font-size: 20px;
}
.content-main-left-title{
	width: 92%;
margin-left: 40px; 
border: 0.1px solid red;
}
.content-main-left-title-a{

font-size: 40px;
font-weight: bold;
}
.content-main-left-content{
	width: 100%;
height: 1000px;
border: 0.1px solid blue;
}
.content-main-left-file{
width: 100%;
height: 100px;
border: 0.1px solid red;
}
.content-main-left-comment{
	width: 100%;
height: 380px;
border: 0.1px solid blue;
}
.content-main-right-money{
width: 100%;
height: 400px;
border: 0.1px solid red;
}
.content-main-right-donation{
width: 100%;
height: 100px;
border: 0.1px solid blue;
}
.content-main-right-organization{
width: 100%;
height: 300px;
border: 0.1px solid red;
}
.content-main-right-require{
width: 100%;
height: 300px;
border: 0.1px solid blue;
}
.content-main-right-relation{
width: 100%;
height: 350px;
border: 0.1px solid red;
}
}
</style>
</head>
<body>

	<jsp:include page="/WEB-INF/views/main/header.jsp"></jsp:include>
	<div class="content">
		<div class="content-main">
			<div class="content-main-left">
				<div class="content-main-left-tap">
					<a class="content-main-left-tap1">기부 > 환경</a>
				</div>
				<div class="content-main-left-title">
					<a class="content-main-left-title-a">이것은 통닭인가 치킨인가? 이것은 통닭인가 치킨인가? 이것은 통닭인가 치킨인가? 이것은 통닭인가 치킨인가?</a>
				</div>
				<div class="content-main-left-content">
					<a class="content-main-left-content-a">내용</a>
				</div>
				<div class="content-main-left-file">
					<a class="content-main-left-file-a">첨부 파일</a>
				</div>
				<div class="content-main-left-comment">
					<a class="content-main-left-comment-a">댓글</a><br>
					<button>더보기</button>
				</div>
				
			</div>
			<div class="content-main-right">
				<div class="content-main-right-money">
					<a class="content-main-right-money-a1">현재 기부 금액</a>	<br>
					<a class="content-main-right-money-a2">70%</a><br>
					<a class="content-main-right-money-a3">목표금액</a><br>	
					<a class="content-main-right-money-a4">현재 기부 금액</a>	<br>
					<a class="content-main-right-money-a5">기부 참여자 수</a>	<br>
					<a class="content-main-right-money-a6">D-Day</a>		
				</div>
				<div class="content-main-right-donation">
					<button class="content-main-right-donation-button">기부 하기</button>	
				</div>
				<div class="content-main-right-organization">
				<a class="content-main-right-organization-a1">모금 단체 안내</a><br>
				<a class="content-main-right-organization-a2">이미지</a><br>
				<a class="content-main-right-organization-a3">단체 이름</a><br>
				<a class="content-main-right-organization-a4">단체 리뷰</a>	
				</div>
				<div class="content-main-right-require">
				<a class="content-main-right-require-a1">주의 사항</a><br>
				<a class="content-main-right-require-a1">주의 내용</a>
				</div>
				<div class="content-main-right-relation">
					<a class="content-main-right-require-a1">연관 기부 글</a>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/main/footer.jsp"></jsp:include>
</body>
</html>