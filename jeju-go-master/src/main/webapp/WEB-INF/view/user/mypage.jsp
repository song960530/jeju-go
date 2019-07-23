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
<meta charset="EUC-KR">
<title>제주Go 회원 마이페이지</title>
</head>
<body>
<div class="w3-content w3-container w3-margin-top">
		<div class="w3-container w3-card-4">
			<div class="recent">
         		 <h2 class="widgetheading" style="text-align: center;">My Page</h2>
        	</div>
			<div>
				<form id="myForm" action="updatemypage.jeju" method="post">
					<p>
						<label>아이디</label> 
						<input class="w3-input" type="text" id="id" name="userid" readonly value="${user.userid}"> 
					</p>
					<p>
						<label>이름</label> 
						<input class="w3-input" type="text" id="name" name="username" readonly value="${user.username}"> 
					</p>
					<p>
						<label>휴대폰번호</label> 
						<input class="w3-input" type="text" id="phone" name="phone" value="${user.phone}" required> 
					</p>
					<p class="w3-center">
						<button type="submit" class="btn btn-primary">회원정보 변경</button>
					</p>
				</form>
				<br />
			</div>
		</div>
	</div>
</body>
</html>