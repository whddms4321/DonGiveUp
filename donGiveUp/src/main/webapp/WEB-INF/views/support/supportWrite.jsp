<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
    <!-- 부트스트림4 지원 메타 포트 -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- 부트스트림4 지원 메타 포트 종료-->
<!--    부트스트랩(다운)과 jQuery 불러오기-->
<script type="text/javascript"
	src="/resources/jongeun/bootstrap4/js/jquery-3.3.1.js"></script>
<script type="text/javascript"
	src="/resources/jongeun/bootstrap4/js/bootstrap.min.js"></script>
<link type="text/css" rel="stylesheet"
	href="/resources/jongeun/bootstrap4/css/bootstrap.min.css" />
<!--    부트스트랩(다운)과 jQuery 불러오기 종료-->
        <!-- 구글 content 폰트 -->
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    
<title>물품후원 양식</title>
</head>
    <style>
       
        .main{
             font-family: 'Noto Sans KR', sans-serif;
            width: 85%;
            height: 85%;
            margin: 0 auto;
            border: 2.5px solid #0fbcff;
            border-radius: 15px;
        }
        .main>h1{
            text-align: center;
        }
        .methodExplain{
            display: none;
                
        }
        .disp{
            display: block;
        }
        
    </style>
    <script>
        $(function(){
           $(".supportMethod").click(function(){
               console.log("테스트");
              $(".methodExplain").removeClass("disp");
               var index = $(".supportMethod").index($(this));
               console.log(index);
               if( index === 0){
                $("#method1").addClass("disp");    
               }else if( index === 1 ){
                   $("#method2").addClass("disp");    
               }else {
                   $("#method3").addClass("disp");    
               }
                
           }); 
           
            
            
        });
          function submitEnd(){
                    opener.location.reload();

                    /* self.close(); */
                }
    </script>
<body>
    <div class="main">
        <h1>물품 후원 신청</h1>
        <form action="/supportInsert.don" method="post" class="form" enctype="multipart/form-data">
            물품 후원자 : ${sessionScope.member.memberId } 님 <br>
            <input type="hidden" name="supportId" value="${sessionScope.member.memberId }">
            <select name="supportCategory" >
                <option value="0">의류</option>
                <option  value="1">생리대</option>
                <option  value="2">화장품</option>
                <option  value="3">도서</option>
                <option  value="4">생활용품</option>
                <option  value="5">가전제품</option>
                <option  value="6">유아제품</option>
                <option  value="7">학용품</option>
            </select><br>
            후원품 이름 : <input type="text" placeholder="ex)어린이동화책 00권" name="supportName"><br>
            기부 방법 <br>
            <input type="radio" name="supportMethod" value="1" class="supportMethod"> 택배
            <input type="radio" name="supportMethod"  value="2"class="supportMethod"> 본사로 방문
            <input type="radio" name="supportMethod" value="3" class="supportMethod"> 받아가기
            <div class="methodExplain" id="method1">
                주소: xxxxx oooo 이며, 선불로 보내주시면 감사하겠습니다.
            </div>
            <div class="methodExplain" id="method2">
                주소 :xxxxx oooo이고, 담당자에게 연락을 주시고 방문 하길 부탁드립니다.
                담당자 번호 : 000-000-0000
            </div>
            <div class="methodExplain" id="method3">
                후원해주시는 분의 주소로 담당자가 사전 연락후, 찾아가겠습니다.
            </div><br>
            물품 수량 : <input type="text" placeholder="수량을 적어주세요." name="supportAmount">개<br>
            물품후원 금액(출고액의 80%가 입력) : <input type="text" placeholder="금액 입력" name="supportPrice">원 <br>
            이미지 : <input type="file" name="file" > <br>
            <p>안내사항</p>
            <pre>물품 후원이 승인이 된 후, 최대 2주안까지 후원자의 이메일로 기부증 영수증을 발급할 예정입니다.</pre>
            <input type="submit" value="물품 후원 신청하기" class="btn btn-dark" onclick="submitEnd();">
            
            <br><br><br><br><br><br>
            
        </form>
     </div> 
</body>
</html>