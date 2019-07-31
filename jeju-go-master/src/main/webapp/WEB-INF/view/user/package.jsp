<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto">
<link href="../css/boardstyle.css" rel="stylesheet">

<style>
</style>
<title>ȸ�� ����Ȯ��������</title>
</head>
<body>
	<div class="container">
		<div>		
			<button class="btn-primarys">			
				<h2 class="widgetheading" style="text-align: center;">���೻��</h2>
			</button>
			   <ul class="nav nav-tabs">
               <li class="nav-item"><a class="nav-link active"
                   href="../user/history.jeju?userid=${login.userid}">����</a></li>
               <li class="nav-item"><a class="nav-link" 
                  href="../user/package.jeju?userid=${login.userid}">��Ű��</a></li>
           	  </ul>  		
			<table>
				<tr class="w3-center" style="color: black;">
					<th>ȣ��</th>
					<th>���ȣ</th>
					<th>������</th>
					<th>üũ��</th>
					<th>üũ�ƿ�</th>
					<th>����ݾ�</th>
					<th>�������Ʈ</th>
					<th>�� �����ݾ�</th>
					<th>��û��</th>
					<th></th>
				</tr>
				<c:forEach items="${list}" var="list">
					<tr style="color: black;">
					  <td>
						<c:if test="${list.hno == 0}">
						  ${list.name}
						</c:if>
						<c:if test="${list.hno != 0 }">
						<a href="../hotel/hoteldetail.jeju?no=${list.hno}">  ${list.hname} - ${list.name} </a>
						</c:if>
					  </td>
					  <td>${list.roomnum}</td>
					  <td>${list.username}</td>
					  <td>${list.start}</td>
					  <td>${list.end}</td>
					  <td><fmt:formatNumber value="${list.total}" pattern="###,###"/></td>
					  <td><fmt:formatNumber value="${list.point}" pattern="###,###"/></td>
					  <td><fmt:formatNumber value="${list.total - list.point}" pattern="###,###"/></td>
					  <td><fmt:formatDate value="${list.regdate}" pattern="yyyy-MM-dd"/></td>
					  <td>
					  	<c:if test="${list.checked=='���δ��'}">
					    	<button id="bang-btn" onclick="document.getElementById('selectbang${list.checked}').style.display='block'"
					    	class="btn btn-success)">${list.checked}</button>
					    </c:if>
					  	<c:if test="${list.checked=='���οϷ�'}">
					    	<button id="bang-btn" onclick="document.getElementById('selectbang${list.checked}').style.display='block'"
					    	class="btn btn-primary">${list.checked}</button>
					    </c:if>
					  	<c:if test="${list.checked=='�������'}">
					    	<button id="bang-btn" class="btn btn-danger">${list.checked}</button>
					    </c:if>
					  </td>
					</tr>
					<div id="selectbang${list.checked}" class="w3-modal" style="display: none;">
						<div class="w3-modal-content w3-animate-zoom w3-padding-large">
							<div class="w3-container w3-white w3-center">
								<i
									onclick="document.getElementById('selectbang${list.no}').style.display='none'"
									class="fa fa-remove w3-button w3-xlarge w3-right w3-transparent"></i>
									<div class="w3-center">
									<b style="font-size:20px;">${list.hname} - ${list.name} ���� ���</b>
									</div>
									<br><br>
							</div>
						</div>
					</div>
				</c:forEach>
			</table>
		</div>
	</div>
</body>
</html> 