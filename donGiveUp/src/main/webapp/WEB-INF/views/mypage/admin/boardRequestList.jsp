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
						<li><a href="#tab2" data-toggle="tab">기부</a></li>
						<li><a href="#tab3" data-toggle="tab">펀딩</a></li>
						<li><a href="#tab4" data-toggle="tab">함께해요</a></li>
						<li><a href="#tab5" data-toggle="tab">물품후원</a></li>
					</ul>
					<div class="tab-content" style="margin-left:50px;">
						<div class="tab-pane fade in active" id="tab1">
							<form action="/boardRequestList.don" method="get">
								<input type="hidden" name="reqPage" value="1">
								<input type="hidden" name="type" value="all">
								<div class="search_wrap"><!-- 제목 입력 -->
									<input type="text" name="title" class="form-control" placeholder="제목 입력..." style="display:inline;">
									<input type="submit" value="검색" class="btn btn-md btn-primary search_btn">
								</div>
								<div>
									<div style="float:left;">
										<label><input type="radio" name="requestList" value="wait">&nbsp; 신청대기목록</label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<label><input type="radio" name="requestList" value="complete" checked>&nbsp; 처리완료목록</label>
									</div>
									<div class="sort">
										<select name="sorting"  style="width:100px;">
											<option>정렬</option>
											<option value="dateSort">날짜순</option>
											<option value="titleSort">제목순</option>
										</select>
									</div>
								</div>
							</form>
							<div id="table" style="margin-top:50px;">
								<table border=1>
									<c:forEach items="${reqBoardList}" var="b">
										<tr>
											<td>${b.groupName}</td>
											<td>${b.boardTitle}</td>
										</tr>
									</c:forEach>
								</table>
							</div>
							<div id="pageNavi">
								${pageNavi}
							</div>
						</div>
						<div class="tab-pane fade" id="tab2">
							<h4>기부</h4>
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
		function pageMove(obj, reqPage){
				var type = $(obj).parent().parent().find("input[name=type]").val(); //게시글 타입
				var title = $(obj).parent().parent().find("input[name=title]").val(); //게시글 입력 제목
				var requestList = $(obj).parent().parent().find("input[name=requestList]:checked").val(); //신청대기 OR 처리완료
				var sorting = $(obj).parent().parent().find("[name=sorting]").val(); //정렬
				if(sorting=="정렬"){
					sorting = "date";
				}
				
				$.ajax({
					url : "/boardRequestListAjax.don",
					data : {reqPage : reqPage, type : type, title : title, requestList : requestList, sorting : sorting},
					success : function(data){
						console.log("데이터 타입 : " + typeof(data));
						var boardList = data.list;
						var pageNavi = data.pageNavi;
						$("#table").children().children().remove(); //테이블의 모든행 삭제
						var html ="";
						for(var i=0; i<boardList.length; i++){
							html += "<tr><td>"+boardList[i].groupName+"</td>"+"<td>"+boardList[i].boardTitle+"</td></tr>"
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
	</script>
</body>
</html>