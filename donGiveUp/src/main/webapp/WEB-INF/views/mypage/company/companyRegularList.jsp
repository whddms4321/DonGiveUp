<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정기후원 관리</title>
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
.table{
	text-align:center;
}
th{
	text-align:center;
	background-color : #F1F1F1;
	font-size : 18px;
	padding : 10px;
}
td{
	padding:10px;
}
#pageNavi{
	text-align : center;
}
.pageNavi{
	padding : 10px;
}
.inList>a{
	background-color : #0fbcff;
	color : white;
}
</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/main/header.jsp"/>
	
	<div class="content">
		<div class="content-main">
			<div class="content-main-left">
				<div class="userInfo">
					<img style="width:100%; height:100%;"src="/imgs/mypage/company.jpg">
					<div class="menuWrap">
						<div class="home">
							<a href="/companyMypage.don">
							- 신청 목록
							</a>
						</div>
						<div class="modify">
							<a href="/companyBoardList.don">
							- 게시글 관리
							</a>
						</div>
						<div class="inList">
							<a href="/companyRegularList.don">
							- 정기후원 관리
							</a>
						</div>
					</div>
				</div>
			</div>
			<div class="content-main-right">
				<div class="moneyWrap">
						<div class="money now-money">
							<div class="money-font">총 후원 돈토리</div>
							<div class="money-don" id="allDontory"></div>
						</div>
						<div class="money pay-money">
							<div class="money-font">이번달 후원 돈토리</div>
							<div class="money-don" id="monthDontory"></div>
						</div>
				</div>
				<div style="margin-top:60px;">
					<h2 style="font-weight:bold;">후원자 목록</h2>
				</div>
				<div style="margin-top:30px; margin-bottom:30px;">
					<label><input type="radio" name="type" value=0 checked> 현재 참여자 &nbsp; &nbsp; &nbsp; &nbsp;</label> 
					<label><input type="radio" name="type" value=1> 종료 참여자 </label>
				</div>
				<div>
					<table class="table">
					</table>
					<div id="pageNavi">
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
		var memberId = "${sessionScope.member.memberId}";
		
		selectList(0, 1, memberId);
		
		
		$.ajax({
			url : "/selectNowAndMonthMoney.don",
			data : {memberId : memberId},
			success : function(data){
				var nowMoney = data.nowMoney;
				var monthMoney = data.monthMoney;
				
				if(nowMoney > 0){
					$("#allDontory").html(nowMoney.toLocaleString());
				}else{
					$("#allDontory").html("0");
				}
				
				if(monthMoney  > 0){
					$("#monthDontory").html(monthMoney.toLocaleString());
				}else{
					$("#monthDontory").html(monthMoney.toLocaleString());
				}
			}
		});
		
		function selectList(type, reqPage, memberId){
			
			$.ajax({
				url : "/selectCompanyRegularBoard.don",
				data : {type:type, reqPage:reqPage, memberId : memberId},
				success : function(data){
					var list = data.list;
					var pageNavi = data.pageNavi;
					var html = "";
					$(".table").children().remove();
					$("#pageNavi").children().remove();
					
					html += "<tr>";
					html += "<th>번호</th>";
					html += "<th>아이디</th>";
					html += "<th>돈토리</th>";
					if(type == 0){
						html += "<th>자동 결제일자</th>";					
					}else{
						html += "<th>참여기간</th>";
					}
					html += "</tr>";
					
					for(var i=0; i<list.length; i++){
						html += "<tr>";
						html += "<td>" + ((reqPage-1)*5+1+i) + "</td>";
						html += "<td>" + list[i].regularId + "</td>";
						html += "<td>" + list[i].regularMoney.toLocaleString() + "</td>";
						if(type == 0){
							html += "<td>" + list[i].regularAutoDate + "</td>";							
						}else{
							html += "<td>" + list[i].regularInDate + " ~ " + list[i].regularEndDate + "</td>";
						}
						html += "</tr>";
					}
					
					$(".table").append(html);
					$("#pageNavi").append(pageNavi);
					
				},
				error : function(){}
			});			
		}
		
		
		$("input[name=type]").change(function(){
			selectList($(this).val(), 1, memberId);
		});
	</script>
</body>
</html>