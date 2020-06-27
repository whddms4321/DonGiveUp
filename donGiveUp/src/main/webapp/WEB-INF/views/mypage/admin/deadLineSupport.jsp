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
		font-size:20px;
	}
	#pageNavi a{
		padding:13px;
	}
	#pageNaviModal a{
		padding:10px;
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
						<table class="table">
							<tr>
								<th>번호</th><th>글제목</th><th>담당자</th><th>연락처</th><th>이메일</th><th>마감일자</th><th>비고</th>
							</tr>
							<c:forEach items="${list}" var="s" varStatus="c">
							<tr >
								<!-- 요청한 페이지 번호를 다시 받아와 게시글 순서번호와 연산 -->
								<td class="number">${(reqPage-1)*10 + c.count}</td>
								<td><a  data-toggle="modal" data-target="#dataModal" data-reqpage=1 data-supportno="${s.supportNo}">${s.supportName}</a></td>
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
						<div id="content" style="overflow:auto; height:300px;">
						</div>
						<div id="pageNaviModal">
						</div>
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
		//-----------------------------------신청사유 보여주기----------------------------------
		function requestContentShow(obj){
			$(".requestContent").css("display", "none");
			$(obj).parent().next().css("display", "block");
		}
		//--------------------------글 제목 클릭 시 Modal로 신청기관 목록을 보여줌------------------------
		var supportNo = "";
		var reqPage = "";
		$('#dataModal').on('show.bs.modal', function(event) {			
            supportNo = $(event.relatedTarget).data('supportno');
            reqPage = $(event.relatedTarget).data('reqpage');
            $("#content").html("");
            $("#pageNaviModal").html("");
           //ajax으로 해당 물품에 대한 신청기관 List를 가져와서 Modal에 보여주기
           $.ajax({
        	  url : "/selectSupportRequestCompany.don",
        	  data : {supportNo : supportNo, reqPage : reqPage},
        	  success : function(data){
        		  var list = data.list;
        		  var pageNavi = data.pageNavi;
        		  var html = "";
        		  
        		  if(list.length > 0){
	        		  html += "<div><span style='font-weight:bold; font-size:20px; margin-left:20px;'>선택</span><span style='font-weight:bold; font-size:20px; margin-left:130px;'>신청자</span><span style='font-weight:bold; font-size:20px; margin-left:70px;'>마지막 수령일</span></div>";  
	        		  for(var i=0; i<list.length; i++){
	        			  html += "<div><label onclick='requestContentShow(this);'><input type='radio' name='company' style='margin-left:32px; margin-right:120px;'> &nbsp;&nbsp;&nbsp;" + list[i].supportApplyId + "&nbsp;&nbsp;&nbsp;마지막수령일</label></div>";
	        			  html += "<div class='requestContent' style='display:none; width:200px; height:200px;'>" + list[i].supportApplyReason;
	        			  html += "<div><button class='btn-sm btn-primary'>선정</button></div></div>";
	        			  
	        		  }
	        		  $("#content").append(html);
	        		  $("#pageNaviModal").append(pageNavi);        			  
        		  }else{
        			  console.log("dasda");
        			  html += "<div style='width:470px; height:300px; line-height:300px; text-align:center;  font-size:30px;'>신청 기관이 없습니다.</div>";
        			  html += "<div style='text-align:center;'><button class='btn-sm btn-primary'>재등록</button></div>";
        			  $("#content").append(html);
        		  }
        		  
        	  },
        	  error : function(){
        		  
        	  }
           });
        });
		
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