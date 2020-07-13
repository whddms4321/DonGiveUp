<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자 마이페이지 Home</title>
<link href="/resources/adminMypage/css/bootstrap.min.css" rel="stylesheet">
<link href="/resources/adminMypage/css/font-awesome.min.css" rel="stylesheet">
<link href="/resources/adminMypage/css/datepicker3.css" rel="stylesheet">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script src="/resources/adminMypage/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
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


.money{
	float:left;
	height : 230px;
	width:45%;
	border:5px solid #EFEFEF;
}
.now-money{
	margin-left:45px;
}
.money-font{
	color : #0fbcff;
	font-size : 25px;
	height:110px;
	line-height:110px;
	text-align : center;
	font-weight : bold;
}
.money-don{
	color : black;
	font-size : 35px;
	height:110px;
	line-height:80px;
	text-align : center;
	font-weight : bold;
}
.table-wrap{
	margin-top : 20px;
}
#pageNavi{
	text-align : center;
}

.table th{
	font-size : 18px;
	background-color : #F1F1F1;
}
.table th, td{
	text-align : center;
}
.cashWrap{
	text-align : right;
}
.spanDiv{
	margin-top : 80px;
	font-weight : bold;
	font-size : 25px;
}
.cash{
	border : none;
	background-color: #0fbcff;
	color : #fff;
	padding : 6px;
	border-radius : 5px;
}
.cash-modal{
	width:100px;
	height : 40px;
	
	border-radius : 20px;
	border : 3px solid #0fbcff;
	background-color : #fff;
	color : #0fbcff;
}
.pageNavi{
	padding:10px;
}
.plus{
	color:blue;
}
.minus{
	color:red;
}
.home>a{
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
				<div class="moneyWrap">
						<div class="money now-money">
							<div class="money-font">보유 돈토리</div>
							<div class="money-don" id="nowMoney"></div>
						</div>
						<div class="money pay-money">
							<div class="money-font">총 후원 돈토리</div>
							<div class="money-don" id="allUseMoney"></div>
						</div>
				</div>
				<div class="spanDiv">
					<span>돈토리 내역</span>						
				</div>
				<div class="cashWrap">
					<button class="cash" data-toggle="modal" data-target="#dataModal" >충전하기</button>
				</div>
				<div class="table-wrap">
					<table class="table main">
						<tr>
							<th>번호</th><th>구분</th><th>돈토리</th><th>일자</th>
						</tr>
						<c:forEach items="${useList}" var="u" varStatus="i">
							<tr class="newTr">
								<td>${((reqPage-1)*10+i.count)}</td>
								<c:if test="${u.moneyStock == '입금' }">
									<td>입금</td>
									<td class="moneys"><span class="plus">(+)</span> ${u.moneyHistory}</td>
								</c:if>
								<c:if test="${u.moneyStock == '출금' }">
									<td>출금</td>
									<td class="moneys"><span class="minus">(-)</span> ${u.moneyHistory}</td>
								</c:if>
								<td>${u.moneyUseDate }</td>
							</tr>
						</c:forEach>
					</table>
				</div>
 				<div id="pageNavi">
					${pageNavi }
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="dataModal" tabindex="-1" role="dialog" aria-labelledby="dataModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-sm" style="width:400px;">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span><span class="sr-only"></span>
						</button>
						<h3 class="modal-title" id="dataModalLabel" style="font-weight:bold;">돈토리 충전</h3>
					</div>
					<div class="modal-body" style="height:300px; text-align:center;">
						<table class="table">
							<tr><td style="text-align:left;">5,000원 - 55 돈토리</td><td><input type="radio" name="price" value=5000></td></tr>
							<tr><td style="text-align:left;">10,000원 - 110 돈토리</td><td><input type="radio" name="price" value=10000></td></tr>
							<tr><td style="text-align:left;">30,000원 - 350 돈토리</td><td><input type="radio" name="price" value=30000></td></tr>
							<tr><td style="text-align:left;">50,000원 - 600 돈토리</td><td><input type="radio" name="price" value=50000></td></tr>
							<tr><td style="text-align:left;">100,000원 - 1,300 돈토리</td><td><input type="radio" name="price" value=100000></td></tr>
						</table> 
						<div style="margin-top:20px;">
							<button type="button" class="cash-modal" id="cashPay">+ 충전하기</button>
							<button type="button" class="cash-modal" data-dismiss="modal">닫기</button>
						</div>
					</div>
					<div class="modal-footer">
					</div>
				</div>
			</div>
		</div>
	<script>
		var memberId = "${sessionScope.member.memberId}";
		
		
		$("#cashPay").click(function(){
			
			var amount = $("input[name=price]:checked").val();
			console.log(amount);
			if(amount != undefined || amount != 0 || amount != "" || amount != null){
				IMP.init('imp87933196');
				IMP.request_pay({
				    pg : 'inicis',
				    pay_method : 'card',
				    merchant_uid : 'merchant_' + new Date().getTime(),
				    name : '주문명:결제테스트',
				    amount : amount, 
				    buyer_email : 'iamport@siot.do',
				    buyer_name : '${sessionScope.member.memberName}',
				    buyer_tel : '${sessionScope.member.memberPhone}',
				    buyer_addr : '${sessionScope.member.memberAddr}'
				}, function(rsp) {
				    if ( rsp.success ) {
				    	$.ajax({
				    		url : "/dontoriPay.don",
				    		data : {memberId : memberId, amount : amount},
				    		success : function(result){
				    			pageMove(1, memberId);
				    			location.reload();
				    		},
				    		error : function(){
				    			
				    		}
				    	});
				    	
				        var msg = '결제가 완료되었습니다.';
				    } else {
				    	
				        var msg = '결제에 실패하였습니다.';
				        msg += '에러내용 : ' + rsp.error_msg;
				    }
				    alert(msg);
				});
			}else{
				alert("결제 금액을 선택하세요.");
			}
		});
		
		$(function(){
			$.ajax({
				url : "/allUseMoney.don",
				data : {memberId : memberId},
				success : function(result){
					$("#allUseMoney").html(result.toLocaleString());
				}
			});
			
			$.ajax({
				url : "/nowMoney.don",
				data : {memberId : memberId},
				success : function(result){
					$("#nowMoney").html(result.toLocaleString());
				}
			});
		});
		
		function pageMove(reqPage, memberId){
			$(".newTr").remove();
			$("#pageNavi").children().remove();
			console.log("reqPage : " + reqPage);
			$.ajax({
				url : "/pageMove.don",
				data : {reqPage : reqPage, memberId : memberId},
				success : function(data){
					var list = data.list;
					var pageNavi = data.pageNavi;
					var html = "";
					console.log("페이지내비 : " + pageNavi);
					for(var i=0; i<list.length; i++){
						html += "<tr class='newTr'><td>" + ((reqPage-1)*5+1+i) + "</td>";
						if(list[i].moneyStock == "입금"){
							html += "<td>입금</td>";
							html += "<td><span class='plus'>(+)</span> " + list[i].moneyHistory.toLocaleString(); + "</td>";							
						}else if(list[i].moneyStock == "출금"){
							html += "<td>출금</td>";
							html += "<td><span class='minus'>(-)</span> " + list[i].moneyHistory.toLocaleString(); + "</td>";
						}
						html += "<td>" + list[i].moneyUseDate + "</td></tr>";
					}
					
					$(".main").append(html);
					$("#pageNavi").append(pageNavi);
				}
			})
		}
	</script>
</body>
</html>