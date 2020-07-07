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
</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/main/header.jsp"/>
	
	<div class="content">
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
					<span class="bankMoneyTitle">총 저금액 : </span><span class="bankMoney"></span><span class="bankMoneyTitle">원</span>
				</div>
				<div class="donationBtn">
					<button id="donationBtn" onclick="donation();">종료하기</button> 
				</div>
				<div>
					<span class="bankHeaderChil">저금 참여목록</span>
				</div>
				<div class="radio">
					<label><input type="radio" name="kind" value=0 checked> 콩 기부 목록  </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<label><input type="radio" name="kind" value=1> 정기기부 목록 </label>
					
				</div>
				<div>
					<table class="table">
						<tr>
							<th>번호</th><th>글제목</th><th>금액(원)</th><th>참여일자</th><th>상태</th>
						</tr>
					</table>
				</div>
				<div id="pageNavi">
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
				$("#boardTitle").html(b.bankTitle);
				$("#boardCompany").html(b.bankOrganization);
				bankNo = b.bankNo; //종료하기를 위한 primary key
				var nowMoney = b.bankNowMoney.toLocaleString(); //천단위로 , 찍기
				$(".bankMoney").html(nowMoney);
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
						
						if(type == 0){ //콩으로 기부한 경우 (원)으로 환산
							html += "<td>" + (list[i].bankInMoney*100) + "</td>";
							html += "<td>" + list[i].bankInDate + "</td>";
							html += "<td>-</td>";
						}else{ //정기기부인 경우 해지요청 버튼 생성
							html += "<td>" + list[i].bankInMoney + "</td>";
							html += "<td>" + list[i].bankInDate + "</td>";
							
							if(list[i].bankType == 0){ //해당 저금통이 진행중인 경우
								if(list[i].bankInCancel == 0){ //기본상태 = 해지요청 버튼 생성
									html += "<td><button class='regularCancelBtn' onclick='reqCancel("+ list[i].bankInNo +",0);'>해지요청</button></td>";
								}else if(list[i].bankInCancel == 1){ //해지요청 상태 == '요청상태'라고 보여주기 
									html += "<td>요청대기</td>";
								}else{ //해지완료 상태 == '해지완료'라고 보여주기
									html += "<td>해지완료</td>";
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
					console.log(html);
					$(".table").append(html);
					$("#pageNavi").append(pageNavi);
					
				},
				error : function(){
					
				}
			});
		}
		
		$("input[name=kind]").change(function(){
			bankList(memberId, 1, $(this).val());
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
	</script>
	
</body>
</html>