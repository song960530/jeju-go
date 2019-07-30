<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<title>삭제 페이지</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
	function checkclose() {
		self.close();
	}
	
	function finish(f) {
		if(document.getElementById("result").value ==""){
			alert("비밀번호를 입력해주세요");
			return false;
		}
		if(document.getElementById("result").value !="비밀번호가 일치합니다"){
			alert("비밀번호를 확인 해주세요");
			return false;
		}
		return true;
	}
	
$(document).ready(function(){
	$('#btn2').on('click', function() {
		pass = document.getElementById("password").value;
		$.ajax({
			url : "adminpasschk.jeju",
			type : "POST",
			data : {
				inputpass:pass	
			},
			success : function(data) {
				document.getElementById("result").value=data;
			},
			error : function() {
				alert("실패");
			}
		});
	});
});
</script>
</head>
<body>
	<div class="w3-container w3-center" style="padding-left:10%; padding-right:10%;">
		<div class="w3-card-4 w3-dark-grey w3-center" style="width: 100%;">
			<div class="w3-container w3-center">
				<c:if test="${!empty msg}">
					<h3>${msg}</h3>
					<div class="w3-section">
						<button class="w3-button w3-green" onclick="checkclose()">확인</button>
					</div>
				</c:if>
				<c:if test="${empty msg}">
					<h3>비밀번호를 입력해주세요</h3>
					<form action="hoteldelete.jeju" name="f" method="post" onsubmit="return finish(this)">
						<input type="hidden" name="hno" value="${hno}">
						<input type="hidden" name="today" value="${today}">
						<input type="hidden" name="name" value="${name}">
						<span style="padding-left:20%;"><input type="password" name="password" id="password"></span>
						<span><input type="button" class="w3-button w3-blue" value="비밀번호 확인" id="btn2"></span>
						<input type="text" id="result" value="비밀번호를 확인 해주세요" readonly>
						<div class="w3-section">
							<input type="submit" class="w3-button w3-green" value="확인">
							<input type="button" class="w3-button w3-red" onclick="checkclose()" value="취소">
						</div>
					</form>
				</c:if>
			</div>

		</div>
	</div>
</body>
</html>