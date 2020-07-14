<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보수정</title>
<link href="/resources/adminMypage/css/bootstrap.min.css" rel="stylesheet">
<link href="/resources/adminMypage/css/font-awesome.min.css" rel="stylesheet">
<link href="/resources/adminMypage/css/datepicker3.css" rel="stylesheet">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script src="/resources/adminMypage/js/bootstrap.min.js"></script>
<style>
.content {
	width: 100%;
}
.content-main {
	width: 1200px;
	margin: 0 auto;
}
.content-main-left{
	width:25%;
	float:left;
	
}
.content-main-right{
	width:75%;
	float:right;
	margin-top:100px;
	
}
.userInfo{
	width:80%;
	height:230px;
	margin: 0 auto;
	margin-top:100px;
}
.menuWrap{
	margin-top : 30px;
	background-color : #EFEFEF;
}
.home, .modify, .inList, .bank{
	height :  60px;
	line-height : 60px;
	font-weight : bold;
}

.menuWrap a:hover{
	background-color : #0fbcff;
	color : #fff;
}
.moneyWrap{
	border : 1px solid red;
	height: 230px;
}
.menuWrap a{
	text-decoration : none;
	color : #0fbcff;
	display:block;
	padding-left:40px;
	width : 100%;
	height : 60px;
}

