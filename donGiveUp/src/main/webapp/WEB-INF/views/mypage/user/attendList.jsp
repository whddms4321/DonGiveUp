<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>참여 목록</title>
<link href="/resources/adminMypage/css/bootstrap.min.css" rel="stylesheet">
<link href="/resources/adminMypage/css/font-awesome.min.css" rel="stylesheet">
<link href="/resources/adminMypage/css/datepicker3.css" rel="stylesheet">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script src="/resources/adminMypage/js/bootstrap.min.js"></script>

<script src="https://www.amcharts.com/lib/4/core.js"></script>
<script src="https://www.amcharts.com/lib/4/charts.js"></script>
<script src="https://www.amcharts.com/lib/4/themes/animated.js"></script>
<style>
#chartdiv {
  width: 80%;
  height: 300px;
  margin-top : 20px;
}
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
li{
	width : 177px;
	text-align : center;
}
.inputDiv{
	margin-top : 30px;
	margin-bottom :20px;
}
.regular-cancel-btn{
	margin : 0 auto;
	border : none;
	background-color: #0fbcff;
	color : #fff;
	padding : 6px;
	border-radius : 5px;
}
.table{
	text-align: center;
}
th{
	text-align: center;
	background-color : #F1F1F1;
	padding : 10px;
	font-size : 18px;
}
td{
	padding : 10px;
}
.pageNavi{
	text-align : center;
	padding : 10px;
}
.inputDiv{
 	padding : 20px; 
}
.inList>a{
	background-color : #0fbcff;
	color : white;
}
</style>

