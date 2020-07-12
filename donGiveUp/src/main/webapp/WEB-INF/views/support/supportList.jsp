<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 부트스트림4 지원 메타 포트 -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- 부트스트림4 지원 메타 포트 종료-->
<title>후원품 목록</title>
<!--    부트스트랩(다운)과 jQuery 불러오기-->
<script type="text/javascript"
	src="/resources/jongeun/bootstrap4/js/jquery-3.3.1.js"></script>
<script type="text/javascript"
	src="/resources/jongeun/bootstrap4/js/bootstrap.min.js"></script>
<link type="text/css" rel="stylesheet"
	href="/resources/jongeun/bootstrap4/css/bootstrap.min.css" />
<!--    부트스트랩(다운)과 jQuery 불러오기 종료-->

<!-- 구글 content 폰트 -->
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap"
	rel="stylesheet">

<!--  폰트어썸 링크(부트4.3만 가능)-->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
	integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ"
	crossorigin="anonymous">
<!--    폰트어썸 종료-->

</head>
<style>
body {
	font-family: 'Noto Sans KR', sans-serif;
}

.content {
	overflow: hidden;
}

.content_wrap {
<<<<<<< HEAD
	width: 65%;
	margin: 0 auto;
	border: 0.5px solid black;
=======
	width: 70%;
	margin: 0 auto;
	border: 1px solid pink;
>>>>>>> parent of 87b6781... Revert "Merge branch 'ssong-branch' of https://github.com/whddms4321/DonGiveUp into ssong-branch"
}

.content_wrap>h1 {
	text-align: center;
}
.support_try{
    float:right;
    width:150px;
    height:70px; 
    padding:10px;
<<<<<<< HEAD
    margin-right:130px;
=======
    margin-right:100px;
>>>>>>> parent of 87b6781... Revert "Merge branch 'ssong-branch' of https://github.com/whddms4321/DonGiveUp into ssong-branch"
}
    .support_try div{
        color:white;
        font-size:15px; 
        font-weight: 600;
        float: left;
        border:none;
        display: inline-block;
        width: 100%;
        height: 100%;
        line-height: 50px;
        text-align: center;
        background-color: #0fbcff;
        border-radius: 20px;
        border:none;
        
        
    }
    .support_try div:hover{
   		opacity: 0.6;
    }

.category_div {
	position: relative;
	padding-left: 50px;
}

.category_ul {
<<<<<<< HEAD
	width:85px;
	list-style: none;
	padding: 0;
	left:-70px;
	top:-35px;
	position: absolute;
	/* border: 0.3px solid black; */
	z-index:100;
}
.category_ul>li{
	color:threedface;
	/* text-decoration: underline #0fbcff; */
}
.category_ul>li:hover{
	opacity: 0.7
}
.on {
	
=======
	list-style: none;
	padding: 0;
	position: absolute;
}

.on {
>>>>>>> parent of 87b6781... Revert "Merge branch 'ssong-branch' of https://github.com/whddms4321/DonGiveUp into ssong-branch"
	display: block;
}

.off {
	display: none;
}

.supportList_ul {
<<<<<<< HEAD
	width: 95%;
=======
	width: 85%;
>>>>>>> parent of 87b6781... Revert "Merge branch 'ssong-branch' of https://github.com/whddms4321/DonGiveUp into ssong-branch"
	overflow: hidden;
	list-style: none;
	padding: 0;
	margin: 0 auto;
}

.supportList_li {
<<<<<<< HEAD
	height: 420px;
	display: inline-block;
	border: none;
	margin: 25px;
	
=======
	height: 350px;
	display: inline-block;
	border: none;
	margin: 25px;
>>>>>>> parent of 87b6781... Revert "Merge branch 'ssong-branch' of https://github.com/whddms4321/DonGiveUp into ssong-branch"
}

.supportList {
	display: inline-block;
	width: 220px;
	height: 240px;
<<<<<<< HEAD
	
=======
	border: 0.1px solid red;
>>>>>>> parent of 87b6781... Revert "Merge branch 'ssong-branch' of https://github.com/whddms4321/DonGiveUp into ssong-branch"
	position: relative;
}

.supportList_img {
	width: 100%;
	height: 100%;
}

