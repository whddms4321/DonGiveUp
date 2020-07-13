<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>
    <link href="/resources/dahyun/css/dnrviewpage.css" rel="stylesheet">
    <meta charset="UTF-8">
    <title>기부후기 상세페이지</title>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100&display=swap" rel="stylesheet">
    <script src="/resources/dahyun/js/8bd2671777.js" crossorigin="anonymous"></script>
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.js"></script>

</head>

<body>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <jsp:include page="/WEB-INF/views/main/header.jsp"></jsp:include>
    <div class="content">
        <div class="headarea">
            <div class="frontimg">
                <img src="/resources/upload/images/${dn.dnreviewFilepath}">
            </div>
            <div class="bgfilter"></div>
            <div class="textwrap">
                <span id="dnrTitle">${dn.dnreviewTitle}</span>
                <span id="dnrFoundation">${dn.companyName}</span>
            </div>
        </div>
        <div class="dnrviewWrap">
            <div class="dnrContent">
                ${dn.dnreviewContent}
            </div>
            <div class="imgwrap">
                <!--여기-->
                <div id="myCarousel" class="carousel slide" data-ride="carousel">
                    <!-- Indicators -->
                    <ol class="carousel-indicators">
                        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                        <li data-target="#myCarousel" data-slide-to="1"></li>
                        <li data-target="#myCarousel" data-slide-to="2"></li>
                    </ol>

                    <!-- Wrapper for slides -->
                    <div class="carousel-inner">
                        <c:forEach items="${dri}" var="g" varStatus="i">
                            <c:if test="${i.count == 1}">
                                <div class="item active">
                                    <img class="imggg" src="/resources/upload/images/${g.dnreviewimgFilename}" style="height:450px;">
                                </div>
                            </c:if>
                            <c:if test="${i.count != 1}">
                                <div class="item">
                                    <img class="imggg" src="/resources/upload/images/${g.dnreviewimgFilename}" style="height:450px;">
                                </div>
                            </c:if>
                        </c:forEach>
                    </div>

                    <!-- Left and right controls -->
                    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
                        <span class="glyphicon glyphicon-chevron-left"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="right carousel-control" href="#myCarousel" data-slide="next">
                        <span class="glyphicon glyphicon-chevron-right"></span>
                        <span class="sr-only">Next</span>
                    </a>
                </div>
            </div>
            <br>
            <div class="tableWrap1">
                <div class="Fmoney"><span>${dn.donationNowMoney}</span>&nbsp;원</div>
                <span>기부금 집행 내역</span>
                <table>
                    <tr>
                        <td colspan="2" class="trHead"></td>
                    </tr>
                    <tr>
                        <th class="t1Name">모금기간</th>
                        <td class="t1Content">${dn.donationStartDate} - ${dn.donationEndDate}</td>
                    </tr>
                    <tr>
                        <th class="t1Name">모금금액</th>
                        <td class="t1Content"><span id="fmoney">${dn.donationNowMoney}</span><span>목표금액(${dn.donationGoalMoney})</span></td>
                    </tr>
                    <tr>
                        <th class="t1Name">사업대상</th>
                        <td class="t1Content">${dn.donationType}</td>
                    </tr>
                    <tr>
                        <th class="t1Name">대상수</th>
                        <td class="t1Content">${dn.dnreviewTargetper}</td>
                    </tr>
                </table>
            </div>
            <div class="tableWrap2">
                <table>
                    <tr>
                        <td colspan="3" class="trHead"></td>
                    </tr>
                    <c:forEach items="${drb}" var="db">
                        <tr>
                            <th class="billName">${db.dnbillName}</th>
                            <td class="bDetail">${db.dnbillDetail}</td>
                            <td class="bmoney"><span>${db.dnbillMoney}</span></td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
            <div class="foundationBox">
                <span id="foundationName">${dn.companyName}</span>
                <span id="foundationH"><a href="/donationDetail.don?donationNo=${dn.dnreviewRef}&donationWriter=${dn.dnreviewWriter}"><i class="iconFoundation fas fa-home"></i>&nbsp;후원하러가기</a></span>
                <span id="writeDate">${dn.dnreviewDate}</span>
            </div>
            <c:if test="${not empty sessionScope.member }">
                <div class="cwriteBox">
                    <div class="cmtWrap">
                        <textarea id="dnCmt" placeholder="따듯한 마음을 표현하세요." name="dncommentContent">이거이거</textarea>
                    </div>
                    <span class="textLimit">
                        <span id="nowTxt">0</span>
                        /
                        <span id="limitTxt">500</span>
                    </span>
                    <button class="cmtBtn" type="button">등록</button>

                </div>
            </c:if>
            <div class="cmtsWrap">
                <div class="cmtsHead" id="cmtsHead">
                    <span>댓글</span>
                    <span id="cmtCnt">${count}</span>
                </div>
                <!--여기c:foreach-->
                <c:forEach items="${drc}" var="c">
                    <div class="cmtsBox">
                        <span id="cmtwriter">${c.dncommentWriter}</span>님 작성
                        <div id="cmtsdetail"><input type="text" value="${c.dncommentContent}"></div>
                        <span id="cmtswDate">${c.dncommentDate}</span>
                        <a href="javascript:void(0)" id="cmtsLike"><i class="iconheart far fa-heart"></i><span id="likecnt">${c.dncommentLike}</span></a>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>

    <jsp:include page="/WEB-INF/views/main/footer.jsp"></jsp:include>
    <script>
        $(function() {
            $("#dnCmt").keyup(function() {
                var inputLength = $(this).val().length;
                var remain = 500 - inputLength;
                $("#nowTxt").html(remain);
            });

            $(".cmtBtn").click(function() {
                var dncommentRef = "${dn.dnreviewNo}";

                var memberId = "${sessionScope.member.memberId}";

                var dncommentContent = $("#dnCmt").val();
                $.ajax({
                    url: "/insertDnCmt.don",
                    type: "POST",
                    data: {
                        dncommentRef: dncommentRef,
                        memberId: memberId,
                        dncommentContent: dncommentContent
                    },
                    success: function(result) {
                        var result = Number(result);

                        if (result > 0) {
                          
                            alert("댓글등록성공");
                            location.reload();

                        }





                    },
                    error: function() {
                        alrert("댓글등록실패");
                    }
                });
            });
        });

    </script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</body>


</html>
