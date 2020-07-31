<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>
    <link href="/resources/dahyun/css/vworkpayment.css" rel="stylesheet">
    <meta charset="UTF-8">

    <title>함께해요 결제</title>

    <script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.js"></script>
    <script src="/resources/dahyun/js/8bd2671777.js" crossorigin="anonymous"></script>
    <script src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100&display=swap" rel="stylesheet">
</head>

<body>
    <jsp:include page="/WEB-INF/views/main/header.jsp"></jsp:include>
    <div class="content">
        <div class="paymentTitle">${vw.vworkTitle}<span>&nbsp;>&nbsp;예약/결제</span></div>
        <div class="paymentbill">
            <div class="imgwrap">
                <img src="/resources/dahyun/imgs/결제손.jpg">
            </div>
            <div class="applyInfo">
                <div class="vsInfrwrap">
                    <div class="info">
                        <span>신청인</span>
                        <input type="text" id="memberName" value="${sessionScope.member.memberName}" readonly>
                    </div>
                    <div class="info">
                        <span>봉사장소</span>
                        <input type="text" id="vworkAddress" value="${vw.vworkAddress}" readonly>
                    </div>
                    <div class="info">
                        <span>신청날짜</span>
                        <input type="text" id="vserverDay" name="vserverDay" value="${vs.vserverDay}" readonly>
                    </div>
                    <div class="info">
                        <span>신청인원</span>
                        <input type="text" id="vserverPer" name="vserverPer" value="${vs.vserverPer}" readonly>
                    </div>
                    <div class="info">
                        <span>결제금액</span><span id="text">*당일 불참을 방지하기 위해 예약금을 결제합니다.</span>
                        <input type="text" id="vserverPrice" name="vserverPrice" value="${vs.vserverPrice}" readonly>
                    </div>
                </div>
                <div class="btnwrap">
                    <button id="payBtn">Pay now</button>
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="/WEB-INF/views/main/footer.jsp"></jsp:include>
</body>
<script>
    var vserverDay = "${vs.vserverDay}";
    var vserverPer = ${vs.vserverPer};
    var vserverVms = "${vs.vserverVms}";
    var vserverWriter = "${sessionScope.member.memberId}";
    var vserverRef = ${vw.vworkNo};


    $("#payBtn").click(function() {

        var amount = $("#vserverPrice").val();
        console.log(vserverPrice);

        IMP.init('imp66596224');
        IMP.request_pay({
            pg: 'inicis',
            pay_method: 'card',
            merchant_uid: 'merchant_' + new Date().getTime(),
            name: '주문명:결제테스트',
            amount: amount,
            buyer_email: 'iamport@siot.do',
            buyer_name: '${sessionScope.member.memberName}',
            buyer_tel: '${sessionScope.member.memberPhone}',
            buyer_addr: '${sessionScope.member.memberAddr}'
        }, function(rsp) {
            if (rsp.success) {
                $.ajax({
                    url: "/vserverinsert.don",
                    type:"POST",
                    data: {
                        vserverDay: vserverDay,
                        vserverPer: vserverPer,
                        vserverVms: vserverVms,
                        vserverWriter: vserverWriter,
                        vserverRef: vserverRef,
                        amount: amount
                    },
                    success: function(data) {
                        var result = Number(data);
                        if (result > 0) {
                            location.href="/vworklist.don?count=1";
                            alert("신청완료");
                        }else{
                            alert("신청실패");
                        }

                    },
                    error: function() {

                    }
                });
                var msg = '결제가 완료되었습니다.';
            } else {

                var msg = '결제에 실패하였습니다.';
                msg += '에러내용 : ' + rsp.error_msg;
            }
            alert(msg);
           
        });

    });

</script>

</html>
