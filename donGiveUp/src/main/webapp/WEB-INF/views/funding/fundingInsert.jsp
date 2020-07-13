<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 부트스트림4 지원 메타 포트 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 부트스트림4 지원 메타 포트 종료-->
<!--    부트스트랩(다운)과 jQuery 불러오기-->
<script type="text/javascript"
	src="/resources/jongeun/bootstrap4/js/jquery-3.3.1.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>

<!-- 구글 content 폰트 -->
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap"
	rel="stylesheet">

<!--  폰트어썸 링크(부트4.3만 가능)-->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
	integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ"
	crossorigin="anonymous">
<!--    폰트어썸 종료-->
<!-- ck에디터 링크 -->
<script type="text/javascript" src="/resources/ckeditor4/ckeditor.js"></script>
<!--링크 종료  -->
<title>펀딩 등록하기</title>
</head>
<style>
body {
	font-family: 'Noto Sans KR', sans-serif;
}

a:hover {
	text-decoration: none;
	opacity: 0.7;
}

a {
	color: black;
}

.content {
	
}

.content_wrap {
	width: 1200px;
	margin: 0 auto;
}

.custom-control-input {
	width: 50px;
	height: 20px;
}

.custom-control-input:checked ~.custom-control-label::before {
	background-color: #0fbcff;
	border-color: #0fbcff;
}

.btn-primary {
	background-color: #0fbcff;
	border-color: #0fbcff;
}

.btn-primary:hover {
	opacity: 0.7;
	background-color: #0fbcff;
	border-color: #0fbcff;
}

.btn-primary:not (:disabled ):not (.disabled ).active:focus,
	.btn-primary:not (:disabled ):not (.disabled ):active:focus, .show>.btn-primary.dropdown-toggle:focus
	{
	background-color: #0fbcff;
	border-color: #0fbcff;
}

.fundingInsert {
	display: block;
}

.funding_form {
	width: 70%;
	margin: 0 auto;
	display: block;
}

.funding_form>h2 {
	font-size: 28px;
	text-align: center;
}

.dropdown-item {
	background-color: white;
}

.button_div {
	width: 330px;
	margin: 0 auto;
}

.fontLabel {
	font-size: 27px;
}
</style>
<script type="text/javascript">

	window.onload = function() {
		CKEDITOR.replace('ck_content', {
			height : 400

		});
		
		CKEDITOR.replace('ck_contentRd1', {
			height : 200

		});
		
	};
	function returnButton() {
		alert("지금 작성한 정보를 잃을수 있습니다. 돌아 가시겠습니까?");
		location.href("/");
	}
	
	//document.on 으로 이벤트를 걸면 바뀐시점에서의 내용을 읽어서 새롭게 생성된 것들도 이벤트를 연결 가능하다.
	$(document)
			.on('click',
					'.reward_more',
					function(event) {
				
						var count = $(event.target).val();
						count++;
						console.log(count);
						$(event.target).remove();
						html ="";				
						//자바스크립트 내에서 EL구문을 사용할수 있다. 흐름은 자바 -> jstl -> html -> 스크립트 순으로 진행된다.
						// 따로 변수를 두는 이유는  if문 안에 {}를 또 쓸수 없기 떄문
		
					
							html += "<div class=\"reward_wrap\">";
							html +=	"<input type=\"text\" name=\"rewardName\" placeholder=\"리워드 이름\" style=\"width:400px;\">";
							html += "<input type=\"text\" name=\"rewardName\" placeholder=\"리워드 수량\" style=\"width:200px;\">";
							html += "<input type=\"text\" name=\"rewardName\" placeholder=\"리워드 가격\">";
							html += "<textarea class=\"form-control\" id=\"ck_contentRd"+count+"\" class=\"ck_contentRd\" name=\"fundingContent\"></textarea>";
							html += "<button type=\"button\" class=\"reward_more\" value="+count+">더하기+</button></div>";
									
							
						$(".reward_div").append(html);
						
						
						CKEDITOR.replace('ck_contentRd'+count, {
							height : 200

						});
						

				});
					
