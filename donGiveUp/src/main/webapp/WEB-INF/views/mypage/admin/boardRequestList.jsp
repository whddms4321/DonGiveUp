<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script>
		
</script>
<style>
	.search_btn{
		margin-left:10px;
		height:46px;
	}
	.search_wrap{
		width:600px;
		margin-top:50px;
		margin-bottom:30px;
	}
	.sort{
		 text-align:right;
		 margin-right:70px;
	}
	.th1, .th2, .th3, .th4, .th5, .th6, .th7, .th8{
		font-size : 20px;
		text-align:center;
		height :  50px;
		background-color : gray;
		border : 1px solid black;
	}
	.th1{
		width : 100px;
	}
	.th2{
		width : 150px;
	}
	.th3{
		width : 350px;
	}
	.th4{
		width : 150px;
	}
	.th5{
		width : 197px;
	}
	.th6{
		width : 197px;
	}
	.th7{
		width : 150px;
	}
	.th8{
		width : 100px;
	}
	td{
		height : 50px;
		text-align : center;
	}
	#pageNavi a, span{
		padding : 13px;
	}
	
</style>
</head>
<body>
	<!--  -->
	<jsp:include page="/WEB-INF/views/mypage/admin/dashboardHeader.jsp"/>
	
	<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
		<div class="col-md-6" >
			<div class="panel panel-default" style="width:1540px; height:1000px;">
				<div class="panel-body tabs">
					<ul class="nav nav-tabs">
						<li class="active"><a href="#tab1" data-toggle="tab">전체</a></li>
						<li><a href="#tab2" onclick="saveValue('donation', 1);" data-toggle="tab">기부</a></li>
						<li><a href="#tab3" onclick="saveValue('funding', 1);" data-toggle="tab">펀딩</a></li>
						<li><a href="#tab4" onclick="saveValue('vwork', 1);" data-toggle="tab">함께해요</a></li>
						<li><a href="#tab5" onclick="saveValue('support', 1);" data-toggle="tab">물품후원</a></li>
					</ul>
					<div class="tab-content" style="margin-left:50px;">
						<div class="tab-pane fade in active" id="tab1">
							<input type="hidden" id="prevRequest" value="${requestList}">
							<input type="hidden" id="prevSort" value="${sorting}">
							<form action="/boardRequestList.don" method="get">
								<input type="hidden" name="reqPage" value="1">
								<input type="hidden" name="type" value="all">
								<div class="search_wrap"><!-- 제목 입력 -->
									<input type="text" name="title" class="form-control" placeholder="제목 입력..." style="display:inline;" value="${title}">
									<input type="submit" value="검색" class="btn btn-md btn-primary search_btn">
								</div>
								<div>
									<div style="float:left;">
										<label><input type="radio" name="requestList" id="allRadio" value="">&nbsp; 전체</label>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<label><input type="radio" name="requestList" id="firstRadio" value="wait">&nbsp; 신청대기목록</label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<label><input type="radio" name="requestList" id="secondRadio" value="complete">&nbsp; 처리완료목록</label>
									</div>
									<div class="sort">
										<select id="sorting" name="sorting"  style="width:100px;">
											<option value="">정렬</option>
											<option value="date">날짜순</option>
											<option value="title">제목순</option>
										</select>
									</div>
								</div>
							</form>
							<div id="table" style="margin-top:50px;">
								<table border=1>
									<tr>
										<th class="th1">번호</th>
										<th class="th2">타입</th>
										<th class="th3">글제목</th>
										<th class="th4">담당자</th>
										<th class="th5">연락처</th>
										<th class="th6">이메일</th>
										<th class="th7">신청일자</th>
										<th class="th8">상태</th>
									</tr>
									<c:forEach items="${reqBoardList}" var="b" varStatus="s">
										<tr>
											<td>${s.count}</td>
											<td>${b.groupName}</td>
											<td>${b.boardTitle}</td>
											<td>${b.boardWriter}</td>
											<td>${b.memberPhone}</td>
											<td>${b.memberEmail}</td>
											<td>${b.startDate }</td>
											<c:if test="${b.boardState==0}">
												<td>
													<button type="button" name="yes">승인</button>
													<button type="button" name="no">거부</button>
												</td>
											</c:if>
											<c:if test="${b.boardState==1}">
												<td>
													<span>승인완료</span>
												</td>
											</c:if>
											<c:if test="${b.boardState==2}">
												<td>
													<span>거부</span>
												</td>
											</c:if>
										</tr>
									</c:forEach>
								</table>
							</div>
							<div id="pageNavi" style="text-align:center; margin-top:50px; ">
								${pageNavi}
							</div>
						</div>
						<div class="tab-pane fade" id="tab2"> <!-- 기부  tab2 누를 시 전부 구해와서 여기에 뿌려줌-->
							<form action="/boardRequestListEtc.don" id="donationForm" method="get">
								<!-- <input type="hidden" name="etcReqPage" value="1">  -->
								<input type="hidden" name="etcType" value="donation">
								<div class="search_wrap"><!-- 제목 입력 -->
									<input type="text" name="etcTitle" class="form-control" placeholder="제목 입력..." style="display:inline;">
									<input type="submit" value="검색" class="btn btn-md btn-primary search_btn">
								</div>
								<div>
									<div style="float:left;">
										<label><input type="radio" name="etcRequestList" id="etcAllRadio" value="">&nbsp; 전체</label>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<label><input type="radio" name="etcRequestList" id="etcFirstRadio" value="wait">&nbsp; 신청대기목록</label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<label><input type="radio" name="etcRequestList" id="etcSecondRadio" value="complete">&nbsp; 처리완료목록</label>
									</div>
									<div class="sort">
										<select id="etcSorting" name="etcSorting"  style="width:100px;">
											<option value="">정렬</option>
											<option value="date">날짜순</option>
											<option value="title">제목순</option>
										</select>
									</div>
								</div>
							</form>
							<!-- 
							<div id="table" style="margin-top:50px;">
								<table border=1>
									<tr>
										<th class="th1">번호</th>
										<th class="th3">글제목</th>
										<th class="th4">담당자</th>
										<th class="th5">연락처</th>
										<th class="th6">이메일</th>
										<th class="th7">신청일자</th>
										<th class="th8">상태</th>
									</tr>
									<c:forEach items="${reqBoardList}" var="b" varStatus="s">
										<tr>
											<td>${s.count}</td>
											<td>${b.groupName}</td>
											<td>${b.boardTitle}</td>
											<td>${b.boardWriter}</td>
											<td>${b.memberPhone}</td>
											<td>${b.memberEmail}</td>
											<td>${b.startDate }</td>
											<c:if test="${b.boardState==0}">
												<td>
													<button type="button" name="yes">승인</button>
													<button type="button" name="no">거부</button>
												</td>
											</c:if>
											<c:if test="${b.boardState==1}">
												<td>
													<span>승인완료</span>
												</td>
											</c:if>
											<c:if test="${b.boardState==2}">
												<td>
													<span>거부</span>
												</td>
											</c:if>
										</tr>
									</c:forEach>
								</table>
							</div>
							<div id="pageNavi" style="text-align:center; margin-top:50px; ">
								${pageNavi}
							</div> -->
						</div>
						
						<div class="tab-pane fade" id="tab3">
							<h4>펀딩</h4>
							<div class="search_wrap"><!-- 제목 입력 -->
								<input type="text" name="title" class="form-control" placeholder="제목 입력...">
								<input type="submit" value="검색" class="btn btn-md btn-primary search_btn">
							</div>
							<div>
								<div style="float:left;">
									<label><input type="radio" name="requestList" checked>&nbsp; 신청대기목록</label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<label><input type="radio" name="requestList">&nbsp; 처리완료목록</label>
								</div>
								<div class="sort">
									<select name="sorting"  style="width:100px;">
										<option>정렬</option>
										<option value="dateSort">날짜순</option>
										<option value="titleSort">제목순</option>
									</select>
								</div>
							</div>
						</div>
						<div class="tab-pane fade" id="tab4">
							<h4>함께해요</h4>
							<div class="search_wrap"><!-- 제목 입력 -->
								<input type="text" name="title" class="form-control" placeholder="제목 입력...">
								<input type="submit" value="검색" class="btn btn-md btn-primary search_btn">
							</div>
							<div>
								<div style="float:left;">
									<label><input type="radio" name="requestList" checked>&nbsp; 신청대기목록 </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<label><input type="radio" name="requestList">&nbsp; 처리완료목록 </label>
								</div>
								<div class="sort">
									<select name="sorting"  style="width:100px;">
										<option>정렬</option>
										<option value="dateSort">날짜순</option>
										<option value="titleSort">제목순</option>
									</select>
								</div>
							</div>
						</div>
						<div class="tab-pane fade" id="tab5">
							<h4>물품후원</h4>
							<div class="search_wrap"><!-- 제목 입력 -->
								<input type="text" name="title" class="form-control" placeholder="제목 입력...">
								<input type="submit" value="검색" class="btn btn-md btn-primary search_btn">
							</div>
							<div>
								<div style="float:left;">
									<label><input type="radio" name="requestList" checked>&nbsp; 신청대기목록</label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<label><input type="radio" name="requestList">&nbsp; 처리완료목록</label>
								</div>
								<div class="sort">
									<select name="sorting"  style="width:100px;">
										<option>정렬</option>
										<option value="dateSort">날짜순</option>
										<option value="titleSort">제목순</option>
									</select>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!--/.panel-->
		</div>
	</div>
	<script>
	
	
		//검색 결과의 페이징 번호를 누를 때 호출됨
		$(function(){
			//이전에 선택한 radio 적용
			if($("#prevRequest").val() == "wait"){
				$("#firstRadio").prop('checked',true);
			}else if($("#prevRequest").val() == "complete"){
				$("#secondRadio").prop('checked',true);
			}else{
				$("#allRadio").prop('checked',true);
			}
			
			//이전에 선택한 정렬 적용
			if($("#prevSort").val() == "date"){
				$("#sorting").val("date").prop("selected", true);
			}else if($("#prevSort").val() == "title"){
				$("#sorting").val("title").prop("selected", true);
			}else{
				$("#sorting").val("").prop("selected", true);
			}
			
		});
				
		function pageMove(obj, reqPage){
				
				var type = $(obj).parent().parent().find("input[name=type]").val(); //게시글 타입
				var title = $(obj).parent().parent().find("input[name=title]").val(); //게시글 입력 제목
				var requestList = $("#prevRequest").val(); //신청대기 OR 처리완료				
				var sorting = $("#prevSort").val(); //정렬
				
				console.log(sorting);
				if(sorting=="정렬"){
					console.log("true");
					sorting = "date";
				}
				
				$.ajax({
					url : "/boardRequestListAjax.don",
					data : {reqPage : reqPage, type : type, title : title, requestList : requestList, sorting : sorting},
					success : function(data){
						var boardList = data.list;
						var pageNavi = data.pageNavi;
						$("#table").children().children().remove(); //테이블의 모든행 삭제
						var html ="";
						html += "<tr><th class='th1'>번호</th><th class='th2'>타입</th><th class='th3'>글제목</th><th class='th4'>담당자</th><th class='th5'>연락처</th><th class='th6'>이메일</th><th class='th7'>신청일자</th><th class='th8'>상태</th></tr>"
						for(var i=0; i<boardList.length; i++){
							html += "<tr><td>"+((reqPage-1)*5+1+i)+"</td><td>"+boardList[i].groupName+"</td>";
							html += "<td>"+boardList[i].boardTitle+"</td><td>"+boardList[i].boardWriter+"</td>";
							html += "<td>"+boardList[i].memberPhone+"</td><td>"+boardList[i].memberEmail+"</td>";
							html += "<td>"+boardList[i].startDate+"</td>";
							if(boardList[i].boardState == 0){
								html += "<td><button type='button' name='yes'>승인</button><button type='button' name='no'>거부</button></td></tr>";
							}else if(boardList[i].boardState == 1){
								html += "<td><span>승인완료</span></td></tr>";
							}else if(boardList[i].boardState == 2){
								html += "<td><a href='#'>거부</a></td></tr>";
							}
							
						}
						$("#table").children().append(html);
						$(obj).parent().children().remove(); //pageNavi 삭제 
						$("#pageNavi").append(pageNavi); //새로운 pageNavi 추가
					},
					error : function(){
						console.log("ajax 실패");
					}
				});
		}
		
		//!!!! form 태그도 어차피 prevent를 막고 onclick시 해당 함수로 와야 하는데 굳이 form 태그를 사용해야 하는지 의문!?
		//'전체 '탭을 제외한 나머지 탭을 눌렀을 경우, 검색버튼 눌렀을 경우, 페이지번호 눌렀을 경우 선택값 저장하는 함수
		//첫 로드, 검색 버튼, 페이지 번호 누를 시  선택값 저장하는 함수 호출 -> 글 타입, 페이지번호를 매개변수로 전달! 첫 로드와 검색 버튼시는 무조건 페이지번호 1! 각 페이지 번호 클릭시는 각 페이지 번호 전달
		//선택값 저장하는 함수 -> ajax 함수 호출! 매개변수로 값들을 전달 (글 타입, 구분자, 요청페이지, 글제목, 구분, 정렬)
		//ajax 실행하는 함수(타입에 따른 동적 쿼리, 타입에 관계없이 받을 수 있는 VO 필요, 결과값을 각 탭에 보여줄 수 있어야하고 보여주기 전 각 탭의 모든 테이블 내용 제거) 
		//각 탭에서 겁색 옵션 지정 후 검색 버튼 눌렀을 때
		function saveValue(type, reqPage){
			if(type == "donation"){ //기부 탭을 눌렀을 경우
				if($("#donationForm").find("input[name=etcTitle]").val() == ""){
					console.log("title is '' ");
				}
				if($("#donationForm").find("input[name=etcRequestList]").val() == ""){
					console.log("requesetList is '' ");
				}
				if($("#donationForm").find("#etcSorting").prop("selected", true).val() == ""){
					console.log("sort is '' ");
				}
			
				var obj = {"etcType" : type, "etcReqPage" : reqPage,
					//etcReqPage : $("#donationForm").find("input[name=etcReqPage]").val(),
					"etcTitle": $("#donationForm").find("input[name=etcTitle]").val(),
					"etcRequestList" : $("#donationForm").find("input[name=etcRequestList]").val(),
					"etcSorting" : $("#donationForm").find("#etcSorting").prop("selected", true).val()
					};
				
				console.log("etc 요청페이지: " + obj.etcReqPage);
				console.log("etc 요청글제목 " + $("#donationForm").find("input[name=etcTitle]").val());
				console.log("etc 요청처리구분  " + $("#donationForm").find("input[name=etcRequestList]").val());
				console.log("etc 요청정렬 " + $("#donationForm").find("#etcSorting").prop("selected", true).val());
				console.log("타입 1 : " + typeof(obj));
				ajaxFunc(obj);
				
			}else if(type == "funding"){
				
			}else if(type == "vwork"){
				
			}else if(type == "support"){
				
			}
		}
		
		//선택값과 타입에 따른 ajax를 호출하기 위한 함수
		function ajaxFunc(obj){
			console.log("타입 2 : " + typeof(obj));
			
			$.ajax({
				type : "POST",
				url : "/boardRequestListEtc.don",
				dataType : "json",
				data : JSON.stringify(obj),
				contentType : "application/json; charset=utf-8",
				success : function(data){
					console.log("etc Ajax 성공!!!!!!!!!!!!!");
				},
				error : function(){
					console.log("etc Ajax 실팽");
				}
			});
		}
	</script>
</body>
</html>