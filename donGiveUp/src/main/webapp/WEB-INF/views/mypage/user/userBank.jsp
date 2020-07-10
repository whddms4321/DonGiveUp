<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>저금통</title>
<link href="/resources/adminMypage/css/bootstrap.min.css" rel="stylesheet">
<link href="/resources/adminMypage/css/font-awesome.min.css" rel="stylesheet">
<link href="/resources/adminMypage/css/datepicker3.css" rel="stylesheet">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script src="/resources/adminMypage/js/bootstrap.min.js"></script>

<script src="https://www.amcharts.com/lib/4/core.js"></script>
<script src="https://www.amcharts.com/lib/4/charts.js"></script>
<script src="https://www.amcharts.com/lib/4/themes/animated.js"></script>
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
.bankHeader div, span{
	
}
.bankBody{
	width : 100%;
	height : 250px;
	line-height : 250px;
	border : 3px solid #0fbcff;
	text-align:center;
	margin-top : 20px;
}
.bankMoneyTitle{
	font-size : 35px;
	font-weight : bold;
}
.bankMoneyTitle2{
	font-size : 25px;
	font-weight : bold;
}
.bankMoney{
	font-size : 35px;
	font-weight : bold;
	color : #0fbcff;
}
.bankHeaderChil{
	font-size : 25px;
	font-weight : bold;
}
#boardTitle, #boardCompany{
	color : #0fbcff;
}
.donationBtn{
	margin-top : 20px;
	text-align : right;
}
.donationBtn>button{
	border : none;
	background-color: #0fbcff;
	color : #fff;
	padding : 6px;
	border-radius : 5px;
}
.radio{
	
	margin-top : 20px;
	margin-bottom : 20px;
}
#companyName, #bankAllMoney{
	font-weight : bold;
	color : #0fbcff;
}
#modalContent, #bankAllMoney{
	font-size : 20px;
	font-weight : bold;
}
#donationBtn{
	border : none;
	background-color: #0fbcff;
	color : #fff;
	padding : 6px;
	border-radius : 5px;
}
.btn-default{
	padding : 6px;
	border-radius : 5px;
}
th{
background-color : #F1F1F1;
font-size : 18px;
}
.table th, td{
	text-align : center;
}
.bank>a{
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
			<div class="content-main-right">
				<div style="margin-bottom:40px;"><h1 style="font-weight:bold;">저금통</h1></div>
				<div class="bankHeader">
					<div class="bankHeaderChil" style="float:left; margin-right:50px;">
						제목 : <span class="bankHeaderChil" id="boardTitle"></span>
					</div>
					<div class="bankHeaderChil">
						대상기관 : <span class="bankHeaderChil" id="boardCompany"></span>
					</div>
				</div>
				<div class="bankBody">
					<span class="bankMoneyTitle">총 저금액 : </span><span class="bankMoney"></span><span class="bankMoneyTitle2"> (돈토리)</span>
				</div>
				<div class="donationBtn">
					<button id="donationBtn" data-toggle='modal' data-target='#dataModal'>종료하기</button> 
				</div>
				<div>
					<span class="bankHeaderChil">저금 참여목록</span>
				</div>
				<div class="radio">
					<label><input type="radio" name="kind" value=0 checked> 일반 저금 목록  </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<label><input type="radio" name="kind" value=1> 정기 저금 목록 </label>
					
				</div>
				<div>
					<table class="table">
						<tr>
							<th style="width:10%;">번호</th>
							<th style="width:25%;">글제목</th>
							<th style="width:15%;">돈토리(개)</th>
							<th style="width:15%;" id="date">참여일자</th>
							<th style="width:10%;">상태</th>
						</tr>
					</table>
				</div>
				<div id="pageNavi" style="text-align: center;">
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="dataModal" tabindex="-1" role="dialog" aria-labelledby="dataModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-sm" style="width:500px;">
				<div class="modal-content">
					<div class="modal-header">
						<!-- X 버튼 -->
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span><span class="sr-only"></span>
						</button>
						<!-- 제목 -->
						<h3 class="modal-title" id="dataModalLabel" style="font-weight:bold;">[후원하기]</h3>
					</div>
					<div class="modal-body" style="height:300px;">
						<div id="modalContent" style="width:100%;  text-align:center;">
							<br>
							[<span id="companyName"></span>]<br><br>
							<span>기관에게 저금통을 기부하시겠습니까?</span><br><br>
							<span>총 저금액 : </span>[<span id="bankAllMoney"></span>] 원
						</div>
						<div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" id="donationBtn" onclick="donationToCompany();">기부하기</button>
						<button type="button" id="modalClose"class="btn btn-default" data-dismiss="modal">닫기</button>
					</div>
				</div>
			</div>
		</div>
	<script>
		var memberId = "${sessionScope.member.memberId}";
		var bankNo = "";
		
		bankList(memberId, 1, 0);
		
		//저금통 제목
		$.ajax({
			url : "/selectBankInfo.don",
			data : {memberId : memberId},
			async : false,
			success : function(b){
				if(b.bankTitle==undefined){
					$("#boardTitle").html("[없음]");
					$("#boardTitle").css("color","red");
				}else{
					$("#boardTitle").html(b.bankTitle);
					$("#boardTitle").css("color","black");
				}
				if(b.bankTitle==undefined){
					$("#boardCompany").html("[없음]");
					$("#boardCompany").css("color","red");
				}else{
					$("#boardCompany").html(b.bankOrganization);
					$("#boardCompany").css("color","black");
				}
				
				bankNo = b.bankNo; //종료하기를 위한 primary key
				if(b.bankNowMoney == undefined){
					$(".bankMoney").html("0");
				}else{
					var nowMoney = b.bankNowMoney.toLocaleString(); //천단위로 , 찍기
					$(".bankMoney").html(nowMoney);					
				}
			},
			error : function(){
				
			}
		});

		function bankList(memberId, reqPage, type){			
			$.ajax({
				url : "/selectBankInList.don",
				data : {memberId : memberId, reqPage : reqPage, type:type},
				success : function(data){
					var list = data.list;
					var pageNavi = data.pageNavi;
					
					$(".newTr").remove();
					$("#pageNavi").children().remove();
					var html = "";
					
					for(var i=0; i<list.length; i++){
						html += "<tr class='newTr'>";
						html += "<td>" + ((reqPage-1)*5+1+i) + "</td><td>" + list[i].bankTitle + "</td>";
						
						if(type == 0){ // 1회성 기부
							html += "<td>" + list[i].bankInMoney.toLocaleString(); + "</td>";
							html += "<td>" + list[i].bankInDate + "</td>";
							html += "<td>-</td>";
						}else{ //정기기부인 경우 해지요청 버튼 생성
							html += "<td>" + list[i].bankInMoney.toLocaleString(); + "</td>";
							html += "<td>" + list[i].bankInDate + "</td>";
							
							if(list[i].bankType == 0){ //해당 저금통이 진행중인 경우
								if(list[i].bankInCancel == 0){ //기본상태 = 해지요청 버튼 생성
									html += "<td><button class='regularCancelBtn' onclick='reqCancel("+ list[i].bankInNo +",0);'>해지요청</button></td>";
								}else if(list[i].bankInCancel == 1){ //해지요청 상태 == '요청상태'라고 보여주기 
									html += "<td>요청대기</td>";
								}else if(list[i].bankInCancel == 2){ //해지완료 상태 == '해지완료'라고 보여주기
									html += "<td>해지완료</td>";
								}else if(list[i].bankInCancel == 3){ //완납
									html += "<td>완납</td>";
								}								
							}else{ //해당 저금통이 마감됨
								if(list[i].bankInCancel == 0){ //저금통은 마감되었는데 아직 정기후원이 진행중이면, 즉시 해지요청
									reqCancel(list[i].bankInNo,1);
									html += "<td>요청대기[마감]</td>";
								}else if(list[i].bankInCancel == 1){ //0인경우 메소드 호출을 통해 Cancel 값이 1로 변경됨
									html += "<td>요청대기[마감]</td>";
								}else{ 
									html += "<td>해지완료</td>";
								}	
								
							}
							
						}
						html += "</tr>";
					}
					$(".table").append(html);
					$("#pageNavi").append(pageNavi);
					
				},
				error : function(){
					
				}
			});
		}
		
		$("input[name=kind]").change(function(){
			bankList(memberId, 1, $(this).val());
			if($(this).val() == 0){
				$("#date").html("참여일자");
			}else{
				$("#date").html("자동 결제일자");
			}
			
		});
		
		function reqCancel(bankNo, kind){
			if(kind == 0){
				if(confirm("해지 요청하시겠습니까?")){ //해지요청 버튼 눌렀을 때
					$.ajax({
						url : "/bankCancelReq.don",
						data : {bankNo : bankNo},
						success : function(result){
							if(result>0){
								alert("요청 처리 되었습니다.");
							}
						}
					});				
				}
			}else{ //정기후원중인데 해당 저금통이 마감되었을 때
				$.ajax({
					url : "/bankCancelReq.don",
					data : {bankNo : bankNo},
					success : function(result){
						if(result>0){
							console.log("나이스으~!");
						}
					}
				});	
			}
		}
		
		$('#dataModal').on('show.bs.modal', function(event) {
			var companyName = $("#boardCompany").html();
			var bankMoney = $(".bankMoney").html();
			if(companyName != null && companyName != ""){
				$("#companyName").html(companyName);
			}else{
				$("#companyName").html("대상기관 없음");
			}
			if(bankMoney != 0 & bankMoney != null){				
				$("#bankAllMoney").html(bankMoney);
			}else{
				$("#bankAllMoney").html("0");
			}
		});
		//저금통 종료 - 후원단체에게 후원하기
		function donationToCompany(){
			//내 저금통 0원으로 update
			//내 저금통 타입 마감으로 update
			//돈토리로 환산 후 후원기관 돈토리 update
			//매개변수는 내 아이디, 해당 후원기관명,  금액, 저금통번호
			var price = Number($(".bankMoney").html().replace(/,/gi, ""));
			
			if(price>0){
				var companyName = $("#boardCompany").html();
				
				$.ajax({
					url : "/donationToCompany.don",
					data : {memberId:memberId, price:price, companyName:companyName, bankNo : bankNo},
					success : function(){
						alert("저금액을 후원하셨습니다.");
					},
					error : function(){}
				});				
			}else{
				alert("저금액이 없습니다.");
				$("#modalClose").click();
			}
			
		}
	</script>
	
</body>
</html>