<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.content{
		height: 100%;
		width: 1200px;
		margin: 0 auto;
		font-family: 'Noto Sans KR', sans-serif;
	}
	
	.insertInfo{
		width: 100%;
		height: 220px;
		background-color: #d6ecfa;
		font-family: 'Noto Sans KR', sans-serif;
		padding-left: 350px;
	}
</style>
<script>
	
</script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/main/header.jsp"></jsp:include>
	<div class="insertInfo">
		<br>
		<h1>재능기부 목록</h1>
		<h4>재능기부 커뮤니티에서 채팅이나 게시판 등 다양한 기능을 이용해 보세요.</h4>
	</div>

	<div class="content">
		

	</div>
	<c:if test="${not empty sessionScope.member }">
		<jsp:include page="/WEB-INF/views/main/chat.jsp"></jsp:include>
	</c:if>
	<jsp:include page="/WEB-INF/views/main/footer.jsp" />
</body>
</html>