<<<<<<< HEAD
/* .supportList_img:hover {
=======
.supportList_img:hover {
>>>>>>> parent of 87b6781... Revert "Merge branch 'ssong-branch' of https://github.com/whddms4321/DonGiveUp into ssong-branch"
	width: 120%;
	height: 120%;
	transition-duration: 1s;
}

<<<<<<< HEAD
.supportList_img:not(:hover){
	width:100%;
	height:100%;
	transition-duration:1s;

}
 */
 
=======
.supportList_img
:not
 
(
:hover
 
){
width
:
 
100%;
height
:
 
100%;
transition-duration
:
 
1
s
;


}
>>>>>>> parent of 87b6781... Revert "Merge branch 'ssong-branch' of https://github.com/whddms4321/DonGiveUp into ssong-branch"
.supportList_band {
	display: inline-block;
	width: 60px;
	left: 160px;
	top: 0px;
	text-align: center;
	color: green;
	position: absolute;
}

#moreList {
	width: 550px;
	height: 70px;
	background-color: #0fbcff;
	border-radius: 15px;
	display: block;
	margin: 0 auto;
	font-size: 22px;
}

#moreList:hover {
	opacity: 0.7;
}

.myband {
	background-color: yellow;
}

.supportList_name {
<<<<<<< HEAD
margin-top:5px;
=======
>>>>>>> parent of 87b6781... Revert "Merge branch 'ssong-branch' of https://github.com/whddms4321/DonGiveUp into ssong-branch"
	color: gray;
}
/* .supportList_img{
	position:absolute;
	width:300px;
	hight:20
} */
</style>
<script>
	$(function() {
		$(".category_content").click(function() {
<<<<<<< HEAD
			
			if ($(".category_ul").hasClass("off")) {
				$(".category_ul").removeClass("off");
				$(".category_ul").addClass("on");
				$(".category_content>i").removeClass("fa-caret-up");
				$(".category_content>i").addClass("fa-caret-down");
			} else {
				$(".category_ul").removeClass("on");
				$(".category_ul").addClass("off");
				$(".category_content>i").removeClass("fa-caret-down");
				$(".category_content>i").addClass("fa-caret-up");
			}

		});
		$(".category_ul")
=======
			if ($(".category_ul").hasClass("off")) {
				$(".category_ul").removeClass("off");
				$(".category_ul").addClass("on");
			} else {
				$(".category_ul").removeClass("on");
				$(".category_ul").addClass("off");
			}

		});
>>>>>>> parent of 87b6781... Revert "Merge branch 'ssong-branch' of https://github.com/whddms4321/DonGiveUp into ssong-branch"
	});
	//물품후원 신청하기
	$(document).on('click','.supportListApply',function(event){
		var windo = window.open("/supportApplyWrite.don?supportNo="+$(this).val(), "_blank", "toolbar=yes,scrollbars=yes,resizable=yes,top=100,left=500,width=450,height=600"); 
		
	});

	//document.on 으로 이벤트를 걸면 바뀐시점에서의 내용을 읽어서 새롭게 생성된 것들도 이벤트를 연결 가능하다.
	$(document)
			.on(
					'click',
					'#moreList',
					function(event) {
						var count = $(this).val();
						console.log(count);

						$
								.ajax({
									url : "/moreList.don",
									data : {
										count : count
									},
									success : function(data) {
										$(event.target).remove();
										//data를 javascript 객체화하기
										//var obj = JSON.parse(data);				
										//data값을 list 별로 나누어 추출
										var List = data.supportList;
										var button = data.button;

										console.log(List);
										console.log(button);
										//자바스크립트 내에서 EL구문을 사용할수 있다. 흐름은 자바 -> jstl -> html -> 스크립트 순으로 진행된다.
										// 따로 변수를 두는 이유는  if문 안에 {}를 또 쓸수 없기 떄문
										var Id = '${sessionScope.member.memberId }';

										html = "";

										for (var i = 0; i < List.length; i++) {
<<<<<<< HEAD
											
											html += "<li class='supportList_li'>";
											html += "<div class='supportList'>";
											html += "<img class='supportList_img' src='/resources/upload/support/'"+List[i].supportFilepath+"'>";
=======

											html += "<li class='supportList_li'>";
											html += "<div class='supportList'>";
											html += "<img class='supportList_img' src="+List[i].supportFilename+">";
>>>>>>> parent of 87b6781... Revert "Merge branch 'ssong-branch' of https://github.com/whddms4321/DonGiveUp into ssong-branch"
											html += "<h2 class='supportList_name'>"
													+ List[i]['supportName']
													+ "</h2>";
											html += "<div>마감 기한 : "
													+ List[i]['enrollEndDate']
													+ "</div>";
											html += "<div>물품 수량 : "
													+ List[i]['supportAmouont']
													+ "</div>";

											if (List[i]["supportApplyid"] == Id) {

												html += "<span class=\"supportList_band myband\">요청중</span>";

											} else {

												html += "<button class=\"supportListApply\" value="+List[i]['supportNo']+"}\">요청하기</button></div></li>";

											}

										}
										$(".supportList_ul").append(html);
										$(".content_wrap").append(button);

									},
									error : function() {
										console.log("실행 실패");
									}

								});
					});
