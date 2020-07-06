<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Don Give Up</title>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100&display=swap" rel="stylesheet">
<style>
	body{
		font-family: 'Noto Sans KR', sans-serif;
	}
	.content{
		height: 1000px;
		width: 100%;
		margin: 0 auto;
		background-image: url("/imgs/charities3.jpg");
		background-repeat: no-repeat;
		background-size: cover;
		background-position: 50%;
		opacity: 0.8;
		
	}
	
	.loginArea{
		width: 600px;
		height: 500px;
		background-color: white;
		border-radius: 15px;
	}
	
	.loginDiv>div{
		margin: 0 auto;
	}
	
	.loginText{
		padding-top : 100px;
		text-align: center;
	}
	
	.loginBtn{
		width: 440px; 
		height: 50px;
		background-color: #0fbcff;
		border: none;
		border-radius: 10px;
		color : white;
		font-size: 16px;
		cursor: pointer;
	}
	
	.loginBtn:hover {
		opacity: 0.8;
	}
	
	.findBtnArea{
		width: 100%;
		height: 60px;
		margin: 0 auto;
		text-align: center;
		padding-top: 10px;
		padding-bottom: 10px;
	}
	
	input{
		width: 100%;
		border: 2px solid #aaa;
		border-radius: 4px;
		
		outline: none;
		padding: 8px;
		box-sizing: border-box;
		transition : 0.3s;
	}
	
	input:focus{
		border-color: dodgerBlue;
		box-shadow: 0 0 8px 0 dodgerBlue;
	}
	
	.findA:nth-child(2){
		width: 210px;
		height: 50px;
		color: white;
		background-color: #646661;
		display: inline-block;
		text-decoration: none;
		font-weight: bold;
		border: 2px solid #646661;
		border-radius: 5px;
		text-align: center;
		line-height: 50px;
		font-size: 18px;
		margin-left: 84px;
	}
	
	.findA:nth-child(3){
		width: 210px;
		height: 50px;
		color: #646661;
		background-color: white;
		display: inline-block;
		text-decoration: none;
		font-weight: bold;
		border: 2px solid #646661;
		border-radius: 5px;
		text-align: center;
		line-height: 50px;
		font-size: 18px;
	}
	
	.findBtn1{
		width: 180px;
		height: 35px;
		background-color: #0fbcff;
		color: white;
		line-height: 35px;
		font-size: 20px;
		border: 1px solid #0fbcff;
		cursor: pointer;
	}
	
	.findBtn2{
		width: 180px;
		height: 35px;
		background-color:white; 
		color: #0fbcff;
		line-height: 35px;
		font-size: 20px;
		border: 1px solid #0fbcff;
		cursor: pointer;
	}
	
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.js"></script>
<script>
$(function () {
	$('#selectEmail').change(function(){
		$("#selectEmail option:selected").each(function () {
			if($(this).val()== '1'){ //직접입력일 경우 
				$("#str_email02").val(''); //값 초기화
				$("#str_email02").attr("disabled",false); //활성화 
			}else{ //직접입력이 아닐경우 
				$("#str_email02").val($(this).text()); //선택값 입력
				$("#str_email02").attr("disabled",true); //비활성화 
			} 
		}); 
	});
	
	$(".findBtn1").click(function () {
		$(".findIdMemberArea").show();
		$(".findIdCompanyArea").hide();
		$(".findBtn1").css("background-color","#0fbcff");
		$(".findBtn1").css("color","white");
		$(".findBtn2").css("background-color","white");
		$(".findBtn2").css("color","#0fbcff");
	});
	
	$(".findBtn2").click(function () {
		$(".findIdCompanyArea").show();
		$(".findIdMemberArea").hide();
		$(".findBtn1").css("background-color","white");
		$(".findBtn1").css("color","#0fbcff");
		$(".findBtn2").css("background-color","#0fbcff");
		$(".findBtn2").css("color","white");
	});
	
	$("#findIdMember").submit(function () {
		var str01 = $("#str_email01").val();
		var str02 = $("#str_email02").val();
		$("#memberEmail").val(str01+"@"+str02);
	});
	
});
</script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/main/header.jsp"/>
	<div class="content">
	<div class="loginDiv">
		<div class="loginText">
			<span style="font-size: 50px; color: white; font-weight: bold;">아이디 찾기</span>
		</div>
		<br><br>
		<div class="loginArea">
		<br>
		<a href="/member/findIdFrm.don" class="findA">아이디 찾기</a>
		<a href="/member/findPwFrm.don" class="findA">비밀번호 찾기</a>
			<div class="findBtnArea">
				<button type="button" class="findBtn1">개인</button>
				<button type="button" class="findBtn2">기관</button>
			</div>
			<div class="findIdMemberArea">
				<form action="/member/findIdMember.don" method="post" id="findIdMember">
					<table style="text-align: center; margin: 0 auto;">
						<tr>
							<th style="width: 80px; padding-left: 10px; height: 50px;">이름</th>
							<td style="width: 360px; height: 32px;"><input type="text" name="memberName" placeholder="가입시 입력한 이름을 입력하세요" style="width: 340px; height: 30px;" required></td>
						</tr>
						<tr>
							<th style="width: 80px; padding-left: 10px; height: 50px;">휴대폰 번호</th>
							<td style="width: 360px; height: 32px;"><input type="text" name="memberPhone" placeholder="가입시 입력한 번호를 입력하세요" style="width: 340px; height: 30px;" required></td>
						</tr>
						<tr>
							<th style="width: 80px; padding-left: 10px; height: 50px;">이메일</th>
							<td style="width: 360px; height: 32px;"> 
            				<input type="text" name="str_email01" id="str_email01" style="width:105px; height: 30px;" required> @ <input type="text" name="str_email02" id="str_email02" style="width:100px; height: 30px;" disabled value="naver.com"> 
            				<select style="width:110px; height: 34px; border-radius: 4px;" name="selectEmail" id="selectEmail">
            					<option value="1">직접입력</option> 
        	    				<option value="naver.com" selected>naver.com</option> 
           	 					<option value="hanmail.net">hanmail.net</option> 
      	      					<option value="hotmail.com">hotmail.com</option> 
      	      					<option value="nate.com">nate.com</option> 
            					<option value="yahoo.co.kr">yahoo.co.kr</option> 
            					<option value="empas.com">empas.com</option> 
            					<option value="dreamwiz.com">dreamwiz.com</option> 
            					<option value="freechal.com">freechal.com</option> 
            					<option value="lycos.co.kr">lycos.co.kr</option> 
            					<option value="korea.com">korea.com</option> 
            					<option value="gmail.com">gmail.com</option> 
            					<option value="hanmir.com">hanmir.com</option> 
            					<option value="paran.com">paran.com</option> 
            				</select>
            				<input type="hidden" name="memberEmail" id="memberEmail">
            				</td>
						</tr>
						<tr>
							<td colspan="2" style="height: 100px;"><button type="submit" class="loginBtn">아이디 찾기</button></td>
						</tr>
						
					</table>
				</form>
			</div>
			
			<div class="findIdCompanyArea" style="display: none;">
				<form action="/member/findIdCompany.don" method="post">
					<table style="text-align: center; margin: 0 auto;">
						<tr>
							<th style="width: 80px; padding-left: 10px; height: 50px;">담당자 이름</th>
							<td style="width: 360px; height: 32px;"><input type="text" name="memberName" placeholder="가입시 입력한 이름을 입력하세요" style="width: 340px; height: 30px;" required></td>
						</tr>
						<tr>
							<th style="width: 80px; padding-left: 10px; height: 50px;">휴대폰번호</th>
							<td style="width: 360px; height: 32px;"><input type="text" name="memberPhone" placeholder="가입시 입력한 번호를 입력하세요" style="width: 340px; height: 30px;" required></td>
						</tr>
						<tr>
							<th style="width: 80px; padding-left: 10px; height: 50px;">기관번호</th>
							<td style="width: 360px; height: 32px;"><input type="text" name="companyNumber" placeholder="가입시 입력한 번호를 입력하세요" style="width: 340px; height: 30px;" required></td>
						</tr>
						<tr>
							<td colspan="2" style="height: 100px;"><button type="submit" class="loginBtn">아이디찾기</button></td>
						</tr>
						
					</table>
				</form>
			</div>
		</div>
	</div>
	</div>
	<jsp:include page="/WEB-INF/views/main/footer.jsp"></jsp:include>
</body>
</html>