<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Don Give Up</title>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100&display=swap" rel="stylesheet">
<style>
	body{
		font-family: 'Noto Sans KR', sans-serif;
	}
	.content{
		height: 1400px;
		width: 100%;
		margin: 0 auto;
		background-image: url("/imgs/charities3.jpg");
		background-repeat: no-repeat;
		background-size: cover;
		background-position: 50%;
		opacity: 0.8;
		
	}
	
	.joinArea{
		width: 700px;
		height: 600px;
		background-color: white;
		border-radius: 15px;
		box-sizing: border-box;
	}
	
	.joinDiv>div{
		margin: 0 auto;
	}
	
	.joinText{
		padding-top : 100px;
		text-align: center;
	}
	
	.joinNextBtn{
		width: 220px; 
		height: 50px;
		background-color: #0fbcff;
		border: none;
		border-radius: 10px;
		color : black;
		font-size: 16px;
	}
	
	.joinNextBtn:hover {
		opacity: 0.8;
	}
	
	.joinStep{
		width : 615px;
		margin: 0 auto;
	}
	
	.joinStepBox{
		width: 200px;
		height: 100px;
		line-height: 100px;
		display: inline-block;
		text-align: center;
		background-color: white;
		padding: 0;
		margin-top: 20px;
		margin-bottom: -50px;
		border-radius: 15px;
		font-size: 18px;
		font-weight: bold;
		
	}
	
	.joinStepBox:nth-child(3){
		background-color: #0fbcff;
	}
	
	.joinAreaWrapper>*{
		text-align: center;
		margin: 0 auto;
	}
	
	.joinStep3Btn{
		text-decoration: none;
		color: white;
		background-color: #0fbcff;
		width: 200px;
		height: 50px;
		line-height: 50px;
		display: inline-block;
		border-radius: 10px;
		font-weight: bold;
		margin-right: 30px;
	}
	
	.joinStep3Btn:hover{
		opacity: 0.8;
		
	}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.js"></script>

</head>
<body>
	<jsp:include page="/WEB-INF/views/main/header.jsp"/>
	<div class="content">
	<div class="joinDiv">
		<div class="joinText">
			<span style="font-size: 50px; color: white; font-weight: bold;">회원가입</span>
		</div>
		<div class="joinStep">
			<p class="joinStepBox">Step 1 . 이용약관</p>
			<p class="joinStepBox">Step 2 . 정보입력</p>
			<p class="joinStepBox">Step 3 . 회원가입 완료</p>
		</div>
		<br><br>
		<div class="joinArea">
		<div class="joinAreaWrapper">
			<div class="joinImgArea">
				<img src="/resources/song/image/logo.jpg" style="width: 320px; height: 150px; margin-top: 60px;">
			</div>
			<h1>회원가입을 축하합니다!</h1>
			<h3>Don Give Up 서비스 이용이 가능한 회원이 되셨습니다.</h3>
			<h3>꾸준한 관심과 후원으로 행복을 선물하세요.</h3>
			<div style="margin-top: 50px;">
				<a href="/member/loginFrm.don" class="joinStep3Btn">로그인</a>
				<a href="/" class="joinStep3Btn">메인으로</a>
			</div>
		</div>
		</div>
	</div>
	</div>
	<jsp:include page="/WEB-INF/views/main/footer.jsp"></jsp:include>
</body>
</html>