<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 등록 신청목록</title>
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
	}
	#sorting{
		padding:10px;
	}
	.th1, .th2, .th3, .th4, .th5, .th6, .th7, .th8{
		font-size : 20px;
		text-align:center;
		height :  50px;
		background-color : #F1F1F1;
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
		width : 187px;
	}
	.th6{
		width : 187px;
	}
	.th7{
		width : 130px;
	}
	.th8{
		width : 150px;
	}
	td{
		height : 50px;
		line-height : 50px;
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
						<li><a href="#tab6" onclick="saveValue('regular', 1);" data-toggle="tab">정기후원</a></li>
					</ul>
					<div class="tab-content" style="margin-left:50px; padding-right:70px;">
						<div class="tab-pane fade in active" id="tab1">
							<input type="hidden" id="prevRequest" value="${requestList}">
							<input type="hidden" id="prevSort" value="${sorting}">
							<form action="/boardRequestList.don" method="get">
								<input type="hidden" name="reqPage" value="1">
								<input type="hidden" name="type" value="all">
								<div class="search_wrap form-inline"><!-- 제목 입력 -->
									<input type="text" name="title" class="form-control" placeholder="제목 입력..." style="width:500px; float:left;" value="${title}">
									<input type="submit" value="검색" class="btn btn-md btn-primary search_btn">
								</div>
								<div>
									<div style="float:left;">
										<label><input type="radio" name="requestList" id="allRadio" value="">&nbsp; 전체</label>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<label><input type="radio" name="requestList" id="firstRadio" value="wait">&nbsp; 신청대기목록</label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<label><input type="radio" name="requestList" id="secondRadio" value="complete">&nbsp; 처리완료목록</label>
									</div>
									<div class="sort" >
										<select id="sorting"  name="sorting"  style="width:100px;">
											<option value="">정렬</option>
											<option value="date">날짜순</option>
											<option value="title">제목순</option>
										</select>
									</div>
								</div>
							</form>
							<div id="table" style="margin-top:50px;">
								<table class="table">
									<tr>
										<th class="th1">번호</th>
										<th class="th2">타입</th>
										<th class="th3">글제목</th>
										<th class="th4">담당자</th>
										<th class="th5">연락처</th>
										<th class="th6">이메일</th>
										<th class="th7">신청/승인일</th>
										<th class="th8">상태</th>
									</tr>
									<c:forEach items="${reqBoardList}" var="b" varStatus="s">
										<tr>
											<td>${s.count}</td>
											<td>${b.groupName}</td>
											<td><a href="#">${b.boardTitle}</a></td>
											<td>${b.boardWriter}</td>
											<td>${b.memberPhone}</td>
											<td>${b.memberEmail}</td>
											<td>${b.startDate }</td>
											<c:if test="${b.boardState==0}">
												<td>
													<!-- 거부 버튼 클릭 시 Modal! data-변수명  에서 변수명에 대문자 들어가면 안됨 -->
													<c:if test="${b.groupName == '기부'}">
														<button type="button" class="btn btn-sm btn-primary" name="yes" onclick="boardConfirm(${b.boardKey}, 'donation', 'all');">승인</button>
														<button class="btn btn-sm btn-danger" data-toggle="modal" data-target="#dataModal" data-key="${b.boardKey}" data-type="donation" data-state="all" type="button">거부</button>
													</c:if>
													<c:if test="${b.groupName == '펀딩'}">
														<button type="button" class="btn btn-sm btn-primary" name="yes" onclick="boardConfirm(${b.boardKey}, 'funding', 'all');">승인</button>
														<button class="btn btn-sm btn-danger" data-toggle="modal" data-target="#dataModal" data-key="${b.boardKey}" data-type="funding" data-state="all" type="button">거부</button>
													</c:if>
													<c:if test="${b.groupName == '함께해요'}">
														<button type="button" class="btn btn-sm btn-primary" name="yes" onclick="boardConfirm(${b.boardKey}, 'vwork', 'all');">승인</button>
														<button class="btn btn-sm btn-danger" data-toggle="modal" data-target="#dataModal" data-key="${b.boardKey}" data-type="vwork" data-state="all" type="button">거부</button>
													</c:if>
													<c:if test="${b.groupName == '물품후원'}">
														<button type="button" class="btn btn-sm btn-primary" name="yes" onclick="boardConfirm(${b.boardKey}, 'support', 'all');">승인</button>
														<button class="btn btn-sm btn-danger" data-toggle="modal" data-target="#dataModal" data-key="${b.boardKey}" data-type="support" data-state="all" type="button">거부</button>
													</c:if>
													<c:if test="${b.groupName == '정기후원'}">
														<button type="button" class="btn btn-sm btn-primary" name="yes" onclick="boardConfirm(${b.boardKey}, 'regular', 'all');">승인</button>
														<button class="btn btn-sm btn-danger" data-toggle="modal" data-target="#dataModal" data-key="${b.boardKey}" data-type="regular" data-state="all" type="button">거부</button>
													</c:if>
												</td>
											</c:if>
											<c:if test="${b.boardState==1}">
												<td>
													<span>승인완료</span>
												</td>
											</c:if>
											<c:if test="${b.boardState==2}">
												<td>
													<c:if test="${b.groupName == '기부'}">
														<a href="#dataModal" data-toggle="modal" data-target="#dataModal" data-key="${b.boardKey}" data-type="donation" data-state="show">거부</a>
													</c:if>
													<c:if test="${b.groupName == '펀딩'}">
														<a href="#dataModal" data-toggle="modal" data-target="#dataModal" data-key="${b.boardKey}" data-type="funding" data-state="show">거부</a>
													</c:if>
													<c:if test="${b.groupName == '함께해요'}">
														<a href="#dataModal" data-toggle="modal" data-target="#dataModal" data-key="${b.boardKey}" data-type="vwork" data-state="show">거부</a>
													</c:if>
													<c:if test="${b.groupName == '물품후원'}">
														<a href="#dataModal" data-toggle="modal" data-target="#dataModal" data-key="${b.boardKey}" data-type="support" data-state="show">거부</a>
													</c:if>
													<c:if test="${b.groupName == '정기후원'}">
														<a href="#dataModal" data-toggle="modal" data-target="#dataModal" data-key="${b.boardKey}" data-type="regular" data-state="show">거부</a>
													</c:if>
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
							<div id="donationForm">
								<!-- <input type="hidden" name="etcReqPage" value="1">  -->
								<input type="hidden" name="etcType" value="donation">
								<div class="search_wrap form-inline"><!-- 제목 입력 -->
									<input type="text" name="etcTitle" class="form-control" placeholder="제목 입력..." style="width:500px;">
									<input type="button" value="검색" class="btn btn-md btn-primary search_btn" onclick="saveValue('donation', 1);">
								</div>
								<div>
									<div style="float:left;">
										<input type="hidden" value="donation">
										<div id="donationDiv"></div>
										<label><input type="radio" name="etcRequestList" id="etcAllRadio" value="">&nbsp; 전체</label>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<label><input type="radio" name="etcRequestList" id="etcFirstRadio" value="wait">&nbsp; 신청대기목록</label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<label><input type="radio" name="etcRequestList" id="etcSecondRadio" value="complete">&nbsp; 처리완료목록</label>
									</div>
									<div class="sort">
										<select id="etcSorting" name="etcSorting"  style="padding:10px; width:100px;">
											<option value="">정렬</option>
											<option value="date">날짜순</option>
											<option value="title">제목순</option>
										</select>
									</div>
								</div>
							</div>
							<div id="donationTable" style="margin-top : 50px;">
								<table class="table">
									<tr>
										<th class="th1">번호</th>
										<th class="th3">글제목</th>
										<th class="th4">담당자</th>
										<th class="th5">연락처</th>
										<th class="th6">이메일</th>
										<th class="th7">신청/승인일</th>
										<th class="th8">상태</th>
									</tr>
								</table>
							</div>
							<div id="donationpageNavi" style="text-align:center; margin-top:50px; ">
							</div>
						</div>
						
						<div class="tab-pane fade" id="tab3">
							<div id="fundingForm">
								<!-- <input type="hidden" name="etcReqPage" value="1">  -->
								<input type="hidden" name="etcType" value="funding">
								<div class="search_wrap form-inline"><!-- 제목 입력 -->
									<input type="text" name="etcTitle" class="form-control" placeholder="제목 입력..." style="width:500px;">
									<input type="button" value="검색" class="btn btn-md btn-primary search_btn" onclick="saveValue('funding', 1);">
								</div>
								<div>
									<div style="float:left;">
										<input type="hidden" value="funding">
										<div id="fundingDiv"></div>
										<label><input type="radio" name="etcRequestList" id="etcAllRadio" value="">&nbsp; 전체</label>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<label><input type="radio" name="etcRequestList" id="etcFirstRadio" value="wait">&nbsp; 신청대기목록</label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<label><input type="radio" name="etcRequestList" id="etcSecondRadio" value="complete">&nbsp; 처리완료목록</label>
									</div>
									<div class="sort">
										<select id="etcSorting" name="etcSorting"  style="padding:10px; width:100px;">
											<option value="">정렬</option>
											<option value="date">날짜순</option>
											<option value="title">제목순</option>
										</select>
									</div>
								</div>
							</div>
							<div id="fundingTable" style="margin-top : 50px;">
								<table class="table">
									<tr>
										<th class="th1">번호</th>
										<th class="th3">글제목</th>
										<th class="th4">담당자</th>
										<th class="th5">연락처</th>
										<th class="th6">이메일</th>
										<th class="th7">신청/승인일</th>
										<th class="th8">상태</th>
									</tr>
								</table>
							</div>
							<div id="fundingpageNavi" style="text-align:center; margin-top:50px; ">
							</div>
						</div>
						
						<div class="tab-pane fade" id="tab4">
							<div id="vworkForm">
								<!-- <input type="hidden" name="etcReqPage" value="1">  -->
								<input type="hidden" name="etcType" value="vwork">
								<div class="search_wrap form-inline"><!-- 제목 입력 -->
									<input type="text" name="etcTitle" class="form-control" placeholder="제목 입력..." style="width:500px;">
									<input type="button" value="검색" class="btn btn-md btn-primary search_btn" onclick="saveValue('vwork', 1);">
								</div>
								<div>
									<div style="float:left;">
										<input type="hidden" value="vwork">
										<div id="vworkDiv"></div>
										<label><input type="radio" name="etcRequestList" id="etcAllRadio" value="">&nbsp; 전체</label>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<label><input type="radio" name="etcRequestList" id="etcFirstRadio" value="wait">&nbsp; 신청대기목록</label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<label><input type="radio" name="etcRequestList" id="etcSecondRadio" value="complete">&nbsp; 처리완료목록</label>
									</div>
									<div class="sort">
										<select id="etcSorting" name="etcSorting"  style="padding:10px; width:100px;">
											<option value="">정렬</option>
											<option value="date">날짜순</option>
											<option value="title">제목순</option>
										</select>
									</div>
								</div>
							</div>
							<div id="vworkTable" style="margin-top : 50px;">
								<table class="table">
									<tr>
										<th class="th1">번호</th>
										<th class="th3">글제목</th>
										<th class="th4">담당자</th>
										<th class="th5">연락처</th>
										<th class="th6">이메일</th>
										<th class="th7">신청/승인일</th>
										<th class="th8">상태</th>
									</tr>
								</table>
							</div>
							<div id="vworkpageNavi" style="text-align:center; margin-top:50px; ">
							</div>
						</div>
						<div class="tab-pane fade" id="tab5">
							<div id="supportForm">
								<!-- <input type="hidden" name="etcReqPage" value="1">  -->
								<input type="hidden" name="etcType" value="support">
								<div id="supportDiv"></div>
								<div class="search_wrap form-inline"><!-- 제목 입력 -->
									<input type="text" name="etcTitle" class="form-control" placeholder="제목 입력..." style="width:500px;">
									<input type="button" value="검색" class="btn btn-md btn-primary search_btn" onclick="saveValue('support', 1);">
								</div>
								<div>
									<div style="float:left;">
										<input type="hidden" value="support">
										<label><input type="radio" name="etcRequestList" id="etcAllRadio" value="">&nbsp; 전체</label>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<label><input type="radio" name="etcRequestList" id="etcFirstRadio" value="wait">&nbsp; 신청대기목록</label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<label><input type="radio" name="etcRequestList" id="etcSecondRadio" value="complete">&nbsp; 처리완료목록</label>
									</div>
									<div class="sort">
										<select id="etcSorting" name="etcSorting" style="padding:10px; width:100px;">
											<option value="">정렬</option>
											<option value="date">날짜순</option>
											<option value="title">제목순</option>
										</select>
									</div>
								</div>
							</div>
							<div id="supportTable" style="margin-top : 50px;">
								<table class="table">
									<tr>
										<th class="th1">번호</th>
										<th class="th3">글제목</th>
										<th class="th4">담당자</th>
										<th class="th5">연락처</th>
										<th class="th6">이메일</th>
										<th class="th7">신청/승인일</th>
										<th class="th8">상태</th>
									</tr>
								</table>
							</div>
							<div id="supportpageNavi" style="text-align:center; margin-top:50px; ">
							</div>
						</div>
						
						<div class="tab-pane fade" id="tab6">
							<div id="regularForm">
								<!-- <input type="hidden" name="etcReqPage" value="1">  -->
								<input type="hidden" name="etcType" value="regular">
								<div class="search_wrap form-inline"><!-- 제목 입력 -->
									<input type="text" name="etcTitle" class="form-control" placeholder="제목 입력..." style="width:500px;">
									<input type="button" value="검색" class="btn btn-md btn-primary search_btn" onclick="saveValue('regular', 1);">
								</div>
								<div>
									<div style="float:left;">
										<input type="hidden" value="regular">
										<div id="regularDiv"></div>
										<label><input type="radio" name="etcRequestList" id="etcAllRadio" value="">&nbsp; 전체</label>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<label><input type="radio" name="etcRequestList" id="etcFirstRadio" value="wait">&nbsp; 신청대기목록</label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<label><input type="radio" name="etcRequestList" id="etcSecondRadio" value="complete">&nbsp; 처리완료목록</label>
									</div>
									<div class="sort">
										<select id="etcSorting" name="etcSorting" style="padding:10px; width:100px;">
											<option value="">정렬</option>
											<option value="date">날짜순</option>
											<option value="title">제목순</option>
										</select>
									</div>
								</div>
							</div>
							<div id="regularTable" style="margin-top : 50px;">
								<table class="table">
									<tr>
										<th class="th1">번호</th>
										<th class="th3">글제목</th>
										<th class="th4">담당자</th>
										<th class="th5">연락처</th>
										<th class="th6">이메일</th>
										<th class="th7">신청/승인일</th>
										<th class="th8">상태</th>
									</tr>
								</table>
							</div>
							<div id="regularpageNavi" style="text-align:center; margin-top:50px; ">
							</div>
						</div>
					</div>
				</div>
			</div>
			<!--/.panel-->
		</div>
		
   		 <!-- Modal -->
		<div class="modal fade" id="dataModal" tabindex="-1" role="dialog" aria-labelledby="dataModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-sm" style="width:500px;">
				<div class="modal-content">
					<div class="modal-header">
						<!-- X 버튼 -->
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span><span class="sr-only"></span>
						</button>
						<!-- 제목 -->
						<h3 class="modal-title" id="dataModalLabel" style="font-weight:bold;">[거부 사유를 작성하세요]</h3>
					</div>
					<div class="modal-body" style="height:400px;">
						<textarea id="negativeContent" class="form-control" rows="18" cols="64" style="resize:none;"></textarea>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
						<button type="button" id="closeBtn" class="btn btn-primary" onclick="negativeRequestBoard();">전송</button>
					</div>
				</div>
			</div>
		</div>
		
	</div>
	<script>
		//----------------------------------------------------------------Modal---------------------------------------------------------
		//조회해온 값을 가지고 
		var boardKey="";
		var type="";
		var state="";
		//Modal창이 열렸을 때 해당 게시글의 타입과, 번호를 조회해 옴.
		$('#dataModal').on('show.bs.modal', function(event) {
			$("#negativeContent").val(""); //textarea 값 비워주기
            boardKey = $(event.relatedTarget).data('key');
            type = $(event.relatedTarget).data('type');
            state = $(event.relatedTarget).data('state');
            
            if(state == "show"){
            	negativeShow(boardKey, type);	
            }else if(state == undefined){
            	$("#negativeContent").prop("readonly",false);
            }
            console.log(boardKey);
            console.log(type);
            console.log(state);
        });
		//작성한 거부사유를 확인하고 싶을 때
		function negativeShow(boardKey, type){
			$.ajax({
				url : "/selectNegativeContent.don",
				data : {boardKey : boardKey, type : type},
				success : function(data){
					$("#closeBtn").remove();
					$("#dataModalLabel").html("");
					$("#dataModalLabel").html("[거부 사유 확인]");
					$("#negativeContent").val("");
					$("#negativeContent").val(data);
					$("#negativeContent").prop("readonly",true);
				},
				error : function(){
					alert("거부 사유 불러오는거 실패함~");
				}
			});
		}
		
		//거부사유를 작성하고 확인 버튼을 눌렀을 때
		function negativeRequestBoard(){
			var content = $("#negativeContent").val();
			
			if(content == "" || content == null){
				alert("거부 사유를 작성해주세요~");
				return false;
			}
			
			$.ajax({
				url : "/negativeRequestBoard.don",
				data : {boardKey : boardKey, type : type, content : content},
				success : function(result){
					if(result>0 && state==undefined){
						alert("거부사유가 작성되었습니다.");
						$("#dataModal").modal("hide");
						saveValue(type, 1);
					}else if(result>0 && state=="all"){
						alert("거부사유가 작성되었습니다.");
						$("form").submit();
					}
				},
				error : function(){
					alert("니가 뭔데 거부해ㅋ");
				}
			});
		}
		//----------------------------------------------------------------'전체'탭--------------------------------------------------------
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
		
		//각 페이지 번호 클릭 시 호출
		function pageMove(obj, reqPage){
				var type = $(obj).parent().parent().find("input[name=type]").val(); //게시글 타입
				var title = $(obj).parent().parent().find("input[name=title]").val(); //게시글 입력 제목
				var requestList = $("#prevRequest").val(); //신청대기 OR 처리완료				
				var sorting = $("#prevSort").val(); //정렬
				
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
						html += "<tr><th class='th1'>번호</th><th class='th2'>타입</th><th class='th3'>글제목</th><th class='th4'>담당자</th><th class='th5'>연락처</th><th class='th6'>이메일</th><th class='th7'>신청/승인일</th><th class='th8'>상태</th></tr>"
						for(var i=0; i<boardList.length; i++){
							html += "<tr><td>"+((reqPage-1)*10+1+i)+"</td><td>"+boardList[i].groupName+"</td>";
							html += "<td><a href='#'>"+boardList[i].boardTitle+"</a></td><td>"+boardList[i].boardWriter+"</td>";
							html += "<td>"+boardList[i].memberPhone+"</td><td>"+boardList[i].memberEmail+"</td>";
							html += "<td>"+boardList[i].startDate+"</td>";
							if(boardList[i].boardState == 0){
								html += "<td><button type='button' name='yes' class='btn btn-sm btn-primary' onclick='boardConfirm(";
								html += boardList[i].boardKey;
								if(boardList[i].groupName == "기부"){
									html += ", `donation`, `all`);'>승인</button>";
									html += "<button type='button' class='btn btn-sm btn-danger' data-toggle='modal' data-target='#dataModal' data-key='" + boardList[i].boardKey + "' data-state='all' data-type='donation'>거부</button></td></tr>";
								}else if(boardList[i].groupName == "펀딩"){
									html += ", `funding`, `all`);'>승인</button>";
									html += "<button type='button' class='btn btn-sm btn-danger' data-toggle='modal' data-target='#dataModal' data-key='" + boardList[i].boardKey + "' data-state='all' data-type='funding'>거부</button></td></tr>";
								}else if(boardList[i].groupName == "함께해요"){
									html += ", `vwork`, `all`);'>승인</button>";
									html += "<button type='button' class='btn btn-sm btn-danger' data-toggle='modal' data-target='#dataModal' data-key='" + boardList[i].boardKey + "' data-state='all' data-type='vwork'>거부</button></td></tr>";
								}else if(boardList[i].groupName == "물품후원"){
									html += ", `support`, `all`);'>승인</button>";
									html += "<button type='button' class='btn btn-sm btn-danger' data-toggle='modal' data-target='#dataModal' data-key='" + boardList[i].boardKey + "' data-state='all' data-type='support'>거부</button></td></tr>";
								}else if(boardList[i].groupName == "정기후원"){
									html += ", `regular`, `all`);'>승인</button>";
									html += "<button type='button' class='btn btn-sm btn-danger' data-toggle='modal' data-target='#dataModal' data-key='" + boardList[i].boardKey + "' data-state='all' data-type='regular'>거부</button></td></tr>";
								}
							}else if(boardList[i].boardState == 1){
								html += "<td><span>승인완료</span></td></tr>";
							}else if(boardList[i].boardState == 2){
								html += "<td>";
								if(boardList[i].groupName == "기부"){
									html += '<a href="#dataModal" data-toggle="modal" data-target="#dataModal" data-key="'+boardList[i].boardKey+'" data-type="donation" data-state="show">거부</a></td></tr>';
								}else if(boardList[i].groupName == "펀딩"){
									html += '<a href="#dataModal" data-toggle="modal" data-target="#dataModal" data-key="'+boardList[i].boardKey+'" data-type="funding" data-state="show">거부</a></td></tr>';
								}else if(boardList[i].groupName == "함께해요"){
									html += '<a href="#dataModal" data-toggle="modal" data-target="#dataModal" data-key="'+boardList[i].boardKey+'" data-type="vwork" data-state="show">거부</a></td></tr>';
								}else if(boardList[i].groupName == "물품후원"){
									html += '<a href="#dataModal" data-toggle="modal" data-target="#dataModal" data-key="'+boardList[i].boardKey+'" data-type="support" data-state="show">거부</a></td></tr>';
								}else if(boardList[i].groupName == "정기후원"){
									html += '<a href="#dataModal" data-toggle="modal" data-target="#dataModal" data-key="'+boardList[i].boardKey+'" data-type="regular" data-state="show">거부</a></td></tr>';
								}		
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
		//-------------------------------------------------------'기부,펀딩,물품후원,함께해요'탭--------------------------------------------------
		
		//신청대기목록, 처리완료목록의 radio버튼 값이 바뀔 때, 날짜순,제목순 정렬 방법이 바뀔 때마다 saveValue()를 호출하고, 타입값과 요청페이지를 매개변수로 전달
		$("input[name=etcRequestList]").change(function(){
			saveValue($(this).parent().parent().children().first().val(), 1);
		});
		$(".sort").children().change(function(){
			saveValue($(this).parent().prev().children().first().val(), 1);
		});
		
		//!!!! form 태그도 어차피 prevent를 막고 onclick시 해당 함수로 와야 하는데 굳이 form 태그를 사용해야 하는지 의문!?
		//'전체 '탭을 제외한 나머지 탭을 눌렀을 경우, 검색버튼 눌렀을 경우, 페이지번호 눌렀을 경우 선택값 저장하는 함수
		//첫 로드, 검색 버튼, 페이지 번호 누를 시  선택값 저장하는 함수 호출 -> 글 타입, 페이지번호를 매개변수로 전달! 첫 로드와 검색 버튼시는 무조건 페이지번호 1! 각 페이지 번호 클릭시는 각 페이지 번호 전달
		//선택값 저장하는 함수 -> ajax 함수 호출! 매개변수로 값들을 전달 (글 타입, 구분자, 요청페이지, 글제목, 구분, 정렬)
		//ajax 실행하는 함수(타입에 따른 동적 쿼리, 타입에 관계없이 받을 수 있는 VO 필요, 결과값을 각 탭에 보여줄 수 있어야하고 보여주기 전 각 탭의 모든 테이블 내용 제거) 		
		//해당 타입에 따라 각각의 하위 태그들의 값을 Controller에게 넘겨주기 위한 사전 작업
		//타입에 따라 다른 태그의 값을 읽어와야 하는데 중복되는 다중 if를 문자열을 합치는 방법으로 해결
		function saveValue(type, reqPage){
			var checkedReq = $("#"+type+"Form").find("input[name=etcRequestList]:checked").val();
		console.log(checkedReq);
			if(checkedReq == undefined || checkedReq == ""){
				$("#"+type+"Div").next().children().prop("checked",true)
			}else if(checkedReq == "wait"){
				$("#"+type+"Div").next().next().children().prop("checked",true);
			}else{
				$("#"+type+"Div").next().next().next().children().prop("checked",true);
			}
			
			var obj = {"etcType" : type, "etcReqPage" : reqPage,
				"etcTitle": $("#"+type+"Form").find("input[name=etcTitle]").val(),
				"etcRequestList" : checkedReq,
				"etcSorting" : $("#"+type+"Form").find("#etcSorting").prop("selected", true).val()
				};			
			ajaxFunc(obj);
		}
		
		//선택값과 타입에 따른 ajax를 호출하기 위한 함수
		//객체를 문자열 형태로 넘기기 위해 JSON.stringify() 적용 -> Controller에서 @RequestBody HashMap<String,Object>로 받음.
		//JSON 형식이란걸 Controller에게 알려주기 위한 contentType과 charset을 이용해 인코딩
		function ajaxFunc(obj){
			$.ajax({
				type : "POST",
				url : "/boardRequestListEtc.don",
				dataType : "json",
				data : JSON.stringify(obj),
				contentType : "application/json; charset=utf-8",
				success : function(data){
					var html = "";
					var list = data.list;
					var pageNavi = data.pageNavi;
					console.log(list);
					for(var i=0; i<list.length; i++ ){
						//구해온 행(tr)을 페이지 변경 시 삭제해주기 위해 newTr이란 클래스명을 할당
						//각 행의 번호를 요청 reqPage와 i값을 이용해서 넘버링 했음
						html += "<tr class='newTr'><td>"+((obj.etcReqPage-1)*10+1+i)+"</td>";
						html += "<td><a href='#'>"+list[i].boardTitle+"</a></td><td>"+list[i].boardWriter+"</td>";
						html += "<td>"+list[i].memberPhone+"</td><td>"+list[i].memberEmail+"</td>";
						html += "<td>"+list[i].startDate+"</td>";
						
						if(list[i].boardState == 0){
							html += "<td><button type='button' name='yes'  class='btn btn-sm btn-primary' onclick='boardConfirm(";
							html += list[i].boardKey;
							if(list[i].groupName == "기부"){
								html += ", `donation`);'>승인</button>";
								html += "<button type='button' class='btn btn-sm btn-danger' data-toggle='modal' data-target='#dataModal' data-key='" + list[i].boardKey + "' data-type='donation'>거부</button></td></tr>";
							}else if(list[i].groupName == "펀딩"){
								html += ", `funding`);'>승인</button>";
								html += "<button type='button' class='btn btn-sm btn-danger' data-toggle='modal' data-target='#dataModal' data-key='" + list[i].boardKey + "' data-type='funding'>거부</button></td></tr>";
							}else if(list[i].groupName == "함께해요"){
								html += ", `vwork`);'>승인</button>";
								html += "<button type='button' class='btn btn-sm btn-danger' data-toggle='modal' data-target='#dataModal' data-key='" + list[i].boardKey + "' data-type='vwork'>거부</button></td></tr>";
							}else if(list[i].groupName == "물품후원"){
								html += ", `support`);'>승인</button>";
								html += "<button type='button' class='btn btn-sm btn-danger' data-toggle='modal' data-target='#dataModal' data-key='" + list[i].boardKey + "' data-type='support'>거부</button></td></tr>";
							}else if(list[i].groupName == "정기후원"){
								html += ", `regular`);'>승인</button>";
								html += "<button type='button' class='btn btn-sm btn-danger' data-toggle='modal' data-target='#dataModal' data-key='" + list[i].boardKey + "' data-type='regular'>거부</button></td></tr>";
							}
						}else if(list[i].boardState == 1){
							html += "<td><span>승인완료</span></td></tr>";
						}else if(list[i].boardState == 2){
							html += "<td>";
							if(list[i].groupName == "기부"){
								html += '<a href="#dataModal" data-toggle="modal" data-target="#dataModal" data-key="'+list[i].boardKey+'" data-type="donation" data-state="show">거부</a></td></tr>';
							}else if(list[i].groupName == "펀딩"){
								html += '<a href="#dataModal" data-toggle="modal" data-target="#dataModal" data-key="'+list[i].boardKey+'" data-type="funding" data-state="show">거부</a></td></tr>';
							}else if(list[i].groupName == "함께해요"){
								html += '<a href="#dataModal" data-toggle="modal" data-target="#dataModal" data-key="'+list[i].boardKey+'" data-type="vwork" data-state="show">거부</a></td></tr>';
							}else if(list[i].groupName == "물품후원"){
								html += '<a href="#dataModal" data-toggle="modal" data-target="#dataModal" data-key="'+list[i].boardKey+'" data-type="support" data-state="show">거부</a></td></tr>';
							}else if(list[i].groupName == "정기후원"){
								html += '<a href="#dataModal" data-toggle="modal" data-target="#dataModal" data-key="'+list[i].boardKey+'" data-type="regular" data-state="show">거부</a></td></tr>';
							}
						}
					}
					//이전 테이블 값, 페이지 네비 삭제
					$("#"+obj.etcType+"Table").find(".newTr").remove();
					$("#"+obj.etcType+"pageNavi").children().remove();
					//새로운 테이블 값, 페이지 네비 추가
					$("#"+obj.etcType+"Table").find("tbody").append(html);
					$("#"+obj.etcType+"pageNavi").append(pageNavi);
				},
				error : function(){
					console.log("etc Ajax 실팽");
				}
			});
		}
		//------------------------------------------------------------승인 버튼 클릭 시------------------------------------------------------------
		//해당 게시글의 타입 (기부,펀딩,물품후원,함께해요)과 게시글의 primary key를 전달 받음.
		//승인 시 해당 게시물의 state 값을 update 해준다. type에 따른 동적 쿼리	
		function boardConfirm(key,type,state){
			
			if(confirm("게시물을 승인/등록 하시겠습니까?")){
				$.ajax({
					url : "/agreeRequestBoard.don",
					data : {key : key, type : type},
					success : function(result){
						if(result>0 && state == undefined){
							alert("승인/등록 되었습니다");							
							saveValue(type, 1);
						}else if (result>0 && state == 'all'){
							alert("승인/등록 되었습니다");
							$("form").submit();
						}
					},
					error : function(){
						alert("ㅋㅋㅋㅋㅋ실패");
					}
				});
			}
		}
	</script>
</body>
</html>
