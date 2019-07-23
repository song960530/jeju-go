<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
	$(function(){
		if(${msg ne null}){
			alert('${msg}');
		};
		if($("#wdForm").submit(function(){
			if(!confirm("탈퇴 하시겠습니까?")){
				return false;
			}
		}));
	})
</script>
<meta charset="EUC-KR">
<title>제주Go 회원 마이페이지</title>
</head>
<body>
<div class="w3-content w3-container w3-margin-top">
		<div class="w3-container w3-card-4">
			<div class="recent">
         		 <h2 class="widgetheading" style="text-align: center;">회원탈퇴 신청</h2>
        	</div>
			<div>
				<br />
				<form id= "wdForm" action="withdrawal.jeju" method="post">
					<input type="hidden" name="id" readonly value ="${user.userid}">
					<p>
						<label>Password</label>
						<input class="w3-input" type="password" name="password" required>
					</p>
					<p class="w3-center">
						<button type="submit" id="joinBtn" class="btn btn-primary">회원 탈퇴</button>
					</p>
				</form>
			</div>
		</div>
	</div>
</body>
</html> 