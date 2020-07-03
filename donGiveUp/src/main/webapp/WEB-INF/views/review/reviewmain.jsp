<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <link href="/resources/dahyun/css/reviewmain.css" rel="stylesheet">
    <title>후기메인페이지</title>
    <script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.js"></script>
    <script src="/resources/dahyun/js/8bd2671777.js" crossorigin="anonymous"></script>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100&display=swap" rel="stylesheet">
    <!--캐러셀-->
   
</head>

<body>
    <jsp:include page="/WEB-INF/views/main/header.jsp"></jsp:include>
    <div class="content">
        <div class="reviewTitle">후기</div>
        <div class="reviewNavi">
            <ul>
                <li><a href="/dnreview.don">기부후기</a></li>
                <li><a href="/fdreview.don">펀딩후기</a></li>
                <li><a href="/spreview.don">물품후원후기</a></li>
            </ul>
        </div>
        <div class="dnreviewWrap">
            <div class="tableHead"><a href="/dnreview.don">기부 후기<i class="iconmore fas fa-angle-right"></i></a></div>
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
                    </td>
                    <td>
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
                    </td>
                    <td>
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
                    </td>
                </tr>
            </table>
        </div>
        <div class="fdreviewWrap">
            <div class="tableHead"><a href="/fdreview.don">펀딩 후기<i class="iconmore fas fa-angle-right"></i></a></div>
            <table class="fdreviewList">
                <tr>
                    <td>
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
                    </td>
                    <td>
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
                    </td>
                    <td>
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
                    </td>
                    <td>
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
                    </td>
                </tr>
            </table>
        </div>
        <div class="spreviewWrap">
            <div class="tableHead"><a href="/spreview.don">물품후원 후기<i class="iconmore fas fa-angle-right"></i></a></div>
            <table class="spreviewList">
                <tr>
                    <td>
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
                    </td>
                    <td>
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
                    </td>
                    <td>
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
                    </td>
                    <td>
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
                    </td>
                </tr>
            </table>
        </div>
        <div class="vsreviewWrap">
            <div class="vsrHead"><a href="#">함께해요 후기<i class="iconmore fas fa-angle-right"></i></a></div>
           
        </div>
    </div>


    <jsp:include page="/WEB-INF/views/main/footer.jsp"></jsp:include>
</body>

</html>
