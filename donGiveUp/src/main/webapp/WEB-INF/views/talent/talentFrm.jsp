<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.js"></script>
<style>
	.content{
		height: 800px;
		width: 1200px;
		margin: 0 auto;
	}
	
	.talentInfo{
		background-image: url("/resources/song/image/talentInfo1.jpg");
		background-repeat: no-repeat;
    	background-size: cover;
    	opacity : 0.9;
		width: 100%;
		height: 320px;
	}
	
	.contentHeadPart{
		width: 100%;
		height: 80px;
	}
	
	.contentHeadPart>*{
		margin: 0 auto;
	}
	
	.contentHeadPart>ul{
		list-style: none;
	}
	
	.contentHeadPart>ul>li{
		width: 135px;
		height: 40px;
		font-weight: bold;
		float: left;
		margin-right: 5px;
	}
	
	.contentHeadPart>ul>li>a{
		text-decoration: none;
    	color: gray;
		font-size: 17px;
		display: block;
		border: 1px solid #cdcdcd;
		line-height: 40px;
		text-align: center;
	}
	
	.contentHeadPart>ul>li:nth-child(1)>a {
		border: 1px solid #0fbcff;
		color: #0fbcff;
	}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/main/header.jsp"></jsp:include>
	<div class="talentInfo">
			
	</div>
	
	<div class="content">
	<h2 style="color: #3d3b3a;">지금 모집 중 활동</h2>
	
		<div class="contentHeadPart">
			<ul>
				<li><a href="#">#전체</a></li>
				<li><a href="#">#디자인</a></li>
				<li><a href="#">#프로그래밍</a></li>
				<li><a href="#">#노하우</a></li>
				<li><a href="#">#생활</a></li>
				<li><a href="#">#운동</a></li>
				<li><a href="#">#번역</a></li>
				<li><a href="#">#기타</a></li>
				
			</ul>
			<br><br><br>
			<a href="/talent/insertTalentFrm.don" style="float: right; text-decoration: none; display: block; background-color: #cdcdcd; border-radius: 5px; width: 70px; height: 35px; line-height: 35px; color: white; text-align: center; font-weight: bold;">글등록</a>
			
		</div>
	</div>
	<c:if test="${not empty sessionScope.member }">
	<jsp:include page="/WEB-INF/views/main/chat.jsp"></jsp:include>
		
	</c:if>
	<jsp:include page="/WEB-INF/views/main/footer.jsp"/>
</body>
</html>