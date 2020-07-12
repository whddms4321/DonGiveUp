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

.listTab:nth-child(2) {
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

.deleteTalentListWrap {
	width: 95%;
	text-align: center;
	margin: 0 auto;
	height: 500px;
	background-color: rgba(102, 102, 102, 0.3);
	color: black;
	border-radius: 10px;
}

.deleteTable {
	width: 60%;
	height: 300px;
	background-color: white;
	color: black;
	border-radius: 10px;
	margin: 0 auto;
	margin-top: 50px;
}

#memberPw {
	width: 300px;
	height: 50px;
	border: 2px solid #aaa;
	border-radius: 4px;
	margin: 8px 0;
	outline: none;
	padding: 8px;
	box-sizing: border-box;
	transition: 0.3s;
}

#memberPw:focus {
	border-color: dodgerBlue;
	box-shadow: 0 0 8px 0 dodgerBlue;
}

.deleteTableBtn{
	width: 200px;
	height: 40px;
	background-color: #0fbcff;
	color: white;
	border: none;
	border-radius: 5px;
	font-size: 15px;
}

.deleteTableBtn:hover{
	cursor: pointer;
	opacity: 0.9;
}
</style>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script>
$(function () {
	$("#deleteTalentListForm").submit(function () {
		var bool = confirm("탈퇴하시겠습니까?");
		var memberPw = $("#memberPw").val();
		var memberId= $("#memberId").val();
		if(bool){
			$.ajax({
				url: "/member/selectMemberPw.don",
				data : {memberPw:memberPw},
				type : "get",
				success : function (data) {
					console.log(data);
					if(data == "1"){
						location.href="/talent/deleteTalentList.don?memberId="+memberId+"&talentNo="+"${talentNo }";
					}else{
						alert("회원정보가 일치하지 않습니다.");
					}
				}
			});			
		}
		return false;
	});
});
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
					<li class="listTab"><a href="/talentBoardDeleteFrm.don"
						style="margin-left: 40px;">탈퇴 신청</a></li>
				</ul>
			</div>
		</div>
		<div class="boardWrap">
			<h2 style="margin-left: 20px;">탈퇴신청</h2>
			<div class="deleteTalentListWrap">
				<br>
				<h1>탈퇴하시려면 현재 비밀번호를 입력하여 진행하시기 바랍니다.</h1>
				<form action="/talent/deleteTalentList.don" method="post" id="deleteTalentListForm">
					<table class="deleteTable">
						<tr>
							<th colspan="2" style="font-size: 30px; font-weight: bold;">비밀번호 입력</th>
						</tr>
						<tr>
							<td colspan="2"><input type="password" name="memberPw"
								required placeholder="현재 비밀번호를 입력하세요." id="memberPw">
								<input type="hidden" name="memberId" value="${sessionScope.member.memberId }" id="memberId">	
							</td>
						</tr>
						<tr>
							<td>
								<button type="reset" class="deleteTableBtn">취소</button>								
							</td>
							<td>
								<button type="submit" class="deleteTableBtn">확인</button>
							</td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
	<c:if test="${not empty sessionScope.member }">
		<jsp:include page="/WEB-INF/views/main/chat.jsp"></jsp:include>
	</c:if>
	<jsp:include page="/WEB-INF/views/main/footer.jsp" />
</body>
</html>