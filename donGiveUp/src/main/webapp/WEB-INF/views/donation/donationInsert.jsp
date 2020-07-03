<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기부 등록 작성</title>
<script type="text/javascript" src="/resources/ckeditor/ckeditor.js"></script>
<style>
.content-main {
	margin: 0 auto;
	width: 1200px;
	height: 1700px;
	border: 0.1px solid black;
}

.content-main-header {
	width: 90%;
	margin: 0 auto;
	height: 100px;
	border-bottom: 1px solid black;
	text-align: center;
	font-size: 25px;
	font-weight: bold;
	line-height: 100px;
	
}

.content-main-title {
	width: 90%;
	margin: 0 auto;
	height: 150px;
	border-bottom: 1px solid black;
	font-size: 25px;
	font-weight: bold;
	        
}

.content-main-title-input {
	width: 99.3%;
	height: 50px;
}

.content-main-content {
	width: 90%;
	font-size: 25px;
	font-weight: bold;
	margin: 0 auto;
	height: 700px;
	border-bottom: 1px solid black;
}
.content-main-bottom{
	width: 90%;
	font-size: 25px;
	font-weight: bold;
	margin: 0 auto;
	height: 800px;
	border-bottom: 1px solid black;
	

}
.content-main-bottom-a2{
	font-size: 20px;
}
.content-main-bottom-img{
	width: 30%;

}
.content-main-bottom-date{
	width: 40%;
}
#p_content{
	resize: none;
}
</style>

﻿ <script>
function loadImg(f){
	   console.log(f.files);
	   if(f.files.length!=0 && f.files[0]!=0){
	      var reader = new FileReader();
	      reader.readAsDataURL(f.files[0]);
	      reader.onload = function(e){
	         $("#img-view").attr("src",e.target.result);
	      }
	   }else{
	      $("#img-view").attr("src","");
	   }
	}

    </script>

</head>

<body>
	<jsp:include page="/WEB-INF/views/main/header.jsp"></jsp:include>
	<div class="content">
		<div class="content-main">
			<div class="content-main-header">
				<a class="content-main-header-a">기부 등록 작성</a>
			</div><br>
			
			 <form action="/reviewInsert" method="post" enctype="multipart/form-data" id="insertFrm">
      <input type="hidden" name="sellEndWriter" value="${sessionScope.sellEndWriter }">
      <input type="hidden" name="sellEndNo" value="${sessionScope.sellEndNo}">

         <table class="table table-bordered">
            <tr>
               <th>제목</th>
               
               <td><input type="text" class="form-control" name="reviewTitle"></td>
            </tr>
            <tr>
               <th>작성자</th>
               <td>${sessionScope.member.memberId }
               <input type="hidden" name="reviewWriter" value="${sessionScope.member.memberId }"></td>
            </tr>
            <tr>
               <th>별점</th>
               <td>
        <img class="star" src="../imgs/star-off.png">
        <img class="star" src="../imgs/star-off.png">
        <img class="star" src="../imgs/star-off.png">
        <img class="star" src="../imgs/star-off.png">
        <img class="star" src="../imgs/star-off.png">
        <span class="d1" name="reviewScore"></span>
        
        <input type="hidden" class="reviewScore" name="reviewScore">
   					</td>
				</tr>
				<tr>
					<th>첨부파일</th>
					<td><input type="file" name="reviewFilepath" onchange="loadImg(this)"></td>
				</tr>
				<tr>
					<th>이미지 보기</th>
					<td>
						<div id="img-viewer">
							<img id="img-view" width="350">
						</div>
					</td>
				</tr>
				<tr>
					<th>내용</th>
					<td><textarea id="reviewContent_textarea" name="reviewContent" rows="5" style="width:100%;"></textarea></td>
				</tr>
				<tr style="text-align:center;">
					<th colspan="2">
						<button type="submit" OnClick="FnClose()" class="btn btn-outline-primary">등록</button>	 
										
					</th>
				</tr>
			</table>
		</form>
		</div> 
	<jsp:include page="/WEB-INF/views/main/footer.jsp"></jsp:include>
	
	
	<script>


function setMemberId(){
   alert("등록 성공");
   self.close();//현재창 닫기
};

function loadImg(f){
   console.log(f.files);
   if(f.files.length!=0 && f.files[0]!=0){
      var reader = new FileReader();
      reader.readAsDataURL(f.files[0]);
      reader.onload = function(e){
         $("#img-view").attr("src",e.target.result);
      }
   }else{
      $("#img-view").attr("src","");
   }
};
		
</script>
</body>


</html>


			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			<%-- <div class="content-main-title">
			<fieldset>
  				 <legend>제목 입력</legend>
  				 <input
					type="text" placeholder="제목을 입력해주세요"
					class="content-main-title-input">
					</fieldset>
  				 
				
			</div><br>
			<div class="content-main-content">
			<fieldset>
  				 <legend>내용 입력</legend>
				

		<textarea class="form-control" id="p_content"></textarea>
<script type="text/javascript">
 CKEDITOR.replace('p_content'
                , {height: 500                                                  
                 });
</script>
			</fieldset></div><br>
			<div class="content-main-bottom">
				<a class="content-main-bottom-a1" href="donationInsert.don">세부 사항</a><br><br>
				<a class="content-main-bottom-a2">
				<fieldset>
      			<legend>단체 타입</legend>
				<input type="checkbox" name="type" value="아동" />아동 
				<input type="checkbox" name="type" value="어르신" />어르신 
				<input type="checkbox" name="type" value="장애인" />장애인 
				<input type="checkbox" name="type" value="다문화" />다문화 
				<input type="checkbox" name="type" value="여성" />여성 
				<input type="checkbox" name="type" value="동물" />동물 
				<input type="checkbox" name="type" value="환경" />환경 
				<input type="checkbox" name="type" value="기타" />기타 
				 </fieldset></a><br>
   			<div class="content-main-bottom-img">
   				<fieldset>
  				 <legend>대표 이미지</legend>
					<input type="file" name="reviewFilepath" onchange="loadImg(this)"></td>
					<br>
					<legend>미리보기</legend>
						<div id="img-viewer">
							<img id="img-view" width="250" height="210">
						</div>
				</fieldset>
				
				</div><br>
				
				<div class="content-main-bottom-date">
   		<fieldset>
  				 <legend>종료 날짜</legend>
  				 
  				 </fieldset>			
			</div>
   					<button>미리보기</button><button>신청하기</button>
			</div><br>
		</div>
	</div> 
	<jsp:include page="/WEB-INF/views/main/footer.jsp"></jsp:include>
</body>


</html> --%>