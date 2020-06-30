<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후원단체 신청 목록</title>
	<style>
		table th, td{
			text-align:center;
		}
		table th{
			font-size:20px;
		}
		#pageNavi a, span{
			padding:13px;
		}
		.title{
			font-weight:bold;
			font-size : 15px;
			background-color : gray;
			width : 130px;
		}
	</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/mypage/admin/dashboardHeader.jsp"/>
	<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
		<div class="col-md-6" >
			<div class="panel panel-default" style="width:1540px; height:1000px;">
				<div  style="padding-top:50px; padding-left:70px; padding-right:70px;">
					<div>
						<h1 style="font-weight:bold;">후원단체 등록 신청</h1>
					</div>
					<div style="margin-top:100px;">
						<table class="table">
							<tr>
								<th>번호</th><th>기관등록번호</th><th>담당자</th><th>연락처</th><th>이메일</th><th>재무제표</th><th>가입일자</th>
							</tr>
							<c:forEach items="${list}" var="c" varStatus="l">
								<tr>
									<td>${(reqPage-1)*10 + l.count }</td>
									<td><a style="cursor:pointer;" data-toggle="modal" data-target="#dataModal" data-companynumber="${c.companyNumber}" data-memberid="${c.memberId}"> ${c.companyNumber }</a></td>
									<td>${c.memberId }</td>
									<td>${c.memberPhone }</td>
									<td>${c.memberEmail }</td>
									<td>파일</td>
									<td>${c.memberEnrollDate }</td>
								</tr>
							</c:forEach>
						</table>
					</div>
				</div>
				<div id="pageNavi" style="text-align:center; margin-top:50px; ">
						${pageNavi}
				</div>
			</div>
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
						<h3 class="modal-title" id="dataModalLabel" style="font-weight:bold;">후원단체 조회</h3>
					</div>
					<div class="modal-body" style="height:400px;">
						<div class="form-inline" style="text-align:center;">
							<input type="text" id="companyNumber" class="form-control" style="width:360px;" readonly>
							<input type="button" value="조회" onclick="searchCompany();" class="btn btn-md btn-primary" style="height:44px;">
						</div>
						<div id="content" style="height:300px; width:430px; margin:0 auto; margin-top:30px; display:none;">
							<table class="table" border=1>
								<tr>
									<td class="title">기관명</td><td id="companyName"></td>
								</tr>
								<tr>
									<td class="title">대표자명</td><td id="name"></td>
								</tr>
								<tr>
									<td class="title">전화번호</td><td id="phone"></td>
								</tr>
								<tr>
									<td class="title">사업장 주소</td><td id="addr"></td>
								</tr>
								<tr>
									<td class="title">단체 설립일</td><td id="date"></td>
								</tr>
								<tr>
									<td class="title">홈페이지</td><td id="companyHomePage"></td>
								</tr>
							</table>
						</div>
					</div>
					<div class="modal-footer">
						<div id="btnDiv" style="display:none; float:left; padding-left:185px;">
							<button class="btn-sm btn-primary" onclick="agreeAndNega(0);">승인</button>
							<button class="btn-sm btn-primary" onclick="agreeAndNega(1);">거부</button>
						</div>
						<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
		var companyNumber = "";
		var memberId = "";
		$('#dataModal').on('show.bs.modal', function(event) {			
	        companyNumber = $(event.relatedTarget).data('companynumber'); //해당 회사 등록번호
	        memberId = $(event.relatedTarget).data('memberid'); //멤버 아이디
	        
	        $("#companyNumber").val(companyNumber);
	        $("#content").css("display", "none");
	        $("#btnDiv").css("display", "none");
	    });
		
		function agreeAndNega(type){
			var companyName =  $("#companyName").html();
			enrollCompany(memberId, type, companyName);
			
		}
		//후원단체 승인 및 거부
		function enrollCompany(memberId, type, companyName){
			var bool = 0;
			
			if(type==0){
				if(confirm("승인하시겠습니까?")){
					bool = 1;
				}
			}else{
				if(confirm("거부하시겠습니까?")){
					bool = 1;
				}
			}
			if(bool==1){
				$.ajax({
					url : "/enrollCompany.don",
					data : {memberId : memberId, type : type, companyName : companyName},
					success : function(result){
						if(result>0){
							if(type == 0){
								alert("승인되었습니다.");
							}else{
								alert("거부되었습니다.");
							}
							location.reload();
						}
					},
					error : function(){
						console.log("실패");
					}
				});
			}
		}
		
		//Modal에서 등록번호로 조회하기 버튼을 눌렀을 시 Controller에서 공공 API를 통해 값을 조회해옴
		function searchCompany(){
			$.ajax({
				url : "/searchCompany.don",
				data : {companyNumber : companyNumber},
				success : function(map){
					$("#content").css("display", "block");
					$("#btnDiv").css("display", "block");
					
					if(map.companyName != undefined){
						$("#companyName").html(map.companyName);
						$("#companyName").css("color", "#444444");
					}else{
						$("#companyName").css("color", "red");
						$("#companyName").html("일치하는 정보가 없습니다.");
					}
					if(map.name != undefined){
						$("#name").css("color", "#444444");
						$("#name").html(map.name);
					}else{
						$("#name").css("color", "red");
						$("#name").html("일치하는 정보가 없습니다.");
					}
					if(map.phone != undefined){
						$("#phone").css("color", "#444444");
						$("#phone").html(map.phone);
					}else{
						$("#phone").css("color", "red");
						$("#phone").html("일치하는 정보가 없습니다.");
					}
					if(map.addr != undefined){
						$("#addr").css("color", "#444444");
						$("#addr").html(map.addr);
					}else{
						$("#addr").css("color", "red");
						$("#addr").html("일치하는 정보가 없습니다.");
					}
					if(map.date != undefined){
						$("#date").css("color", "#444444");
						$("#date").html(map.date);
					}else{
						$("#date").css("color", "red");
						$("#date").html("일치하는 정보가 없습니다.");
					}
					if(map.companyHomePage != undefined){
						$("#companyHomePage").css("color", "#444444");
						var html ="";
						html += "<a href='" + map.companyHomePage + "' target='_blank'>" + map.companyHomePage + "</a>";
						$("#companyHomePage").html(html);
					}else{
						$("#companyHomePage").css("color", "red");
						$("#companyHomePage").html("일치하는 정보가 없습니다.");
					}
				},
				error : function(){
					
				}
			});
			
		}
	</script>
</body>
</html>