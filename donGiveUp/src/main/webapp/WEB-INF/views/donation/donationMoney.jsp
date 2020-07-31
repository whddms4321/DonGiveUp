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
   </style>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script>
function check_onclick(){
	theForm = document.frm1;
	
	if(theForm.memberMoney.value < theForm.donationInMoney.value){
		alert("보유 콩보다 많습니다. 확인해주세요.")
		return theForm.donationInMoney.focus();
	}
	
	theForm.submit();
}
</script>
</head>
<body>
<br>
<h1 class="review_h1">콩 기부하기</h1><br>
	<form action="/donationInInsert.don" name="frm1" method="post" id="insertFrm">
         <table class="table table-bordered">
          <input type="hidden" name="donationNo" value="${d.donationNo }">
         <input type="hidden" name="donationInType" value="${d.donationType }">
         <input type="hidden" name="donationNowMoney" value="${donationNowMoney }">
            <tr>
               <th>아이디</th>
               <td><input type="text" class="form-control" name="donationInMemberid" value="${sessionScope.member.memberId }" readonly></td>
            </tr>
            <tr>
               <th>단체</th>
               <td><input type="text" class="form-control" name="companyName" value="${companyName }"  readonly></td>
            </tr>
            <tr>
               <th>보유 콩</th>
               <td><input type="text" class="form-control" name="memberMoney" value="${m.memberMoney }" readonly></td>
            </tr>
          </table>
          <hr>
          <table class="table table-bordered">
            <tr>
               <th>콩 개수 입력</th>
               <td><input type="text" id="inputArea" class="form-control" name="donationInMoney"></td>
            </tr>
            <tr>
               <th>환산 금액</th>
               <td><a id="textResult" class="form-control" value=""></a></td>
            </tr>
            
				<tr style="text-align:center;">
					<th colspan="2">
						<button type="button" OnClick="check_onclick()" class="btn btn-outline-primary">결제하기</button>	 
										
					</th>
				</tr>
			</table>
		</form>


</body>
<script>
$(function(){
	  $("#inputArea").keyup(function() {
          var inputLength = $(this).val();
          var remain = inputLength*100;
          $("#textResult").html(remain+"원");
      });
})
</script>

</html>