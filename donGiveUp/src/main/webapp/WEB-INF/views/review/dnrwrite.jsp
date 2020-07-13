<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <link href="/resources/dahyun/css/dnrwrite.css" rel="stylesheet">
    <title>기부후기등록</title>

    <script src="/resources/dahyun/js/8bd2671777.js" crossorigin="anonymous"></script>
    <script type="text/javascript" src="/resources/ckeditor/ckeditor.js"></script>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100&display=swap" rel="stylesheet">
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.js"></script>
</head>

<body>




    <jsp:include page="/WEB-INF/views/main/header.jsp"></jsp:include>
    <div class="content">
        <div class="dnrwTitle">기부후기 글 등록</div>
        <div class="dnrwpage">
            <div class="inputTable">
                <form action="/dnrinsert.don" id="#dnrwriteFrm" method="post" enctype="multipart/form-data">
                    <table class="dnrTable">
                        <tr>
                            <td class="ipName">제목</td>
                            <td class="ipFrame" colspan="3">
                                <input id="dnr_title" type="text" name="dnreviewTitle">
                            </td>
                        </tr>
                        <tr>
                            <td class="ipName">작성자</td>
                            <td class="ipFrame" colspan="3">
                                <input id="dnr_writer" type="text" name="dnreviewWriter" value="${sessionScope.member.memberId}" readonly>
                            </td>
                        </tr>
                        <tr>
                            <td class="ipName mydnlist">등록한 기부글</td>
                            <td class="ipFrame" colspan="3">
                                <select id="mydnsel" name="donationNo">
                                    <option value="null">선택해주세요.</option>
                                    <c:forEach items="${list}" var="d" varStatus="i">
                                        <option value="${d.donationNo}">${d.donationTitle}</option>
                                    </c:forEach>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td class="ipName">기부게시번호</td>
                            <td class="ipFrame">
                                <input id="dn_no" name="dnreviewRef" type="text" value="" readonly>
                            </td>
                            <td class="ipName">총 모금액</td>
                            <td class="ipFrame">
                                <input id="totaldnMoney" type="text" name="donationNowMoney" value="" readonly>
                                <!--기부번호로 가져오기-->
                            </td>
                        </tr>
                        <tr>
                            <td class="ipName">목표금액</td>
                            <td class="ipFrame">
                                <input id="dn_goal" type="text" name="donationGoalMoney" value="" readonly>
                                <!--기부번호로 가져오기-->
                            </td>
                            <td class="ipName">모금기간</td>
                            <td class="ipFrame">
                                <input id="dn_period" type="text" value="" readonly>
                            </td>
                        </tr>
                        <tr>
                            <td class="ipName">사업대상</td>
                            <td class="ipFrame">
                                <input id="dn_target" type="text" name="donationType" value="" readonly>
                                <!--기부번호로 가져오기-->
                            </td>
                            <td class="ipName">사업대상수</td>
                            <td class="ipFrame">
                                <input id="dn_targetPer" name="dnreviewTargetper" type="text" placeholder="숫자만입력해주세요.">
                            </td>
                        </tr>
                        <tr>
                            <td class="ipName">대표이미지</td>
                            <td colspan="4" class="ipImg">
                                <div><input id="dnr_Frontimg" type="file" name="file"></div>
                            </td>

                        </tr>
                        <tr>
                            <td colspan="4">
                                <span>※&nbsp;이미지 첨부는 하단에서 파일첨부로 해주세요.</span>
                                <textarea class="form-control" id="p_content" name="dnreviewContent"></textarea>
                            </td>
                        </tr>
                        <tr>
                            <td class="ipName"><i class="iconfile fas fa-paperclip"></i></td>
                            <td colspan="4" class="ipFiles">
                                <input multiple="multiple" name="files" type="file"><span>파일은 3개까지만 첨부 가능합니다.</span>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="4" class="dnbill_table">
                                <button type="button" id="addBtn"><i class="iconplus fas fa-plus"></i></button>
                                <div class="dnbWrap">
                                    <table border="1" id="billTable">
                                        <tr>
                                            <th>사용내역명</th>
                                            <th>상세 내용</th>
                                            <th>금액</th>
                                        </tr>
                                        <tr name="billtr">
                                            <td class="bName"><input type="text" name="dnbillName"></td>
                                            <td class="bContent"><input type="text" name="dnbillDetail"></td>
                                            <td class="bMoney"><input type="text" name="dnbillMoney" placeholder="숫자만입력해주세요"></td>
                                        </tr>
                                    </table>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="4" class="applyBtn"><input type="submit" id="applyBtn" value="신청하기" style="width: 820px;height: 50px;background-color: #0fbcff;border: none;color: #fff;font-size: 18px;font-weight: bold;box-sizing: border-box; outline: none; cursor: pointer; "></td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>
    </div>




    <jsp:include page="/WEB-INF/views/main/footer.jsp"></jsp:include>
    <script>
        CKEDITOR.replace('p_content', {
            height: 500

        });
       
        $(document).on("click", "#addBtn", function() {
            var html = "";
            html += "<tr>";
            html += "<td class='bName'>";
            html += "<input type='text' name='dnbillName'>";
            html += "</td>";
            html += "<td class='bContent'>";
            html += "<input type='text' name='dnbillDetail'>";
            html += "</td>";
            html += "<td class='bMoney'>";
            html += "<input type='text' name='dnbillMoney' placeholder='숫자만입력해주세요.'>";
            html += "</td>";
            html += "</tr>";

            var trHtml = $("tr[name=billtr]:last");
            trHtml.after(html);
        });

  

        $("#mydnsel").change(function() {
            var donationNo = $(this).val();
            if (donationNo != "null") {
                $.ajax({
                    url: "/mydnsel.don",
                    type: "POST",
                    data: {
                        donationNo: donationNo
                    },
                    success: function(dn) {
                        var dnreviewRef = dn.donationNo;
                        console.log("번호: " + dnreviewRef);
                        var donationNowMoney = dn.donationNowMoney;
                        console.log("모금액: " + donationNowMoney);
                        var donationGoalMoney = dn.donationGoalMoney;
                        console.log("목표: " + donationGoalMoney);
                        var donationStartDate = dn.donationStartDate;
                        console.log("시작일: " + donationStartDate);
                        var donationEndDate = dn.donationEndDate;
                        console.log("마감: " + donationEndDate);
                        var donationType = dn.donationType;
                        console.log("사업대상: " + donationType);
                        $("#dn_no").val("");
                        $("#totaldnMoney").val("");
                        $("#dn_goal").val("");
                        $("#dn_period").val("");
                        $("#dn_target").val("");

                        $("#dn_no").val(dnreviewRef);
                        $("#totaldnMoney").val(donationNowMoney);
                        $("#dn_goal").val(donationGoalMoney);
                        $("#dn_period").val(donationStartDate + "-" + donationEndDate);
                        $("#dn_target").val(donationType);
                    },
                    error: function() {
                        console.log("실행 실패");
                    }
                });
            }
        });

    </script>



</body>






</html>
