<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <link href="/resources/dahyun/css/vwListSR.css" rel="stylesheet">

    <title>함께해요 게시판</title>

    <script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.js"></script>
    <script src="/resources/dahyun/js/8bd2671777.js" crossorigin="anonymous"></script>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100&display=swap" rel="stylesheet">
</head>

<body>
	<script>
	
	$(document)
	.on('click','#moreList',function(event){
				var str = $(this).val();
				var arr = str.split("_");
				var count = arr[0];
				var keyword = arr[1];
				console.log(count);
						$.ajax({
							url : "/morevwListsearch.don",
							data : {
								count : count,
								keyword : keyword
							},
							success : function(data) {
								$(event.target).remove();
								//data를 javascript 객체화하기
								//var obj = JSON.parse(data);				
								//data값을 list 별로 나누어 추출
								var List = data.vworkList;
								var button = data.button;

								console.log(List);
								console.log(button);
								//자바스크립트 내에서 EL구문을 사용할수 있다. 흐름은 자바 -> jstl -> html -> 스크립트 순으로 진행된다.
								// 따로 변수를 두는 이유는  if문 안에 {}를 또 쓸수 없기 떄문

								html = "";

								for (var i = 0; i < List.length; i++) {
									if(List.length%3 == 1){
										html += "<tr>";
									}
									html += "<td>";
									html += "<div class='vworkBox'>";
									html += "<c:if test='${not empty sessionScope.member}'>";
									html += "<a href='/vworkbooking.don?vworkNo="+List[i].vworkNo+"'>";
									html += "</c:if>";
									html += "<c:if test='${empty sessionScope.member}'>";
									html += "<a id='bookinggo' href='/member/loginFrm.don'>";
									html += "</c:if>"
									html += "<div class='vworkimg'>"
									html += "<img src='/resources/upload/images/"+List[i].vworkFilepath+"'>";
									html += "<span class='vworkTicketCount'>";
									if(List[i].joindCnt != 0){
										html += "<strong>"+List[i].vworkPer*List[i].joindCnt+"</strong>매남음";
									}else{
										html += "<strong>"+List[i].vworkPer+"</strong>매남음";
									}
									
									html += "</span>";
									html += "</div>"
									html += "<div class='vworkboxContent'>";
									html += "<div class='vwbsection'>";
									html +=  "<span class='vwselect'>#"+List[i].vworkSelect+"</span>";
									html += "<a href='#' class='vscomment'>"; 
									html += "<i class='iconcomment far fa-comment'></i>";
									html += "<span>&nbsp;&nbsp;0</span>";
									html += "</a>";
									html += "</div>";
									html += "<div class='vwboxTitle'>"+List[i].vworkTitle+"</div>";
									html += "<div class='vwbDate'>";
									html += "<i class='iconcalendar far fa-calendar-alt'></i>";
									html += "<span>"+List[i].vworkDlDate+"</span>";
									html += "</div>";
									html += "<div class='vwbLocation'>";
									html += "<i class='iconLocation fas fa-map-marker-alt'></i>";
									html += "<span>"+List[i].vworkAddress+"</span>";
									html += "</div>";
									html += "<div class='foundationName'>"+List[i].companyName+"</div>";
									html += "<div class='vworkEnroll'>";
									html += "<button type='button' onclick='vworkbookingBtn("+List[i].vworkNo+");'>참가신청</button>";
									html += "</div>";
									html += "</div>";
									html += "</a>";
									html += "</div>";
									html += "</td>";
									if(List.length%3==0){
										html += "</tr>";
									}

								}
								$("tbody").append(html);
								$(".more_Btn").append(button);

							},
							error : function() {
								console.log("실행 실패");
							}

						});
			});
	</script>
    <jsp:include page="/WEB-INF/views/main/header.jsp"></jsp:include>
    <div class="content">
        <div class="vworkTitle">함께해요</div>
        <div class="vworkNavi">
            <ul>
                <li><a href="/vworklist.don?count=1">전체활동</a></li>
                <li><a href="/vwListsearch.don?keyword=봉사시간인증&count=1">봉사시간인증</a></li>
                <li><a href="/vwListsearch.don?keyword=청소년활동&count=1">청소년참여활동</a></li>
            </ul>
        </div>
        <div class="vworklistWrap">
            <div class="vwlisthead">
                <c:if test="${not empty sessionScope.member.memberId && sessionScope.member.memberType == 2}">
                    <button class="vworkWriteBtn" type="button" onclick="vworkWrite();">함께해요등록</button>
                </c:if>
            </div>
            <table class="vworkCardlist">
                <c:forEach items="${list}" var="v" varStatus="i">
                    <c:if test="${i.count%3 eq 1}">
                        <tr>
                    </c:if>
                    <td>
                        <div class="vworkBox">
                        	<c:if test="${not empty sessionScope.member }">
                            	<a href="/vworkbooking.don?vworkNo=${v.vworkNo }">
                            </c:if>
                            <c:if test="${empty sessionScope.member }">
                            	<a id="bookinggo" href="/member/loginFrm.don">
                            </c:if>
                                <div class="vworkimg">
                                    <img src="/resources/upload/images/${v.vworkFilepath }">
                                    <c:if test="${v.joindCnt ne 0 }">
                                    	<span class="vworkTicketCount"><strong>${v.vworkPer*v.joindCnt}</strong>매남음</span>
                                    </c:if>
                                    <c:if test="${v.joindCnt eq 0 }">
                                    	<span class="vworkTicketCount"><strong>${v.vworkPer}</strong>매남음</span>
                                    </c:if>
                                </div>
                                <div class="vworkboxContent">
                                    <div class="vwbsection">
                                        <span class="vwselect">#자원봉사</span>
                                        <span class="vwselect">#${v.vworkSelect }</span>
                                        
                       
                                        <a href="#" class="vscomment">
                                            <i class="iconcomment far fa-comment"></i>
                                            <span>&nbsp;&nbsp;0</span>
                                        </a>
                                    </div>
                                    <div class="vwboxTitle">${v.vworkTitle }</div>
                                    <div class="vwbDate">
                                        <i class="iconcalendar far fa-calendar-alt"></i>
                                        <span>${v.vworkDlDate }</span>
                                    </div>
                                    <div class="vwbLocation">
                                        <i class="iconLocation fas fa-map-marker-alt"></i>
                                        <span>${v.vworkAddress }</span>
                                    </div>
                                    <div class="foundationName">${v.companyName }</div>
                                    <div class="vworkEnroll">
                                        <button type="button" onclick="vworkbookingBtn('${v.vworkNo}');">참가신청</button>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </td>
                    <c:if test="${i.count%3 eq 0}">
                        </tr>
                    </c:if>
                </c:forEach>
            </table>
            
            <div class="moreBtn">${button}</div>
            
        </div>
    </div>
    <jsp:include page="/WEB-INF/views/main/footer.jsp"></jsp:include>
    <script>
        function vworkWrite() {
            location.href = "/vworkwrite.don";
        }

        function vworkbookingBtn(vworkNo) {
        	if(${sessionScope.member.memberId != 'null'}){
        		location.href = "/vworkbooking.don?vworkNo="+vworkNo+"&memberId="+${sessionScope.member.memberId} ;
        	}else{
        		alert("로그인 후 이용해주세요.");
        		location.href = "/member/loginFrm.don";
        	}
        }
        $(function(){
        	$("#bookinggo").click(function(){
        		alert("로그인 후 이용해주세요.");
        		if(true){
        			location.href="/member/loginFrm.don";
        		}else{
        			location.href="/vworklist.don?count=1";
        		}
        	});
        });
    </script>
</body>

</html>
