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
		height: 1400px;
		width: 100%;
		margin: 0 auto;
		background-image: url("/imgs/charities3.jpg");
		background-repeat: no-repeat;
		background-size: cover;
		background-position: 50%;
		opacity: 0.8;
		
	}
	
	.joinArea{
		width: 800px;
		height: 100%;
		background-color: white;
		border-radius: 15px;
		box-sizing: border-box;
		padding-bottom: 50px;
	}
	
	.joinDiv>div{
		margin: 0 auto;
	}
	
	.joinText{
		padding-top : 100px;
		text-align: center;
	}
	
	.joinNextBtn{
		width: 220px; 
		height: 50px;
		background-color: #0fbcff;
		border: none;
		border-radius: 10px;
		color : black;
		font-size: 16px;
	}
	
	.joinNextBtn:hover {
		opacity: 0.8;
		font-weight: bold;
	}
	
	.joinStep{
		width : 615px;
		margin: 0 auto;
	}
	
	.joinStepBox{
		width: 200px;
		height: 100px;
		line-height: 100px;
		display: inline-block;
		text-align: center;
		background-color: white;
		padding: 0;
		margin-top: 20px;
		margin-bottom: -50px;
		border-radius: 15px;
		font-size: 18px;
		font-weight: bold;
		
	}
	
	.joinStepBox:nth-child(2){
		background-color: #0fbcff;
	}
	
	.personTable>tbody>tr>td>input{
		width: 245px;
	}
	
	.companyTable>tbody>tr>td>input{
		width: 245px;
	}
	
	.personTable{
		margin: 0 auto;
	}
	
	.companyTable{
		margin: 0 auto;
	}
	
	
	
	#joinPersonBtn{
		margin-left : 85px;
		width: 300px;
		height: 300px;
		margin-right: 20px;
		margin-bottom: 20px;
	}
	
	#joinPersonBtn:hover{
		cursor: pointer;
	}
	
	#joinCompanyBtn:hover{
		cursor: pointer;
	}
	
	#joinCompanyBtn{
		width: 300px;
		height: 300px;
	}
	
	.joinPersonWrap{
		padding-top:30px;
		margin: 0 auto;
		border: 1px solid gray;
		border-radius: 5px;
		width: 650px;
		
	}
	
	.joinCompanyWrap{
		padding-top:30px;
		margin: 0 auto;
		border: 1px solid gray;
		border-radius: 5px;
		width: 650px;
		
	}
	
	.personTable>tbody>tr>td>span{
		display: none;
		color : red;
		font-weight: bold;
	}
	
	.companyTable>tbody>tr>td>span{
		display: none;
		color : red;
		font-weight: bold;
	}
	
	input{
		width: 100%;
		border: 2px solid #aaa;
		border-radius: 4px;
		margin: 8px 0;
		outline: none;
		padding: 8px;
		box-sizing: border-box;
		transition : 0.3s;
	}
	
	input:focus{
		border-color: dodgerBlue;
		box-shadow: 0 0 8px 0 dodgerBlue;
	}
	
	textarea{
		width: 100%;
		border: 2px solid #aaa;
		border-radius: 4px;
		margin: 8px 0;
		outline: none;
		padding: 8px;
		box-sizing: border-box;
		transition : 0.3s;
	}
	
	textarea:focus{
		border-color: dodgerBlue;
		box-shadow: 0 0 8px 0 dodgerBlue;
	}
	
	.joinOtherBtn{
		width: 120px;
		height: 35px;
		color: black;
		border-radius: 5px;
		background-color: #0fbcff;
		border: none;
	}
	
	.joinOtherBtn:hover{
		opacity: 0.9;
		font-weight: bold;
		cursor: pointer;
	}
	
	.joinPersonWrap{
		display: none;
	}
	
	.joinCompanyWrap{
		display: none;
	}
</style>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.js"></script>
<script>

