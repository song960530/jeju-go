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
  text-align: center;
  padding: 8px;
}
tr:nth-child(even){background-color: #f2f2f2}
tr:nth-child(odd){background-color: white;}
th {
  background-color: #56A9E8;
  color: white;
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
	function passchk(id){
		alert("dz")
	 	return false;
	 
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
	<div class="container">
		<div>
				<h2 class="widgetheading" style="text-align: center;">회원 목록</h2>
			<table>
				<tr style="color: black;">
					<th>아이디</th>
					<th>이름</th>
					<th>전화</th>
					<th>권한</th>
					<!-- <th><input type="checkbox" name="allchk"
						onchange="allchkbox(this)"></th> -->
				</tr>
				<c:forEach items="${list}" var="user">
					<tr style="color: black;">
						<td>${user.userid}</td>
						<td>${user.username}</td>
						<td>${user.phone}</td>
						<td>
							<a href="javascript:void(0)"  onclick="document.getElementById('admindelete${user.userid}').style.display='block'"class="btn btn-primary">강제탈퇴</a>
							<a href="../user/mypage.jeju?userid=${user.userid}"><button type="button" class="btn btn-primary">회원정보 수정</button></a>
						</td>
					</tr>
					<!-- 강제탈퇴 비밀번호 확인 부분 -->
						<div id="admindelete${user.userid}" class="w3-modal" style="display: none;">
							<div class="w3-modal-content w3-animate-zoom w3-padding-large">
								<div class="w3-container w3-white w3-center">
									<i onclick="document.getElementById('admindelete${user.userid}').style.display='none'"
										class="fa fa-remove w3-button w3-xlarge w3-right w3-transparent"></i>
									<h2 class="w3-wide">관리자 비밀번호 확인</h2>
									<p>비밀번호를 입력하세요</p>
									<form action="admindelete.jeju" method="post" id="admindelete">
									<%-- <form:form modelattribute="user" action="admindelete.jeju?userid=${user.userid}"
										name="lf" onsubmit="return loginchk(this)"> --%>
										<input type="hidden" name="userid" value="${user.userid}">
										<p>
											<input class="w3-input w3-border"
												style="text-transform: lowercase;" type="password"
												name="password" placeholder="비밀번호">
										</p>
										<button type="submit"
											class="w3-button w3-padding-large w3-green w3-margin-bottom">강제탈퇴</button>
									</form>
								</div>
							</div>
						</div>
				</c:forEach>
				<tr>
    				<td colspan="5" class="w3-center">
	       				<c:if test="${pageNum > 1}">
	          				<a href="javascript:listcall(${pageNum - 1})">[이전]</a>
	       				</c:if>

	       				<c:if test="${pageNum <= 1}">[이전]</c:if>
	       				<c:forEach var="a" begin="${startpage}" end="${endpage}">
	          				<c:if test="${a == pageNum}">[${a}]</c:if>
	          				<c:if test="${a != pageNum}">
	            				<a href="javascript:listcall(${a})">[${a}]</a>
	          				</c:if>
	       				</c:forEach>

	       				<c:if test="${pageNum < maxpage}">
				           	<a href="javascript:listcall(${pageNum + 1})">[다음]</a>
	       				</c:if>

	       				<c:if test="${pageNum >= maxpage}">[다음]</c:if>
        			</td>
     			</tr>
				<c:if test="${count == 0}">
	  				<tr>
	  					<td colspan="5">등록된 문의글이 없습니다.</td>
	  				</tr>
				</c:if>
			</table>
		</div>
	</div>
	</form>
</body>
</html>