<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.js"></script>
<head>
    <meta charset="UTF-8">
    <link href="/resources/dahyun/css/vworkeditFrm.css" rel="stylesheet">

    <title>함께해요 수정하기</title>

    <script src="/resources/dahyun/js/8bd2671777.js" crossorigin="anonymous"></script>
    <script type="text/javascript" src="/resources/ckeditor/ckeditor.js"></script>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100&display=swap" rel="stylesheet">

    <link href="/resources/dahyun/dist/css/datepicker.min.css" rel="stylesheet" type="text/css">
    <script src="/resources/dahyun/dist/js/datepicker.min.js"></script>

    <!-- Include English language -->
    <script src="/resources/dahyun/dist/js/i18n/datepicker.en.js"></script>

</head>

<body>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/locales/bootstrap-datepicker.kr.min.js"></script>

    <jsp:include page="/WEB-INF/views/main/header.jsp"></jsp:include>
    <div class="content">
        <div class="vworkwTitle">함께해요 글 수정하기</div>
        <div class="vworkwpage">
            <div class="inputTable" border="1">
                <form action="/vworkupdate.don?vworkNo=${v.vworkNo}" id="#vworkFrm" method="post">
                    <table class="vwwTable">
                       <tr>
                            <td class="ipName">제목</td>
                            <td class="ipFrame">
                                <input id="vworkTitle" name="vworkTitle" type="text" value="${v.vworkTitle }">
                            </td>

                             <td class="ipName">
                               	 봉사날짜
                            </td>
                        </tr>
                        <tr>
                            <td class="ipName">작성자</td>
                            <td class="ipFrame">
                                <input class="noedit" id="vworkWriter" name="vworkWriter" type="text" value="${v.companyName}" readonly>
                            </td>
                         	<td rowspan="5" class="dpFrame">
                                <div id="dpwrap" style="margin-left:20px;">
                                    <input name="vworkJoinDate" class="datepicker-here" id="datePicker" type="hidden" data-language='en' data-multiple-dates="6" data-multiple-dates-separator=",">
                                </div>
                            </td>

                        </tr>
                         <tr>
                            <td class="ipName">봉사타입</td>
                            <td class="ipFrame">
                                <select class="vworkSelect" name="vworkSelect">
                                    <option value="null">선택안함</option>
                                    <option value="봉사시간인증">봉사시간인증</option>
                                    <option value="청소년활동">청소년활동</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td class="ipName">모집인원</td>
                            <td class="ipFrame">
                                <input class="noedit" id="vworkPer" name="vworkPer" type="text" value="${v.vworkPer }" readonly>
                            </td>
                        </tr>
                        <tr>
                            <td class="ipName">장소</td>
                            <td class="ipFrame">
                                <input id="vworkAddress" name="vworkAddress" type="text" value="${v.vworkAddress }">
                            </td>
                        </tr>
                        <tr>
                            <td class="ipName">신청비</td>
                            <td class="ipFrame">
                                <input class="noedit" id="vworkFee" name="vworkFee" type="text" value="${v.vworkFee }" readonly>
                            </td>
                        </tr>
                        <tr>


                            <td class="ipName">대표이미지</td>
                            <td class="ipImg" colspan="2">
                                <input class="noedit" id="vwork_img" type="text" name="file" value="${v.vworkFilename}" readonly>
                                <span class="Orjd">봉사날짜(전)</span>
                                <input class="noedit" id="orjdate" type="text" value="${v.vworkJoinDate}" readonly>
                            </td>
                        </tr>
                        <tr>
                            <td class="ipName">활동소개</td>
                            <td colspan="2" class="ipIntro">
                                <textarea id="vworkIntro" name="vworkIntro">${v.vworkIntro}</textarea>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                <span>※&nbsp;상세소개에 이미지 첨부시 넓이는 760으로 설정해주세요.</span>
                                <textarea class="form-control" id="p_content" name="vworkDetail">${v.vworkDetail}</textarea>
                            </td>
                        </tr>  
                        <tr>
                            <td colspan="3" class="ipButton"><input type="submit" id="applyBtn" value="수정하기" style="width: 820px;height: 50px;background-color: #0fbcff;border: none;color: #fff;font-size: 18px;font-weight: bold;box-sizing: border-box; outline: none; cursor: pointer; "></td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>
    </div>
    <jsp:include page="/WEB-INF/views/main/footer.jsp"></jsp:include>

    <script type="text/javascript">
        CKEDITOR.replace('p_content', {
            height: 500
        });
    
    </script>
 


</body>

</html>
