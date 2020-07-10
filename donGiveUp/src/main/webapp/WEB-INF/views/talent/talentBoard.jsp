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

.content>div {
	float: left;
}

.boardTab {
	width: 15%;
	height: 800px;
}

.listTab {
	height: 80px;
	font-size: 20px;
	line-height: 80px;
	text-decoration: none;
}

.listTab>a {
	text-decoration: none;
	color: black;
	display: block;
}

.listTab:nth-child(1) {
	background-color: #D4D4Cd;
	color: white;
	font-weight: bold;
}

.boardWrap {
	width: 85%;
	height: 800px;
}

.noticeTable {
	width: 100%;
	text-align: center;
	border-bottom: 3px solid grey;
}

.noticeTable>tbody>tr>th {
	background-color: grey;
	opacity: 0.6;
	color: ghostwhite;
	height: 50px;
}

.noticeTable>tbody>tr>th:first-child {
	width: 250px;
}

.noticeTable>tbody>tr>th:last-child {
	width: 250px;
}

.noticeTable>tbody>tr>td {
	height: 50px;
	color: black;
}

.noticePageNavi {
	width: 100%;
	text-align: center;
	height: 50px;
	margin: 0 auto;
	margin-top: 30px;
	margin-bottom: 30px;
}

.noticePageNavi>* {
	margin: 20px;
}

.noticePageNavi>.noticeBtn {
	width: 30px;
	height: 30px;
	border: 0.5px solid grey;
	display: inline-block;
	line-height: 30px;
}

.noticePageNavi>.noticePrevBtn {
	width: 50px;
	height: 30px;
	border: 0.5px solid red;
	display: inline-block;
	line-height: 30px;
	background-color: red;
	color: ghostwhite;
	font-weight: bold;
}

.noticePageNavi>.noticeNextBtn {
	width: 50px;
	height: 30px;
	border: 0.5px solid red;
	display: inline-block;
	line-height: 30px;
	background-color: red;
	color: ghostwhite;
	font-weight: bold;
}

.noticePageNavi>.selectNoticePage {
	width: 30px;
	height: 30px;
	border: 1px solid #494949;
	display: inline-block;
	line-height: 30px;
	background-color: #494949;
	color: ghostwhite;
	font-weight: bold;
}
</style>
<script>
	
</script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/main/header.jsp"></jsp:include>
	<div class="content">
		<div class="boardTab">
			<div
				style="width: 100%; height: 120px; background-color: #0fbcff; color: white; line-height: 120px; text-align: center; font-size: 30px; margin-top: 20px; font-weight: bold;">참
				여</div>
			<div
				style="width: 100%; height: 300px; background-color: white; color: black; float: left;">
				<ul
					style="list-style: none; border: 1px solid #dedede; padding-left: 0;">
					<li class="listTab" style="border-bottom: 1px solid #dedede;"><a
						href="/talent/talentBoard.don?reqPage=1&talentNo=${talentNo }"
						style="margin-left: 40px;">게시판</a></li>
					<li class="listTab"><a
						href="/talent/talentBoardDeleteFrm.don?reqPage=1&talentNo=${talentNo }"
						style="margin-left: 40px;">탈퇴 신청</a></li>
				</ul>
			</div>
		</div>
		<div class="boardWrap">
			<h2 style="margin-left: 20px;">게시판</h2>
			<table class="noticeTable">
				<tr>
					<th>글번호</th>
					<th>제목</th>
					<th>작성자</th>
				</tr>
				<c:forEach items="${list }" var="talentBoard">
					<tr>
						<td style="border-bottom: 0.1px solid #DDE3E9;">
							${talentBoard.talentBoardNo }</td>
						<td style="border-bottom: 0.1px solid #DDE3E9;"><a
							href="/talent/talentBoardDetail.don?talentBoardNo=${talentBoard.talentBoardNo}"
							style="font-weight: bold">${talentBoard.talentBoardTitle }</a></td>
						<td style="border-bottom: 0.1px solid #DDE3E9;">
							${talentBoard.talentBoardWriter }</td>
					</tr>

				</c:forEach>
			</table>
			<div class="noticePageNavi">${pageNavi }</div>
		</div>
	</div>
	<c:if test="${not empty sessionScope.member }">
		<jsp:include page="/WEB-INF/views/main/chat.jsp"></jsp:include>
	</c:if>
	<jsp:include page="/WEB-INF/views/main/footer.jsp" />
</body>
</html>