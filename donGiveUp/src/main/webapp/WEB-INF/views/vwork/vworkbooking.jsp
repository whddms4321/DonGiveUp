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

    <!-- 카카오지도 -->
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e8d4b89b7ec265495c7c05f35a7366c1&libraries=services,clusterer,drawing"></script>

</head>

<body>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <jsp:include page="/WEB-INF/views/main/header.jsp"></jsp:include>
    <div class="content">
        <c:if test="${sessionScope.member.memberId == v.vworkWriter}">
            <button id="editBtn" value="${v.vworkNo}" type="button" onclick="edit();">수정</button>
        </c:if>
        <div class="vworkbTitle">
            ${v.vworkTitle }<span>&nbsp;>&nbsp;예약 정보 입력</span>
        </div>

        <div class="bookingWrap1">
            <div class="vwImg">
                <img src="/resources/upload/images/${v.vworkFilepath }">
            </div>
            <div class="vwDate">
                <div class="joinD">
                    <div id="joinDhead">
                        <span><i class='iconcalendar far fa-calendar-alt'></i></span>
                        <span id="jdText">봉사날짜</span>
                    </div>
                    <span>${v.vworkJoinDate }</span>
                </div>
                <div class="jdBtnWrap">
                    <div id="jdBtnhead">
                        <span><i class="iconableD far fa-calendar-check"></i></span>
                        <span id="jdable">신청 가능한 날짜</span>
                    </div>
                    <div class="ulWrap">
                        <ul class="ul">
                            <li class="li" id="li_0" value="${v.vworkNo }"></li>
                            <li class="li" id="li_1" value="${v.vworkNo }"></li>
                            <li class="li" id="li_2" value="${v.vworkNo }"></li>
                            <li class="li" id="li_3" value="${v.vworkNo }"></li>
                            <li class="li" id="li_4" value="${v.vworkNo }"></li>
                            <li class="li" id="li_5" value="${v.vworkNo }"></li>
                        </ul>
                    </div>
                    <div class="ul2Wrap">
                        <div class="ticket"></div>
                        <div class="ticket"></div>
                        <div class="ticket"></div>
                        <div class="ticket"></div>
                        <div class="ticket"></div>
                        <div class="ticket"></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="bookingWrap2">
            <div class="vwInfo">
                <div id="introhead">
                    <span><i class="iconboard far fa-clipboard"></i></span>
                    <span id="itr">간단소개</span>
                </div>
                <div class="introWrap">
                    <div id="introW">
                        ${v.vworkIntroBr }
                    </div>
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
                            <span id="fee">${v.vworkFee }</span>
                            <div class="countControl">
                                <a href="javascript:void(0)" id="minusBtn" title="빼기"><i class="iconminus fas fa-minus"></i></a>
                                <div id="countPer">1</div>
                                <!--신청가능한카운트까지만 더하기 가능(선택한 날짜의 남은 매수까지)-->
                                <a href="javascript:void(0)" id="plusBtn" title="더하기"><i class="iconplus fas fa-plus"></i></a>
                            </div>
                            <div class="total">
                                <span id="totalText">Total</span>
                                <span id="totalFee">${v.vworkFee }</span>
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
                                    <td><input type="text" placeholder="${sessionScope.member.memberName}"></td>
                                </tr>
                                <tr>
                                    <td>참여일</td>
                                    <td><input id="applyDate" name="vserverDate" type="text" readonly></td>
                                </tr>
                                <tr>
                                    <td>아이디</td>
                                    <td><input type="text" value="${sessionScope.member.memberId }" readonly></td>
                                </tr>
                                <tr>
                                    <td>vms아이디</td>
                                    <td><input type="text" placeholder="vms아이디 입력"></td>
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
                    <div id="dC">
                        ${v.vworkDetail }
                    </div>
                </div>
                <div class="addressContent">
                    <div id="adWrap1">
                        <div id="map" style="width:374.4px; height:450px;"></div>
                    </div>
                    <div id="adWrap2">
                        <div id="foundation">
                            <span id="fName">${v.companyName }</span><a href="#" id="fDonation"><i class="iconFoundation fas fa-home"></i>정기후원</a>
                            <span id="fTitle">-${v.vworkTitle }</span>
                        </div>
                        <div id="adInfo">
                            <span id="Ad"><i class="iconLocation fas fa-map-marker-alt"></i>${v.vworkAddress }</span>
                            <span id="phone"><i class="iconPhone fas fa-phone-alt"></i>${v.memberPhone }</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="/WEB-INF/views/main/footer.jsp"></jsp:include>

    <script>
        /*var count = 0;
        $(function() {
            $("#plusBtn").css("cursor", "pointer").click(function() {
                count = Number($("#countPer").html());
                var fee = Number($("#fee").html());
                $("#countPer").html(count + 1);
                count = Number($("#countPer").html());
                $("#totalFee").html(fee * count);
                if ( count > 1) {
                    $(".iconminus").css("background-color", "#0fbcff");
                    $("#minusBtn").css("cursor", "pointer");
                }
            });

            $("#minusBtn").click(function() {
                count = Number($("#countPer").html());
                var fee = Number($("#fee").html());
                if (  count > 1) {
                    $("#countPer").html(count - 1);
                    count = Number($("#countPer").html());
                    if (count == 1) {
                        $(".iconminus").css("background-color", "darkgray");
                    }
                }
                $("#totalFee").html(fee * count);
            });
        });
        */
        function edit() {
            var vworkNo = $("#editBtn").val();
            location.href = "/vworkeditFrm.don?vworkNo=" + vworkNo;
        }
        $("#addressBtn").click(function() {
            $(this).css("background-color", "#fff");
            $(this).css("color", "rgba(0,0,0,.5)");
            $(".addressContent").show();
            map.relayout();

            $(".detailContent").hide();
            $("#detailBtn").css("background-color", "#e3f0f6");
            $("#detailBtn").css("color", "#fff");
        });
        $("#detailBtn").click(function() {
            $(this).css("background-color", "#fff");
            $(this).css("color", "rgba(0,0,0,.5)");
            $(".detailContent").show();
            $(".addressContent").hide();
            $("#addressBtn").css("background-color", "#e3f0f6");
            $("#addressBtn").css("color", "#fff");
        });

        $("#vwbookingBtn").css("cursor", "pointer").click(function() {
            $("#vserForm").attr("action", "/vworkpayment.don");
            $("#vserForm").submit();
        });
        //봉사신청일 넣기
        var str = "${v.vworkJoinDate}";
        var arr = str.split(',');
        //console.log(arr);
        var html = "";
        for (i = 0; i < arr.length; i++) {
            html = "<a href='javascript:void(0)' class='jdBtn'>" + arr[i] + "</a>";
            $("#li_" + i).append(html);
            //console.log(i);
        }
        //봉사신청클릭시 남은 티켓수
        var ticket;
        var index;
        var count;
        var cnt; 
        var fee = Number($("#fee").html());
        $(function() {
            $(".jdBtn").click(function() {
                $(this).css("background-color", "#e3f0f6");
                $(this).parent().siblings().children().css("background-color", "#80d4f6");
                $(this).css("color", "#3D3B3A");
                $(this).parent().siblings().children().css("color", "#fff");
                var vserdate = $(this).html();
                index = $(".jdBtn").parent().index($(this).parent());
                //console.log(index);
                var vworkNo = $(this).parent().val();
                console.log("신청일:"+vserdate);
                $.ajax({
                    url: "/vwticketCnt.don",
                    type: "POST",
                    data: {
                        vserdate: vserdate,
                        vworkNo: vworkNo
                    },
                    success: function(data) {
                        var result = Number(data);

                        var count = "${v.vworkPer}";

                        ticket = count - result;


                        $(".ticket").eq(index).html(ticket + "매남음");
                        $(".ticket").eq(index).siblings().html("");
                        $("#applyDate").val("");
                        $("#applyDate").val(vserdate);

                        if (ticket != 0) {
                            $(".iconplus").css("background-color", "#0fbcff");
                        } else if (ticket == 0) {
                            $("#plusBtn").click(function() {
                                return false;
                            });
                            $("#minusBtn").click(function() {
                                return false;
                            });
                        }


                        cnt = Number($("#countPer").html());
                        $("#plusBtn").click(function() {
                            $("#totalFee").html(cnt * fee);
                            if (0 < cnt <= ticket) {
                                $(".iconminus").css("background-color", "#0fbcff");
                                if (cnt < ticket) {
                                    $("#countPer").html(cnt + 1);
                                    cnt = Number($("#countPer").html());
                                    $("#totalFee").html(cnt * fee);
                                    console.log("cnt:" + cnt);

                                }
                                cnt = Number($("#countPer").html());
                                if (cnt == ticket) {
                                    $(".iconplus").css("background-color", "darkgray");
                                }
                            }
                        });

                        cnt = Number($("#countPer").html());
                        $("#minusBtn").click(function() {
                            $(".iconplus").css("background-color", "#0fbcff");
                            if (1 < cnt) {
                                $("#countPer").html(cnt - 1);
                                cnt = Number($("#countPer").html());
                                $("#totalFee").html(cnt * fee);
                                console.log("cnt : " + cnt);
                            }
                            cnt = Number($("#countPer").html());
                            if (cnt == 1) {
                                $(".iconminus").css("background-color", "darkgray");
                            }
                        });


                    },
                    error: function() {
                        console.log("실행 실패");
                    }

                });

            });
            $(".addressContent").hide();

        });

        /*$(function() {
            $(".ticket").eq(index).html().onchange(function() {
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
            })
            
        });*/

        /* $(function() {
             $(".datePicker").on('input', function() {
                 var pdate = $("#datePicker").val();
                 console.log(pdate);
                 for (i = 0; i < arr.length; i++) {
                     if (!pdate.equals(arr[i])) {
                         alert("봉사날짜중에서 선택해주세요.")
                     }
                 }
             });
         });*/
        //지도 api
        var xx;
        var yy;
        var addr = "${v.vworkAddress }";
        //console.log(addr);
        var geocoder = new kakao.maps.services.Geocoder();

        var callback = function(result, status) {
            if (status === kakao.maps.services.Status.OK) {
                //console.log(result);
                xx = result[0].x;
                yy = result[0].y;
                //console.log(xx + "," + yy);
                var container = document.getElementById('map'); //지도를 담을 영역
                var options = {
                    center: new kakao.maps.LatLng(yy, xx), //지도의 중심좌표.
                    level: 6
                };
                map = new kakao.maps.Map(container, options);
                var markerPosition = new kakao.maps.LatLng(yy, xx);

                // 마커를 생성합니다
                var marker = new kakao.maps.Marker({
                    position: markerPosition
                });

                // 마커가 지도 위에 표시되도록 설정합니다
                marker.setMap(map);


            }
        };

        geocoder.addressSearch(addr, callback);
        kakao.maps.event.addListener(map, 'center_changed', function() {

            // 지도의  레벨을 얻어옵니다
            var level = map.getLevel();

            // 지도의 중심좌표를 얻어옵니다 
            var latlng = map.getCenter();
        });

    </script>


</body>

</html>
