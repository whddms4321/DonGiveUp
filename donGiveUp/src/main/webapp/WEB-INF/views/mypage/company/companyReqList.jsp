<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 신청 목록</title>
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
	width : 177px;
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
	width: 25%;
}
.th2{
	width : 50%;
}
.th3{
	width:25%;
}
.home>a{
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
									<li class="active panels"><a href="#tab1" onclick="reqBoard('donation', 1,'${sessionScope.member.memberId}');" data-toggle="tab">기부</a></li>
									<li class="panels"><a href="#tab2" onclick="reqBoard('funding', 1,'${sessionScope.member.memberId}');" data-toggle="tab">펀딩</a></li>
									<li class="panels"><a href="#tab3" onclick="reqBoard('vwork', 1,'${sessionScope.member.memberId}');" data-toggle="tab">함께해요</a></li>
									<li class="panels"><a href="#tab4" onclick="reqBoard('support', 1,'${sessionScope.member.memberId}');" data-toggle="tab">물품후원</a></li>
									<li class="panels"><a href="#tab5" onclick="reqBoard('regular', 1,'${sessionScope.member.memberId}');" data-toggle="tab">정기후원</a></li>
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
									<div class="tab-pane fade" id="tab4">
										<div class="supportDiv tableDiv">
											<table class="table">
											</table>
										</div>
										<div class="supportPageNavi pageNavi"></div>
									</div>
									<div class="tab-pane fade" id="tab5">
										<div class="regularDiv tableDiv">
											<table class="table">
											</table>
										</div>
										<div class="regularPageNavi pageNavi"></div>
									</div>
								</div>
							</div>
						</div>
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
						<h3 class="modal-title" id="dataModalLabel" style="font-weight:bold;">[거부 사유]</h3>
					</div>
					<div class="modal-body" style="height:400px;">
						<textarea id="negativeContent" class="form-control" rows="18" cols="64" readonly style="resize:none;"></textarea>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
	
		
		var memberId = "${sessionScope.member.memberId}";
		reqBoard('donation', 1, memberId);
		
		function reqBoard(type, reqPage, memberId){
			$.ajax({
				url : "/selectCompanyReqList.don",
				data : {memberId : memberId, reqPage : reqPage, type:type},
				success : function(data){
					var list = data.list;
					var pageNavi = data.pageNavi;
					var html = "";
					$(".newTr").remove();
					$("." +type+"PageNavi").children().remove();
					html += "<tr class='newTr'><th class='th1'>번호</th><th class='th2'>글제목</th><th class='th2'>상태</th></tr>";
					
					for(var i=0; i<list.length; i++){
						html += "<tr class='newTr'>";
						html += "<td>" + ((reqPage-1)*10+1+i) + "</td><td>" + list[i].boardTitle + "</td>";
						if(type == 'support'){
							
							if(list[i].boardState == 0){ //신청상태 (심사대기, 심사중= 기간종료)
								var date = list[i].boardEndDate;
								date = Number(date.split("/"));
								date[0] = "20" + date[0];
								
								var today = new Date;
								var year = Number(today.getFullYear());
								var month = Number(today.getMonth() + 1);
								var day = Number(today.getDate());
								
								if(date[0] > year){ //마감년도가 오늘보다 늦은 경우
									html += "<td>심사대기</td>";
								}else if(date[0] == year){ //같은 년도 
									if(date[1] > month){ //마감월이 오늘보다 늦은 경우
										html += "<td>심사대기</td>";	
									}else if(date[1] == month){ //같은 월
										if(date[2] > day){ //마감일이 오늘보다 늦은 경우
											html += "<td>심사대기</td>";		
										}else if(date[2] == day){ //마감일이 오늘인 경우
											html += "<td>심사중</td>";
										}else{
											html += "<td>심사중</td>";
										}
									}else{
										html += "<td>심사중</td>";
									}
								}else{ //마감된 경우
									html += "<td>심사중</td>";
								}
								
							}else if(list[i].boardState == 1){ // 내가 배정됨
								html += "<td>배정완료</td>";
							}else if(list[i].boardState == 2){ // 다른 기관이 배정됨
								html += "<td>배정실패</td>";
							}
						}else{
							if(list[i].boardState == 0){
								html += "<td>승인대기</td>";
							}else if(list[i].boardState == 1){
								html += "<td>승인완료</td>";
							}else if(list[i].boardState == 2){
								html += "<td><a href='#dataModal' data-toggle='modal' data-target='#dataModal' data-content='" + list[i].negativeContent + "'>거부</a></td>";
							}
						}
						html += "</tr>";
					}
					
					$("." + type + "Div").children().append(html);
					$("." + type + "PageNavi").append(pageNavi);
					
				},
				error : function(){
					
				}
			});			
		}
		
		$('#dataModal').on('show.bs.modal', function(event) {
			var negativeContent = $(event.relatedTarget).data('content');
			$("#negativeContent").html("");
			$("#negativeContent").html(negativeContent);
		});
	</script>
</body>
</html>