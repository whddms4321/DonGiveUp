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
	height: 650px;
	width: 1200px;
	margin: 0 auto;
	font-family: 'Noto Sans KR', sans-serif;
}

.talentInfo {
	background-image: url("/resources/song/image/talentInfo1.jpg");
	background-repeat: no-repeat;
	background-size: cover;
	opacity: 0.9;
	width: 100%;
	height: 320px;
}

.contentHeadPart {
	width: 1200px;
	height: 80px;
}

.contentHeadPart>* {
	margin: 0 auto;
}

.contentHeadPart>ul {
	list-style: none;
}

.contentHeadPart>ul>li {
	width: 135px;
	height: 40px;
	font-weight: bold;
	float: left;
	margin-right: 5px;
}

.contentHeadPart>ul>li>a {
	text-decoration: none;
	color: gray;
	font-size: 17px;
	display: block;
	border: 1px solid #cdcdcd;
	line-height: 40px;
	text-align: center;
}

.contentHeadColor:active {
	border: 1px solid #0fbcff;
	color: #0fbcff;
}

.talentPageNavi {
	width: 1200px;
	text-align: center;
	height: 50px;
	margin: 0 auto;
	margin-top: 70px;
	height: 200px;
}

.talentPageNavi>* {
	margin: 20px;
}

.talentPageNavi>.talentBtn {
	width: 30px;
	height: 30px;
	border: 0.5px solid grey;
	display: inline-block;
	line-height: 30px;
}

.talentPageNavi>.talentPrevBtn {
	width: 50px;
	height: 30px;
	border: 0.5px solid red;
	display: inline-block;
	line-height: 30px;
	background-color: red;
	color: ghostwhite;
	font-weight: bold;
}

.talentPageNavi>.talentNextBtn {
	width: 50px;
	height: 30px;
	border: 0.5px solid red;
	display: inline-block;
	line-height: 30px;
	background-color: red;
	color: ghostwhite;
	font-weight: bold;
}

.talentPageNavi>.selectTalentPage {
	width: 30px;
	height: 30px;
	border: 1px solid #494949;
	display: inline-block;
	line-height: 30px;
	background-color: #494949;
	color: ghostwhite;
	font-weight: bold;
}

.talentListPart {
	float: left;
	width: 395px;
	height : 100%;
	margin-top: 60px;
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

.talentListPart:hover{
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

.noticeDetailSpan1 {
	color: #BDCCD9;
	font-weight: bold;
	font-style: italic;
	margin-right: 10px;
	margin-left: 30px;
	font-size: 14px;
}

.noticeDetailSpan2 {
	color: red;
	font-weight: bold;
	margin-right: 10px;
	margin-left: 30px;
}
</style>
<script>
	$(function () {
		$(".contentHeadColor").click(function () {
			$(this).css({border:"1px solid #0fbcff",color:"#0fbcff"});
		});
	});
	
	function talentList(talentNo) {
		location.href="/talent/talentDetail.don?talentNo="+talentNo;
	}
</script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/main/header.jsp"></jsp:include>
	<div class="talentInfo"></div>

	<div class="content">
		<h2 style="color: #3d3b3a;">지금 모집 중 활동</h2>

		<div class="contentHeadPart">
			<ul>
				<li><a href="/talent/talentFrm.don?reqPage=1&type=전체" class="contentHeadColor">#전체</a></li>
				<li><a href="/talent/talentFrm.don?reqPage=1&type=디자인" class="contentHeadColor">#디자인</a></li>
				<li><a href="/talent/talentFrm.don?reqPage=1&type=프로그래밍" class="contentHeadColor">#프로그래밍</a></li>
				<li><a href="/talent/talentFrm.don?reqPage=1&type=노하우" class="contentHeadColor">#노하우</a></li>
				<li><a href="/talent/talentFrm.don?reqPage=1&type=생활" class="contentHeadColor">#생활</a></li>
				<li><a href="/talent/talentFrm.don?reqPage=1&type=운동" class="contentHeadColor">#운동</a></li>
				<li><a href="/talent/talentFrm.don?reqPage=1&type=번역" class="contentHeadColor">#번역</a></li>
				<li><a href="/talent/talentFrm.don?reqPage=1&type=기타" class="contentHeadColor">#기타</a></li>

			</ul>
			<br> <br> <br> 
			<c:if test="${not empty sessionScope.member.memberId }">
			
			
			<a href="/talent/insertTalentFrm.don"
				style="float: right; text-decoration: none; display: block; background-color: #0fbcff; border-radius: 5px; width: 70px; height: 35px; line-height: 35px; color: white; text-align: center; font-weight: bold; margin-right: 40px;">글등록</a>
				<a href="/talent/talentListMyList.don?memberId=${sessionScope.member.memberId }" style="float: right; text-decoration: none; display: block; background-color:#0fbcff; border-radius: 5px; width: 150px; height: 35px; line-height: 35px; color: white; text-align: center; font-weight: bold; margin-right: 20px;">재능기부 참여목록</a>
				<a href="/talent/talentListOpen.don?memberId=${sessionScope.member.memberId }" style="float: right; text-decoration: none; display: block; background-color:#0fbcff; border-radius: 5px; width: 150px; height: 35px; line-height: 35px; color: white; text-align: center; font-weight: bold; margin-right: 20px;">재능기부 개설 목록</a>
			</c:if>
		
		</div>
		<div style="margin-top: 25px; width: 1200px;">
			<div style="width: 1200px; height: 100%;">
			<c:if test="${not empty list }">
				<c:forEach items="${list }" var="list">
					<div class="talentListPart" style="position: relative;" onclick="talentList('${list.talentNo }')">
						<div class="talentImage">
							<img src="/resources/song/talent/thumbs/${list.talentFilepath }"
								style="width: 100%; height: 100%;">
						</div>
						<div class="talentWriter"><span class="noticeDetailSpan1">작성자</span><span style="margin-right: 20px;"> ${list.talentWriter }</span></div>
						<div class="talentTitle">${list.talentTitle }</div>
						<div class="talentCount"><span class="noticeDetailSpan2">제한인원</span>  ${list.talentCount } 명</div>
					</div>

				</c:forEach>			
			</c:if>
			<c:if test="${empty list }">
				<div style="text-align: center; margin-top: 100px;">
				<img src="/resources/song/image/경고.png">
					<h1>해당 카테고리에 등록된 글이 없습니다.</h1>
				</div>
			</c:if>
			</div>
		</div>
	</div>
	<div class="talentPageNavi">${pageNavi}</div>
	<c:if test="${not empty sessionScope.member }">
		<jsp:include page="/WEB-INF/views/main/chat.jsp"></jsp:include>

	</c:if>
	<jsp:include page="/WEB-INF/views/main/footer.jsp" />
</body>
</html>