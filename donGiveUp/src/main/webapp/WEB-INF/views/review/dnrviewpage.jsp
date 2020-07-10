<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
    <!--캐러셀-->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>

<body>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <jsp:include page="/WEB-INF/views/main/header.jsp"></jsp:include>
    <div class="content">
        <div class="headarea">
            <div class="frontimg">
                <img src="/resources/dahyun/imgs/콩삼이.jpg">
            </div>
            <div class="bgfilter"></div>
            <div class="textwrap">
                <span id="dnrTitle">귀여운 콩삼이가 고구마간식을 기부받았어요.</span>
                <span id="dnrFoundation">댕댕이행복재단</span>
            </div>
        </div>
        <div class="dnrviewWrap">
            <div class="dnrContent">
                글내용가져오기
            </div>
            <div class="imgwrap">
                <div id="demo" class="carousel slide" data-ride="carousel">
                    <div class="carousel-inner">
                        <!-- 슬라이드 쇼 -->
                        <div class="carousel-item active">
                            <!--가로-->
                            <img class="d-block w-100" src="/resources/dahyun/imgs/부티냠냠1.jpg" alt="First slide">
                            <!--<div class="carousel-caption d-none d-md-block">
                                <h5>ㄷ</h5>
                                <p>testtesttest</p>
                                </div>-->
                        </div>
                        <div class="carousel-item">
                            <img class="d-block w-100" src="/resources/dahyun/imgs/부티냠냠2.jpg" alt="Second slide">
                        </div>
                        <div class="carousel-item">
                            <img class="d-block w-100" src="/resources/dahyun/imgs/부티냠냠3.jpg" alt="Third slide">
                        </div> <!-- / 슬라이드 쇼 끝 -->
                        <!-- 왼쪽 오른쪽 화살표 버튼 -->
                        <a class="carousel-control-prev" href="#demo" data-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span> <!-- <span>Previous</span> -->
                        </a>
                        <a class="carousel-control-next" href="#demo" data-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span> <!-- <span>Next</span> -->
                        </a> <!-- / 화살표 버튼 끝 -->
                        <!-- 인디케이터 -->
                        <ul class="carousel-indicators">
                            <li data-target="#demo" data-slide-to="0" class="active"></li>
                            <!--0번부터시작-->
                            <li data-target="#demo" data-slide-to="1"></li>
                            <li data-target="#demo" data-slide-to="2"></li>
                        </ul> <!-- 인디케이터 끝 -->
                    </div>
                </div>
            </div>
            <br>
            <div class="tableWrap1">
                <div class="Fmoney"><span>70,000</span>&nbsp;원</div>
                <span>기부금 집행 내역</span>
                <table>
                    <tr>
                        <td colspan="2" class="trHead"></td>
                    </tr>
                    <tr>
                        <th class="t1Name">모금기간</th>
                        <td class="t1Content">2020.06.10-2020.06.30</td>
                    </tr>
                    <tr>
                        <th class="t1Name">모금금액</th>
                        <td class="t1Content"><span id="fmoney">70,000</span><span>목표금액(70,000)</span></td>
                    </tr>
                    <tr>
                        <th class="t1Name">사업대상</th>
                        <td class="t1Content">귀염둥이 부티</td>
                    </tr>
                    <tr>
                        <th class="t1Name">대상수</th>
                        <td class="t1Content">1마리</td>
                    </tr>
                </table>
            </div>
            <div class="tableWrap2">
                <table>
                    <tr>
                        <td colspan="3" class="trHead"></td>
                    </tr>
                    <tr>
                        <th class="billName">사업비</th>
                        <td class="bDetail">고구마 간식 * 5</td>
                        <td class="bmoney"><span>50,000</span></td>
                    </tr>
                    <tr>
                        <th class="billName">사업비</th>
                        <td class="bDetail">껌 * 2</td>
                        <td class="bmoney"><span>10,000</span></td>
                    </tr>
                    <tr>
                        <th class="billName">사업비</th>
                        <td class="bDetail">까까</td>
                        <td class="bmoney"><span>10,000</span></td>
                    </tr>
                </table>
            </div>
            <div class="foundationBox">
                <span id="foundationName">댕댕이행복재단</span>
                <span id="foundationH"><a href="#"><i class="iconFoundation fas fa-home"></i>&nbsp;후원하러가기</a></span>
                <span id="writeDate">2020.07.05</span>
            </div>
            <div class="cwriteBox">
                <form id="cmtFrm" method="post">
                    <div class="cmtWrap">
                        <textarea id="dnCmt" placeholder="따듯한 마음을 표현하세요."></textarea>
                    </div>
                    <span class="textLimit">
                        <span id="nowTxt">0</span>
                        /
                        <span id="limitTxt">500</span>
                    </span>
                    <button class="cmtBtn">등록</button>
                </form>
            </div>
            <div class="cmtsWrap">
                <div class="cmtsHead">
                    <span>댓글</span>
                    <span id="cmtCnt">1</span>
                </div>
                <!--여기c:foreach-->
                <div class="cmtsBox">
                    <span id="cmtwriter">이토토</span>님 작성
                    <div id="cmtsdetail"><input type="text" value="댓글내용"></div>
                    <span id="cmtswDate">2020.07.05</span>
                    <a href="javascript:void(0)" id="cmtsLike"><i class="iconheart far fa-heart"></i><span id="likecnt">0</span></a>
                </div>
            </div>
        </div>
    </div>

    <jsp:include page="/WEB-INF/views/main/footer.jsp"></jsp:include>

</body>


</html>
