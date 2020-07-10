<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정기결제 관리</title>
<style>
		table th, td{
			text-align:center;
		}
		table th{
			font-size:20px;
			background-color : #F1F1F1;
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
							<h1 style="font-weight:bold;">정기결제 관리</h1>
						</div>
						<div style="margin-top: 50px;">
							<label><input type="radio" name="regular"  id="all" value="all">&nbsp; 전체</label>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<label><input type="radio" name="regular"  id="req" value="req">&nbsp; 해지요청</label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<label><input type="radio" name="regular"  id="complete" value="complete">&nbsp; 해지완료</label>
						</div>
						<div style="margin-top:20px;">
							<table class="table">
								<tr>
									<th>번호</th><th>구분</th><th>자동결제일</th><th>아이디</th><th>금액</th><th>연락처</th><th>이메일</th><th>비고</th>
								</tr>
								<c:forEach items="${list}" var="c" varStatus="l">
									<tr class="newTr">
										<td>${(reqPage-1)*10 + l.count }</td>
										<td>${c.groupName }</td>
										<td>${c.regularInPayNum }</td> <!--결제번호에서 매달 돈토리 결제일로 변경  -->
										<td>${c.regularId }</td>
										<td>${c.regularInMoney }</td> 
										<td>${c.memberPhone }</td>
										<td>${c.memberEmail }</td>
										<c:if test="${c.regularInCancel == 1 }">
											<td><a href='javascript:void(0);' onclick="updateRegular(${c.regularInNo}, '${c.groupName}');">해지요청</a></td>
										</c:if>
										<c:if test="${c.regularInCancel == 2 }">
											<td>해지완료</td>
										</c:if>
									</tr>
								</c:forEach>
							</table>
						</div>
						<div id="pageNavi" style="text-align:center; margin-top:50px; ">
							${pageNavi}
						</div>
					</div>
				</div>
			</div>
		</div>
		<script>
		function updateRegular(regularNo, kind){
			var type= "";
			if(kind == "저금통"){
				type = "bank";
			}else{
				type = "regular";
			}
			
			if(confirm("해지완료로 전환하시겠습니까?")){
				$.ajax({
					url : "/updateRegular.don",
					data : {regularNo : regularNo, type : type},
					success : function(result){
						if(result>0){
							alert("전환되었습니다.");
							location.reload();
						}
					},
					error : function(){
						
					}
				});
				
			}
			
		}
		
		$(function(){
			var type = "${type}";
			
			if(type == "all"){
				$("#all").prop("checked",true);
			}else if(type == "req"){
				$("#req").prop("checked",true);
			}else{
				$("#complete").prop("checked",true);
			}
		});
		$("input[name=regular]").change(function(){
			var type = $(this).prop("selected", true).val();
			
			$.ajax({
				url : "/regularCancelReqAjax.don",
				data : {type :type},
				success : function(data){
					var list = data.list;
					var pageNavi = data.pageNavi;
					
					$(".newTr").remove();
					$("#pageNavi").children().remove();
					
					var html="";
					for(var i=0; i<list.length; i++){
						html += "<tr class='newTr'><td>" + (i+1) + "</td><td>" + list[i].groupName + "</td><td>" + list[i].regularInPayNum + "</td><td>" + list[i].regularId;
						html += "</td><td>" + list[i].regularInMoney + "</td><td>" + list[i].memberPhone + "</td><td>" + list[i].memberEmail + "</td>";
						if(list[i].regularInCancel == 1){

							html += "<td><a href='javascript:void(0);' onclick='updateRegular(" + list[i].regularInNo + "," + list[i].groupName +");'>해지요청</a></td></tr>";
						}else{
							html += "<td>해지완료</td></tr>";

						}
					}
					$(".table").append(html);
					$("#pageNavi").append(pageNavi);
					
				},
				error : function(){
					
				}
			});
		});
		</script>
</body>
</html>