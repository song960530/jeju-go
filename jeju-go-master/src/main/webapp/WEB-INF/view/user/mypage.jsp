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
				alert("��й�ȣ�� �ٸ��ϴ�.");
				$("#pw").val("").focus();
				$("#pw2").val("");
				return false;
			}else if ($("#pw").val().length < 8) {
				alert("��й�ȣ�� 8�� �̻����� �����ؾ� �մϴ�.");
				$("#pw").val("").focus();
				return false;
			}else if($.trim($("#pw").val()) !== $("#pw").val()){
				alert("������ �Է��� �Ұ����մϴ�.");
				return false;
			}
		}));
		if($("#wdForm").submit(function(){
			if(!confirm("Ż�� �Ͻðڽ��ϱ�?")){
				return false;
			}
		}));
	})
</script>
<meta charset="EUC-KR">
<title>����Go ȸ�� ����������</title>
</head>
<body>
<div class="w3-content w3-container w3-margin-top">
		<div class="w3-container w3-card-4">
			<div class="w3-center w3-large w3-margin-top">
				<h3>My Page</h3>
			</div>
			<div>
				<form id="myForm" action="updatemypage.jeju" method="post">
					<p>
						<label>���̵�</label> 
						<input class="w3-input" type="text" id="id" name="userid" readonly value="${ user.userid }"> 
					</p>
					<p>
						<label>�̸�</label> 
						<input class="w3-input" type="text" id="name" name="username" readonly value="${ user.username }"> 
					</p>
					<p>
						<label>�޴�����ȣ</label> 
						<input class="w3-input" type="text" id="phone" name="phone" value="${ user.phone }" required> 
					</p>
					<p class="w3-center">
						<button type="submit" class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-round">ȸ������ ����</button>
					</p>
				</form>
				<br />
				<form id="pwForm" action="updatepw.jeju" method="post">	
					<input type="hidden" name="id" value="${ user.userid }">
					<input type="hidden" name="name" value="${ user.username }">
					<p>
						<label>Password</label>
						<input class="w3-input" id="old_pw" name="old_pw" type="password" required>
					</p>
					<p>
						<label>New Password</label> 
						<input class="w3-input" id="pw" name="pw" type="password" required>
					</p>
					<p>
						<label>Confirm</label>
						<input class="w3-input" type="password" id="pw2" type="password" required>
					</p>
					<p class="w3-center">
						<button type="submit" id="joinBtn" class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-round">��й�ȣ ����</button>
					</p>
				</form>
				<br />
				<form id= "wdForm" action="withdrawal.jeju" method="post">
					<input type="hidden" name="id" readonly value ="${user.userid}">
					<p>
						<label>Password</label>
						<input class="w3-input" type="password" name="password" required>
					</p>
					<p class="w3-center">
						<button type="submit" id="joinBtn" class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-round">ȸ�� Ż��</button>
					</p>
				</form>
			</div>
		</div>
	</div>
</body>
</html>