<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<title>콩 기부하기</title>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.js"></script>

<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100&display=swap" rel="stylesheet">
<style>
      #insertFrm{
         width:500px;
         margin:0 auto;
      }
      .review_h1{
      text-align: center;
      margin: 0 auto;
      }
      #reviewContent_textarea{
       resize: none;
      }
      body{
      width: 90%;
      margin: 0 auto;
      }
   </style>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.js"></script>

</head>
<body>
<br>
<h1 class="review_h1">기부 완료</h1><br>
	
         <table class="table table-bordered">
        
            <tr>
               <th>아이디</th>
               <td><input type="text" class="form-control" name="donationInMemberid" value="${sessionScope.member.memberId }" readonly></td>
            </tr>
            <tr>
               <th>단체</th>
               <td><input type="text" class="form-control" name="companyName" value="${m.companyName }"  readonly></td>
            </tr>
            <tr>
               <th>결제 콩</th>
               <td><input type="text"  id="inputArea" class="form-control" name="memberMoney" value="${r.regularInMoney }" readonly></td>
            </tr>
            <tr>
               <th>결제 날짜</th>
               <td><input type="text"  class="form-control" name="memberMoney" value="${time }" readonly></td>
            </tr>
             <tr>
               <th>출금 날짜</th>
               <td><input type="text"  class="form-control" name="regularInPayNum" value="${r.regularInPayNum }" readonly></td>
            </tr>
            <tr style="text-align:center;">
					<th colspan="2">
						<button OnClick="FnClose()" class="btn btn-outline-primary">닫기</button>	 
										
					</th>
				</tr>
          </table>
          


</body>
<script>
function FnClose(){
    self.close();   //자기자신창을 닫습니다.
}

</script>

</html>