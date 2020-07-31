<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- 부트스트림4 지원 메타 포트 종료-->
<!--    부트스트랩(다운)과 jQuery 불러오기-->
<script type="text/javascript"
	src="/resources/jongeun/bootstrap4/js/jquery-3.3.1.js"></script>
<script type="text/javascript"
	src="/resources/jongeun/bootstrap4/js/bootstrap.min.js"></script>
<link type="text/css" rel="stylesheet"
	href="/resources/jongeun/bootstrap4/css/bootstrap.min.css" />
<!--    부트스트랩(다운)과 jQuery 불러오기 종료-->
        <!-- 구글 content 폰트 -->
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<title>후원품 신청하기</title>
</head>
	<style>
		body{
			font-family: 'Noto Sans KR', sans-serif;
		}
		.supportApply_form{
			width:410px;
			display:block;
			height:550px;
			margin:0 auto;
			margin-top: 25px;
			border: 3.5px solid #0fbcff;
			border-radius: 20px;
			padding: 10px;
		}
		.supportApply_form>p{
			font-size:23px;
			color:black;
			font-weight: 700;
		}
		
		.img_class{
			width:150px;
			height:120px;
			border:0.1px double black;		
		}
		.button_div{
			width:180px;
			margin:0 auto;		
		}
		#applyReason{
			margin:0 auto;
			display:block;
		}
		
	</style>
	<script>
	 function submitEnd(){
         opener.location.reload();
/*              var url = "/supportApplyInsert.don"; */
		var supportNo = $("#supportNo").val();
		var supportApplyId = $("#supportApplyId").val();
		var supportApplyReason = $("#supportApplyReason").val();
		
		alert($("input[name=supportNo]").val());
		alert($("input[name=supportApplyId]").val());
		alert($("textarea[name=supportApplyReason]").val());
		
        location.href="/supportApplyInsert.don?supportNo="+supportNo+"&supportApplyId="+supportApplyId+"&supportApplyReason="+supportApplyReason;	

        /* self.close(); */ 
        
     }
	 function exit(){
		 
		  self.close(); 
	 }
	</script>
<body>

	<form class="supportApply_form" action="/supportApplyInsert.don" method="post" >
	
		<p>물품명  : ${support.supportName }</p>
		
		<hr>
		<input type="hidden" name="supportNo" value="${support.supportNo }" id="supportNo">
		<br>
		이미지 사진 : &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img class="img_class" src="/resources/upload/images/${support.supportFilename }">
		<br><hr>
		<input type="hidden" id="supportApplyId" name="supportApplyId" value="${sessionScope.member.memberId }">
		<br>
		<textarea name="supportApplyReason" placeholder="신청 사유를 적어주세요."
		style="width:280px; height:150px;" id="supportApplyReason"></textarea><br><br>
		<div class="button_div">
			<button  class="btn btn-primary applySubmit" type="submit" onclick="submitEnd();">신청하기</button>
			<button class="btn btn-primary" type="button" onclick="exit()">돌아가기</button>
		</div>
	</form>
	
</body>
</html>