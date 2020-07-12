<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.content {
	height: 100%;
	width: 1200px;
	margin: 0 auto;
	font-family: 'Noto Sans KR', sans-serif;
	overflow: hidden;
}

.insertInfo {
	width: 100%;
	height: 220px;
	background-color: #d6ecfa;
	font-family: 'Noto Sans KR', sans-serif;
	padding-left: 350px;
}

.talentListPart {
	float: left;
	width: 395px;
	height: 500px;
}

.talentImage {
	width: 90%;
	height: 350px;
	margin-left: 20px;
	position: relative;
	margin: auto;
	overflow: hidden;
}

.talentTitle {
	font-weight: bold;
	font-size: 20px;
	text-align: center;
	margin-bottom: 20px;
}

.talentWriter {
	width: 100%;
	text-align: right;
}

.talentListPart:hover img {
	transform: scale(1.2);
}

.talentListPart:hover {
	cursor: pointer;
}

.talentImage img {
	max-width: 100%;
	transition: all 0.7s;
	display: block;
	width: 100%;
	height: auto;
	transform: scale(1);
}

.noticeDetailSpan2 {
	color: red;
	font-weight: bold;
	margin-right: 10px;
	margin-left: 30px;
}
</style>
<script>
	function talentBoard(talentNo) {
		location.href = "/talent/talentBoard.don?reqPage=1&talentNo="
				+ talentNo;
	}
</script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/main/header.jsp" />

	<div class="insertInfo">
		<br>
		<h1>재능기부 개설 목록</h1>
		<h4>재능기부 커뮤니티에서 게시판을 작성하여 재능을 원하는 사람들에게 재능을 선사하세요.</h4>
	</div>

	<div class="content">
		<h1>개설목록</h1>
		<hr>
		<div style="margin-top: 25px; width: 1200px; height: 100%;">
<!-- 		 -->
			<div style="width: 1200px; height: 100%;" class="divFloat">
				<c:forEach items="${list }" var="list">
					<div class="talentListPart"
						onclick="talentBoard('${list.talentNo }')">
						<div class="talentImage">
							<img src="/resources/song/talent/thumbs/${list.talentFilepath }"
								style="width: 100%; height: 100%;">
						</div>
						<div class="talentTitle">${list.talentTitle }</div>
						<div class="talentCount">
							<span class="noticeDetailSpan2">제한인원</span> ${list.talentCount }
							명
						</div>
					</div>
				</c:forEach>
			</div>
		</div>

	</div>
	<c:if test="${not empty sessionScope.member }">
		<jsp:include page="/WEB-INF/views/main/chat.jsp"/>
	</c:if>
	<jsp:include page="/WEB-INF/views/main/footer.jsp" />
</body>
</html>