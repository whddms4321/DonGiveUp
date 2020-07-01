<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
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
							<div style="width:800px; margin-top:50px; margin-bottom:30px;"><!-- 제목 입력 -->
								<input type="text" name="title" class="form-control" placeholder="제목 입력..." style="float:left; width:50%;">
								<input type="submit" value="검색" class="btn btn-md btn-primary" style="margin-left:10px; height:46px;">
							</div>
							<div>
								<div style="float:left;">
									<input type="radio" name="requestList">&nbsp; 신청대기목록 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<input type="radio" name="requestList">&nbsp; 처리완료목록
									<span style="text-align:right; width:100px;"></span>
								</div>
								<div style="text-align:right; margin-right:70px;">
									<select name="sorting" class="form-control" style="width:100px;">
										<option>정렬</option>
										<option name="dateSort">날짜순</option>
										<option name="titleSort">제목순</option>
									</select>
								</div>
							</div>
						</div>
						<div class="tab-pane fade" id="tab2">
							<h4>기부</h4>
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
								Donec eget rutrum purus. Donec hendrerit ante ac metus sagittis
								elementum. Mauris feugiat nisl sit amet neque luctus, a tincidunt
								odio auctor.</p>
						</div>
						<div class="tab-pane fade" id="tab3">
							<h4>펀딩</h4>
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
								Donec eget rutrum purus. Donec hendrerit ante ac metus sagittis
								elementum. Mauris feugiat nisl sit amet neque luctus, a tincidunt
								odio auctor.</p>
						</div>
						<div class="tab-pane fade" id="tab4">
							<h4>함께해요</h4>
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
								Donec eget rutrum purus. Donec hendrerit ante ac metus sagittis
								elementum. Mauris feugiat nisl sit amet neque luctus, a tincidunt
								odio auctor.</p>
						</div>
						<div class="tab-pane fade" id="tab5">
							<h4>물품후원</h4>
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
								Donec eget rutrum purus. Donec hendrerit ante ac metus sagittis
								elementum. Mauris feugiat nisl sit amet neque luctus, a tincidunt
								odio auctor.</p>
						</div>
					</div>
				</div>
			</div>
			<!--/.panel-->
		</div>
	</div>
</body>
</html>