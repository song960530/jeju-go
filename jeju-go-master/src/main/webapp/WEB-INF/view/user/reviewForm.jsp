<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script src="../star/js/star.js"></script>
<link href="../css/star2.css" rel="stylesheet">
<link href="../Arsha/css/bootstrap.min.css" rel="stylesheet">
<link href="../Arsha/css/responsive-slider.css" rel="stylesheet">
<link href="../Arsha/css/style.css" rel="stylesheet">
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<title>Insert title here</title>
<script type="text/javascript">
	function test1(f){
		if(f.sepoint.value==""){
			alert("별점을 선택해주세요");
			return false;
		}
		if(f.content.value==""){
			alert("리뷰를 입력해주세요");
			return false;
		}
		return true;
	}
</script>
</head>
<body>
<div class="w3-container w3-center" style="padding-left:10%; padding-right:10%;">
		<div class="w3-modal-content w3-animate-zoom w3-padding-large">
	     <div class="w3-container w3-white w3-center">
	        <i onclick="document.getElementById('review${f.no}').style.display='none'"
	           class="fa fa-remove w3-button w3-xlarge w3-right w3-transparent"></i>
	           <div class="w3-center">
	            <br><br>
	              <b style="font-size:20px;">편하게 지내셨나요? 리뷰를 작성해주세요!</b>
	            <br><br>
	            <form action="writereview.jeju" method="post" name="f" onsubmit="return test1(this)">
	            	<input type="hidden" name="no" value="${f.no}">
	            	<input type="hidden" name="hno" value="${f.hno}">
	            	<input type="hidden" name="roomnum" value="${f.roomnum}">
	            	<input type="hidden" name="pno" value="${f.pno}">
	            	<input type="hidden" name="userid" value="${f.userid}">
	            	<input type="hidden" name="name" value="${f.name}">
					<span class="star-input">
						<span class="input">
					    	<input type="radio" name="sepoint" value="1" id="p1">
					    	<label for="p1">1</label>
					    	<input type="radio" name="sepoint" value="2" id="p2">
					    	<label for="p2">2</label>
					    	<input type="radio" name="sepoint" value="3" id="p3">
					    	<label for="p3">3</label>
					    	<input type="radio" name="sepoint" value="4" id="p4">
					    	<label for="p4">4</label>
					    	<input type="radio" name="sepoint" value="5" id="p5">
					    	<label for="p5">5</label>
					  	</span>
					</span>
	                   <br><br>
	                   <div class="form-group">
					      <textarea name="content" class="form-control" style="height:100px; weight:50%; font-size:15pt; color:black; font-weight:bold; text-align: center;"></textarea>
					</div>
	                 <input type="submit" id="bang-btn" class="btn btn-primary" value="리뷰 작성하기">
               </form>
              </div>
        </div>
     </div>
	</div>
</body>
</html>
