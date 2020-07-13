<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script type="text/javascript" src="/resources/ckeditor4/ckeditor.js"></script>
<style>
	.content{
		height: 1000px;
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
	
	.insertTalentTable{
		border: 2px solid #cdcdcd;
		width: 100%;
	}
	
	.insertTalentTable>tbody>tr>th {
		border-bottom: 2px solid #cdcdcd;
	}
	.insertTalentTable>tbody>tr>td {
		border-bottom: 2px solid #cdcdcd;
	}
	
	.btnClass{
		text-align : center;
		margin: 0 auto;
		width: 100%;
		height: 200px;
		padding-top: 50px;
	}
	
	.btnClass>button{
		width: 170px;
		height: 40px;
		background-color: #0fbcff;
		color: white;
		border: none;
		border-radius: 5px;
		font-size: 18px;
		margin-left: 20px;
		margin-right: 20px;
	}
	
	.btnClass>button:hover{
		opacity: 0.8;
		cursor: pointer;
	}
</style>
<script type="text/javascript">
$(function () {
	CKEDITOR.replace('p_content'
                , {height: 500,
                	enterMode:'2',
         			shiftEnterMode:'3'
	 
                 });
	CKEDITOR.config.resize_enabled = false;
	
	$("#talentCount").focusout(function() {
		var regExp = /^[\d]*$/;
		var talentCount = $("#talentCount").val();
		if(talentCount!=""){
			if(!regExp.test(talentCount)){
				alert("숫자만 입력가능합니다.");
				$("#talentCount").val("");
				$("#talentCount").focus();
			}
		}
	});
});
</script>
</head>
<body>
<jsp:include page="/WEB-INF/views/main/header.jsp"></jsp:include>
<div class="insertInfo">
<br>
		<h1>재능기부 글수정</h1>
		<h4>재능기부 등록을 통해 자신이 보유한 재능을 재능이 필요한 모두에게 선물하세요.</h4>
</div>
<div class="content">
	<h2>글수정</h2>
	<form action="/talent/updateTalent.don" method="post" enctype="multipart/form-data">
		<table class="insertTalentTable">
			<tr>
				<th>제목</th>
				<td>
					<input type="text" name="talentTitle" style="width: 1070px; height: 20px; margin-left: 10px;" required value="${talent.talentTitle }">
					<input type="hidden" name="talentWriter" value="${sessionScope.member.memberId }">
					<input type="hidden" name="talentNo" value="${talent.talentNo }">
				</td>
			</tr>
			<tr>
				<th>재능기부 소개</th>
				<td><textarea class="form-control" id="p_content" name="talentContent" style="resize: none;"  required >${talent.talentContent }</textarea></td>
			</tr>
			<tr>
				<th>카테고리</th>
				<td style="height: 30px; margin-left: 20px;">
					<input type="radio" name="talentPart" value="디자인" style="margin-left: 20px;" required>디자인
					<input type="radio" name="talentPart" value="프로그래밍" style="margin-left: 20px;" required>프로그래밍
					<input type="radio" name="talentPart" value="노하우" style="margin-left: 20px;" required>노하우
					<input type="radio" name="talentPart" value="생활" style="margin-left: 20px;" required>생활
					<input type="radio" name="talentPart" value="운동" style="margin-left: 20px;" required>운동
					<input type="radio" name="talentPart" value="번역" style="margin-left: 20px;" required>번역
					<input type="radio" name="talentPart" value="기타" style="margin-left: 20px;" required>기타
				</td>
			</tr>
			<tr>
				<th>참여자 인원</th>
				<td><input type="text" name="talentCount" style="width: 1070px; height: 20px; margin-left: 10px;" required placeholder="숫자만 입력하세요" id="talentCount" value="${talent.talentCount }"> 
			</tr>
		</table>
		<div class="btnClass">
			<button type="submit">수정</button>
			<button type="reset">취소</button>
		</div>
	</form>
</div>
<c:if test="${not empty sessionScope.member }">
	<jsp:include page="/WEB-INF/views/main/chat.jsp"></jsp:include>	
</c:if>
<jsp:include page="/WEB-INF/views/main/footer.jsp"/>
</body>
</html>