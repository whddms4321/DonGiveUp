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
<title>단체 구독하기</title>

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
	
	if(theForm.memberMoney.value < theForm.regularInMoney.value){
		alert("보유 콩보다 많습니다. 확인해주세요.")
		return theForm.regularInMoney.focus();
	}
	
	theForm.submit();
}
</script>
</head>
<body>
<br>
<h1 class="review_h1">콩 구독하기</h1><br>
	<form action="/regularInInsert.don" name="frm1" method="post" id="insertFrm">
         <table class="table table-bordered">
          <input type="hidden" name="regularId" value="${r.regularId }">
            <tr>
               <th>아이디</th>
               <td><input type="text" class="form-control" name="regularInId" value="${sessionScope.member.memberId }" readonly></td>
            </tr>
            <tr>
               <th>단체</th>
               <td><input type="text" class="form-control" name="companyName" value="${companyName }" readonly></td>
            </tr>
            <tr>
               <th>보유 콩</th>
               <td><input type="text" class="form-control" name="memberMoney" value="${m.memberMoney }" readonly></td>
            </tr>
          </table>
          <hr>
          <table class="table table-bordered">
          <tr>
               <th>콩 매달 차감일</th>
               <td><select class="form-control" name="regularInPayNum">
               	<option value="01">1일</option>
               	<option value="02">2일</option>
               	<option value="03">3일</option>
               	<option value="04">4일</option>
               	<option value="05">5일</option>
               	<option value="06">6일</option>
               	<option value="07">7일</option>
               	<option value="08">8일</option>
               	<option value="09">9일</option>
               	<option value="10">10일</option>
               	<option value="11">11일</option>
               	<option value="12">12일</option>
               	<option value="13">13일</option>
               	<option value="14">14일</option>
               	<option value="15">15일</option>
               	<option value="16">16일</option>
               	<option value="17">17일</option>
               	<option value="18">18일</option>
               	<option value="19">19일</option>
               	<option value="20">20일</option>
               	<option value="21">21일</option>
               	<option value="22">22일</option>
               	<option value="23">23일</option>
               	<option value="24">24일</option>
               	<option value="25">25일</option>
               	<option value="26">26일</option>
               	<option value="27">27일</option>
               	<option value="28">28일</option>       	
               </select></td>
            </tr>
            <tr>
               <th>콩 개수 입력</th>
               <td><input type="text" class="form-control" id="inputArea" name="regularInMoney"></td>
            </tr>
            <tr>
                <th>환산 금액</th>
               <td><a id="textResult" class="form-control" value=""></a></td>
            </tr>
            
				<tr style="text-align:center;">
					<th colspan="2">
						<button type="button" OnClick="check_onclick()" class="btn btn-outline-primary">구독하기</button>	 								
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