</script>
<body>
	<jsp:include page="/WEB-INF/views/main/header.jsp" />
	<div class="content">
		<div class="content_wrap">

			<!-- <div class="dropdown col-lg-2">
					<button type="button" class="btn btn-primary dropdown-toggle"
						data-toggle="dropdown">펀딩 분류 선택</button>
					<input type="" class="dropdown-menu" name="fundingType">
						<option class="dropdown-item" value="0">공익 나눔
						<option class="dropdown-item" value="1">대안 상생 미디어 창작
				</div> -->

			<!-- <div class="input-group mb-3 input-group-sm">
			     <div class="input-group-prepend">
			       <span class="input-group-text">Small</span>
			    </div>
			    <input type="text" class="form-control">
			  </div>	 -->
			  <!--  <div class="input-group mb-3">
					    <div class="input-group-prepend">
					      <span class="input-group-text fontLabel">펀딩 주체 입력</span>
					    </div>
					    <input type="text" class="form-control" placeholder="First Name" name="fundingGroup">
					     
					  </div>-->
			<!-- 입력 예제 -->

			<form action="/fundingInsert.don" method="post"
				enctype="multipart/form-data" class="funding_form">
				<br><br><br>
				<h2>펀딩 글 등록</h2>
				<select
					class="btn btn-primary dropdown-toggle" data-toggle="dropdown"
					name="fundingClass" class="fundingClass">
						<option class="dropdown-item" value="0">펀딩 글 분류 선택하기
						<option class="dropdown-item" value="0">공익 나눔
						<option class="dropdown-item" value="1">대안 상생
						<option class="dropdown-item" value="2">미디어 창작
				</select> <br>
				
				<br>
				<div class="form-group">
					<label for="fundingTitle" class="fontLabel">펀딩 글 제목 </label> <input
						type="text" class="form-control" id="fundingTitle"
						name="fundingTitle" placeholder="제목을 입력하세요.">
				</div>
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text">펀딩 재단 이름</span>
					</div>
					<input type="text" class="form-control" name="fundingGroup"
						placeholder="재단 이름을 입력하세요.">
				</div>
				<div class="form-group">
					<label for="fundingGroupIntroduce" class="fontLabel">펀딩 재단
						소개</label> <input type="text" class="form-control"
						id="fundingGroupIntroduce" name="fundingGroupIntroduce"
						placeholder="간단한 설명을 입력하세요.">
				</div>
				<div class="form-group">
					<label for="subject" class="fontLabel">펀딩 제목</label> <input
						type="text" class="form-control" id="subject" name="fundingTitle"
						placeholder="펀딩 제목을 입력하세요.">
				</div>
				<div class="form-group">
					<input type="hidden" class="form-control" id="writer"
						name="fndingManager" value="${member.memberId }">
				</div>
				<div class="form-group">
					<label for=content " class="fontLabel">펀딩 내용</label>
					<textarea class="form-control" id="ck_content" class="ck_content"
						name="fundingContent"></textarea>
				</div>

				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text">펀딩 목표 금액</span>
					</div>
					<input type="text" class="form-control" name="fundingGoalPrice"
						placeholder="펀딩 목표 금액을 입력하세요.">
				</div>
				
				<hr>
				
				<div class="reward_div">
					<div class="reward_wrap">
						<input type="text" name="rewardName" placeholder="리워드 이름" style="width:400px;">
						<input type="text" name="rewardName" placeholder="리워드 수량" style="width:200px;">
						<input type="text" name="rewardName" placeholder="리워드 가격">
						<textarea class="form-control" id="ck_contentRd1" class="ck_contentRd"
						name="fundingContent"></textarea>
						<button type="button" class="reward_more" value="1">더하기+</button>
					</div>
				</div>
				<input type="hidden" name="fundingType" value="0">
				<div class="button_div">
					<button type="submit" class="btn btn-primary">작성하기</button>
					<button type="button" class="btn btn-primary">미리보기</button>
					<button type="button" class="btn btn-primary"
						onclick="returnButton();">돌아가기</button>
				</div>
			</form>
		</div>
	</div>
	
	<jsp:include page="/WEB-INF/views/main/footer.jsp" />
	
</body>
</html>