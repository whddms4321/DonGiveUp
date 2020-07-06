<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>
    <link href="/resources/dahyun/css/dnrviewpage.css" rel="stylesheet">
    <meta charset="UTF-8">
    <title>기부후기 상세페이지</title>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100&display=swap" rel="stylesheet">
    <script src="/resources/dahyun/js/8bd2671777.js" crossorigin="anonymous"></script>
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.js"></script>
</head>

<body>
    <jsp:include page="/WEB-INF/views/main/header.jsp"></jsp:include>
    <div class="content">
        <div class="headarea">
            <div class="frontimg">
                <img src="/resources/dahyun/imgs/콩삼이.jpg">
            </div>
            <div class="bgfilter"></div>
            <div class="textwrap">
                <span id="dnrTitle">귀여운 콩삼이가 고구마간식을 기부받았어요.</span>
                <span id="dnrFoundation">댕댕이행복재단</span>
            </div>
        </div>
        <div class="dnrviewWrap">
            <div class="dnrContent">
                글내용가져오기
            </div>
            <div class="imgwrap">
            
            </div>
        </div>
    </div>

    <jsp:include page="/WEB-INF/views/main/footer.jsp"></jsp:include>

</body>


</html>
