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
        <div class="paymentTitle">봉사활동제목가나다라마사아자차카타파하<span>&nbsp;>&nbsp;예약/결제</span></div>
        <div class="paymentbill"></div>
    </div>
    <jsp:include page="/WEB-INF/views/main/footer.jsp"></jsp:include>
</body>

</html>
