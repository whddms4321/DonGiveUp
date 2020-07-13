<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
.footer {
	width: 100%;
	height : 250px;
	background-color: #0fbcff;
	letter-spacing: normal;
}

.footer>div .containFooter {
	width: 85%;
	min-width: 1220px;
	margin: 0 auto;
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
}

.footer .fc1 .containFooter {
	height: 87px;
	border-bottom: 1px solid rgba(255, 255, 255, 0.1);
}

.footer .fc1 .containFooter .logo_footer {
	width: 140px;
	float: left;
	padding: 20px 0 0;
	margin: 0 45px 0 0;
	text-align: left;
}

.footer .fc1 .containFooter .logo_footer img {
	width: 100%;
}

.footer .fc1 .containFooter ul.footer_menu {
	float: left;
	padding: 36px 0 0;
}

.footer .fc1 .containFooter ul.footer_menu li {
	height: 100%;
	display: inline-block;
	padding: 0 15px;
	color: #c5c5c5;
}

.footer .fc1 .containFooter ul.footer_menu li a:hover {
	border-bottom: 2px solid #ed1c24;
}

.footer .fc1 .containFooter ul.footer_menu li a:link, .footer .fc1 .containFooter ul.footer_menu li a:visited
	{
	padding: 0 0 10px;
	font-size: 14px;
	font-weight: 300;
	color: #e8e8e8;
}

.footer .fc1 .containFooter .donate_info {
	height: 100%;
	float: right;
}

.footer .fc1 .containFooter .donate_info dl {
	float: left;
	padding: 32px 0 0 16px;
}

.footer .fc1 .containFooter .donate_info dl:first-child {
	padding-right: 18px;
}

.footer .fc1 .containFooter .donate_info dl.account {
	position: relative;
}

.footer .fc1 .containFooter .donate_info dl.account:after {
	width: 1px;
	height: 11px;
	content: "";
	display: block;
	position: absolute;
	left: 0;
	top: 39px;
	background-color: #474b4e;
}

.footer .fc1 .containFooter .donate_info dl dt {
	display: inline-block;
	font-size: 15px;
	color: #ffe043;
	margin-right: 10px;
}

.footer .fc1 .containFooter .donate_info dl dd {
	display: inline-block;
	font-size: 15px;
	font-weight: 400;
	color: #fff;
}

.footer .fc2 .address {
	float: left;
	padding: 40px 0;
	font-size: 14px;
	color: white;
}

.footer .fc2 .address span {
	margin: 0 0 0 13px;
	font-weight: 400;
}

.footer .fc2 .address span:first-child {
	margin: 0;
}

.footer .fc2 .donate_btn {
	float: right;
	padding: 25px 0 0;
}

.footer .fc2 .donate_btn a {
	width: 200px;
	padding: 15px 0;
	color: white;
}
</style>
</head>
<body>
	<div class="section footer fp-auto-height">
		<div class="fc1">
			<div class="containFooter">
				<div class="logo_footer">
					<img src="/resources/song/image/logo.jpg" alt="로고" />
				</div>
				<ul class="footer_menu">
					<li><a href="#" title="소개">소개</a></li>
					<li><a href="#" title="활동">활동</a></li>
					<li><a href="#" title="현장소식">현장소식</a></li>
					<li><a href="#" title="채용">채용</a></li>
					<li><a href="#" title="후원">후원</a></li>
				</ul>
				<div class="donate_info">
					<dl class="request">
						<dt>후원문의</dt>
						<dd>02-0000-0000</dd>
					</dl>
					<dl class="account">
						<dt>후원계좌</dt>
						<dd>기업 010-000-123456</dd>
					</dl>
				</div>
			</div>
		</div>
		<div class="fc2">
			<div class="containFooter">
				<p class="address">
					<span>서울 영등포구 선유동2로 57 이레빌딩</span> <span>대표자: Don Give Up</span> <span>고유번호:
						010-000-123456</span> <span>Copyright 2020 ⓒDon Give Up.All right
						Reserved.</span>
				</p>
				<p class="donate_btn">
					<a href="#" title="정기 후원하기">정기 후원하기</a>
				</p>
			</div>
		</div>
	</div>
</body>
</html>