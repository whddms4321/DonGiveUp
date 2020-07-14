<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 관리</title>
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

.panels{
	width : 295px;
	text-align : center;
}
table{
	text-align : center;
}
th{
	text-align : center;
	height:50px;
	font-size:15px;
}
td{
	text-align : center;
	height:50px;
	
}
tr{
	border-bottom: 1px solid #E7E7E7;
}
.tableDiv{
	padding-top : 30px;
}
.pageNavi{
	text-align:center;
	padding:10px;
}
.th1{
	width: 15%;
}
.th2{
	width : 50%;
}
.th3{
	width:25%;
}
.th4{
	width:10%;
}

.subTable th, .subTable td{
	background-color : #E7E7E7;
}
.subPageNavi{
	background-color : #E7E7E7;
	width:100%;
	padding-top : 20px;
	padding-bottom : 20px;
}
.subTable{
	margin-bottom : 0px;
	width:100%;
}
.subTrRew{
	width:15%;
}
.subTrNo{
	width:10%;
}
.subTrId{
	width:15%;
}
.subTrPer{
	width:10%;
}
.subTrDate{
	width:20%;
}
.subTrMoney{
	width:10%;
}
.modify>a{
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
				<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main" style="margin:0px; padding-left:0px;">
					<div class="col-md-6" style="padding-left:0px; border:none;">
						<div class="panel panel-default" style="width:920px;  border:none;">
							<div class="panel-body tabs">
								<ul class="nav nav-tabs">
									<li class="active panels"><a href="#tab1" onclick="boardList('donation', 1,'${sessionScope.member.memberId}');" data-toggle="tab">기부</a></li>
									<li class="panels"><a href="#tab2" onclick="boardList('funding', 1,'${sessionScope.member.memberId}');" data-toggle="tab">펀딩</a></li>
									<li class="panels"><a href="#tab3" onclick="boardList('vwork', 1,'${sessionScope.member.memberId}');" data-toggle="tab">함께해요</a></li>
								</ul>
								<div class="tab-content" style="margin-left:50px; padding-right:70px;">
									<div class="tab-pane fade in active" id="tab1">
										<div class="donationDiv tableDiv">
											<table class="table">
											</table>
										</div>
										<div class="donationPageNavi pageNavi"></div>
									</div>
									<div class="tab-pane fade" id="tab2">
										<div class="fundingDiv tableDiv">
											<table class="table">
											</table>
										</div>
										<div class="fundingPageNavi pageNavi"></div>
									</div>
									<div class="tab-pane fade" id="tab3">
										<div class="vworkDiv tableDiv">
											<table class="table">
											</table>
										</div>
										<div class="vworkPageNavi pageNavi"></div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
		var memberId = "${sessionScope.member.memberId}";
		boardList('donation', 1, memberId);
		
		//기부, 펀딩, 함께해요 첫번째 테이블 구해오기
		function boardList(type, reqPage, memberId){
			$(".subTable").remove();
			$(".subPageNavi").remove();
			$(".newTd").remove();
			$.ajax({
				url : "/selectCompanyBoardList.don",
				data : {type: type, reqPage : reqPage, memberId : memberId},
				success : function(data){
					var list = data.list;
					var pageNavi = data.pageNavi;
					
					var html = "";
					$(".newTr").remove();
					$("." +type+"PageNavi").children().remove();
					
					if(type!="vwork"){
						html += "<tr class='newTr'><th class='th1'>번호</th><th class='th2'>글제목</th><th class='th3'>기간</th><th class='th4'>참여자</th></tr>";							
					}else{
						html += "<tr class='newTr'><th class='th1'>번호</th><th class='th2'>글제목</th><th class='th3'>승인일자</th><th class='th4'>참여자</th></tr>";
					}
					
					for(var i=0; i<list.length; i++){
						html += "<tr class='newTr'>";
						html += "<td>"+ ((reqPage-1)*10+1+i) + "</td><td>" + list[i].boardTitle + "</td>";
						if(type!="vwork"){
							html += "<td>" + list[i].boardStartDate + " ~ " + list[i].boardEndDate + "</td>";
						}else{
							html += "<td>" + list[i].boardStartDate + "</td>";
						}
						html += "<td><a href='javascript:void(0);' onclick='boardAttendUserList(`" + type + "`," + list[i].boardNo + ", 1 , this, `a`);'>확인</a></td></tr>";
						
						html += "<tr style='display:none;'>";
							//html += "<td colspan='4' class='newTd' style='text-align:center;'>";
							//	html += "<table class='table subTable'>";
							//	html += "</table>";
							//	html += "<div class='subPageNavi'></div>";
							//html += "</td>";
						html += "</tr>";
					
					}
				
					$("." + type + "Div").children().append(html);
					$("." + type + "PageNavi").append(pageNavi);
				},
				error : function(){}
			});
		}
		
					
		//각 게시글에 대한 참여자
		function boardAttendUserList(type, boardNo, reqPage , obj, kind){
			
			$.ajax({
				url : "/boardAttendUserList.don",
				data : {type : type, boardNo : boardNo, reqPage : reqPage},
				success : function(data){
					var list = data.list;
					var pageNavi = data.pageNavi;
					var html = "";
					
					var objConcat = $(obj).parent().parent().parent();
					//var objConcat = $(obj).parent().prev();
					
					if(kind == "a"){
						$(obj).parent().parent().next().children().remove();
						
						//처음에 참여 버튼을 눌렀을 때
						//$(obj).parent().parent().next().find(".subTable").children().remove();
						//$(obj).parent().parent().next().find(".subPageNavi").children().remove();
					}		
					if(kind == "page"){
						//페이지 번호를 눌렀을 때
						
						$(obj).parent().parent().remove();
						//$(obj).parent().prev().children().remove();
						//$(obj).parent().children().remove();
					}
					
					if(list.length>0){
						//th 생성
						if(type == 'donation'){
							html += "<td colspan='4' class='newTd' style='text-align:center;'>";
							html += "<table class='table subTable'>";
							
							html += "<tr>";
							html += "<th class='subTrNo'>번호</th><th class='subTrId'>이름</th><th class='subTrDate'>기부일자</th><th class='subTrMoney'>금액(원)</th>";
							html += "</tr>";							
						}else if(type == 'funding'){
							html += "<td colspan='4' class='newTd' style='text-align:center;'>";
							html += "<table class='table subTable'>";
							
							html += "<tr>";
							html += "<th class='subTrNo'>번호</th><th class='subTrId'>이름</th><th class='subTrDate'>연락처</th><th class='subTrRew'>리워드명</th><th class='subTrMoney'>수량</th><th>금액(원)</th><th class='subTrDate'>참여일자</th>";
							html += "</tr>";
						}else if(type == 'vwork'){
							html += "<td colspan='4' class='newTd' style='text-align:center;'>";
							html += "<table class='table subTable'>";
							
							html += "<tr>";
							html += "<th class='subTrNo'>번호</th><th class='subTrId'>이름</th><th>연락처</th><th class='subTrPer'>참여인원</th><th class='subTrDate'>참여희망날짜</th>";
							html += "</tr>";
						}
						
						for(var i=0; i<list.length; i++){
							if(type == 'donation'){
								html += "<tr>";
								html += "<td>" + ((reqPage-1)*5+1+i) + "</td><td>" + list[i].memberName + "</td>";
								html += "<td>" + list[i].attendDate + "</td><td>" + (list[i].attendMoney * 100).toLocaleString() + "</td>";
								html += "</tr>";							
							}else if(type == 'funding'){
								html += "<tr>";
								html += "<td>" + ((reqPage-1)*5+1+i) + "</td><td>" + list[i].memberName + "</td><td>" + list[i].memberPhone + "</td>";
								html += "<td>" + list[i].rewardName + "</td>";
								html += "<td>" + list[i].rewardCount + "</td>";
								html += "<td>" + (list[i].rewardCount * list[i].rewardOnePrice).toLocaleString() + "</td>";
								html += "<td>" + list[i].attendDate + "</td>";
								html += "</tr>";
							}else if(type == 'vwork'){
								html += "<tr>";
								html += "<td>" + ((reqPage-1)*5+1+i) + "</td><td>" + list[i].memberName + "</td><td>" + list[i].memberPhone + "</td>";
								html += "<td>" + list[i].attendUserCount + "</td><td>" + list[i].attendDate + "</td>";
								html += "</tr>";	
							}
						}
						
						html += "</table>";
						html += "<div class='subPageNavi'></div>";
						html += "</td>";
						if(kind == "a"){
							$(obj).parent().parent().next().append(html);
							$(obj).parent().parent().next().find(".subPageNavi").append(pageNavi);
							//처음 참여자 확인 누를 시
							//$(obj).parent().parent().next().find(".subTable").append(html);
							//$(obj).parent().parent().next().find(".subPageNavi").append(pageNavi);
						}
						if(kind == "page"){
							$(objConcat).append(html);
							$(objConcat).find(".subPageNavi").append(pageNavi);
							//$(objConcat).next().append(pageNavi);
							
						}
						
						$(obj).parent().parent().next().css("display", "table-row");
					}else{
						alert("참여자가 없습니다.");
					}
				}
			});
		}
	</script>
</body>
</html>