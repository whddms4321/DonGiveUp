<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
                <form id="#dnrwriteFrm" method="post">
                    <table class="dnrTable">
                        <tr>
                            <td class="ipName">제목</td>
                            <td class="ipFrame" colspan="3">
                                <input id="dnr_title" type="text">
                            </td>
                        </tr>
                        <tr>
                            <td class="ipName">작성자</td>
                            <td class="ipFrame" colspan="3">
                                <input id="dnr_writer" type="text">
                            </td>
                        </tr>
                        <tr>
                            <td class="ipName">기부게시번호</td>
                            <td class="ipFrame">
                                <input id="dn_no" type="text">
                            </td>
                            <td class="ipName">총 모금액</td>
                            <td class="ipFrame">
                                <input id="totaldnMoney" type="text" value="70,000원" readonly>
                                <!--기부번호로 가져오기-->
                            </td>
                        </tr>
                        <tr>
                            <td class="ipName">사업대상</td>
                            <td class="ipFrame">
                                <input id="dn_target" type="text" value="콩삼이" readonly>
                                <!--기부번호로 가져오기-->
                            </td>
                            <td class="ipName">사업대상수</td>
                            <td class="ipFrame">
                                <input id="dn_targetPer" type="text">
                            </td>
                        </tr>
                        <tr>
                            <td class="ipName">대표이미지</td>
                            <td colspan="3" class="ipImg">
                                <input id="dnr_Frontimg" type="text">
                                <span><button>사진첨부</button></span>
                            </td>

                        </tr>
                        <tr>
                            <td colspan="4">
                                <span>※&nbsp;이미지 첨부는 하단에서 해주세요.</span>
                                <textarea class="form-control" id="p_content"></textarea>
                            </td>
                        </tr>
                        <tr>
                            <td class="ipName"><i class="iconfile fas fa-paperclip"></i></td>
                            <td colspan="3" class="ipFiles">
                                <input id="dnrimg_files" type="text" readonly>
                                <span><button>사진첨부</button></span>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="4" class="dnbill_table">
                                <button id="addBtn"><i class="iconplus fas fa-plus"></i></button>
                                <div class="dnbWrap">
                                    <table border="1" id="billTable">
                                        <tr>
                                            <th>사용내역명</th>
                                            <th>상세 내용</th>
                                            <th>금액</th>
                                        </tr>
                                        <tr>
                                            <td class="bName"><input type="text"></td>
                                            <td class="bContent"><input type="text"></td>
                                            <td class="bMoney"><input type="text"></td>
                                        </tr>
                                        <tr>
                                            <td class="bName"><input type="text"></td>
                                            <td class="bContent"><input type="text"></td>
                                            <td class="bMoney"><input type="text"></td>
                                        </tr>
                                        <tr>
                                            <td class="bName"><input type="text"></td>
                                            <td class="bContent"><input type="text"></td>
                                            <td class="bMoney"><input type="text"></td>
                                        </tr>
                                    </table>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="4" class="applyBtn"><button>신청하기</button></td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>
    </div>
    <jsp:include page="/WEB-INF/views/main/footer.jsp"></jsp:include>

</body>
<script type="text/javascript">
    CKEDITOR.replace('p_content', {
        height: 500

    });

</script>
        <script>
            $(function() {
                $("#addBtn").click(function() {
                    $("#billTable > tbody").append('<tr><td class="bName"><input type="text"></td><td class="bContent"><input type="text"></td><td class="bMoney"><input type="text"></td></tr>');
                });

            </script>

</html>
