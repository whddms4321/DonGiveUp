<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>

<head>
    <link href="/resources/dahyun/css/spreviewlist.css" rel="stylesheet">
    <meta charset="UTF-8">
    <title>물품후원후기게시판</title>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100&display=swap" rel="stylesheet">
    <script src="/resources/dahyun/js/8bd2671777.js" crossorigin="anonymous"></script>
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.js"></script>

</head>

<body>
    <jsp:include page="/WEB-INF/views/main/header.jsp"></jsp:include>
    <div class="content">
        <div class="reviewTitle">
            <span class="sprtText">물품후원후기</span>
            <div class="searchBox">
                <form id="searchFrm" method="get">
                    <span class="sText"><input id="stinput" type="text" placeholder="검색어를 입력해주세요"></span>
                    <span class="icon"><button id="sBtn"><i class="iconsearch fas fa-search"></i></button></span>
                </form>
            </div>
        </div>
        <div class="sprNavi">
            <ul>
                <li><a href="/reviewmain.don">후기메인페이지</a></li>
                <li><a href="/dnreview.don">기부후기</a></li>
                <li><a href="/fdreview.don">펀딩후기</a></li>
            </ul>
        </div>
        <div class="sprlistWrap">
            <div class="sprlisthead">
                <button class="sprWriteBtn" type="button" onclick="sprWrite();">후원후기등록</button>
            </div>
        </div>
        <div class="spreviewWrap">
            <table class="spreviewList">
                <tr>
                    <td>
                        <a href="/sprview.don">
                            <div class="spreviewBox">
                                <div class="sprimg">
                                    <img src="/resources/dahyun/imgs/강쥐용품.jpg">
                                </div>
                                <div class="sprText">
                                    <span class="sprTitle">강아지용품 후원 유기견들에게 행복을.</span>
                                    <span class="foundationName">댕댕이행복재단</span>
                                </div>
                                <div class="sprLine"></div>
                            </div>
                        </a>
                    </td>
                    <td>
                        <a href="#">
                            <div class="spreviewBox">
                                <div class="sprimg">
                                    <img src="/resources/dahyun/imgs/강쥐용품.jpg">
                                </div>
                                <div class="sprText">
                                    <span class="sprTitle">강아지용품 후원 유기견들에게 행복을.</span>
                                    <span class="foundationName">댕댕이행복재단</span>
                                </div>
                                <div class="sprLine"></div>
                            </div>
                        </a>
                    </td>
                    <td>
                        <a href="#">
                            <div class="spreviewBox">
                                <div class="sprimg">
                                    <img src="/resources/dahyun/imgs/강쥐용품.jpg">
                                </div>
                                <div class="sprText">
                                    <span class="sprTitle">강아지용품 후원 유기견들에게 행복을.</span>
                                    <span class="foundationName">댕댕이행복재단</span>
                                </div>
                                <div class="sprLine"></div>
                            </div>
                        </a>
                    </td>
                    <td>
                        <a href="#">
                            <div class="spreviewBox">
                                <div class="sprimg">
                                    <img src="/resources/dahyun/imgs/강쥐용품.jpg">
                                </div>
                                <div class="sprText">
                                    <span class="sprTitle">강아지용품 후원 유기견들에게 행복을.</span>
                                    <span class="foundationName">댕댕이행복재단</span>
                                </div>
                                <div class="sprLine"></div>
                            </div>
                        </a>
                    </td>
                </tr>
              
            </table>
        </div>
    </div>
    <jsp:include page="/WEB-INF/views/main/footer.jsp"></jsp:include>
    <script>
        $(function() {
            $("#sBtn").css("cursor", "pointer").focusin(function() {
                $(this).css("outline", "none");
            });
            $("#stinput").focusin(function() {
                $(this).css("outline", "none");
            });
        });

        function sprWrite() {
            location.href = "/sprwrite.don";
        };

    </script>
</body>

</html>
