<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마감 후원물품</title>
<style>
	table th, td{
		text-align:center;
	}
	table th{
		background-color : #CBD3D7;
		font-size:20px;
	}
	#pageNavi a{
		padding:13px;
	}
	#pageNaviModal a, span{
		padding:10px;
	}
	#pageNaviModal{
		margin-top:35px;
		text-align:center;
	}
	.modalTable th{
		background-color : #CBD3D7;
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
						<h1 style=" font-weight:bold;">마감 후원물품</h1>
					</div>
					<div style="margin-top:100px;">
						<table class="table table-striped">
							<tr>
								<th>번호</th><th>글제목</th><th>담당자</th><th>연락처</th><th>이메일</th><th>마감일자</th><th>비고</th>
							</tr>
							<c:forEach items="${list}" var="s" varStatus="c">
							<tr >
								<!-- 요청한 페이지 번호를 다시 받아와 게시글 순서번호와 연산 -->
								<td>${(reqPage-1)*10 + c.count}<input type="hidden" id="${s.supportNo}"></td>
								<td><a style="cursor:pointer;" data-toggle="modal" data-target="#dataModal" data-reqpage=1 data-supportno="${s.supportNo}">${s.supportName}</a></td>
								<td>${s.supportId}</td>
								<td>${s.memberPhone}</td>
								<td>${s.memberEmail}</td>
								<td>${s.enrollEndDate}</td>
								<td><button onclick="deleteSupport(${s.supportNo},this);" class="btn-primary btn-sm">삭제</button></td>
							</tr>
							</c:forEach>
						</table>
					</div>
					<div id="pageNavi" style="text-align:center; margin-top:50px; ">
						${pageNavi }
					</div>
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
						<h3 class="modal-title" id="dataModalLabel" style="font-weight:bold;">신청기관 목록</h3>
					</div>
					<div class="modal-body" style="height:400px;">
						<div id="content" style="height:300px;">
						</div>
						<div id="pageNaviModal">
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
						<!-- <button type="button" id="closeBtn" class="btn btn-primary" onclick="negativeRequestBoard();">전송</button>  -->
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
		//-----------------------------------신청사유 보여주기----------------------------------
		function requestContentShow(obj){
			$(".requestContent").css("display", "none");
			$(obj).parent().parent().next().css("display", "table-row");
			//$(obj).next().css("display", "block");
			//$(obj).next().next().css("display", "block");
		}
		//--------------------------글 제목 클릭 시 Modal로 신청기관 목록을 보여줌------------------------
		var supportNo = "";
		var reqPage = "";
		$('#dataModal').on('show.bs.modal', function(event) {			
            supportNo = $(event.relatedTarget).data('supportno');
            reqPage = $(event.relatedTarget).data('reqpage');
           //ajax으로 해당 물품에 대한 신청기관 List를 가져와서 Modal에 보여주기
           companyList(supportNo, reqPage);
        });
		
		//페이지 번호를 누를 때는 $('#dataModal').on('show.bs.modal', function(event){} <- 모달창 열렸을 때
		//조건에 맞지 않기 때문에, ajax 실행을 함수로 분리
		function companyList(supportNo, reqPage){
			$("#content").html("");
            $("#pageNaviModal").html("");

			$.ajax({
	        	  url : "/selectSupportRequestCompany.don",
	        	  data : {supportNo : supportNo, reqPage : reqPage},
	        	  success : function(data){
	        		  var list = data.list;
	        		  var pageNavi = data.pageNavi;
	        		  var html = "";
	        		  
	        		  if(list.length > 0){

	        			  html += "<table class='table modalTable'>";
	        			  	html += "<tr><th>번호</th><th>신청자</th><th>선택</th></tr>";
		        		  //html += "<div style='padding-top:10px; padding-bottom:10px;'><span style='font-weight:bold; font-size:20px; margin-left:20px;'>선택</span><span style='font-weight:bold; font-size:20px; margin-left:90px;'>신청자</span></div>";  
		        		  for(var i=0; i<list.length; i++){
		        			  html += "<tr>";
		        			  	html += "<td>" + ((reqPage-1)*5+1+i) +"</td>";
		        			  	html += "<td>" + list[i].supportApplyId + "</td>";
		        			  	html += "<td><input type='radio' onclick='requestContentShow(this);' name='company'></td>";
		        			  html += "</tr>";
		        			  html += "<tr class='requestContent' style='display:none;'>";
		        			  	html += "<td colspan='3'>";
		        			  		html += "<div  style='margin-top:15px; width:360px; height:200px;'>" + list[i].supportApplyReason + "</div>";
		        			  		html += "<div  style='text-align:center; margin-bottom:15px;'>";
		        			  			html += "<button class='btn-sm btn-primary' onclick='assignCompany("+ supportNo + ",`" + list[i].supportApplyId +"`);'>선정</button>";
		        			  		html += "</div></td></tr>";
		        		  }	
		        			  /*
		        			  html += "<div style='width:400px; margin-left:15px; padding-left:20px; border-bottom:1px dotted gray;'>";
		        			  	html += "<label onclick='requestContentShow(this);'>";
		        			  		html += "<input type='radio' name='company' style=' margin-right:100px;'> &nbsp;&nbsp;&nbsp;";
		        			 		 html += "<span>" + list[i].supportApplyId + "</span>&nbsp;&nbsp;&nbsp;";
		        			  	html +="</label>";
		        			  	html += "<div class='requestContent' style='display:none; margin-top:15px; width:360px; height:200px;'>" + list[i].supportApplyReason + "</div>";
		        			  	html += "<div class='requestContent' style='display:none; text-align:center; margin-bottom:15px;'>";
		        			  		html += "<button class='btn-sm btn-primary' onclick='assignCompany("+ supportNo + ",`" + list[i].supportApplyId +"`);'>선정</button>";
		        			  	html += "</div>";
		        			  html += "</div>";

		        		    
		        		  html += "<div><span style='font-weight:bold; font-size:20px; margin-left:20px;'>선택</span><span style='font-weight:bold; font-size:20px; margin-left:90px;'>신청자</span></div>";  
		        		  for(var i=0; i<list.length; i++){
		        			  html += "<div style='width:400px; margin-left:15px; padding-left:20px; border-bottom:1px dotted gray;'><label onclick='requestContentShow(this);'><input type='radio' name='company' style=' margin-right:100px;'> &nbsp;&nbsp;&nbsp;<span>" + list[i].supportApplyId + "</span>&nbsp;&nbsp;&nbsp;</label>";

		        			  html += "<div class='requestContent' style='display:none; margin-top:15px; width:360px; height:200px;'>" + list[i].supportApplyReason + "</div>";
		        			  html += "<div class='requestContent' style='display:none; text-align:center; margin-bottom:15px;'><button class='btn-sm btn-primary' onclick='assignCompany("+ supportNo + ",`" + list[i].supportApplyId +"`);'>선정</button></div></div>";

		        			  
		        		  }
		        			  */
		        			  
		        			  
		        		  html += "</table>";
		        		  $("#content").css("overflow", "auto");
		        		  $("#content").append(html);
		        		  $("#pageNaviModal").append(pageNavi);        			  
	        		  }else{
	        			  $("#content").css("overflow", "inherit");
	        			  html += "<div style='width:470px; height:300px; line-height:300px; text-align:center;  font-size:30px;'>신청 기관이 없습니다.</div>";
	        			  html += "<div style='text-align:center;'><button onclick='reUpload("+ supportNo +");' class='btn-sm btn-primary'>재등록</button></div>";
	        			  $("#content").append(html);
	        		  }
	        		  
	        	  },
	        	  error : function(){
	        		  
	        	  }
	           });
		}
		
		//------------------------------마감 후원물품을 기관에게 배정하는 경우 [프로시저 활용]-----------------------------------------
		//support 테이블의 support_state 3으로 변경
		//supportapply 테이블에서 해당 아이디와 같은 행의 상태 1로 같지 않은 행의 상태 2로 변경
		function assignCompany(supportNo, applyId){
			if(confirm("물품을 해당 기관에 배정하시겠습니까?")){
				$.ajax({
					url : "/selectApplyId.don",
					data : {applyId : applyId},
					async : false,
					success : function(data){
						applyId = data;
					},
					error : function(){
						
					}
				});
				$.ajax({
					url : "/supportAssignToCompany.don",
					data : {supportNo : supportNo, applyId : applyId},
					success : function(){
						alert("물품이 배정되었습니다.");
						location.reload();
					},
					error : function(){
						console.log("물품배정 실패");
					}
				});	
			}
		}
		
		//------------------------------마감 후원물품에 신청한 기관이 없을 경우 -> 재등록 버튼을 눌렀을 경우---------------------
		function reUpload(supportNo){
			
			if(confirm("해당 물품을 재등록 하시겠습니까?")){
				$.ajax({
					url : "/supportReUpload.don",
					data : {supportNo : supportNo},
					success : function(result){
						if(result>0){
							alert("물품이 재등록 되었습니다");
							$("#dataModal").hide();
							location.reload();
						}
					},
					error : function(){
						console.log("재업로드 실패");
					}
				});
			}
		}
		
		//--------------------------마감된 후원물품 삭제--------------------------------
		function deleteSupport(no, obj){
			if(confirm('정말 삭제하시겠습니까?')){				
				$.ajax({
					url : "/deleteSupport.don",
					data : {supportNo : no},
					success : function(result){
						alert("삭제 되었습니다");
						if(result>0){
							$(obj).parent().parent().remove();
						}
					},
					error : function(){
						
					}
				});
			}
		}
	</script>
</body>
</html>