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
	width: 72%;
	margin: 0 auto;
	display: block;
	border:0.5px solid gray;
	padding:20px;
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
.reward_wrap{
 font-size: 23px;
}

.reward_wrap>input{
margin:10px;
font-size: 17px;
}

.reward_wrap>h2{
	font-weight: 700px;
	
}
.reward_wrap>span{
   color:red;
   font-size: 20px;
}
.reward_more, .reward_less{
	background-color:gray;
	color:white;
	border:none;
	font-size: 17px;
	margin-bottom:13px;
	
}
</style>
<script type="text/javascript">

	
	window.onload = function() {
		//펀딩 내용, 리워드 1번 글 
		CKEDITOR.replace('ck_content', {
			height : 400

		});
		
		CKEDITOR.replace('ck_contentRd1', {
			height : 200

		});
		
	};
	function reviewFun(){
		var url = "/reviewFun.don";
		var title = "reviewFun";
		var status = "left=500px, top=100px, width=1200px, height=500px, menubar=no, status=no, scrollbars=yes";
		var popup = window.open("", title, status);
		$(".funding_form").attr("action", url);
		$(".funding_form").attr("method", "post");
		$(".funding_form").attr("target", title);//새로 열린 popup창과 form태그를 연결
		$(".funding_form").submit();
		
	}
	
	
	function returnButton() {
		if(confirm("지금 작성한 정보는 저장되지 않습니다. 신중히 선택해 주세요.")){
			location.href="/";
			
		}
	}
	
	/* 작성글 확인 스크립트 */
	function fundingsubmit(){
		 var check = [false,false,false,false,false,false];
			console.log($(".fundingClass").val());
			
			if($(".fundingClass").val() != ""){	
				check[0] = true;
				
				if($(".fundingGroup").val()!="" ){
					check[1] = true;
					
					if($(".fundingGroupIntroduce").val()!=""){
						check[2] = true;
					
						if($(".fundingTitle").val()!=""){
							check[3] = true;
						
							if($(".fundingContent").val()!=""){
								check[4] = true;
								console.log($(".fundingManager").val());
								if($(".fundingManager").val() ==""){
									
									alert("로그인후 이용해주세요.");
									location.href="/member/loginFrm.don";
									return false;
									
								}else {
									if($(".fundingGoalPrice").val()!=""){
										
										check[5] = true;
									}
									
								}
								
							}	
						}
					}
				}
			}
			console.log(check);
			for (var i = 0; i < check.length; i++) {
					if( check[i] == false){
						alert("빈칸을 채워주세요. 리스트 추가시 채우는것 필수");
						
						return false;
					}
			}
			
			/* var message = CKEDITOR.instances['ck_content'].getData();
			var list = $(message).find('img').attr("src");
			var list2 = $(message).find('img').next().attr("src");
			//var test = message.find('img').attr("src");
			
			console.log(list);
            console.log(list2); */
        
		
			/* 리워드 이미지 저장 용 펑션  */
			
	}
	//document.on 으로 이벤트를 걸면 바뀐시점에서의 내용을 읽어서 새롭게 생성된 것들도 이벤트를 연결 가능하다.
	$(document)
			.on('click',
					'.reward_more',
					function(event) {
				
						var count = $(event.target).val();
						console.log(count);
						if( count <= 6){
							count++;
							console.log(count);
							$(event.target).remove();
							html ="";				
							//자바스크립트 내에서 EL구문을 사용할수 있다. 흐름은 자바 -> jstl -> html -> 스크립트 순으로 진행된다.
							// 따로 변수를 두는 이유는  if문 안에 {}를 또 쓸수 없기 떄문
								
							html += "<div class=\"reward_wrap\">";
							html += "<h2>리워드 번호 :"+count+"번</h2>";
							html += "<span>※ 리워드는 최대 8개까지만 입력 가능합니다.</span><br>";
							html +=	"리워드 이름<input type=\"text\" name=\"rewardName\" placeholder=\"리워드 이름\" style=\"width:400px;\"><br>";
							html += "리워드 수량<input type=\"text\" name=\"rewardAmount\" placeholder=\"최대로 판매할 수량 입력\" style=\"width:200px;\">";
							html += "리워드 가격<input type=\"text\" name=\"rewardPrice\" placeholder=\"리워드 가격\"> 원<br>";
							html += "<span class='reward_span'>  ※  리워드당 이미지 하나만 입력 &nbsp;&nbsp;<button type='button' class='reward_more' value="+count+">리워드 추가하기+</button></span>";
							html += "&nbsp;&nbsp;<button type='button' class='reward_less' value="+count+">리워드 제거-</button><br>"
							html += "<textarea class=\"form-control\" id=\"ck_contentRd"+count+"\" class=\"ck_contentRd"+count+"\" name=\"fundingContent\"></textarea><br><hr><br></div>";
										 
								
							$(".reward_div").append(html);
							
							CKEDITOR.replace('ck_contentRd'+count, {
								height : 200

							});
							
						} else if( count == 7){
							count++;
							
							$(event.target).remove();
							html ="";				
							//자바스크립트 내에서 EL구문을 사용할수 있다. 흐름은 자바 -> jstl -> html -> 스크립트 순으로 진행된다.
							// 따로 변수를 두는 이유는  if문 안에 {}를 또 쓸수 없기 떄문
			
							
								html += "<div class=\"reward_wrap\">";
								html += "<h2>리워드 번호 :"+count+"번</h2>";
								html += "<span>※ 리워드는 최대 8개까지만 입력 가능합니다.</span><br>";
								html +=	"리워드 이름<input type=\"text\" name=\"rewardName\" placeholder=\"리워드 이름\" style=\"width:400px;\"><br>";
								html += "리워드 수량<input type=\"text\" name=\"rewardAmount\" placeholder=\"최대로 판매할 수량 입력\" style=\"width:200px;\">";
								html += "리워드 가격<input type=\"text\" name=\"rewardPrice\" placeholder=\"리워드 가격\"> 원<br>";
								html += "<span class='reward_span'>  ※  리워드당 이미지 하나만 입력</span>\"&nbsp;&nbsp;<button type=\"button\" class=\"reward_less\" value="+count+"\">리워드 제거-</button><br>";
								html += "<textarea class=\"form-control\" id=\"ck_contentRd"+count+"\" class='ck_contentRd"+count+"' name=\"fundingContent\"></textarea><br><hr><br></div>";
										
								
							$(".reward_div").append(html);
							
							CKEDITOR.replace('ck_contentRd'+count, {
								height : 200

							});
						}

				});
	
	$(document)
	.on('click',
			'.reward_less', function(event){
			var uncount = $(event.target).val();
			html ="";
			if( uncount > 1){
				html+= "&nbsp;&nbsp;<button type='button' class='reward_more' value='"+uncount+"'>리워드 추가하기+</button>";
				uncount-=2;
				console.log($(".reward_span").eq(uncount).html());
				console.log(html);
				$(".reward_span").eq(uncount).append(html);
				$(event.target).parent().remove();
				
			}
			
	});
					
