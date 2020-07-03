<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">

    <link href="/resources/dahyun/css/vworkbooking.css" rel="stylesheet">
    <title>함께해요 예약하기</title>

    <script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.js"></script>
    <script src="/resources/dahyun/js/8bd2671777.js" crossorigin="anonymous"></script>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100&display=swap" rel="stylesheet">
    <script src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=5tpvdsp8rb&submodules=geocoder"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker3.standalone.min.css">
</head>

<body>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/locales/bootstrap-datepicker.kr.min.js"></script>
    <jsp:include page="/WEB-INF/views/main/header.jsp"></jsp:include>
    <div class="content">
        <div class="vworkbTitle">봉사활동제목가나다라마사아자차카타파하<span>&nbsp;>&nbsp;예약 정보 입력</span></div>

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
            <form id="vserForm" method="post">
                <div class="bookingInfo">
                    <div class="BIWrap">
                        <div id="ticket">
                            <span><i class="iconPay far fa-credit-card"></i></span>
                            <span id="ticketText">참가비/참여인원선택</span>
                        </div>
                        <div id="price">
                            <span id="fee">1000</span>
                            <div class="countControl">
                                <a href="javascript:void(0)" id="minusBtn" title="빼기"><i class="iconminus fas fa-minus"></i></a>
                                <div id="countPer">1</div>
                                <!--신청가능한카운트까지만 더하기 가능(선택한 날짜의 남은 매수까지)-->
                                <a href="javascript:void(0)" id="plusBtn" title="더하기"><i class="iconplus fas fa-plus"></i></a>
                            </div>
                            <div class="total">
                                <span id="totalText">Total</span>
                                <span id="totalFee">1000</span>
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
                                    <td colspan="2"><button id="vwbookingBtn">예약하기</button></td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
            </form>
        </div>

        <div class="detailWrap">
            <div class="detailHead">
                <div id="detailBtn">상세정보</div>
                <div id="addressBtn">오시는길</div>
            </div>
            <div class="contentWrap">
                <div class="detailContent">
                    d
                </div>
                <div class="addressContent">
                    <div id="adWrap1">
                        <div id="map"></div>
                    </div>
                    <div id="adWrap2">
                        <div id="foundation">
                            <span id="fName">초록우산어린이재단</span><a href="#" id="fDonation"><i class="iconFoundation fas fa-home"></i>정기후원</a>
                            <span id="fTitle">-봉사활동제목가나다라마사아자차카타파하</span>
                        </div>
                        <div id="adInfo">
                            <span id="Ad"><i class="iconLocation fas fa-map-marker-alt"></i>서울시 영등포구 선유로 이레빌딩 19층</span>
                            <span id="phone"><i class="iconPhone fas fa-phone-alt"></i>010-1111-2222</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="/WEB-INF/views/main/footer.jsp"></jsp:include>

    <script>
        var count = 0;
        $(function() {
            $("#plusBtn").css("cursor", "pointer").click(function() {
                count = Number($("#countPer").html());
                var fee = Number($("#fee").html());
                $("#countPer").html(count + 1);
                count = Number($("#countPer").html());
                $("#totalFee").html(fee * count);
                if (count > 1) {
                    $(".iconminus").css("background-color", "#0fbcff");
                    $("#minusBtn").css("cursor", "pointer");
                }
            });

            $("#minusBtn").click(function() {
                count = Number($("#countPer").html());
                var fee = Number($("#fee").html());
                if (count > 1) {
                    $("#countPer").html(count - 1);
                    count = Number($("#countPer").html());
                    if (count == 1) {
                        $(".iconminus").css("background-color", "darkgray");
                    }
                }
                $("#totalFee").html(fee * count);
            });
        });
        
        $("#addressBtn").css("cursor", "pointer").click(function() {
            $(this).css("background-color", "#fff");
            $(this).css("color", "rgba(0,0,0,.5)");
            $(".addressContent").show();
            $(".detailContent").hide();
            $("#detailBtn").css("background-color", "#e3f0f6");
            $("#detailBtn").css("color", "#fff");
        });
        $("#detailBtn").css("cursor", "pointer").click(function() {
            $(this).css("background-color", "#fff");
            $(this).css("color", "rgba(0,0,0,.5)");
            $(".detailContent").show();
            $(".addressContent").hide();
            $("#addressBtn").css("background-color", "#e3f0f6");
            $("#addressBtn").css("color", "#fff");
        });
        window.onload = function() {
            var map = new naver.maps.Map('map', {
                center: new naver.maps.LatLng(37.533807, 126.896772),
                zoom: 17,
                zoomControl: true,
                zoomControlOptions: {
                    position: naver.maps.Position.TOP_RIGHT,
                    style: naver.maps.ZoomControlStyle.SMALL
                }
            });
            var marker = new naver.maps.Marker({
                position: new naver.maps.LatLng(37.533807, 126.896772),
                map: map
            });
            //최초 중심지의 주소
            var contentString = [
                "<div class='iw_inner'>",
                " <h3>KH정보교육원</h3>",
                " <p>서울시 영등포구 선유로2동 57 이레빌딩 19F</p>",
                "</div>"
            ].join("");
        }
        $("#vwbookingBtn").css("cursor", "pointer").click(function() {
            $("#vserForm").attr("action", "/vworkpayment.don");
            $("#vserForm").submit();
        });

    </script>


</body>

</html>
