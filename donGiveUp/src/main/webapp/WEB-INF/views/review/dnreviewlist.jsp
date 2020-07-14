<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>

<head>
    <link href="/resources/dahyun/css/dnreviewlist.css" rel="stylesheet">
    <meta charset="UTF-8">
    <title>기부후기게시판</title>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100&display=swap" rel="stylesheet">
    <script src="/resources/dahyun/js/8bd2671777.js" crossorigin="anonymous"></script>
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.js"></script>

</head>

<body>
    <script>
         $(document)
            .on('click', '#moreList', function(event) {
                var count = $(this).val();
                console.log(count);
                $.ajax({
                    url: "/morevwList.don",
                    data: {
                        count: count
                    },
                    success: function(data) {
                        $(event.target).remove();
                        //data를 javascript 객체화하기
                        //var obj = JSON.parse(data);				
                        //data값을 list 별로 나누어 추출
                        var List = data.dnreviewList;
                        var button = data.button;

                        console.log(List);
                        console.log(button);
                        //자바스크립트 내에서 EL구문을 사용할수 있다. 흐름은 자바 -> jstl -> html -> 스크립트 순으로 진행된다.
                        // 따로 변수를 두는 이유는  if문 안에 {}를 또 쓸수 없기 떄문

                        html = "";

                        for (var i = 0; i < List.length; i++) {

                            if (List.length % 4 == 1) {
                                html += "<tr>";
                            }
                            html += "<td>";
                            html += "<a href='/dnrview.don?dnreviewNo="+List[i].dnreviewNo+"'>";
                            html += "<div class='dnreviewBox'>";
                            html += "<div class='dnrimg'>";
                            html += "<img src='/resources/upload/images/"+List[i].dnreviewFilepath +"'>";
                            html += "</div>";
                            html += "<div class='dnrText'>";
                            html += "<span class='dnrTitle'>"+List[i].dnreviewTitle+"</span>";
                            html += "<span class='foundationName'>"+List[i].companyName+"</span>";
                            html += "</div>";
                            html += "<span class='prgWrap'>";
                            html += "<progress value='"+List[i].dnrPercent}+"' max='100' class='prgBar'></progress>";
                            html += "</span>";
                            html += "<span class='finalDnMoney'>"+List[i].donationNowMoney+"</span>";
                            html += "</div>";
                            html += "</a>";
                            html += "</td>";
                            if (List.length % 4 == 0) {
                                html += "</tr>";
                            }

                        }

                        $("tbody").append(html);
                        $(".more_Btn").append(button);

                    },
                    error: function() {
                        console.log("실행 실패");
                    }

                });
            });
    </script>
    <jsp:include page="/WEB-INF/views/main/header.jsp"></jsp:include>
    <div class="content">
        <div class="reviewTitle">
            <span class="dnrtText">기부후기</span>
            <div class="searchBox">
                <form action="/dnreviewsearch.don" id="searchFrm" method="get">
                    <span class="sText"><input type="text" id="keyword" name="keyword" placeholder="검색어를 입력해주세요" value="${keyword }"></span>
                    <span class="icon"><button type="submit" id="sBtn"><i class="iconsearch fas fa-search"></i></button></span>
                </form>
            </div>
        </div>
        <div class="dnrNavi">
            <ul>
                <li><a href="/dnreviewlist.don?count=1">기부후기</a></li>
                <li><a href="/fdreviewlist.don?count=1">펀딩후기</a></li>
                <li><a href="/sprevewlist.don?count=1">물품후원후기</a></li>
            </ul>
        </div>
        <div class="dnrlistWrap">
            <div class="dnrlisthead">
                <c:if test="${not empty sessionScope.member.memberId && sessionScope.member.memberType == 2}">
                    <button class="dnrWriteBtn" type="button" onclick="dnrWrite();">기부후기등록</button>
                </c:if>
            </div>
        </div>
        <div class="dnreviewWrap">
            <table class="dnreviewList">
                <c:forEach items="${list}" var="dnr" varStatus="i">
                    <c:if test="i.count%4 eq 1">
                    <tr>
                    </c:if>
                        <td>
                            <a href="/dnrview.don?dnreviewNo=${dnr.dnreviewNo}">
                                <div class="dnreviewBox">
                                    <div class="dnrimg">
                                        <img src="/resources/upload/images/${dnr.dnreviewFilepath }">
                                    </div>
                                    <div class="dnrText">
                                        <span class="dnrTitle">${dnr.dnreviewTitle}</span>
                                        <span class="foundationName">${dnr.companyName}</span>
                                    </div>
                                    <span class="prgWrap">
                                        <progress value="${dnr.dnrPercent}" max="100" class="prgBar"></progress>
                                    </span>
                                    <span class="finalDnMoney">${dnr.donationNowMoney}</span>
                                </div>
                            </a>
                        </td>
                    <c:if test="i.count%4 eq 0">
                    </tr>
                    </c:if>
                </c:forEach>
            </table>
            <div class="moreBtn">${button}</div>

        </div>
    </div>
    <jsp:include page="/WEB-INF/views/main/footer.jsp"></jsp:include>
    <script>
        $(function() {
            $("#sBtn").css("cursor", "pointer").focusin(function() {
                $(this).css("outline", "none");
            });
            $("#stinput").focusin(function() {
                $(this).css("outline", "none");
            });
        });
        var memberId = "${sessionScope.member.memberId}";

        function dnrWrite() {
            location.href = "/dnrwrite.don?memberId=" + memberId;
        };

    </script>
</body>

</html>
