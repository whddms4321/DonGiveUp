<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기부 상세 페이지</title>
<style>
.content-main{
margin:0 auto;
width: 1200px;
height : 1700px;

}
.content-main-left{
width: 80%;
height : 100%;
border: 0.1px solid gray;
border-bottom:none;
border-top:none;
float: left;
}
.content-main-right{
margin-left:80%;
width: 20%;
height : 100%;
border-right: 0.1px solid gray;
border-left:none;

}
.content-main-left-tap{
width: 100%;
height: 80px;


}
.content-main-left-tap1{
color:gray;
margin-left:100px; 
line-height: 120px;
font-size: 17px;
}
.content-main-left-title{
	width: 100%;
text-align: center; 

}
.content-main-left-title-a{

font-size: 40px;
font-weight: bold;
}
.content-main-left-content{
	width: 100%;
height: 1000px;

}
.content-main-left-file{
width: 100%;
height: 100px;

}
.content-main-left-comment{
	width: 100%;
height: 380px;

}
.content-main-right-money{
width: 100%;
height: 280px;


}
.content-main-right-donation{
width: 100%;
height: 80px;

}
.content-main-right-organization{
width: 100%;
height: 300px;

}
.content-main-right-require{
width: 100%;
height: 300px;

}
.content-main-right-relation{
width: 100%;
height: 350px;

}
.content-main-right-money-a1{
	font-size: 35px;
	font-weight: bold;
	color: green;
	margin-left: 15px;
}
progress{
margin-left: 15px;
	width: 80%;
}
.content-main-right-money-a3{
	font-size : 16px;
	margin-left: 15px;
	color: gray;
}

.content-main-right-money-a4{

	margin-left: 9px;
}
.content-main-right-money-a5{
	
	margin-left: 15px;
	font-size: 30px;
	font-weight: bold;
	
}
.content-main-right-money-a6{
	
	margin-left: 15px;
}
.content-main-right-money-d2{
	margin-top:10px;
margin-left: 15px;
width: 55px;
background-color:red;
	color:white;
	border-radius: 5px 5px; 
}
.content-main-right-money-d1{
line-height: 70px;

}
.content-main-right-donation-button{
	width: 99.2%;
	height: 100%;
	background-color: #0fbcff;
	font-size: 25px;
	font-weight: bold;
	color: white;
	border: none;
}
.content-main-right-organization-d1{
	font-size: 23px;
	font-weight: bold;
	color: black;
	text-align:center;
	margin-top: 15px;
}
.content-main-right-organization-img{
	width: 70%;
	height: 50%;
	margin-left: 15%;
}
.content-main-right-organization-d2{
	font-weight:bold;
	color:gray;
	text-align:center;
}
.content-main-right-organization-d3{
	
	color:gray;
	text-align:center;
}
.content-main-right-require-d1{
font-size: 23px;
	font-weight: bold;
	color: black;
	text-align:center;
	margin-top: 15px;
}
.content-main-right-require-d2{
	font-size: 13px;
	margin: 10px;
}
</style>
</head>
<body>

	<jsp:include page="/WEB-INF/views/main/header.jsp"></jsp:include>
	<div class="content">
		<div class="content-main">
			<div class="content-main-left">
				<div class="content-main-left-tap">
					<a class="content-main-left-tap1">기부 > ${detail.donationType}</a>
				</div>
				<div class="content-main-left-title">
					<a class="content-main-left-title-a">${detail.donationTitle}</a>
				</div><br>
				<div class="content-main-left-content">
					<a class="content-main-left-content-a">${detail.donationContent}</a>
				</div><hr>
				<div class="content-main-left-file">
					<a class="content-main-left-file-a">첨부 파일 : ${company.chartFilepath }</a>
				</div><hr>
				<div class="content-main-left-comment">
					<a class="content-main-left-comment-a">댓글</a><br>
					<button>더보기</button>
				</div>
				
			</div>
			<div class="content-main-right">
				<div class="content-main-right-money">
				<div class="content-main-right-money-d1"><a class="content-main-right-money-a1">80%</a></div>
				<a class="content-main-right-money-a2"><progress value="80" max="100"></progress></a><br>
				<a class="content-main-right-money-a3">${detail.donationStartDate} ~ ${detail.donationEndDate}까지</a><br>
				<div class="content-main-right-money-d2"><a class="content-main-right-money-a4">D-59</a></div><br>	
				<a class="content-main-right-money-a5">${detail.donationNowMoney}원</a><br><br>
				<a class="content-main-right-money-a6">목표${detail.donationGoalMoney}원</a><br>						
				
					
				</div>
				<div class="content-main-right-donation">
					<button class="content-main-right-donation-button">모금함 기부 하기</button>	
				</div>
				<div class="content-main-right-organization">
				<div class="content-main-right-organization-d1"><a class="content-main-right-organization-a1">모금 단체 안내</a></div><br>
				<a class="content-main-right-organization-a2"><img class="content-main-right-organization-img" src="/resources/upload/images/1.JPG"></a><br>
				<div class="content-main-right-organization-d2"><a class="content-main-right-organization-a3">${company.companyName }</a></div><br>
				<div class="content-main-right-organization-d3"><a class="content-main-right-organization-a4" href="#">기부 단체 리뷰</a>	</div>
				</div>
				<div class="content-main-right-require">
				<div class="content-main-right-require-d1"><a class="content-main-right-require-a1">주의 사항</a></div><br>
				<div class="content-main-right-require-d2"><a class="content-main-right-require-a2">
				<b>결제 시 다음 화면으로 넘어가지 않는 경우(기타 오류 발생 시)</b>

		인터넷 익스플로러를 사용 중이라면 브라우저를 확인 후 재설정하는 것만으로도

		오류가 해결되는 경우가 많습니다.<br><br>

		<b>결제 시 입력한 이름과 주민등록번호가 일치하지 않는다는 경우</b>

		네이버 회원정보에 등록된 이름과 한국신용평가원에 등록된 이름이 일치하지 않을 때 

		해당 오류가 나타날 수 있습니다.
		</a></div>
				</div>
				<div class="content-main-right-relation">
					<div class="content-main-right-require-d1"><a class="content-main-right-require-a1">연관 기부 글</a></div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/main/footer.jsp"></jsp:include>
</body>
</html>