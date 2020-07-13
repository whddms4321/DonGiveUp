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
		<h1>재능기부 게시판 글등록</h1>
		<h4>재능기부 게시판 등록을 통해 참여인원에 대해 정보 공유를 해주세요.</h4>
</div>
<div class="content">
	<h2>글등록</h2>
	<form action="/talent/insertTalentBoard.don" method="post" enctype="multipart/form-data">
		<table class="insertTalentTable">
			<tr>
				<th>제목</th>
				<td>
					<input type="text" name="talentBoardTitle" style="width: 1070px; height: 20px; margin-left: 10px;" required>
					<input type="hidden" name="talentBoardWriter" value="${sessionScope.member.memberId }">
					<input type="hidden" name="talentNo" value="${talentNo }">
				</td>
			</tr>
			<tr>
				<th>게시판 내용</th>
				<td><textarea class="form-control" id="p_content" name="talentBoardContent" style="resize: none;"  required></textarea></td>
			</tr>
		</table>
		<div class="btnClass">
			<button type="submit">등록</button>
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