<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.js"></script>
<head>
<style>
.content {
	width: 1200px;
	margin: 0 auto;
	font-family: 'Noto Sans KR', sans-serif;
	margin-bottom: 100px;
}

.vworkwTitle {
	margin: 0 auto;
	margin-top: 10px;
	width: 80%;
	font-size: 37px;
	color: #3D3B3A;
	font-weight: bold;
	line-height: 100px;
	
}

.vworkwpage {
	width: 80%;
	border: 2px solid #e3f0f6;
	margin: 0 auto;
	margin-top: -15px;
}

.inputTable {
	width: 100%;
	margin: 0 auto;
	margin-top: 3px;
	margin-bottom: 3px;
}

form {
	width: 100%;
}

.vwwTable {
	border-collapse: separate;
	border-spacing: 10px;
	width: 100%;
}

.ipName {
	text-align: center;
	background-color: rgba(0, 0, 0, .2);
	color: #fff;
	font-weight: 600;
	font-size: 12.5px;
	width: 10%;
	height: 40px;
}

.ipFrame {
	width: 60%;
	height: 40px;
}

.ipFrame>input {
	box-sizing: border-box;
	width: 100%;
	height: 40px;
}

select {
	width: 100%;
	height: 40px;
	box-sizing: border-box;
	padding: 5px;
	border: 0.5px solid black;
	border-radius: 3px;
}



.ipJoindate {
	width: 90%;
	height: 40px;
}

.ipJoindate>input {
	width: 100%;
	height: 100%;
	box-sizing: border-box;
}

.ipIntro {
	width: 90%;
	height: 150px;
}

#vworkIntro {
	width: 100%;
	height: 100%;
	resize: none;
	box-sizing: border-box;
}

.ipImg>input {
	
	height: 100%;
	box-sizing: border-box;
}

.ipImg>span {
	width: 5%;
	height: 100%;
}

.ipImg button {
	width: 14.4%;
	height: 100%;
	background-color: rgba(94, 94, 94);
	border: 1px solid #fff;
	font-weight: 600;
	font-size: 14px;
	color: #fff;
}

.ipFiles {
	width: 90%;
	height: 60px;
}

.iconfile {
	color: #fff;
	font-size: 30px;
}

.ipFiles>input {
	width: 100%;
	height: 100%;
	box-sizing: border-box;
}

.ipButton {
	width: 100%;
	height: 50px;
}

.ipButton>button {
	height: 100%;
	border: none;
	background-color: #0fbcff;
	color: #fff;
	font-weight: 600;
	font-size: 20px;
}

.but1 {
	width: 47%;
	margin: 1%;
}


</style>
<meta charset="UTF-8">

<title>기부 글 등록신청</title>

<script src="/resources/dahyun/js/8bd2671777.js" crossorigin="anonymous"></script>
<script type="text/javascript" src="/resources/ckeditor/ckeditor.js"></script>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100&display=swap"
	rel="stylesheet">

<link href="/resources/css/donation/dist/css/datepicker.min.css" rel="stylesheet" type="text/css">
<script src="/resources/css/donation/dist/js/datepicker.min.js"></script>

<!-- Include English language -->
<script src="/resources/css/donation/dist/js/i18n/datepicker.en.js"></script>
</head>

<body>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<jsp:include page="/WEB-INF/views/main/header.jsp"></jsp:include>
	<div class="content">
		<div class="vworkwTitle">기부 글 등록신청</div>
		<div class="vworkwpage">
			<div class="inputTable">
				<form method="post" enctype="multipart/form-data">
					<table class="vwwTable">
						<tr>
							<td class="ipName">제목</td>
							<td class="ipFrame"><input id="vwork_title"
								name="donationTitle" type="text"></td>
							<td class="ipName">마감 날짜</td>
						</tr>
						<tr>
							<td class="ipName">작성자</td>
							<td class="ipFrame"><input name="donationWriter" id="vwork_writer" type="text" value="${sessionScope.member.memberId }" readonly>
							</td>
							<td rowspan="5" class="dpFrame">
								<div id="dpwrap">
									<input name="donationEndDate" class="datepicker-here" data-language='en' type="hidden">
								</div>
							</td>
						</tr>
						<tr>
							<td class="ipName">단체 이름</td>
							<td class="ipFrame"><input id="vwork_fee" type="text" value="${sessionScope.member.companyName }" readonly></td>
						</tr>
						<tr>
							<td class="ipName">봉사타입</td>
							<td class="ipFrame"><select class="vworkSelect"
								name="donationType">
									<option value="null">선택안함</option>
									<option value="아동">아동</option>
									<option value="어르신">어르신</option>
									<option value="장애인">장애인</option>
									<option value="다문화">다문화</option>
									<option value="여성">여성</option>
									<option value="동물">동물</option>
									<option value="환경">환경</option>
									<option value="기타">기타</option>
							</select></td>
						</tr>
						 <tr>
							<td class="ipName">목표 금액</td>
							<td class="ipFrame"><input id="vwork_fee" type="text"
								name="donationGoalMoney"></td>				
						</tr>
						 <tr>
							<td class="ipName">대표이미지</td>
							<td colspan="2" class="ipImg">
								<input type="file" name="file">
							</td>
						</tr>			
						<tr>
							<td colspan="3"><textarea class="form-control"
									id="p_content" name="donationContent"></textarea></td>
						</tr> 
						<tr> 
							<td colspan="3" class="ipButton">
													<button
													onclick="reviewInsert()"
													type="button">리뷰작성</button>
								<input type="submit" value="미리보기" onclick="javascript: form.action='/donationDetailFrm.don';"/>
    							<input type="submit" value="신청하기" onclick="javascript: form.action='/donationInsert.don';"/>

							</td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/main/footer.jsp"></jsp:include>
	<script type="text/javascript">
		CKEDITOR.replace('p_content', {
			height : 500
		});
		
		$(function(){
			$('.datepicker-here').datepicker({
			    language: 'en',
			});
		});
		
		function reviewInsert() {
			console.log("시작");
			var memberId = "3";
			/* var sellEndWriter = "${sessionScope.sellEnd.sellEndWriter}"; */
			var url = "/donationDetailFrm.don";
			var title = "donationDetailFrm";
			var status = "left=500px, top=100px, width=600px, height=550px, menubar=no, status=no, scrollbars=yes";
			var popup = window.open("", title, status);
			
			$(".reviewInsertFrm").attr("action", url);
			$(".reviewInsertFrm").attr("method", "post");
			$(".reviewInsertFrm").attr("target", title);//새로 열린 popup창과 form태그를 연결
			$(".reviewInsertFrm").submit();
		}
		
	</script>
</body>
</html>