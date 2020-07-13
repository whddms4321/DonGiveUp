<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일반 회원관리</title>
<style>
		table th, td{
			text-align:center;
		}
		table th{
			font-size:20px;
			background-color : #CBD3D7;
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
							<h1 style="font-weight:bold;">회원관리</h1>
						</div>
						<div style="margin-top:100px;">
							<table class="table table-striped">
								<tr>
									<th>번호</th><th>아이디</th><th>이름</th><th>주소</th><th>연락처</th><th>이메일</th><th>가입일</th><th>상태</th>
								</tr>
								<c:forEach items="${list}" var="c" varStatus="l">
									<c:if test="${c.memberId != 'admin' }">
										<tr>
											<td>${(reqPage-1)*10 + l.count }</td>
											<td>${c.memberId }</td>
											<td>${c.memberName }</td>
											<td>${c.memberAddr }</td>
											<td>${c.memberPhone }</td>
											<td>${c.memberEmail }</td>
											<td>${c.memberEnrollDate }</td>
											<c:if test="${c.memberType == 1 }">
												<td><a href="javascript:void(0);" onclick="memberStopAndRestore('stop','${c.memberId}');">일반</a></td>
											</c:if>
											<c:if test="${c.memberType == 4 }">
												<td><a href="javascript:void(0);" onclick="memberStopAndRestore('restore','${c.memberId}');">정지</a></td>
											</c:if>
										</tr>
									</c:if>
								</c:forEach>
							</table>
						</div>
					</div>
					<div id="pageNavi" style="text-align:center; margin-top:50px; ">
						${pageNavi}
					</div>
				</div>
			</div>
		</div>
		<script>
			
			function memberStopAndRestore(kind, memberId){
				if(kind == "stop"){
					if(confirm("회원을 정지 시키겠습니까?")){
						$.ajax({
							url : "/memberStopAndRestore.don",
							data : {type : "nomal", kind:kind, memberId:memberId},
							success : function(){
								location.reload();
							},
							error : function(){
								
							}
						});		
					}
				}else{
					if(confirm("일반 회원으로 복구 시키겠습니까?")){
						$.ajax({
							url : "/memberStopAndRestore.don",
							data : {type : "nomal", kind:kind, memberId:memberId},
							success : function(){
								location.reload();
							},
							error : function(){
								
							}
						});		
					}
				}
			}
		</script>
</body>
</html>