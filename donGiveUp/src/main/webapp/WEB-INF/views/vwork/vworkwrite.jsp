<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <link href="/resources/dahyun/css/vworkwrite.css" rel="stylesheet">
    <title>Don Give Up</title>
    <script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.js"></script>
    <script src="/resources/dahyun/js/8bd2671777.js" crossorigin="anonymous"></script>
    <script type="text/javascript" src="/resources/ckeditor/ckeditor.js"></script>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker3.standalone.min.css">
</head>

<body>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/locales/bootstrap-datepicker.kr.min.js"></script>
    <jsp:include page="/WEB-INF/views/main/header.jsp"></jsp:include>
    <div class="content">
        <div class="vworkwTitle">함께해요 글 등록신청</div>
        <div class="vworkwpage">
            <div class="inputTable" border="1">
                <form id="#form_vw" method="post">
                    <table class="vwwTable">
                        <tr>
                            <td class="ipName">제목</td>
                            <td class="ipFrame">
                                <input id="vwork_title" type="text">
                            </td>
                            <td rowspan="6" class="dpFrame">
                                <!--<div id="datePicker"></div>-->

                            </td>
                        </tr>
                        <tr>
                            <td class="ipName">작성자</td>
                            <td class="ipFrame">
                                <input id="vwork_writer" type="text">
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
                                <input id="vwork_per" type="text">
                            </td>
                        </tr>
                        <tr>
                            <td class="ipName">장소</td>
                            <td class="ipFrame">
                                <input id="vwork_address" type="text">
                            </td>
                        </tr>
                        <tr>
                            <td class="ipName">신청비</td>
                            <td class="ipFrame">
                                <input id="vwork_fee" type="text">
                            </td>
                        </tr>
                        <tr>
                            <td class="ipName">봉사날짜</td>
                            <td colspan="2" class="ipJoindate">
                                <input id="datePicker" type="text" readonly>
                            </td>
                        </tr>
                        <tr>
                            <td class="ipName">대표이미지</td>
                            <td colspan="2" class="ipImg">
                                <input id="vwork_img" type="text">
                                <span><button>사진첨부</button></span>
                            </td>

                        </tr>
                        <tr>
                            <td class="ipName">활동소개</td>
                            <td colspan="2" class="ipIntro">
                                <input id="vwork_intro" type="text">
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                <textarea class="form-control" id="p_content"></textarea>
                            </td>
                        </tr>
                        <tr>
                            <td class="ipName"><i class="iconfile fas fa-paperclip"></i></td>
                            <td colspan="2" class="ipFiles">
                                <input id="vworkimg_files" type="text">
                            </td>

                        </tr>
                        <tr>
                            <td colspan="3" class="ipButton"><button>신청하기</button></td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>
    </div>
    <jsp:include page="/WEB-INF/views/main/footer.jsp"></jsp:include>
    <script>
        $("#datePicker").datepicker({
            format: "yyyy-mm-dd",
            language: "kr",
            todayHighlight: true,
            multidate: true
         
            
        });

    </script>
    <script type="text/javascript">
 CKEDITOR.replace('p_content'
                , {height: 500                                                  
                 });
</script>


</body>

</html>
