<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <link href="/resources/dahyun/css/fdrwrite.css" rel="stylesheet">
    <title>기부후기등록</title>
    <script src="/resources/dahyun/js/8bd2671777.js" crossorigin="anonymous"></script>
    <script type="text/javascript" src="/resources/ckeditor/ckeditor.js"></script>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100&display=swap" rel="stylesheet">
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.js"></script>
</head>

<body>
    <jsp:include page="/WEB-INF/views/main/header.jsp"></jsp:include>
    <div class="content">
        <div class="fdrwTitle">펀딩후기 글 등록</div>
        <div class="fdrwpage">
            <div class="inputTable">
                <form id="#fdrwriteFrm" method="post">
                    <table class="fdrTable">
                        <tr>
                            <td class="ipName">제목</td>
                            <td class="ipFrame" colspan="3">
                                <input id="fdr_title" type="text">
                            </td>
                        </tr>
                        <tr>
                            <td class="ipName">작성자</td>
                            <td class="ipFrame" colspan="3">
                                <input id="fdr_writer" type="text">
                            </td>
                        </tr>
                        <tr>
                            <td class="ipName">펀딩게시번호</td>
                            <td class="ipFrame">
                                <input id="fd_no" type="text">
                            </td>
                            <td class="ipName">대표이미지</td>
                            <td class="ipImg">
                                <input id="fdr_frontimg" type="text">
                                <span><button><i class="iconf fas fa-paperclip"></i></button></span>
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
                                <input id="fdrimg_files" type="text" readonly>
                                <span><button>사진첨부</button></span>
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

</html>
