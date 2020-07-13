<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.3.1.js"></script>
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

.noticeDetailSpan1 {
	color: #BDCCD9;
	font-weight: bold;
	font-style: italic;
	margin-right: 10px;
	margin-left: 30px;
	font-size: 14px;
}

.noticeDetailSpan2 {
	color: #5E6062;
	font-size: 14px;
}

.noticeBtn {
	border: 1px solid #D4D4Cd;
	width: 90px;
	line-height: 28px;
	vertical-align: center;
	color: #666666;
	padding-left: 2px;
	padding-right: 2px;
	margin-left: 2px;
	margin-right: 2px;
	background-color: #ffffff;
}

.noticeBtn:hover {
	cursor: pointer;
	background-color: rgba(102, 102, 102, 0.3);
	color: white;
}

.adminNoticeBtn {
	display: inline-block;
	width: 90px;
	height: 28px;
	background-color: #ffffff;
	text-align: center;
	line-height: 30px;
	color: #666666;
	border: 1px solid #D4D4Cd;
	padding-left: 2px;
	padding-right: 2px;
	margin-left: 2px;
	margin-right: 2px;
	text-decoration: none;
}
</style>

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
			<h2 style="margin-left: 20px;">상세 보기</h2>
			<c:if
				test="${sessionScope.member.memberId eq board.talentBoardWriter }">
				<div align="right">

					<a href="/modifyTalentBoardFrm?talentNo=${board.talentNo}"
						class="adminNoticeBtn">수정하기</a> <a href="javascript:void(0)"
						class="adminNoticeBtn"
						onclick="deleteTalentBoard('${board.talentNo}')">삭제하기</a>

				</div>
			</c:if>
			<div class="noticeDetailContent">
				<hr style="border: 2px solid black;">
				<h1 align="center">${board.talentBoardTitle}</h1>
				<div style="text-align: right">
					<span class="noticeDetailSpan2"><span
						class="noticeDetailSpan1">by</span>${board.talentBoardWriter}</span>
				</div>
				<br>
				<hr style="border: 2px solid black;">

				<div style="width: 100%; margin-top: 50px; margin-bottom: 50px;"
					class="noticeContentTable0">${board.talentBoardContent }</div>
				<hr>
				<br> <br>
				<button type="button" class="noticeBtn">목록보기</button>
				<br> <br> <br>
			</div>
		</div>
	</div>
	<c:if test="${not empty sessionScope.member }">
		<jsp:include page="/WEB-INF/views/main/chat.jsp"></jsp:include>
	</c:if>
	<jsp:include page="/WEB-INF/views/main/footer.jsp" />
</body>
<script>
$(function() {
	$(".noticeBtn").click(function () {
		history.back();
	});
	
	
});
function deleteTalentBoard() {
	if(confirm("삭제하시겠습니까?")){
		location.href="/deleteNotice?talentNo=${board.talentNo}"
	}else{
		return false;
	}
};
</script>
</html>