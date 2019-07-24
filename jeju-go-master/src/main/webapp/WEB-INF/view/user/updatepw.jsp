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
		
		if($("#pwForm").submit(function(){
			if($("#pw").val() !== $("#pw2").val()){
				alert("비밀번호가 다릅니다.");
				$("#pw").val("").focus();
				$("#pw2").val("");
				return false;
			}else if ($("#pw").val().length < 3) {
				alert("비밀번호는 3자 이상으로 설정해야 합니다.");
				$("#pw").val("").focus();
				return false;
			}else if($.trim($("#pw").val()) !== $("#pw").val()){
				alert("공백은 입력이 불가능합니다.");
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
         		 <h2 class="widgetheading" style="text-align: center;">비밀번호 변경</h2>
        	</div>
				<form id="pwForm" action="updatepw.jeju" method="post">	
					<input type="hidden" name="userid" value="${ login.userid }">
					<input type="hidden" name="username" value="${ login.username }">				      
					<p>
						<label>Password</label>
						<input class="w3-input" id="old_pw" name="password"  type="password"  required>
					</p>
					<p>
						<label>New Password</label> 
						<input class="w3-input" id="pw" name="newpassword" type="password" required>
					</p>
					<p>
						<label>Confirm</label>
						<input class="w3-input"  id="pw2" name="newpassword2" type="password" required>
					</p>
					<p class="w3-center">
						<button type="submit" id="joinBtn" class="btn btn-primary">비밀번호 변경</button>
					</p>
				</form>
			</div>
		</div>
</body>
</html> 