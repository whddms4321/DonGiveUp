<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.wrapper{
		width: 100%;
		
		font-family: 'Noto Sans KR', sans-serif;
	}
	
	.header{
		width: 100%;
		height: 100px;
		border-bottom: 2px solid #0fbcff;
	}
	
	.header_top{
		width: 1200px;
		height: 100%;
    	margin: 0 auto;
    	overflow: hidden;
    	
	}
	.header_top>div{
		float: left;
		text-align: center;
		line-height: 100px;
	}
	
	.header_top>div>a{
		text-decoration: none;
		color: #3d3b3a;
	}
	
	.header_logo{
		padding-right: 30px;
	}
	
	.header_logo>a{
		font-family: 'Staatliches', cursive;
		font-weight: bold;
		font-size: 60px;
	}
	
	.header_navi_a{
		width: 50px;
		padding: 25px;
		text-decoration: none;
	}
	
	.header_log_section{
		padding-left: 30px;
	}
	
	.header_log_a:hover{
		color: #0fbcff;
	}
	.header_navi_a:hover{
		color: #0fbcff;
	}
	
</style>
<link href="https://fonts.googleapis.com/css2?family=Lato&family=Montserrat&family=Open+Sans&family=Raleway&family=Source+Sans+Pro&family=Staatliches&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100&display=swap" rel="stylesheet">
</head>
<body>
<div class="wrapper">
		<div class="header">
			<div class="header_top">
				<div class="header_logo">
					<a href="/"><span style="color: #0fbcff;">Don</span> <span style="color: #3d3b3a;">Give Up</span></a>
				</div>
				<div class="header_navi">
					<a href="#" class="header_navi_a" style="font-size: 18px; font-weight: bold;">기부</a> 
					<a href="#" class="header_navi_a" style="font-size: 18px; font-weight: bold;">펀딩</a> 
					<a href="#" class="header_navi_a" style="font-size: 18px; font-weight: bold;">물품후원</a>
					<a href="#" class="header_navi_a" style="font-size: 18px; font-weight: bold;">재능기부</a> 
					<a href="#" class="header_navi_a" style="font-size: 18px; font-weight: bold;">함께해요</a> 
					<a href="#" class="header_navi_a" style="font-size: 18px; font-weight: bold;">저금통</a>
					<a href="#" class="header_navi_a" style="font-size: 18px; font-weight: bold;">후기</a>
				</div>
				<div class="header_log_section">
				<c:if test="${empty sessionScope.member }">
					<a href="/member/loginFrm.don" class="header_log_a" style="font-size: 18px; font-weight: bold;">로그인</a>
					<span>·</span>
					<a href="/member/joinFrm.don" class="header_log_a" style="font-size: 18px; font-weight: bold;">회원가입</a>
				</c:if>
				<c:if test="${not empty sessionScope.member }">
					<a href="#" class="header_log_a" style="font-size: 18px; font-weight: bold;">마이페이지</a>
					<span>·</span>
					<a href="/member/logout.don" class="header_log_a" style="font-size: 18px; font-weight: bold;">로그아웃</a>
				</c:if>
				</div>
			</div>
		</div>
	</div>
</body>
</html>