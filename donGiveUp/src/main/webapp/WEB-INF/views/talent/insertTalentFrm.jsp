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
</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/main/header.jsp"></jsp:include>
<div class="content">
	
</div>
<c:if test="${not empty sessionScope.member }">
	<jsp:include page="/WEB-INF/views/main/chat.jsp"></jsp:include>	
</c:if>
<jsp:include page="/WEB-INF/views/main/footer.jsp"/>
</body>
</html>