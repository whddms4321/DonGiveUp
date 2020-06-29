<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <link href="/resources/dahyun/css/vworkbooking.css" rel="stylesheet">
    <title>Don Give Up</title>
    <script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.js"></script>
    <script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.js"></script>
    <script src="/resources/dahyun/js/8bd2671777.js" crossorigin="anonymous"></script>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker3.standalone.min.css">
</head>

<body>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/locales/bootstrap-datepicker.kr.min.js"></script>
    <jsp:include page="/WEB-INF/views/main/header.jsp"></jsp:include>
    <div class="content">
        <div class="vworkbTitle">봉사활동제목가나다라마사아자차카타파하<span>&nbsp;>&nbsp;예약 정보 입력</span></div>
        <form>
            <div class="bookingWrap1">
                <div class="vwImg">
                    <img src="/resources/dahyun/imgs/둥둥2.jpg">
                </div>
                <div class="vwDate">

                </div>
            </div>
            <div class="bookingWrap2">
                <div class="vwInfo">
                    <div class="introWrap">
                        <p class="introDetail">
                            <br>
                            [모집대상] 14세 이상 청소년 포함 누구나
                            <br>
                            [봉사활동시간] 13-16시
                            <br>
                            <br>
                            [봉사활동소개]
                            <br>
                            1. 오늘 하루, 우리가 해야 할 일에 대해 배우고 역할을 나눕니다.
                            <br>
                            2. 각자 맡은 음식의 재료를 준비하고, 씻고 다듬어 요리합니다.
                            <br>
                            3. 길게 줄 선 이웃을 위해 배식을 진행합니다.
                            <br><br>
                            * 초록우산어린이재단이 주최하는 본 활동의 원활한 운영을 위해 재단법인 Don Give Up에서 신청 모집을 대행, 지원합니다.
                        </p>
                    </div>
                </div>
                <div class="bookingInfo">
                    <div class="BIWrap">
                        <div id="ticket">
                            <span><i class="iconPay far fa-credit-card"></i></span>
                            <span id="ticketText">참가비/참여인원선택</span>
                        </div>
                        <div id="price">
                            <span id="fee">100</span>
                            <div class="countControl">
                                <a href="#" title="빼기"><i class="iconminus fas fa-minus"></i></a>
                                <input type="text" value="0">
                                <a href="#" title="더하기"><i class="iconplus fas fa-plus"></i></a>
                            </div>
                        </div>
                        <div id="reserver">
                            <span><i class="iconUser fas fa-user"></i></span>
                            <span id="reserverText">예약자정보</span>
                        </div>
                        <div id="rTable">
                            <table>
                                <tr>
                                    <td>이름</td>
                                    <td><input type="text"></td>
                                </tr>
                                <tr>
                                    <td>참여일</td>
                                    <td><input id="datePicker" type="text"></td>
                                </tr>
                                <tr>
                                    <td>아이디</td>
                                    <td><input type="text" readonly></td>
                                </tr>
                                <tr>
                                    <td>vms아이디</td>
                                    <td><input type="text" value="vms아이디 입력"></td>
                                </tr>
                                <tr>
                                    <td colspan="2"><button>예약하기</button></td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </form>
        <div class="detailWrap">
            <div class="detailHead">
                <div id="detailBtn">상세정보</div>
                <div id="addressBtn">오시는길</div>
            </div>
        </div>
    </div>
    <jsp:include page="/WEB-INF/views/main/footer.jsp"></jsp:include>
</body>

</html>
