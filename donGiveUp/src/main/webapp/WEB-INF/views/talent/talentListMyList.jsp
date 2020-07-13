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
</style>
<script>
function talentBoard(talentNo) {
	location.href="/talent/talentBoard.don?reqPage=1&talentNo="+talentNo;
}
</script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/main/header.jsp"></jsp:include>
	<div class="insertInfo">
		<br>
		<h1>재능기부 참여 목록</h1>
		<h4>재능기부 커뮤니티에서 게시판을 통하여 배우고 싶은 분야에 대해 배워보세요.</h4>
	</div>

	<div class="content">
	<h1>참여목록</h1>
	<hr>
		<div style="margin-top: 25px; width: 1200px; height: 100%;overflow: hidden;">
			<div style="width: 1200px; height: 100%;" class="divFloat">
				<c:forEach items="${join }" var="list">
					<div class="talentListPart"
						onclick="talentBoard('${list.talentNo }')">
						<div class="talentImage">
							<img src="/resources/song/talent/thumbs/${list.talentFilepath }"
								style="width: 100%; height: 100%;">
						</div>
						<div class="talentWriter">
							<span class="noticeDetailSpan1">개설자</span><span
								style="margin-right: 20px;"> ${list.talentWriter }</span>
						</div>
						<div class="talentTitle">${list.talentTitle }</div>
					</div>
				</c:forEach>
			</div>
		</div>

	</div>
	<c:if test="${not empty sessionScope.member }">
		<jsp:include page="/WEB-INF/views/main/chat.jsp"></jsp:include>
	</c:if>
	<jsp:include page="/WEB-INF/views/main/footer.jsp" />
</body>
</html>