.title{
	margin-top : 30px;	
	border-bottom : 2px solid #E3E4E4;
}
.userInfoWrap{
	float:left; 
	width:600px;
	margin-top : 60px;
}
.textDiv{
	float:left;
	width: 100px;
	height:78px;
	line-height:78px;
	font-weight:bold;
}
.form-inline{
	height : 78px;
	line-height:78px;
	margin-left : 70px;
}
.form-control{
	width:300px;
}
.btnDiv{
	text-align:center;
}
#submitBtn{
	border : none;
	background-color: #0fbcff;
	color : #fff;
	padding : 6px;
	border-radius : 5px;
}
.modify>a{
	background-color : #0fbcff;
	color : white;
}
</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/main/header.jsp"/>
	
	<div class="content"  style="height:1000px;">
		<div class="content-main">
			<div class="content-main-left">
				<div class="userInfo">
					<img style="width:100%; height:100%;"src="/imgs/mypage/user1.png">
					<div class="menuWrap">
						<div class="home">
							<a href="/userMypage.don?reqPage=1&memberId=${sessionScope.member.memberId }">
							- My Home
							</a>
						</div>
						<div class="modify">
							<a href="/userModify.don">
							- 정보 수정
							</a>
						</div>
						<div class="inList">
							<a href="/userAttendList.don">
							- 참여 목록
							</a>
						</div>
						<div class="bank">
							<a href="/userBank.don">
							- 저금통
							</a>
						</div>
					</div>
				</div>
			</div>
			<form action="/userInfoModify.don" method="post">
			<div class="content-main-right">
				<div class="title">
					<h2 style="font-weight:bold;">회원정보 수정</h2>
				</div>
				<div class="userInfoWrap">
					<div class="form-inline"><div class="textDiv">아이디 : </div><input type="text" class="form-control" name="memberId" value="${sessionScope.member.memberId}" readonly></div>
					<div class="form-inline"><div class="textDiv">이름 : </div><input type="text" class="form-control" name="memberName" placeholder="한글 2~6글자" value="${sessionScope.member.memberName}">&nbsp;<span id="nameChk"></span></div>
					<div class="form-inline"><div class="textDiv">전화번호 : </div><input type="text" class="form-control" name="memberPhone" placeholder="-를 제외한 숫자 10~11자리" value="${sessionScope.member.memberPhone}">&nbsp;<span id="phoneChk"></span></div>
					<div class="form-inline">
						<div class="textDiv">이메일 : </div>
						<input type="hidden" name="memberEmail">
						<input type="text" id="email1" class="form-control" style="width:130px;" > @
						<input type="text" id="email2" class="form-control" style="width:130px;" value="naver.com" readonly>
						<select id="selectEmail" name="selectEmail" class="form-control" style="width:130px;">
            					<option value="write">직접입력</option> 
        	    				<option class="emailKind" value="naver.com">naver.com</option> 
           	 					<option class="emailKind" value="hanmail.net">hanmail.net</option> 
      	      					<option class="emailKind" value="hotmail.com">hotmail.com</option> 
      	      					<option class="emailKind" value="nate.com">nate.com</option> 
            					<option class="emailKind" value="yahoo.co.kr">yahoo.co.kr</option> 
            					<option class="emailKind" value="empas.com">empas.com</option> 
            					<option class="emailKind" value="dreamwiz.com">dreamwiz.com</option> 
            					<option class="emailKind" value="freechal.com">freechal.com</option> 
            					<option class="emailKind" value="lycos.co.kr">lycos.co.kr</option> 
            					<option class="emailKind" value="korea.com">korea.com</option> 
            					<option class="emailKind" value="gmail.com">gmail.com</option> 
            					<option class="emailKind" value="hanmir.com">hanmir.com</option> 
            					<option class="emailKind" value="paran.com">paran.com</option> 
            			</select>
					</div>
					<div class="form-inline"><div class="textDiv">추천인 : </div><input type="text" class="form-control" name="memberReferee" value="${sessionScope.member.memberReferee}" readonly></div>
					<div class="form-inline"><div class="textDiv">가입일 : </div><input type="text" class="form-control" name="memberEnrollDate" value="${sessionScope.member.memberEnrollDate}" readonly></div>
				</div>
				<div class="img" style="margin-left:50px;">
					<img src="/imgs/mypage/img1.PNG" style="margin-left:30px; margin-top :60px;">
				</div>
				<div class="btnDiv" style="margin-top :20px;">
					<button type="submit" id="submitBtn">수정하기</button>
				</div>
			</div>
			</form>
		</div>
	</div>
	<script>
		var submitChk = [false, false];
		var prevEmail = "${sessionScope.member.memberEmail}";
		
		var frontEmail = prevEmail.substring(0, prevEmail.indexOf("@"));
		var lastEmail = prevEmail.substring(prevEmail.indexOf("@")+1);
		$("#email1").val(frontEmail);
		$("#email2").val(lastEmail);
		
		$(".emailKind").each(function(index, item){
			if(lastEmail == $(item).val()){
				$(item).prop("selected",true);
				$("#email2").prop("readonly", true);
				return false;
			}else{
				$("#email2").prop("readonly", false);
			}
		});
		
		var nameExp = /^[가-힣]{2,4}$/;
		$("input[name=memberName]").focusout(function(){
			var val = $("input[name=memberName]").val(); 
			if(nameExp.test(val)){
				$("#nameChk").html("");
				$("#nameChk").css("color", "black");
				submitChk[0] = true;
			}else{
				$("#nameChk").html("잘못된입력");
				$("#nameChk").css("color", "red");
				submitChk[0] = false;
			}
		});
		
		var phoneExp = /^[0-9]{10,11}$/;
		$("input[name=memberPhone]").focusout(function(){
			var val = $("input[name=memberPhone]").val(); 
			if(phoneExp.test(val)){
				$("#phoneChk").html("");
				$("#phoneChk").css("color", "black");
				submitChk[1] = true;
			}else{
				$("#phoneChk").html("잘못된입력");
				$("#phoneChk").css("color", "red");
				submitChk[1] = false;
			}
		});
		
		$("#selectEmail").change(function(){
			if($("#selectEmail").val() == "write"){
				$("#email2").val("");
				$("#email2").prop("readonly", false);
			}else{
				$("#email2").val($("#selectEmail").val());
				$("#email2").prop("readonly", true);
			}
		});
		
		$("form").submit(function(){
			if(confirm("수정하시겠습니까?")){
				if($("#email2").val() == ""){
					alert("이메일을 정확히 입력하세요.");
					return false;
				}
				$("input[name=memberEmail]").val($("#email1").val() + "@" +$("#email2").val());
				
				var val1 = $("input[name=memberName]").val(); 
				if(nameExp.test(val1)){
					$("#nameChk").html("");
					$("#nameChk").css("color", "black");
					submitChk[0] = true;
				}else{
					$("#nameChk").html("잘못된입력");
					$("#nameChk").css("color", "red");
					submitChk[0] = false;
				}
				
				var val2 = $("input[name=memberPhone]").val(); 
				if(phoneExp.test(val2)){
					$("#phoneChk").html("");
					$("#phoneChk").css("color", "black");
					submitChk[1] = true;
				}else{
					$("#phoneChk").html("잘못된입력");
					$("#phoneChk").css("color", "red");
					submitChk[1] = false;
				}
				
				
				for(var i=0; i<submitChk.length; i++){
					if(submitChk[0] == false){
						alert("이름은 한글 2~6글자 입력 가능합니다.");
						$("input[name=memberName]").focus();
						return false;
					}
					if(submitChk[1] == false){
						alert("전화번호는 -를 제외한 숫자 10~11자리를 입력해주세요.");
						$("input[name=memberPhone]").focus();
						return false;
					}
				}
				
			}
		});
	</script>
	
</body>
</html>
