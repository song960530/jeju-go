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
<title>ȸ�� ���</title>
<script type="text/javascript">
   function allchkbox(allchk) {
      var chks = document.getElementsByName("idchks");
      for (var i = 0; i < chks.length; i++) {
         chks[i].checked = allchk.checked;
      }
   }
   function passchk(id){
	   alert("dz")
	   return false;
	   
   }
</script>
</head>
<body>
	<div class="container">
		<div>
			<button class="btn-primarys">
				<h2 class="widgetheading" style="text-align: center;">ȸ�� ���</h2>
			</button>
			<table>
				<tr style="color: black;">
					<th>���̵�</th>
					<th>�̸�</th>
					<th>��ȭ</th>
					<th>&nbsp;</th>
					<!-- <th><input type="checkbox" name="allchk"
						onchange="allchkbox(this)"></th> -->
				</tr>
				<c:forEach items="${list}" var="user">
					<tr style="color: black;">
						<td>${user.userid}</td>
						<td>${user.username}</td>
						<td>${user.phone}</td>
						<td>
							<a href="javascript:void(0)"  onclick="document.getElementById('admindelete${user.userid}').style.display='block'"class="btn btn-primary">����Ż��</a>
							<a href="../user/mypage.jeju?userid=${user.userid}"><button type="button" class="btn btn-primary">ȸ������ ����</button></a>
						</td>
					</tr>
					<!-- ����Ż�� ��й�ȣ Ȯ�� �κ� -->
						<div id="admindelete${user.userid}" class="w3-modal" style="display: none;">
							<div class="w3-modal-content w3-animate-zoom w3-padding-large">
								<div class="w3-container w3-white w3-center">
									<i onclick="document.getElementById('admindelete${user.userid}').style.display='none'"
										class="fa fa-remove w3-button w3-xlarge w3-right w3-transparent"></i>
									<h2 class="w3-wide">������ ��й�ȣ Ȯ��</h2>
									<p>��й�ȣ�� �Է��ϼ���</p>
									<form action="admindelete.jeju" method="post" id="admindelete">
									<%-- <form:form modelattribute="user" action="admindelete.jeju?userid=${user.userid}"
										name="lf" onsubmit="return loginchk(this)"> --%>
										<input type="hidden" name="userid" value="${user.userid}">
										<p>
											<input class="w3-input w3-border"
												style="text-transform: lowercase;" type="password"
												name="password" placeholder="��й�ȣ">
										</p>
										<button type="submit"
											class="w3-button w3-padding-large w3-green w3-margin-bottom">����Ż��</button>
									</form>
									<%-- </form:form> --%>
			</div>
		</div>
	</div>
				</c:forEach>
			</table>
		</div>
	</div>
</body>
</html>