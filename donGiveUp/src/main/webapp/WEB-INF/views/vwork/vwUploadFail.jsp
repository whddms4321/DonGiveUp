<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.js"></script>
    <style>
        .content {
            width: 1200px;
            height: 500px;
            margin: 0 auto;
            margin-bottom: 100px;
            font-family: 'Noto Sans KR', sans-serif;
        }

        .message {
            width: 35%;
            height: 250px;
            margin: 0 auto;
            margin-top: 100px;
            background-color: lightgrey;
            border: none;
            position: relative;
        }

        .text {
            width: 100%;
            height: 100px;
            background-color: #e3f0f6;
            margin: 0 auto;
            line-height: 100px;
            top: 75px;
            position: absolute;
        }

        .text>span {
            font-size: 25px;
            color: #3D3B3A;
            font-weight: bold;
            margin-left: 115px;
        }

        #Btn {
            margin-top: 195px;
            margin-left: 160px;
            width: 100px;
            height: 35px;
            font-weight: bold;
            background-color: #3D3B3A;
            color: #fff;
            outline: none;
            cursor: pointer;
            border: none;

        }

    </style>
</head>

<body>
    <jsp:include page="/WEB-INF/views/main/header.jsp"></jsp:include>
    <div class="content">
        <div class="message">
            <div class="text">
                <span>등록 신청 실패!!</span>
            </div>
            <button id="Btn">돌아가기</button>
        </div>
    </div>
    <jsp:include page="/WEB-INF/views/main/footer.jsp"></jsp:include>
    <script>
        $(function() {
            $("#Btn").click(function() {
                location.href = "/vworklist.don?count=1"
            });
        });

    </script>
</body>

</html>
