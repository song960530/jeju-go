<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto">
<style>
.w3-sidebar a {font-family: "Roboto", sans-serif}
body,h1,h2,h3,h4,h5,h6,.w3-wide {font-family: "Montserrat", sans-serif;}\
div.left {
   width: 20%;
   float: left;
   box-sizing: border-box;
}
div.right {
   width: 70%;
   float: right;
   box-sizing: border-box;
}
</style>
<title>회원 목록</title>
<script type="text/javascript">
   function allchkbox(allchk) {
      var chks = document.getElementsByName("idchks");
      for (var i = 0; i < chks.length; i++) {
         chks[i].checked = allchk.checked;
      }
   }
</script>
</head>
<body>
	<div class="container"
		style="margin-left: 5%; margin-right: 5%; width: 90%;">
		<div class="right">
			<button class="btn-primarys">
				<h2 class="widgetheading" style="text-align: center;">회원 목록</h2>
			</button>
			<table>
				<tr style="color: black;">
					<th>아이디</th>
					<th>이름</th>
					<th>전화</th>
					<th>&nbsp;</th>
					<!-- <th><input type="checkbox" name="allchk"
						onchange="allchkbox(this)"></th> -->
				</tr>
				<c:forEach items="${list}" var="user">
					<tr style="color: black;">
						<td>${user.userid}</td>
						<td>${user.username}</td>
						<td>${user.phone}</td>
						<td><a href="../user/update.jeju?id=${user.userid}">수정</a> <a
							href="../user/delete.jeju?id=${user.userid}">강제탈퇴</a> <a
							href="../user/mypage.jeju?id=${user.userid}">회원정보</a></td>
					<%-- 	<td><input type="checkbox" name="idchks"
							value="${user.userid}"></td> --%>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
</body>
</html>