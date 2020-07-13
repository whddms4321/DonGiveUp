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
}

.insertInfo {
	width: 100%;
	height: 220px;
	background-color: #d6ecfa;
	font-family: 'Noto Sans KR', sans-serif;
	padding-left: 350px;
}

.talentDetailFrm {
	width: 1000px;
	height: 100%;
	margin: 0 auto;
	overflow: hidden;
	border: 1px solid #ededed;
}

.talentDetailPart1 {
	width: 50%;
	height: 500px;
	float: left;
}

.talentDetailPart1>img {
	width: 100%;
	height: 100%;
}

.talentDetailPart2 {
	width: 50%;
	height: 500px;
	float: left;
	background-color: #f3f5f7;
	color: black;
}

.talentContentArea {
	margin: 0 auto;
	width: 100%;
	height: 100%;
	text-align: center;
	margin-top: 550px;
	font-size: 18px;
}

.talentContentArea>img {
	width: 800px !important;
	
}

.noticeBtn {
	border: 1px solid #D4D4Cd;
	height: 40px;
	width: 300px;
	line-height: 40px;
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


</style>
<script>
$(function () {
	$(".noticeBtn").click(function () {
		history.back();
	});	
});

function talentJoin(talentNo) {
	var bool = confirm("신청하시겠습니까?");
	if(bool){
		if("${sessionScope.member.memberId }" == "${talent.talentWriter }"){
			alert("자신이 개최한 글입니다.");
			return false;
		}else{
			location.href="/talent/insertTalentList.don?talentNo="+talentNo+"&memberId=${sessionScope.member.memberId}&talentCount=${talent.talentCount }";
		}
			
	}else{
		return false;
	}
	
}

function deleteTalent(talentNo) {
	var bool = confirm("삭제하시겠습니까?");
	if(bool){
		location.href="/talent/deleteTalent.don?talentNo="+talentNo;
		
	}else{
		return false;
	}
}
</script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/main/header.jsp"></jsp:include>
	<div class="insertInfo">
		<br>
		<h1>재능기부 참가</h1>
		<h4>재능기부 참가를 통해 필요한 재능을 배우고 또 다른 사람들에게 희망을 전파해주세요.</h4>
	</div>
	<div class="content">
		<div>
			<h2>재능기부 참가 신청</h2>
			<h5>${talent.talentPart }> 재능기부 참가 신청</h5>
			<c:if test="${sessionScope.member.memberId == talent.talentWriter }">
				<div>
					<a href="javascript:void(0)"
						onclick="deleteTalent('${talent.talentNo }')"
						style="float: right; text-decoration: none; display: block; background-color: #0fbcff; border-radius: 5px; width: 70px; height: 35px; line-height: 35px; color: white; text-align: center; font-weight: bold; margin-right: 100px;">삭제</a>
					<a href="/talent/updateTalentFrm.don?talentNo=${talent.talentNo }"
						style="float: right; text-decoration: none; display: block; background-color: #0fbcff; border-radius: 5px; width: 70px; height: 35px; line-height: 35px; color: white; text-align: center; font-weight: bold; margin-right: 20px;">수정</a>
				</div>
			</c:if>
		</div>
		<div class="talentDetailFrm">
			<div class="talentDetailPart1">
				<img src="/resources/song/talent/thumbs/${talent.talentFilepath }">
			</div>
			<div class="talentDetailPart2">
				<div
					style="text-align: center; width: 100%; height: 100px; line-height: 100px; border-bottom: 1px solid #ededed;">
					<span
						style="float: left; font-weight: bold; font-size: 20px; color: black; margin-left: 50px;">제목</span><span
						style=" font-size: 20px; text-decoration: underline; color: #353866; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;display:inline-block;width:80%;">${talent.talentTitle }</span>
				</div>
				<div
					style="text-align: center; width: 100%; height: 100px; line-height: 100px; border-bottom: 1px solid #ededed;">
					<span
						style="float: left; font-weight: bold; font-size: 20px; color: black; margin-left: 50px;">작성자</span><span
						style="float: right; margin-right: 100px; font-size: 20px; text-decoration: underline; color: #353866;">${talent.talentWriter }</span>
				</div>
				<div
					style="text-align: center; width: 100%; height: 100px; line-height: 100px; border-bottom: 1px solid #ededed;">
					<span
						style="float: left; font-weight: bold; font-size: 20px; color: black; margin-left: 50px;">개설일</span><span
						style="float: right; margin-right: 100px; font-size: 20px; text-decoration: underline; color: #353866;">${talent.talentEnrollDate }</span>
				</div>
				<div
					style="text-align: center; width: 100%; height: 100px; line-height: 100px; border-bottom: 1px solid #ededed;">
					<span
						style="float: left; font-weight: bold; font-size: 20px; color: black; margin-left: 50px;">제한
						인원 / ${talent.talentCount } 명</span>
					<span
						style="float: right; margin-right: 100px; font-size: 20px; color: #353866; font-weight: bold;">현재인원 / ${count } 명</span>
				</div>
				<div
					style="text-align: center; width: 100%; height: 100px; line-height: 100px;">
					<button type="button" onclick="talentJoin('${talent.talentNo }')"
						style="width: 400px; height: 50px; background-color: #0fbcff; color: white; font-size: 25px; border: none; border-radius: 10px; cursor: pointer;">참가신청</button>
				</div>
			</div>
			<div class="talentContentArea">
				<h1 style="margin-bottom: 40px; font-size: 30px;">- 세부 소개 -</h1>
				${talent.talentContent } <br>
				<br>
				<button type="button" class="noticeBtn">목록보기</button>
				<br>
				<br>
				<br>
			</div>

		</div>
	</div>
	<c:if test="${not empty sessionScope.member }">
		<jsp:include page="/WEB-INF/views/main/chat.jsp"></jsp:include>
	</c:if>
	<jsp:include page="/WEB-INF/views/main/footer.jsp" />
</body>
</html>