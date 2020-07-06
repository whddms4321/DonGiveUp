<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
		width: 242px;;
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
		margin-left: 84px;
	}
	
	.findA:nth-child(3){
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
	}
	
	.showIdArea{
		width: 500px;
		height: 250px;
		background-color: #d6ecfa;
		border-radius: 15px;
		text-align: center;
		margin: 0 auto;
		margin-top: 30px;
		padding-top: 20px;
	}
	.joinStep3Btn{
		text-decoration: none;
		color: white;
		background-color: #0fbcff;
		width: 200px;
		height: 50px;
		line-height: 50px;
		display: inline-block;
		border-radius: 10px;
		font-weight: bold;
		margin-right: 30px;
	}
	
	.joinStep3Btn:hover{
		opacity: 0.8;
		
	}
	
	.updateMemberTable{
		text-align: center;
		margin: 0 auto;
		width: 100%;
		height: 100%;
	}
	
	#errorPw{
		color: red;
		font-weight: bold;
		display: none;
	}
	
	#errorPwRe{
		color: red;
		font-weight: bold;
		display: none;
	}
	
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.js"></script>
<script>
	$(function () {
		var count = [false,false];
		$("#memberPw").focusout(function() {
			var regExp =/^.*(?=^.{8,20}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
			var pw = $("#memberPw").val();
			if(pw!=""){
				if(!regExp.test(pw)){
					$("#errorPw").css("display","inline-block");
					count[0]= false;
				}else{
					$("#errorPw").css("display","none");
					count[0]= true;
				}
				
				var pwVal = $("#memberPw").val();
				var pwReVal = $("#memberPwRe").val();
				if(pwReVal!=""){
					if(pwVal != pwReVal){
						$("#errorPwRe").css("display","inline-block");
					}else{
						$("#errorPwRe").css("display","none");
					}
				}
			}else{
				$("#errorPw").css("display","none");
			}
			
			
		});
		
		$("#memberPw").focusin(function () {
			$("#memberPwRe").val("");
		});
		
		$("#memberPwRe").focusout(function () {
			var pw = $("#memberPw").val();
			var pwRe = $("#memberPwRe").val();
			if(pwRe!="" && pw!=""){
				if(pw != pwRe){
					$("#errorPwRe").css("display","inline-block");
					count[1]= false;
				}else{
					$("#errorPwRe").css("display","none");
					count[1]= true;
				}
			}else{
				$("#errorPwRe").css("display","none");
				count[1]= false;
			}
			
		});
		
		$("#updateMemberPw").submit(function () {
			var bool = confirm("입력한 정보로 가입하시겠습니까?");
			if(bool){
				var num=0;
	            for(var i=0; i<count.length; i++){
	                if(count[i]==false){
	                    num++;
	                }
	            }

				if(num!=0){
					alert("조건에 맞게 작성해주세요.");
					return false;
				}else if(num==0){
					return true;
				}

			}else{
				return false;
			}
		});
	});
</script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/main/header.jsp"/>
	<div class="content">
	<div class="loginDiv">
		<div class="loginText">
			<span style="font-size: 50px; color: white; font-weight: bold;">비밀번호 찾기</span>
		</div>
		<br><br>
		<div class="loginArea">
		<br>
		<a href="/member/findIdFrm.don" class="findA">아이디 찾기</a>
		<a href="/member/findPwFrm.don" class="findA">비밀번호 찾기</a>
			<div class="showIdArea">
			<h2>비밀번호를 변경해주세요.</h2>
			<form action="/member/updateMemberPw.don" method="post" id="updateMemberPw">
				<table class="updateMemberTable">
					<tr>
						<th>새 비밀번호</th>
						<td><input type="password" name="memberPw" required placeholder="영문+숫자+특수문자조합 (8~20 문자)" id="memberPw"><input type="hidden" name="memberId" value="${member.memberId }"></td>
						<td style="width: 150px;"><span id="errorPw">잘못된 입력입니다.</span></td>
					</tr>
					<tr>
						<th>비밀번호 확인</th>
						<td><input type="password" name="memberPwRe" required placeholder="내용을 입력하세요." id="memberPwRe"></td>
						<td style="width: 150px;"><span id="errorPwRe">비밀번호가 다릅니다.</span></td>
					</tr>
					<tr>
						<td colspan="3"><button type="submit" style="width: 200px; height: 40px; background-color: #0fbcff; cursor: pointer; border: none; color: white; border-radius: 5px;">비밀번호 변경</button></td>
					</tr>
					
				</table>
			</form>
			</div>
			<br>
			<div style="text-align: center;margin: 0 auto;">
				<a href="/member/loginFrm.don" class="joinStep3Btn" style="margin-left: 20px;">로그인</a>
				<a href="/" class="joinStep3Btn">메인으로</a>
			</div>
		</div>
	</div>
	</div>
	<jsp:include page="/WEB-INF/views/main/footer.jsp"></jsp:include>
</body>
</html>