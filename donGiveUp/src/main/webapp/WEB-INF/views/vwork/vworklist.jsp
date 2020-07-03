<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <link href="/resources/dahyun/css/vworklist.css" rel="stylesheet">
    <title>함께해요 게시판</title>
    <script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.js"></script>
    <script src="/resources/dahyun/js/8bd2671777.js" crossorigin="anonymous"></script>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100&display=swap" rel="stylesheet">
</head>

<body>
    <jsp:include page="/WEB-INF/views/main/header.jsp"></jsp:include>
    <div class="content">
        <div class="vworkTitle">함께해요</div>
        <div class="vworkNavi">
            <ul>
                <li><a href="#">전체활동</a></li>
                <li><a href="#">봉사시간인증</a></li>
                <li><a href="#">청소년참여활동</a></li>
            </ul>
        </div>
        <div class="vworklistWrap">
            <div class="vwlisthead">
                <button class="vworkWriteBtn" type="button" onclick="vworkWrite();">함께해요등록</button>
            </div>
            <table class="vworkCardlist">
                <tr>
                    <td>
                        <div class="vworkBox">
                            <a href="/vworkbooking.don">
                                <div class="vworkimg">
                                    <img src="/resources/dahyun/imgs/둥둥2.jpg">
                                    <span class="vworkTicketCount"><strong>5</strong>매남음</span>
                                </div>
                                <div class="vworkboxContent">
                                    <div class="vwbsection">
                                        <span class="vwselect">#봉사시간인증</span>
                                        <span class="vwselect">#청소년참여</span>
                                        <a href="#" class="vscomment">
                                            <i class="iconcomment far fa-comment"></i>
                                            <span>&nbsp;&nbsp;0</span>
                                        </a>
                                    </div>
                                    <span class="vwboxTitle">봉사활동제목가나다라마사아자차카타파하</span>
                                    <div class="vwbDate">
                                        <i class="iconcalendar far fa-calendar-alt"></i>
                                        <span>2020.06.25</span>
                                    </div>
                                    <div class="vwbLocation">
                                        <i class="iconLocation fas fa-map-marker-alt"></i>
                                        <span>서울시 영등포구</span>
                                    </div>
                                    <div class="foundationName">초록우산어린이재단</div>
                                    <div class="vworkEnroll">
                                        <button type="button" onclick="vworkbookingBtn();">참가신청</button>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </td>
                    <td>
                        <div class="vworkBox">
                            <a href="#">
                                <div class="vworkimg">
                                    <img src="/resources/dahyun/imgs/둥둥2.jpg">
                                    <span class="vworkTicketCount"><strong>5</strong>매남음</span>
                                </div>
                                <div class="vworkboxContent">
                                    <div class="vwbsection">
                                        <span class="vwselect">#봉사시간인증</span>
                                        <span class="vwselect">#청소년참여</span>
                                        <a href="#" class="vscomment">
                                            <i class="iconcomment far fa-comment"></i>
                                            <span>&nbsp;&nbsp;0</span>
                                        </a>
                                    </div>
                                    <span class="vwboxTitle">봉사활동제목가나다라마사아자차카타파하</span>
                                    <div class="vwbDate">
                                        <i class="iconcalendar far fa-calendar-alt"></i>
                                        <span>2020.06.25</span>
                                    </div>
                                    <div class="vwbLocation">
                                        <i class="iconLocation fas fa-map-marker-alt"></i>
                                        <span>서울시 영등포구</span>
                                    </div>
                                    <div class="foundationName">초록우산어린이재단</div>
                                    <div class="vworkEnroll">
                                        <button>참가신청</button>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </td>
                    <td>
                        <div class="vworkBox">
                            <a href="#">
                                <div class="vworkimg">
                                    <img src="/resources/dahyun/imgs/둥둥2.jpg">
                                    <span class="vworkTicketCount"><strong>5</strong>매남음</span>
                                </div>
                                <div class="vworkboxContent">
                                    <div class="vwbsection">
                                        <span class="vwselect">#봉사시간인증</span>
                                        <span class="vwselect">#청소년참여</span>
                                        <a href="#" class="vscomment">
                                            <i class="iconcomment far fa-comment"></i>
                                            <span>&nbsp;&nbsp;0</span>
                                        </a>
                                    </div>
                                    <span class="vwboxTitle">봉사활동제목가나다라마사아자차카타파하</span>
                                    <div class="vwbDate">
                                        <i class="iconcalendar far fa-calendar-alt"></i>
                                        <span>2020.06.25</span>
                                    </div>
                                    <div class="vwbLocation">
                                        <i class="iconLocation fas fa-map-marker-alt"></i>
                                        <span>서울시 영등포구</span>
                                    </div>
                                    <div class="foundationName">초록우산어린이재단</div>
                                    <div class="vworkEnroll">
                                        <button>참가신청</button>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </td>
                </tr><br><br><br><br>
                 <tr>
                    <td>
                        <div class="vworkBox">
                            <a href="/vworkbooking.don">
                                <div class="vworkimg">
                                    <img src="/resources/dahyun/imgs/둥둥2.jpg">
                                    <span class="vworkTicketCount"><strong>5</strong>매남음</span>
                                </div>
                                <div class="vworkboxContent">
                                    <div class="vwbsection">
                                        <span class="vwselect">#봉사시간인증</span>
                                        <span class="vwselect">#청소년참여</span>
                                        <a href="#" class="vscomment">
                                            <i class="iconcomment far fa-comment"></i>
                                            <span>&nbsp;&nbsp;0</span>
                                        </a>
                                    </div>
                                    <span class="vwboxTitle">봉사활동제목가나다라마사아자차카타파하</span>
                                    <div class="vwbDate">
                                        <i class="iconcalendar far fa-calendar-alt"></i>
                                        <span>2020.06.25</span>
                                    </div>
                                    <div class="vwbLocation">
                                        <i class="iconLocation fas fa-map-marker-alt"></i>
                                        <span>서울시 영등포구</span>
                                    </div>
                                    <div class="foundationName">초록우산어린이재단</div>
                                    <div class="vworkEnroll">
                                        <button type="button" onclick="vworkbookingBtn();">참가신청</button>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </td>
                    <td>
                        <div class="vworkBox">
                            <a href="#">
                                <div class="vworkimg">
                                    <img src="/resources/dahyun/imgs/둥둥2.jpg">
                                    <span class="vworkTicketCount"><strong>5</strong>매남음</span>
                                </div>
                                <div class="vworkboxContent">
                                    <div class="vwbsection">
                                        <span class="vwselect">#봉사시간인증</span>
                                        <span class="vwselect">#청소년참여</span>
                                        <a href="#" class="vscomment">
                                            <i class="iconcomment far fa-comment"></i>
                                            <span>&nbsp;&nbsp;0</span>
                                        </a>
                                    </div>
                                    <span class="vwboxTitle">봉사활동제목가나다라마사아자차카타파하</span>
                                    <div class="vwbDate">
                                        <i class="iconcalendar far fa-calendar-alt"></i>
                                        <span>2020.06.25</span>
                                    </div>
                                    <div class="vwbLocation">
                                        <i class="iconLocation fas fa-map-marker-alt"></i>
                                        <span>서울시 영등포구</span>
                                    </div>
                                    <div class="foundationName">초록우산어린이재단</div>
                                    <div class="vworkEnroll">
                                        <button>참가신청</button>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </td>
                    <td>
                        <div class="vworkBox">
                            <a href="#">
                                <div class="vworkimg">
                                    <img src="/resources/dahyun/imgs/둥둥2.jpg">
                                    <span class="vworkTicketCount"><strong>5</strong>매남음</span>
                                </div>
                                <div class="vworkboxContent">
                                    <div class="vwbsection">
                                        <span class="vwselect">#봉사시간인증</span>
                                        <span class="vwselect">#청소년참여</span>
                                        <a href="#" class="vscomment">
                                            <i class="iconcomment far fa-comment"></i>
                                            <span>&nbsp;&nbsp;0</span>
                                        </a>
                                    </div>
                                    <span class="vwboxTitle">봉사활동제목가나다라마사아자차카타파하</span>
                                    <div class="vwbDate">
                                        <i class="iconcalendar far fa-calendar-alt"></i>
                                        <span>2020.06.25</span>
                                    </div>
                                    <div class="vwbLocation">
                                        <i class="iconLocation fas fa-map-marker-alt"></i>
                                        <span>서울시 영등포구</span>
                                    </div>
                                    <div class="foundationName">초록우산어린이재단</div>
                                    <div class="vworkEnroll">
                                        <button>참가신청</button>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </td>
                </tr>
            </table>
        </div>
    </div>
    <jsp:include page="/WEB-INF/views/main/footer.jsp"></jsp:include>
    <script>
    	function vworkWrite(){
    		location.href="/vworkwrite.don";
    	}
    	function vworkbookingBtn(){
    		location.href="/vworkbooking.don";
    	}
    </script>
</body>

</html>