</script>
<body>
	<jsp:include page="/WEB-INF/views/main/header.jsp" />
	<div class="content">
		<div class="content_wrap">

			<!-- 입력 예제 -->

			<form action="/fundingInsert.don" method="post"
				enctype="multipart/form-data" class="funding_form">
				<br><br><br>
				<h2>펀딩 글 등록</h2>
				<select
					class="btn btn-primary fundingClass"
					name="fundingClass">
						<option class="dropdown-item" value="">펀딩 글 분류 선택하기</option>
						<option class="dropdown-item" value="0">공익 나눔</option>
						<option class="dropdown-item" value="1">대안 상생</option>
						<option class="dropdown-item" value="2">미디어 창작</option>
				</select> <br>
				
				<br>
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
						<h2>리워드 번호 : 1번 </h2>
						<span>※ 리워드는 최대 8개까지만 입력 가능합니다.</span><br>
						리워드 이름 <input type="text" name="rewardName" placeholder="리워드 이름 입력" style="width:400px;"><br>
						리워드 수량 <input type="text" name="rewardAmount" placeholder="최대로 판매할 수량 입력" style="width:200px;">
						리워드 가격 <input type="text" name="rewardPrice" placeholder="리워드 가격 입력">원 <br>
						<span class="reward_span">  ※  리워드당 이미지 하나만 입력 &nbsp;&nbsp;
						<button type="button" class="reward_more" value="1">리워드 추가+</button></span> 
						<br>
						<textarea class="textarea" id="ck_contentRd1" class="ck_contentRd1"
						name="rewardContent"></textarea>
						<input type="hidden" name="rewardImgFilepath" value="${test}">
						<br><hr><br>
					</div>
				</div>
				<input type="hidden" name="fundingManager" value="${sessionScope.member.memberId }" class="fundingManager">
				<input type="hidden" name="fundingType" value="0">
				<div class="button_div">
					<button type="submit" class="btn btn-primary" onclick="return fundingsubmit();">작성하기</button>
					<!-- <button type="button" class="btn btn-primary" onclick="reviewFun();">미리보기</button> -->
					<button type="button" class="btn btn-primary"
						onclick="returnButton();">돌아가기</button>
						<br><br>
				</div>
			</form>
		</div>
	</div>
	
	<jsp:include page="/WEB-INF/views/main/footer.jsp" />
	
</body>
</html>