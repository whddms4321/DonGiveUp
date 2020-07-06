<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
		height: 1000px;
		width: 100%;
		margin: 0 auto;
		background-image: url("/imgs/charities3.jpg");
		background-repeat: no-repeat;
		background-size: cover;
		background-position: 50%;
		opacity: 0.8;
		
	}
	
	.loginArea{
		width: 600px;
		height: 500px;
		background-color: white;
		border-radius: 15px;
	}
	
	.loginDiv>div{
		margin: 0 auto;
	}
	
	.loginText{
		padding-top : 100px;
		text-align: center;
	}
	
	.loginBtn{
		width: 440px; 
		height: 50px;
		background-color: #0fbcff;
		border: none;
		border-radius: 10px;
		color : white;
		font-size: 16px;
		cursor: pointer;
	}
	
	.loginBtn:hover {
		opacity: 0.8;
	}
	
	.findBtnArea{
		width: 100%;
		height: 60px;
		margin: 0 auto;
		text-align: center;
		padding-top: 10px;
		padding-bottom: 10px;
	}
	
	input{
		width: 100%;
		border: 2px solid #aaa;
		border-radius: 4px;
		
		outline: none;
		padding: 8px;
		box-sizing: border-box;
		transition : 0.3s;
	}
	
	input:focus{
		border-color: dodgerBlue;
		box-shadow: 0 0 8px 0 dodgerBlue;
	}
	
	.findA:nth-child(2){
		width: 210px;
		height: 50px;
		color: #646661;
		background-color: white;
		display: inline-block;
		text-decoration: none;
		font-weight: bold;
		border: 2px solid #646661;
		border-radius: 5px;
		text-align: center;
		line-height: 50px;
		font-size: 18px;
		margin-left: 84px;
	}
	
	.findA:nth-child(3){
		width: 210px;
		height: 50px;
		color: white;
		background-color: #646661;
		display: inline-block;
		text-decoration: none;
		font-weight: bold;
		border: 2px solid #646661;
		border-radius: 5px;
		text-align: center;
		line-height: 50px;
		font-size: 18px;
	}
	
	.showIdArea{
		width: 500px;
		height: 250px;
		background-color: #d6ecfa;
		border-radius: 15px;
		text-align: center;
		margin: 0 auto;
		margin-top: 30px;
		padding-top: 40px;
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
	<div class="loginDiv">
		<div class="loginText">
			<span style="font-size: 50px; color: white; font-weight: bold;">비밀번호 찾기</span>
		</div>
		<br><br>
		<div class="loginArea">
		<br>
		<a href="/member/findIdFrm.don" class="findA">아이디 찾기</a>
		<a href="/member/findPwFrm.don" class="findA">비밀번호 찾기</a>
			<div class="showIdArea">
				<p style="color: black; font-weight: bold; font-size: 25px; margin-top: 50px;">입력하신 정보에 해당하는 정보가 없습니다.<br> 
				정보 확인 후 재입력 바랍니다.</p>
			</div>
			<br>
			<div style="text-align: center;margin: 0 auto;">
				<a href="/member/loginFrm.don" class="joinStep3Btn" style="margin-left: 20px;">로그인</a>
				<a href="/" class="joinStep3Btn">메인으로</a>
			</div>
		</div>
	</div>
	</div>
	<jsp:include page="/WEB-INF/views/main/footer.jsp"></jsp:include>
</body>
</html>