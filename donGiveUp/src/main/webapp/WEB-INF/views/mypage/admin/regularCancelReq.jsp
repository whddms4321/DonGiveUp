<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
							<label><input type="radio" name="allList"  value="all">&nbsp; 전체</label>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<label><input type="radio" name="regularList"  value="regular">&nbsp; 정기후원</label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<label><input type="radio" name="bankList"  value="bank">&nbsp; 저금통</label>
						</div>
						<div style="margin-top:20px;">
							<table class="table">
								<tr>
									<th>번호</th><th>구분</th><th>결제번호</th><th>아이디</th><th>금액</th><th>연락처</th><th>이메일</th><th>비고</th>
								</tr>
								<c:forEach items="${list}" var="c" varStatus="l">
									<tr>
										<td>${(reqPage-1)*10 + l.count }</td>
										<td>${c.regularInPayNum }</td>
										<td>${c.regularId }</td>
										<td>${c.regularInMoney }</td>
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
								</c:forEach>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
</body>
</html>