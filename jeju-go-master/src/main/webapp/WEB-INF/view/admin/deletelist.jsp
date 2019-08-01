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
table {
  border-collapse: collapse;
  width: 100%;
}
th, td {
  text-align: left;
  padding: 8px;
}
tr:nth-child(even){background-color: #f2f2f2}
tr:nth-child(odd){background-color: white;}
th {
  background-color: #56A9E8;
  color: white;
}
</style>
<title>ȸ�� Ż�� ��û ���</title>
<script type="text/javascript">
   function allchkbox(allchk) {
      var chks = document.getElementsByName("idchks");
      for (var i = 0; i < chks.length; i++) {
         chks[i].checked = allchk.checked;
      }
   }
   function listcall(page) {
	    document.list.pageNum.value = page;
	    document.list.submit();
	 }
</script>
</head>
<body>
<form name="list">
<input type="hidden" name="pageNum" value="1">
</form>
<div class="container">
		<div>
		<!-- <div style="margin-left: 5%; margin-right: 5%; width: 90%;"> -->
				<h2 class="widgetheading" style="text-align: center;">Ż�� ��û ȸ�� ���</h2>
			<form action="delete.jeju" method="post" id="delete">
			<table>
				<tr style="color: black;">
					<th>���̵�</th>
					<th>�̸�</th>
					<th>��ȭ</th>
					<th><input type="checkbox" name="allchk"
						onchange="allchkbox(this)"></th>
				</tr>
				<c:forEach items="${list}" var="user">
				<c:if test="${!empty user.deleterequest}">
					<tr style="color: black;">
						<td>${user.userid}</td>
						<td>${user.username}</td>
						<td>${user.phone}</td>
						<td><input type="checkbox" name="idchks" value="${user.userid}"></td>
					</tr>
				</c:if>	
				</c:forEach>
				<c:if test="${count == 0}">
	  				<tr>
	  					<td colspan="5">��ϵ� ���Ǳ��� �����ϴ�.</td>
	  				</tr>
				</c:if>
			</table>
<%-- 				<input type="hidden" name="userId" value="${user.userid}"> --%>
				<p style="float: right;">
				<input type="submit" class="btn btn-primary" value="Ż�����"></p>
				<!-- <input type="button" class="btn btn-primary" onclick="location.href='../user/main.jeju'" value="����Ż��"> -->
			</form>
		</div>
		<table>
				<tr>
    				<td colspan="5" class="w3-center">
	       				<c:if test="${pageNum > 1}">
	          				<a href="javascript:listcall(${pageNum - 1})">[����]</a>
	       				</c:if>

	       				<c:if test="${pageNum <= 1}">[����]</c:if>
	       				<c:forEach var="a" begin="${startpage}" end="${endpage}">
	          				<c:if test="${a == pageNum}">[${a}]</c:if>
	          				<c:if test="${a != pageNum}">
	            				<a href="javascript:listcall(${a})">[${a}]</a>
	          				</c:if>
	       				</c:forEach>

	       				<c:if test="${pageNum < maxpage}">
				           	<a href="javascript:listcall(${pageNum + 1})">[����]</a>
	       				</c:if>

	       				<c:if test="${pageNum >= maxpage}">[����]</c:if>
        			</td>
     			</tr>
			</table>
	</div>
</body>
</html>