$(function () {
	var count = [false,false,false,false,false];
	var checkCount = 0;
	var requiredId = 0;
	var stateM = 1;
	var stateC = 1;
	var company = [false,false,false,false,false,false];
	
	$("#joinPersonBtn").click(function () {
		$(".joinPersonWrap").show();
		$(".joinCompanyWrap").hide();
		stateM = 1;
	});
	
	$("#joinCompanyBtn").click(function () {
		$(".joinPersonWrap").hide();
		$(".joinCompanyWrap").show();
		stateC = 1;
	});
	
	if(stateM==1){
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
		
		$("#memberId").focusout(function() {
			var regExp = /^[a-z0-9A-Z]{6,16}$/;
			var id = $("#memberId").val();
			console.log("1");
			if(id!=""){
				if(!regExp.test(id)){
					$("#errorId").css("display","inline-block");
					checkCount = 0;
					count[0]= false;
				}else{
					$("#errorId").css("display","none");
					checkCount = 1;
					count[0]= false;
				}
			}else{
				$("#errorId").css("display","none");
				count[0]= false;
			}
		});
		
		$("#memberIdCheck").click(function () {
			if(checkCount==1){
				var memberId = $("#memberId").val();
				$.ajax({
		            url:"/member/checkId.don",
		            type:"get",
		            data:{memberId:memberId},
		            success:function(data){
		                if(data==1){
		                	$("#errorCheckId").css("display","inline-block");
		                	$("#successCheckId").css("display","none");
		                  	$("#memberId").focus();
		                  	count[0]= false;
		                	
		                }else{
		                	$("#successCheckId").css("display","inline-block");
		                	$("#errorCheckId").css("display","none");
		                	$("#memberId").attr("readonly","true");
		                	requiredId = 1;
		                	count[0]= true;
		                }
		            }
		        });
			}else{
				$("#errorCheckId").css("display","none");
				$("#successCheckId").css("display","none");
			}
			
		});
		
		$("#memberPw").focusout(function() {
			var regExp =/^.*(?=^.{8,20}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
			var pw = $("#memberPw").val();
			if(pw!=""){
				if(!regExp.test(pw)){
					$("#errorPw").css("display","inline-block");
					count[1]= false;
				}else{
					$("#errorPw").css("display","none");
					count[1]= true;
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
		
		$("#memberPwRe").focusout(function () {
			var pw = $("#memberPw").val();
			var pwRe = $("#memberPwRe").val();
			if(pwRe!="" && pw!=""){
				if(pw != pwRe){
					$("#errorPwRe").css("display","inline-block");
					count[2]= false;
				}else{
					$("#errorPwRe").css("display","none");
					count[2]= true;
				}
			}else{
				$("#errorPwRe").css("display","none");
				count[2]= false;
			}
			
		});
		
		$("#memberName").focusout(function() {
			var regExp = /^[가-힣]{2,4}$/;
			var name = $("#memberName").val();
			if(name!=""){
				if(!regExp.test(name)){
					$("#errorName").css("display","inline-block");
					count[3]= false;
				}else{
					$("#errorName").css("display","none");
					count[3]= true;
				}
			}else{
				$("#errorName").css("display","none");
				count[3]= false;
			}
		});
		
		$("#memberPhone").focusout(function() {
			var regExp = /^[0-9]{10,11}$/;
			var phone = $("#memberPhone").val();
			if(phone!=""){
				if(!regExp.test(phone)){
					$("#errorPhone").css("display","inline-block");
					count[4]= false;
				}else{
					$("#errorPhone").css("display","none");
					count[4]= true;
				}
			}else{
				$("#errorPhone").css("display","none");
				count[4]= false;
			}
		});
		
		$("#addrSearchBtn").click(function () {
			new daum.Postcode({
	            oncomplete:function(data){
	                $("#memberAddr1").val(data.roadAddress);
	            }
	        }).open();
		});
	    
		$("#joinForm1").submit(function () {
			var str01 = $("#str_email01").val();
			var str02 = $("#str_email02").val();
			$("#memberEmail").val(str01+"@"+str02);
			var addr1 = $("#memberAddr1").val();
			var addr2 = $("#memberAddr2").val();
			$("#memberAddr").val(addr1+" "+addr2);
			console.log($("#memberEmail").val());
			console.log($("#memberAddr").val());
			var bool = confirm("입력한 정보로 가입하시겠습니까?");
			if(requiredId==0){
				alert("아이디 중복확인을 해주세요.");
				return false;
			}
			if(requiredId==1){
				
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
				
				
			}
			
		});
		
	}
	
	if(stateC==1){
		$("#memberId1").focusout(function() {
			var regExp = /^[a-z0-9A-Z]{6,16}$/;
			var id = $("#memberId1").val();
			if(id!=""){
				if(!regExp.test(id)){
					$("#errorId1").css("display","inline-block");
					checkCount = 0;
					company[0]= false;
				}else{
					$("#errorId1").css("display","none");
					checkCount = 1;
					company[0]= false;
				}
			}else{
				$("#errorId1").css("display","none");
				company[0]= false;
			}
			
		});
		
		$("#memberIdCheck1").click(function () {
			if(checkCount==1){
				var memberId = $("#memberId1").val();
				$.ajax({
		            url:"/member/checkId.don",
		            type:"get",
		            data:{memberId:memberId},
		            success:function(data){
		                if(data==1){
		                	$("#errorCheckId1").css("display","inline-block");
		                	$("#successCheckId1").css("display","none");
		                  	$("#memberId1").focus();
		                  	company[0]= false;
		                	
		                }else{
		                	$("#successCheckId1").css("display","inline-block");
		                	$("#errorCheckId1").css("display","none");
		                	$("#memberId").attr("readonly","true");
		                	requiredId = 1;
		                	company[0]= true;
		                }
		            }
		        });
			}else{
				$("#errorCheckId1").css("display","none");
				$("#successCheckId1").css("display","none");
			}
			
		});
		
		$("#memberPw1").focusout(function() {
			var regExp =/^.*(?=^.{8,20}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
			var pw = $("#memberPw1").val();
			if(pw!=""){
				if(!regExp.test(pw)){
					$("#errorPw1").css("display","inline-block");
					company[1]= false;
				}else{
					$("#errorPw1").css("display","none");
					company[1]= true;
				}
				
				var pwVal = $("#memberPw1").val();
				var pwReVal = $("#memberPwRe1").val();
				if(pwReVal!=""){
					if(pwVal != pwReVal){
						$("#errorPwRe1").css("display","inline-block");
					}else{
						$("#errorPwRe1").css("display","none");
					}
				}
			}else{
				$("#errorPw1").css("display","none");
			}
			
			
		});
		
		$("#memberPwRe1").focusout(function () {
			var pw = $("#memberPw1").val();
			var pwRe = $("#memberPwRe1").val();
			if(pwRe!="" && pw!=""){
				if(pw != pwRe){
					$("#errorPwRe1").css("display","inline-block");
					company[2]= false;
				}else{
					$("#errorPwRe1").css("display","none");
					company[2]= true;
				}
			}else{
				$("#errorPwRe1").css("display","none");
				company[2]= false;
			}
			
		});
		
		$("#memberName1").focusout(function() {
			var regExp = /^[가-힣]{2,4}$/;
			var name = $("#memberName1").val();
			if(name!=""){
				if(!regExp.test(name)){
					$("#errorName1").css("display","inline-block");
					company[3]= false;
				}else{
					$("#errorName1").css("display","none");
					company[3]= true;
				}
			}else{
				$("#errorName1").css("display","none");
				company[3]= false;
			}
		});
		
		$("#memberPhone1").focusout(function() {
			var regExp = /^[0-9]{10,11}$/;
			var phone = $("#memberPhone1").val();
			if(phone!=""){
				if(!regExp.test(phone)){
					$("#errorPhone1").css("display","inline-block");
					company[4]= false;
				}else{
					$("#errorPhone1").css("display","none");
					company[4]= true;
				}
			}else{
				$("#errorPhone1").css("display","none");
				company[4]= false;
			}
		});
		
		$("#companyNumber").focusout(function() {
			var regExp = /^[0-9]{10}$/;
			var companyNumber = $("#companyNumber").val();
			if(companyNumber!=""){
				if(!regExp.test(companyNumber)){
					$("#errorCompanyNumber").css("display","inline-block");
					company[5]= false;
				}else{
					$("#errorCompanyNumber").css("display","none");
					company[5]= true;
				}
			}else{
				$("#errorCompanyNumber").css("display","none");
				company[5]= false;
			}
		});
		
		
		$("#joinForm2").submit(function () {
			var bool = confirm("입력한 정보로 가입하시겠습니까?");
			if(requiredId==0){
				alert("아이디 중복확인을 해주세요.");
				return false;
			}
			if(requiredId==1){
				
				if(bool){
					var num=0;
		            for(var i=0; i<company.length; i++){
		                if(company[i]==false){
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
				
				
			}
			
		});
	}
	

	 
    
	/* $("#joinPersonBtn").click(function () {
		$(".joinPersonWrap").css("display","block");
		$(".joinCompanyWrap").css("display","none");
	});
	
	$("#joinCompanyBtn").click(function () {
		$(".joinPersonWrap").css("display","none");
		$(".joinCompanyWrap").css("display","block");
	}); */
});

</script>

</head>
<script type="text/javascript">
window.history.forward();
function noBack(){window.history.forward();}
</script>
<body onload="noBack();" onpageshow="if(event.persisted) noBack();" onunload="">
	<jsp:include page="/WEB-INF/views/main/header.jsp"/>
	<div class="content">
	<div class="joinDiv">
		<div class="joinText">
			<span style="font-size: 50px; color: white; font-weight: bold;">회원가입</span>
		</div>
		<div class="joinStep">
			<p class="joinStepBox">Step 1 . 이용약관</p>
			<p class="joinStepBox">Step 2 . 정보입력</p>
			<p class="joinStepBox">Step 3 . 회원가입 완료</p>
		</div>
		<br><br>
		<div class="joinArea">
		<br><br>
        <button type="button" id="joinPersonBtn">개인</button>
        <button type="button" id="joinCompanyBtn">기관</button>
            <div class="joinPersonWrap">
            	<form action="/member/insertMember.don" method="post" id="joinForm1">
            		<table class="personTable">
            			<tr>
            				<td style="width: 100px;">*아이디</td>
            				<td style="width: 250px;"><input type="text" placeholder="영문 및 숫자 (6~16 문자)" name="memberId" id="memberId" required></td>
            				<td style="width: 100px;"><button type="button" style="width: 100px;" id="memberIdCheck" class="joinOtherBtn">중복확인</button></td>
            				<td style="width: 150px;"><span id="errorId">잘못된 입력입니다.</span><span id="errorCheckId">아이디가 중복됩니다.</span><span id="successCheckId" style="color:blue;">사용가능합니다.</span></td>
            				
            			</tr>
            			<tr>
            				<td style="width: 100px;">*비밀번호</td>
            				<td><input type="password" placeholder="영문+숫자+특수문자조합 (8~20 문자)" name="memberPw" id="memberPw" required></td>
            				<td style="width: 100px;"></td>
            				<td colspan="2"><span id="errorPw">잘못된 입력입니다.</span></td>
            			</tr>
            			<tr>
            				<td style="width: 100px;">*비밀번호 확인</td>
            				<td><input type="password" placeholder="내용을 입력하세요." id="memberPwRe" required></td>
            				<td style="width: 100px;"></td>
            				<td colspan="2"><span id="errorPwRe">비밀번호가 다릅니다.</span></td>
            			</tr>
            			<tr>
            				<td>*이름</td>
            				<td><input type="text" placeholder="한글만 입력해주세요.(2~6 글자)" name="memberName" id="memberName" required></td>
            				<td style="width: 100px;"></td>
            				<td><span id="errorName">잘못된 입력입니다.</span></td>
            			</tr>
            			<tr>
            				<td>*휴대폰번호</td>
            				<td><input type="text" placeholder="-제외 번호 입력(10~11자리의 숫자)" name="memberPhone" id="memberPhone" required></td>
            				<td style="width: 100px;"></td>
            				<td><span id="errorPhone">잘못된 입력입니다.</span></td>
            			</tr>
            			<tr>
            				<td>*이메일</td>
            				<td colspan="3">
            				<input type="text" name="str_email01" id="str_email01" style="width:150px" required> @ <input type="text" name="str_email02" id="str_email02" style="width:150px;" disabled value="naver.com"> 
            				<select style="width:110px;margin-right:10px; height: 34px; border-radius: 4px;" name="selectEmail" id="selectEmail">
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
            			</tr>
            			<tr>
            				<td>*주소</td>
            				<td><input type="text" id="memberAddr1" readonly required style=" background-color:  #dddfe6; cursor: not-allowed;"></td>
            				<td><button type="button" style="width: 100px;" id="addrSearchBtn" class="joinOtherBtn">주소검색</button></td>
            			</tr>
            			<tr>
            				<td>*상세주소</td>
            				<td><input type="text" name="memberAddr2" id="memberAddr2" required><input type="hidden" name="memberAddr" id="memberAddr"></td>
            			</tr>
            			<tr>
            				<td>추천인 입력</td>
            				<td><input type="text" placeholder="추천인 아이디를 입력하세요.(선택)" name="memberReferee"></td>
            				<td colspan="2">( 입력시 돈토리 10개가 지급됩니다. )</td>
            			</tr>
            		</table>
            		<div style="text-align: center;">
            		<br><br>
            			<button type="reset" style=" background-color: #dddfe6;" class="joinNextBtn">취소</button>
            			<button type="submit" class="joinNextBtn">등록</button>
            		<br><br>
            		</div>
            		</form>
            	</div>
            	
            	<div class="joinCompanyWrap">
            	<form action="/member/insertCompany.don" method="post" id="joinForm2">
            		<table class="companyTable">
            			<tr>
            				<td style="width: 100px;">*아이디</td>
            				<td style="width: 250px;"><input type="text" placeholder="영문 및 숫자 (6~16 문자)" name="memberId" id="memberId1" required></td>
            				<td style="width: 100px;"><button type="button" style="width: 100px;" id="memberIdCheck1" class="joinOtherBtn">중복확인</button></td>
            				<td style="width: 150px;"><span id="errorId1">잘못된 입력입니다.</span><span id="errorCheckId1">아이디가 중복됩니다.</span><span id="successCheckId1" style="color:blue;">사용가능합니다.</span></td>
            				
            			</tr>
            			<tr>
            				<td style="width: 100px;">*비밀번호</td>
            				<td><input type="password" placeholder="영문+숫자+특수문자조합 (8~20 문자)" name="memberPw" id="memberPw1" required></td>
            				<td style="width: 100px;"></td>
            				<td colspan="2"><span id="errorPw1">잘못된 입력입니다.</span></td>
            			</tr>
            			<tr>
            				<td style="width: 100px;">*비밀번호 확인</td>
            				<td><input type="password" placeholder="내용을 입력하세요." id="memberPwRe1" required></td>
            				<td style="width: 100px;"></td>
            				<td colspan="2"><span id="errorPwRe1">비밀번호가 다릅니다.</span></td>
            			</tr>
            			<tr>
            				<td>*담당자이름</td>
            				<td><input type="text" placeholder="한글만 입력해주세요.(2~6 글자)" name="memberName" id="memberName1" required></td>
            				<td style="width: 100px;"></td>
            				<td><span id="errorName1">잘못된 입력입니다.</span></td>
            			</tr>
            			<tr>
            				<td>*휴대폰번호</td>
            				<td><input type="text" placeholder="-제외 번호 입력(10~11자리의 숫자)" name="memberPhone" id="memberPhone1" required></td>
            				<td style="width: 100px;"></td>
            				<td><span id="errorPhone1">잘못된 입력입니다.</span></td>
            			</tr>
            			<tr>
            				<td>*기관번호</td>
            				<td><input type="text" placeholder="비영리 단체 기관번호 (10자리 숫자)" name="companyNumber" id="companyNumber" required></td>
            				<td style="width: 100px;"></td>
            				<td><span id="errorCompanyNumber">잘못된 입력입니다.</span></td>
            			</tr>
            			<tr>
            				<td>*기관이미지</td>
            				<td><input type="file" name="companyFilename" required></td>
            				<td style="width: 100px;"></td>
            			</tr>
            			<tr>
            				<td>*기관 소개</td>
            				<td colspan="3"><textarea style="resize:none;" rows="10" cols="70"  required></textarea></td>
            				
            			</tr>
            			<tr>
            				<td>*제무제표</td>
            				<td><input type="file" name="chartFilename" required></td>
            				<td style="width: 100px;"></td>
            				
            			</tr>
            		</table>
            		<div style="text-align: center;">
            		<br><br>
            			<button type="reset" style=" background-color: #dddfe6;" class="joinNextBtn">취소</button>
            			<button type="submit" class="joinNextBtn">등록</button>
            		<br><br>
            		</div>
            		</form>
            	</div>
		</div>
	</div>
	</div>
	<jsp:include page="/WEB-INF/views/main/footer.jsp"></jsp:include>
</body>

</html>