<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>

<head>
    <link href="/resources/dahyun/css/fdreviewlist.css" rel="stylesheet">
    <meta charset="UTF-8">
    <title>펀딩후기게시판</title>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100&display=swap" rel="stylesheet">
    <script src="/resources/dahyun/js/8bd2671777.js" crossorigin="anonymous"></script>
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.js"></script>

</head>

<body>
    <jsp:include page="/WEB-INF/views/main/header.jsp"></jsp:include>
    <div class="content">
        <div class="reviewTitle">
            <span class="fdrtText">펀딩후기</span>
            <div class="searchBox">
                <form id="searchFrm" method="get">
                    <span class="sText"><input id="stinput" type="text" placeholder="검색어를 입력해주세요"></span>
                    <span class="icon"><button id="sBtn"><i class="iconsearch fas fa-search"></i></button></span>
                </form>
            </div>
        </div>
        <div class="fdrNavi">
            <ul>
                <li><a href="/dnreviewlist.don?count=1">기부후기</a></li>
                <li><a href="/fdreviewlist.don?count=1">펀딩 후기</a></li>
                <li><a href="/spreview.don">물품후원 후기</a></li>
            </ul>
        </div>
        <div class="fdrlistWrap">
            <div class="fdrlisthead">
                <button class="fdrWriteBtn" type="button" onclick="fdrWrite();">펀딩후기등록</button>
            </div>
        </div>
        <div class="fdreviewWrap">
            <table class="fdreviewList">
                <tr>
                    <td>
                        <a href="/fdrview.don">
                            <div class="fdreviewBox">
                                <div class="fdrimg">
                                    <img src="/resources/dahyun/imgs/아슈크림.jpg">
                                </div>
                                <div class="fdrText">
                                    <span class="fdrTitle">찬혀긔가 직접 만든 우유 아이스크림 펀딩 후기.</span>
                                    <span class="foundationName">차녀기아슈크림가게</span>
                                </div>
                                <div class="fdrLine"></div>
                            </div>
                        </a>
                    </td>
                    <td>
                        <a href="#">
                            <div class="fdreviewBox">
                                <div class="fdrimg">
                                    <img src="/resources/dahyun/imgs/아슈크림.jpg">
                                </div>
                                <div class="fdrText">
                                    <span class="fdrTitle">찬혀긔가 직접 만든 우유 아이스크림 펀딩 후기.</span>
                                    <span class="foundationName">차녀기아슈크림가게</span>
                                </div>
                                <div class="fdrLine"></div>
                            </div>
                        </a>
                    </td>
                    <td>
                        <a href="#">
                            <div class="fdreviewBox">
                                <div class="fdrimg">
                                    <img src="/resources/dahyun/imgs/아슈크림.jpg">
                                </div>
                                <div class="fdrText">
                                    <span class="fdrTitle">찬혀긔가 직접 만든 우유 아이스크림 펀딩 후기.</span>
                                    <span class="foundationName">차녀기아슈크림가게</span>
                                </div>
                                <div class="fdrLine"></div>
                            </div>
                        </a>
                    </td>
                    <td>
                        <a href="#">
                            <div class="fdreviewBox">
                                <div class="fdrimg">
                                    <img src="/resources/dahyun/imgs/아슈크림.jpg">
                                </div>
                                <div class="fdrText">
                                    <span class="fdrTitle">찬혀긔가 직접 만든 우유 아이스크림 펀딩 후기.</span>
                                    <span class="foundationName">차녀기아슈크림가게</span>
                                </div>
                                <div class="fdrLine"></div>
                            </div>
                        </a>
                    </td>
                </tr>
                <tr>
                    <td>
                        <a href="/fdrview.don">
                            <div class="fdreviewBox">
                                <div class="fdrimg">
                                    <img src="/resources/dahyun/imgs/아슈크림.jpg">
                                </div>
                                <div class="fdrText">
                                    <span class="fdrTitle">찬혀긔가 직접 만든 우유 아이스크림 펀딩 후기.</span>
                                    <span class="foundationName">차녀기아슈크림가게</span>
                                </div>
                                <div class="fdrLine"></div>
                            </div>
                        </a>
                    </td>
                    <td>
                        <a href="#">
                            <div class="fdreviewBox">
                                <div class="fdrimg">
                                    <img src="/resources/dahyun/imgs/아슈크림.jpg">
                                </div>
                                <div class="fdrText">
                                    <span class="fdrTitle">찬혀긔가 직접 만든 우유 아이스크림 펀딩 후기.</span>
                                    <span class="foundationName">차녀기아슈크림가게</span>
                                </div>
                                <div class="fdrLine"></div>
                            </div>
                        </a>
                    </td>
                    <td>
                        <a href="#">
                            <div class="fdreviewBox">
                                <div class="fdrimg">
                                    <img src="/resources/dahyun/imgs/아슈크림.jpg">
                                </div>
                                <div class="fdrText">
                                    <span class="fdrTitle">찬혀긔가 직접 만든 우유 아이스크림 펀딩 후기.</span>
                                    <span class="foundationName">차녀기아슈크림가게</span>
                                </div>
                                <div class="fdrLine"></div>
                            </div>
                        </a>
                    </td>
                    <td>
                        <a href="#">
                            <div class="fdreviewBox">
                                <div class="fdrimg">
                                    <img src="/resources/dahyun/imgs/아슈크림.jpg">
                                </div>
                                <div class="fdrText">
                                    <span class="fdrTitle">찬혀긔가 직접 만든 우유 아이스크림 펀딩 후기.</span>
                                    <span class="foundationName">차녀기아슈크림가게</span>
                                </div>
                                <div class="fdrLine"></div>
                            </div>
                        </a>
                    </td>
                </tr>
                <tr>
                    <td>
                        <a href="/fdrview.don">
                            <div class="fdreviewBox">
                                <div class="fdrimg">
                                    <img src="/resources/dahyun/imgs/아슈크림.jpg">
                                </div>
                                <div class="fdrText">
                                    <span class="fdrTitle">찬혀긔가 직접 만든 우유 아이스크림 펀딩 후기.</span>
                                    <span class="foundationName">차녀기아슈크림가게</span>
                                </div>
                                <div class="fdrLine"></div>
                            </div>
                        </a>
                    </td>
                    <td>
                        <a href="#">
                            <div class="fdreviewBox">
                                <div class="fdrimg">
                                    <img src="/resources/dahyun/imgs/아슈크림.jpg">
                                </div>
                                <div class="fdrText">
                                    <span class="fdrTitle">찬혀긔가 직접 만든 우유 아이스크림 펀딩 후기.</span>
                                    <span class="foundationName">차녀기아슈크림가게</span>
                                </div>
                                <div class="fdrLine"></div>
                            </div>
                        </a>
                    </td>
                    <td>
                        <a href="#">
                            <div class="fdreviewBox">
                                <div class="fdrimg">
                                    <img src="/resources/dahyun/imgs/아슈크림.jpg">
                                </div>
                                <div class="fdrText">
                                    <span class="fdrTitle">찬혀긔가 직접 만든 우유 아이스크림 펀딩 후기.</span>
                                    <span class="foundationName">차녀기아슈크림가게</span>
                                </div>
                                <div class="fdrLine"></div>
                            </div>
                        </a>
                    </td>
                    <td>
                        <a href="#">
                            <div class="fdreviewBox">
                                <div class="fdrimg">
                                    <img src="/resources/dahyun/imgs/아슈크림.jpg">
                                </div>
                                <div class="fdrText">
                                    <span class="fdrTitle">찬혀긔가 직접 만든 우유 아이스크림 펀딩 후기.</span>
                                    <span class="foundationName">차녀기아슈크림가게</span>
                                </div>
                                <div class="fdrLine"></div>
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

        function fdrWrite() {
            location.href = "/fdrwrite.don";
        };

    </script>
</body>

</html>