</head>
<body>
<jsp:include page="/WEB-INF/views/main/header.jsp"/>
	
	<div class="content" style="height:1000px;">
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
				<div style="margin:0 auto; margin-bottom:50px;">
					<h2 style="font-weight:bold;">활동내역</h2>
					<div id="chartdiv" style="margin:0 auto;"></div>
				</div>
				<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main" style="margin:0px; padding-left:0px;">
					<div class="col-md-6" style="padding-left:0px;">
						<div class="panel panel-default" style="width:920px; border:none;">
							<div class="panel-body tabs">
								<ul class="nav nav-tabs">
									<li class="active"><a href="#tab1" onclick="saveValue('donation', 0, 1, `${sessionScope.member.memberId}`);" data-toggle="tab">기부</a></li>
									<li><a href="#tab2" onclick="saveValue('funding', 0, 1, `${sessionScope.member.memberId}`);" data-toggle="tab">펀딩</a></li>
									<li><a href="#tab3" onclick="saveValue('vwork', 0, 1, `${sessionScope.member.memberId}`);" data-toggle="tab">함께해요</a></li>
									<li><a href="#tab4" onclick="saveValue('support', 0, 1, `${sessionScope.member.memberId}`);" data-toggle="tab">물품후원</a></li>
									<li><a href="#tab5" onclick="saveValue('regular', 0, 1, `${sessionScope.member.memberId}`);" data-toggle="tab">정기후원</a></li>
								</ul>
								<div class="tab-content"  style="width:100%;" style="margin-left:50px; padding-right:70px;">
									<div class="tab-pane fade in active" id="tab1">
										<div class="inputDiv">
											<label><input type="radio" name="donation" value="0" checked> 진행중 목록</label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											<label><input type="radio" name="donation" value="1"> 종료된 목록</label>
										</div>
										<div class="donationDiv tableDiv">
											<table class="table">
											
											</table>
										</div>
										<div class="donationPageNavi pageNavi"></div>
									</div>
									<div class="tab-pane fade" id="tab2">
										<div class="inputDiv">
											<label><input type="radio" name="funding" value="0" checked> 진행중 목록</label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											<label><input type="radio" name="funding" value="1"> 종료된 목록</label>
										</div>
										<div class="fundingDiv tableDiv">
											<table class="table">
											
											</table>
										</div>
										<div class="fundingPageNavi pageNavi"></div>
									</div>
									<div class="tab-pane fade" id="tab3">
										<div class="inputDiv">
											<label><input type="radio" name="vwork" value="0" checked> 참여 예정</label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											<label><input type="radio" name="vwork" value="1"> 참여 완료</label>
										</div>
										<div class="vworkDiv tableDiv">
											<table class="table">
											
											</table>
										</div>
										<div class="vworkPageNavi pageNavi"></div>
									</div>
									<div class="tab-pane fade" id="tab4">
										<div class="inputDiv">
											<label><input type="radio" name="support" value="0" checked> 승인대기 목록 </label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											<label><input type="radio" name="support" value="1"> 승인완료 목록 </label>
										</div>
										<div class="supportDiv tableDiv">
											<table class="table">
											
											</table>
										</div>
										<div class="supportPageNavi pageNavi"></div>
									</div>
									<div class="tab-pane fade" id="tab5">
										<div class="inputDiv">
											<label><input type="radio" name="regular" value="0" checked> 진행중 목록</label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											<label><input type="radio" name="regular" value="1"> 종료된 목록</label>
										</div>
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
	<script>
		
		var memberId = "${sessionScope.member.memberId}";
		
		
		saveValue('donation', 0, 1, memberId);
		
		$("input[name=donation]").change(function(){
			saveValue('donation', $(this).val(), 1, memberId);
		});
		$("input[name=funding]").change(function(){
			saveValue('funding', $(this).val(), 1, memberId);		
		});
		$("input[name=vwork]").change(function(){
			saveValue('vwork', $(this).val(), 1, memberId);
		});
		$("input[name=support]").change(function(){
			saveValue('support', $(this).val(), 1, memberId);
		});
		$("input[name=regular]").change(function(){
			saveValue('regular', $(this).val(), 1, memberId);
		});
		
		function saveValue(type, radio, reqPage, memberId){
			$.ajax({
				url : "/attendList.don",
				data : {type : type, radio : radio, reqPage : reqPage, memberId : memberId},
				success : function(data){
					var list = data.list;
					var pageNavi = data.pageNavi;
					var html = "";
					
					if(type == "donation"){
							$(".donationDiv").children().children().remove();
							$(".donationPageNavi").children().remove();
							html += "<tr>";
							html += "<th>번호</th><th>글제목</th><th>돈토리(개)</th><th>기부일자</th>";
							html += "</tr>";
							
							for(var i=0; i<list.length; i++){
								html += "<tr>";
								html += "<td>" + ((reqPage-1)*5+1+i) + "</td><td>" + list[i].boardTitle + "</td><td>" + list[i].boardMoney.toLocaleString()  + "</td><td>" + list[i].boardDate + "</td>";
								html += "</tr>";
							}
							
							$(".donationDiv").children().append(html);
							$(".donationPageNavi").append(pageNavi);
						
					}else if(type == "funding"){
							$(".fundingDiv").children().children().remove();
							$(".fundingPageNavi").children().remove();
							
							html += "<tr>";
							html += "<th>번호</th><th>글제목</th><th>리워드명</th><th>수량</th><th>금액(원)</th><th>참여일자</th>";
							html += "</tr>";
								
							for(var i=0; i<list.length; i++){
								html += "<tr>";
								html += "<td>" + ((reqPage-1)*5+1+i) + "</td><td>" + list[i].boardTitle + "</td>";
								html += "<td>" + list[i].boardRewardName + "</td>";
								html += "<td>" + list[i].boardCount + "</td>";
								html += "<td>" + (list[i].boardCount * list[i].rewardOnePrice).toLocaleString() + "</td>";
								html += "<td>" + list[i].boardDate + "</td>";
								html += "</tr>";
							}
						
							$(".fundingDiv").children().append(html);
							$(".fundingPageNavi").append(pageNavi);
					}else if(type == "vwork"){
							$(".vworkDiv").children().children().remove();
							$(".vworkPageNavi").children().remove();
							
							html += "<tr>";
							html += "<th>번호</th><th>글제목</th><th>장소</th><th>봉사일자</th>";
							html += "</tr>";
							
							for(var i=0; i<list.length; i++){
								html += "<tr>";
								html += "<td>" + ((reqPage-1)*5+1+i) + "</td><td>" + list[i].boardTitle + "</td><td>" + list[i].boardPlace  + "</td><td>" + list[i].boardDate + "</td>";
								html += "</tr>";
							}
							
							$(".vworkDiv").children().append(html);
							$(".vworkPageNavi").append(pageNavi);
					}else if(type == "regular"){
						$(".regularDiv").children().children().remove();
						$(".regularPageNavi").children().remove();
						
						if(radio == 0){
							html += "<tr>";
							html += "<th style='width=15%;'>번호</th>";
							html += "<th style='width=55%;'>대상기관</th>";
							html += "<th style='width=20%;'>돈토리(개)</th>";
							html += "<th style='width=15%;'>자동 결제일자</th>";
							html += "<th style='width=15%;'>-</th>";
							html += "</tr>";
							
							for(var i=0; i<list.length; i++){
								html += "<tr>";
								html += "<td style='padding:3px;'>" + ((reqPage-1)*5+1+i) + "</td><td style='padding:3px;'>" + list[i].boardTitle + "</td><td style='padding:3px;'>" + list[i].boardMoney.toLocaleString() + "</td>";
								html += "<td style='padding:3px;'>" + list[i].boardDate + "</td>";
								html += "<td style='padding:3px;'>" + "<button class='regular-cancel-btn' onclick='regularCancelReq(" + list[i].boardNo + "," + reqPage +");'>해지요청</button>"  + "</td>";
								html += "</tr>";
							}
						}else{ //종료된 목록
							html += "<tr>";
							html += "<th style='width=15%;'>번호</th>";
							html += "<th style='width=25%;'>대상기관</th>";
							html += "<th style='width=20%;'>돈토리(개)</th>";
							html += "<th style='width=25%;'>종료일자</th>";
							html += "<th style='width=15%;'>상태</th>";
							html += "</tr>";
							
							for(var i=0; i<list.length; i++){
								html += "<tr>";
								html += "<td>" + ((reqPage-1)*5+1+i) + "</td><td>" + list[i].boardTitle + "</td><td>" + list[i].boardMoney.toLocaleString() + "</td>";
								if(list[i].boardState==1){
									html += "<td> - </td>";
									html +="<td>요청대기</td>";
								}else if(list[i].boardState==2){
									html += "<td>" + list[i].regularEndDate + "</td>";
									html +="<td>해지완료</td>";
								}
								html += "</tr>";
							}
						}
						
						$(".regularDiv").children().append(html);
						$(".regularPageNavi").append(pageNavi);
					}else if(type == "support"){
						$(".supportDiv").children().children().remove();
						$(".supportPageNavi").children().remove();
						
						html += "<tr>";
						html += "<th style='width=10%;'>번호</th>";
						html += "<th style='width=20%;'>글제목</th>";
						html += "<th style='width=10%;'>종류</th>";
						html += "<th style='width=10%;'>수량</th>";
						if(radio==0){
							html += "<th style='width=25%;'>신청일</th>";
						}else{
							html += "<th style='width=25%;'>마감일</th>";							
						}
						html += "<th style='width=10%;'>상태</th>";
						html += "</tr>";
						
						for(var i=0; i<list.length; i++){
							html += "<tr>";
							html += "<td>" + ((reqPage-1)*5+1+i) + "</td><td>" + list[i].boardTitle + "</td>";
							switch(list[i].supportKind){
								case 0 : 
									html += "<td>X</td>";
									break;
								case 1 : 
									html += "<td>의류</td>";
									break;
								case 2 :
									html += "<td>유아용품</td>";
									break;
								case 3 :
									html += "<td>생리대</td>";
									break;
								case 4 :
									html += "<td>화장품</td>";
									break;
								case 5 :
									html += "<td>학용품</td>";
									break;
								case 6 :
									html += "<td>도서</td>";
									break;
								case 7 :
									html += "<td>가전제품</td>";
									break;
								case 8 :
									html += "<td>생활용품</td>";
									break;
								case 9 :
									html += "<td>가구/침구</td>";
									break;
							}
							html += "<td>" + list[i].boardCount + "</td>";
							if(radio == 0){
								html += "<td>" + list[i].boardInDate + "</td>";
							}else{
								if(list[i].boardState == 1){
									html += "<td>" + list[i].boardDate + "</td>";
								}else if(list[i].boardState == 2){
									html += "<td> - </td>";
								}else if(list[i].boardState == 3){
									html += "<td>" + list[i].boardDate + "</td>";
								}
																
							}
							
							if(radio == 0 && list[i].boardState == 0){
								html += "<td>승인대기</td>";
							}else if(radio != 0){
								if(list[i].boardState == 1){ //오늘 날짜랑 마감날짜 비교하는 if 추가 (승인완료, 심사중)
									var date = list[i].boardDate;
									date = Number(date.split("/"));
									date[0] = "20" + date[0];
									
									var today = new Date;
									var year = Number(today.getFullYear());
									var month = Number(today.getMonth() + 1);
									var day = Number(today.getDate());
									
									if(date[0] > year){ //마감년도가 오늘보다 늦은 경우
										html += "<td>기관 모집중</td>";
									}else if(date[0] == year){ //같은 년도 
										if(date[1] > month){ //마감월이 오늘보다 늦은 경우
											html += "<td>기관 모집중</td>";	
										}else if(date[1] == month){ //같은 월
											if(date[2] > day){ //마감일이 오늘보다 늦은 경우
												html += "<td>기관 모집중</td>";		
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
									
								}else if(list[i].boardState == 2){ //거부사유 모달로 보여주기
									html += "<td><a href='#dataModal' data-toggle='modal' data-target='#dataModal' data-boardno=" + list[i].boardNo + " data-type='support'>반려</a></td>";
								}else if(list[i].boardState == 3){ //신청사유 모달로 보여주기
									html += "<td><a href='#dataModal' data-toggle='modal' data-target='#dataModal' data-boardno=" + list[i].boardNo + " data-type='company'>기관배정</a></td>";
								}
							}
							html += "</tr>";
						}
						
						$(".supportDiv").children().append(html);
						$(".supportPageNavi").append(pageNavi);
					}
				},
				error : function(){
					console.log("실패");
				}
			});
		}
	
		
		var donationCnt = 0;
		var fundingCnt = 0;
		var supportCnt = 0;
		var vworkCnt = 0;
		var regularCnt = 0;
		
		$.ajax({
			url:"/attenListCount.don",
			data : {memberId : memberId},
			async : false,
			success : function(map){
				donationCnt = map.donationCnt;
				fundingCnt = map.fundingCnt;
				supportCnt = map.supportCnt;
				vworkCnt = map.vworkCnt;
				regularCnt = map.regularCnt;
			}
		});
		
		
		am4core.ready(function() {

			// Themes begin
			am4core.useTheme(am4themes_animated);
			// Themes end

			// Create chart instance
			var chart = am4core.create("chartdiv", am4charts.PieChart);

			// Add data
			chart.data = [ {
			  "country": "일반기부",
			  "litres": donationCnt
			}, {
			  "country": "펀딩",
			  "litres": fundingCnt
			}, {
			  "country": "물품후원",
			  "litres": supportCnt
			}, {
			  "country": "함께헤요",
			  "litres": vworkCnt
			}, {
			  "country": "정기기부",
			  "litres": regularCnt
			}];

			// Add and configure Series
			var pieSeries = chart.series.push(new am4charts.PieSeries());
			pieSeries.dataFields.value = "litres";
			pieSeries.dataFields.category = "country";
			pieSeries.slices.template.stroke = am4core.color("#fff");
			pieSeries.slices.template.strokeOpacity = 1;

			// This creates initial animation
			pieSeries.hiddenState.properties.opacity = 1;
			pieSeries.hiddenState.properties.endAngle = -90;
			pieSeries.hiddenState.properties.startAngle = -90;

			chart.hiddenState.properties.radius = am4core.percent(0);


			});
		
		function regularCancelReq(boardNo, reqPage){
			if(confirm("정기후원 해지를 요청하시겠습니까?")){
				$.ajax({
					url : "/regularCancelRequest.don",
					data : {boardNo : boardNo},
					success : function(result){
						if(result>0){
							alert("해지 요청 되었습니다.");
							saveValue('regular', 0, reqPage, memberId);
						}
					},
					error : function(){
						
					}
				});				
			}
			
		}
		
		$('#dataModal').on('show.bs.modal', function(event) {
			var boardNo = $(event.relatedTarget).data('boardno');
			var type = $(event.relatedTarget).data('type');
			$("#negativeContent").val("");
			
			if(type != "company"){ //물품후원 거부사유를 보여줄 때
				$("#dataModalLabel").html("[거부 사유]");
				$.ajax({
					url : "/selectNegativeContentUser.don",
					data  : {boardNo : boardNo, type : type},
					success : function(content){
						if(content != "" && content != null && content != undefined){
							$("#negativeContent").val(content);						
						}
					},
					error : function(){
						
					}
				});				
			}else{ //기관 신청 사유를 보여줄 때
				$("#dataModalLabel").html("[신청 사유]");
				$.ajax({
					url : "/selectCompanyReqContent.don",
					data  : {boardNo : boardNo, type : type},
					success : function(content){
						if(content != "" && content != null && content != undefined){
							$("#negativeContent").val(content);
						}
					},
					error : function(){
						
					}
				});	
			}
		});
	</script>
</body>
</html>