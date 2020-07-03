<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>

<head>
    <link href="/resources/dahyun/css/dnreviewlist.css" rel="stylesheet">
    <meta charset="UTF-8">
    <title>기부후기게시판</title>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100&display=swap" rel="stylesheet">
    <script src="/resources/dahyun/js/8bd2671777.js" crossorigin="anonymous"></script>
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.js"></script>

</head>

<body>
    <jsp:include page="/WEB-INF/views/main/header.jsp"></jsp:include>
    <div class="content">
        <div class="reviewTitle">
            <span class="dnrtText">기부후기</span>
            <div class="searchBox">
                <form id="searchFrm" method="get">
                    <span class="sText"><input id="stinput" type="text" placeholder="검색어를 입력해주세요"></span>
                    <span class="icon"><button id="sBtn"><i class="iconsearch fas fa-search"></i></button></span>
                </form>
            </div>
        </div>
        <div class="dnrNavi">
            <ul>
                <li><a href="/reviewmain.don">후기메인페이지</a></li>
                <li><a href="/fdreview.don">펀딩후기</a></li>
                <li><a href="#">물품후원후기</a></li>
            </ul>
        </div>
        <div class="dnrlistWrap">
            <div class="dnrlisthead">
                <button class="dnrWriteBtn" type="button" onclick="dnrWrite();">기부후기등록</button>
            </div>
        </div>
        <div class="dnreviewWrap">
            <table class="dnreviewList">
                <tr>
                    <td>
                        <a href="/dnrview.don">
                            <div class="dnreviewBox">
                                <div class="dnrimg">
                                    <img src="/resources/dahyun/imgs/콩삼이.jpg">
                                </div>
                                <div class="dnrText">
                                    <span class="dnrTitle">귀여운 콩삼이가 고구마간식을 기부받았어요.</span>
                                    <span class="foundationName">댕댕이행복재단</span>
                                </div>
                                <span class="=prgWrap">
                                    <progress value="70" max="100" class="prgBar"></progress>
                                </span>
                                <span class="finalDnMoney">700,000,000</span>
                            </div>
                        </a>
                    </td>
                    <td>
                        <a href="#">
                            <div class="dnreviewBox">
                                <div class="dnrimg">
                                    <img src="/resources/dahyun/imgs/콩삼이.jpg">
                                </div>
                                <div class="dnrText">
                                    <span class="dnrTitle">귀여운 콩삼이가 고구마간식을 기부받았어요.</span>
                                    <span class="foundationName">댕댕이행복재단</span>
                                </div>
                                <span class="=prgWrap">
                                    <progress value="70" max="100" class="prgBar"></progress>
                                </span>
                                <span class="finalDnMoney">700,000,000</span>
                            </div>
                        </a>
                    </td>
                    <td>
                        <a href="#">
                            <div class="dnreviewBox">
                                <div class="dnrimg">
                                    <img src="/resources/dahyun/imgs/콩삼이.jpg">
                                </div>
                                <div class="dnrText">
                                    <span class="dnrTitle">귀여운 콩삼이가 고구마간식을 기부받았어요.</span>
                                    <span class="foundationName">댕댕이행복재단</span>
                                </div>
                                <span class="=prgWrap">
                                    <progress value="70" max="100" class="prgBar"></progress>
                                </span>
                                <span class="finalDnMoney">700,000,000</span>
                            </div>
                        </a>
                    </td>
                    <td>
                        <a href="#">
                            <div class="dnreviewBox">
                                <div class="dnrimg">
                                    <img src="/resources/dahyun/imgs/콩삼이.jpg">
                                </div>
                                <div class="dnrText">
                                    <span class="dnrTitle">귀여운 콩삼이가 고구마간식을 기부받았어요.</span>
                                    <span class="foundationName">댕댕이행복재단</span>
                                </div>
                                <span class="=prgWrap">
                                    <progress value="70" max="100" class="prgBar"></progress>
                                </span>
                                <span class="finalDnMoney">700,000,000</span>
                            </div>
                        </a>
                    </td>
                </tr>
            </table>
        </div>
    </div>
    <jsp:include page="/WEB-INF/views/main/footer.jsp"></jsp:include>
    <script>
        $(function(){
            $("#sBtn").css("cursor","pointer").focusin(function(){
               $(this).css("outline","none"); 
            });
            $("#stinput").focusin(function(){
               $(this).css("outline","none"); 
            });
        });
        
        function dnrWrite(){
    		location.href="/dnrwrite.don";
    	};
    </script>
</body>

</html>
