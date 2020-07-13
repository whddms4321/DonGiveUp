<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <link href="/resources/dahyun/css/mydnlist.css" rel="stylesheet">
    <title>mydnlist</title>
    <script src="/resources/dahyun/js/8bd2671777.js" crossorigin="anonymous"></script>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100&display=swap" rel="stylesheet">
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.js"></script>
</head>

<body>
    <div class="header">
        등록한 기부 글 목록
    </div>
    <div class="content">
        <table>
            <c:forEach items="${list}" var="d" varStatus="i">
                <tr>
                    <td class="ipFrame"><input type="radio" name="donationNo" value="${d.donationNo }"></td>
                    <td class="title">
                        <div>${d.donationTitle }</div>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
    <div class="footer">
        <button type="button" id="selcom">선택완료</button>
    </div>
    <script>
        $(function() {
            $("#selcom").click(function() {
                var donationNo = $("input[name=donationNo]:checked").val();
                console.log("선택번호: "+donationNo);
                if (check != undefined || check != 0 || check != "" || check != null) {
                    $.ajax({
                        url: "/mydnsel.don",
                        type: "POST",
                        data: {
                            donationNo: donationNo
                        },
                        success: function(d) {
                            var dnreviewRef = "d.donationNo";
                            console.log("번호: "+dnreviewRef);
                            var donationNowMoney = "d.donationNowMoney";
                            console.log("모금액: "+donationNowMoney);
                            var donationGoalMoney = "d.donationGoalMoney";
                            console.log("목표: "+donationGoalMoney);
                            var donationStartDate = "d.donationStartDate";
                            console.log("시작일: "+donationStartDate);
                            var donationEndDate = "d.donationEndDate";
                            console.log("마감: "+donationEndDate);
                            var donationType = "d.donationType";
                            console.log("사업대상: "+donationType);

                            $(opener.document).find("#dn_no").val(dnreviewRef);
                            $(opener.document).find("#totaldnMoney").val(donationNowMoney);
                            $(opener.document).find("#dn_goal").val(donationGoalMoney);
                            $(opener.document).find("#dn_period").val(donationStartDate + donationEndDate);
                            $(opener.document).find("#dn_target").val(donationType);

                            self.close();
                        },
                        error: function() {
                            console.log("실행 실패");
                        }
                    });
                } else {
                    alert("글을 선택해주세요.");
                }
            })
        });

    </script>
</body>

</html>