</script>
<body>

	<jsp:include page="/WEB-INF/views/main/header.jsp" />
	<div class="content">
		<div class="content_wrap">
			<br> <br> <br>
			
			<h1>물품 후원 리스트</h1>
			<br> <br> <br>
			<div class="category_div">
<<<<<<< HEAD
				<span class="category_content"  style='font-size:24px' >전체 <i class='fas fa-caret-up'   style='font-size:27px' ></i></span>
				<ul class="category_ul off" style="cursor:pointer">
=======
				<span class="category_content">전체 ▽</span>
				<ul class="category_ul off">
>>>>>>> parent of 87b6781... Revert "Merge branch 'ssong-branch' of https://github.com/whddms4321/DonGiveUp into ssong-branch"
					<li>전체</li>
					<li>의류</li>
					<li>생리대</li>
					<li>화장품</li>
					<li>도서</li>
					<li>생활용품</li>
					<li>가전제품</li>
					<li>유아제품</li>
					<li>학용품</li>
				</ul>
				<div class="support_try">
<<<<<<< HEAD
				
				<a href="/supportAd.don">
				<%-- <c:if test="${sessionScope.member.memberType eq 1 }"></c:if> --%>
					<div class="apply" value="나중에 css 수정">물품 후원하러 가기</div>
=======
				<a href="/supportAd.don">
					<div class="apply">물품 후원하기</div>
>>>>>>> parent of 87b6781... Revert "Merge branch 'ssong-branch' of https://github.com/whddms4321/DonGiveUp into ssong-branch"
				</a>
			</div>
			</div>
			<br>
			<ul class="supportList_ul">
<<<<<<< HEAD
				
				<c:forEach var="n" items="${List }" varStatus="status">
					<li class="supportList_li">
						<div class="supportList">
							<img class="supportList_img" src="/resources/upload/support/${n.supportFilepath }">
=======
				<c:forEach var="n" items="${List }" varStatus="status">
					<li class="supportList_li">
						<div class="supportList">
							<img class="supportList_img" src="${n.supportFilename }">
>>>>>>> parent of 87b6781... Revert "Merge branch 'ssong-branch' of https://github.com/whddms4321/DonGiveUp into ssong-branch"
							<h2 class="supportList_name">${n.supportName }</h2>
							<div>마감 기한 : ${n.enrollEndDate }</div>
							<div>물품 수량 : ${n.supportAmount }</div>
							<c:if test="${n.supportApplyId eq sessionScope.member.memberId }">
								<span class="supportList_band myband">요청중</span>
							</c:if>
<<<<<<< HEAD
							<c:if test="${n.supportApplyId ne sessionScope.member.memberId}">
								<c:if test="${sessionScope.member.memberType eq 0 }">
									<button class="supportListApply" value="${n.supportNo }">요청하기</button>
								</c:if>
=======
							<c:if test="${n.supportApplyId ne sessionScope.member.memberId }">
								
								<button class="supportListApply" value="${n.supportNo }">요청하기</button>
>>>>>>> parent of 87b6781... Revert "Merge branch 'ssong-branch' of https://github.com/whddms4321/DonGiveUp into ssong-branch"
							</c:if>
						</div>
					</li>
				</c:forEach>
			</ul>
<<<<<<< HEAD
			<img src="/resources/upload/support//127.0.0.1_supportApplyAd.don.png">
=======
>>>>>>> parent of 87b6781... Revert "Merge branch 'ssong-branch' of https://github.com/whddms4321/DonGiveUp into ssong-branch"
			<span class="button">${button }</span>
		</div>
	</div>
	<br>
	<br>
	<br>
	<br>
	<jsp:include page="/WEB-INF/views/main/footer.jsp" />

</body>
</html>