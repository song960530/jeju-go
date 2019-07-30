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
  text-align: center;
  padding: 8px;
}
tr:nth-child(even){background-color: #f2f2f2}
tr:nth-child(odd){background-color: white;}
th {
  background-color: #56A9E8;
  color: white;
}
.styled-select {
   background: url(http://i62.tinypic.com/15xvbd5.png) no-repeat 96% 0;
   height: 29px;
   overflow: hidden;
   width: 240px;
}
.styled-select select {
   background: transparent;
   border: none;
   font-size: 14px;
   height: 29px;
   padding: 5px; /* If you add too much padding here, the options won't show in IE */
   width: 268px;
}
.styled-select.slate {
   background: url(http://i62.tinypic.com/2e3ybe1.jpg) no-repeat right center;
   height: 34px;
   width: 240px;
}
.styled-select.slate select {
   border: 1px solid #ccc;
   font-size: 16px;
   height: 34px;
   width: 268px;
}
/* -------------------- Rounded Corners */
.rounded {
   -webkit-border-radius: 20px;
   -moz-border-radius: 20px;
   border-radius: 20px;
}
.semi-square {
   -webkit-border-radius: 5px;
   -moz-border-radius: 5px;
   border-radius: 5px;
}
/* -------------------- Colors: Background */
.slate   { background-color: #ddd; }
.green   { background-color: #779126; }
.blue    { background-color: #3b8ec2; }
.yellow  { background-color: #eec111; }
.black   { background-color: #000; }
/* -------------------- Colors: Text */
.slate select   { color: #000; }
.green select   { color: #fff; }
.blue select    { color: #fff; }
.yellow select  { color: #000; }
.black select   { color: #fff; }
/* -------------------- Select Box Styles: danielneumann.com Method */
/* -------------------- Source: http://danielneumann.com/blog/how-to-style-dropdown-with-css-only/ */
#mainselection select {
   border: 0;
   color: #EEE;
   background: transparent;
   font-size: 20px;
   font-weight: bold;
   padding: 2px 10px;
   width: 378px;
   *width: 350px;
   *background: #58B14C;
   -webkit-appearance: none;
}
#mainselection {
   overflow:hidden;
   width:350px;
   -moz-border-radius: 9px 9px 9px 9px;
   -webkit-border-radius: 9px 9px 9px 9px;
   border-radius: 9px 9px 9px 9px;
   box-shadow: 1px 1px 11px #330033;
   background: #58B14C url("http://i62.tinypic.com/15xvbd5.png") no-repeat scroll 319px center;
}
/* -------------------- Select Box Styles: stackoverflow.com Method */
/* -------------------- Source: http://stackoverflow.com/a/5809186 */
select#soflow, select#soflow-color {
   -webkit-appearance: button;
   -webkit-border-radius: 2px;
   -webkit-box-shadow: 0px 1px 3px rgba(0, 0, 0, 0.1);
   -webkit-padding-end: 20px;
   -webkit-padding-start: 2px;
   -webkit-user-select: none;
   background-image: url(http://i62.tinypic.com/15xvbd5.png), -webkit-linear-gradient(#FAFAFA, #F4F4F4 40%, #E5E5E5);
   background-position: 97% center;
   background-repeat: no-repeat;
   border: 1px solid #AAA;
   color: #555;
   font-size: inherit;
   margin: 20px;
   overflow: hidden;
   padding: 5px 10px;
   text-overflow: ellipsis;
   white-space: nowrap;
   width: 300px;
}
select#soflow-color {
   color: #fff;
   background-image: url(http://i62.tinypic.com/15xvbd5.png), -webkit-linear-gradient(#779126, #779126 40%, #779126);
   background-color: #779126;
   -webkit-border-radius: 20px;
   -moz-border-radius: 20px;
   border-radius: 20px;
   padding-left: 15px;
}
</style>
<title>회원 예약확인페이지</title>
</head>
<body>
	<div class="container">
		<div>		
			<button class="btn-primarys">			
				<h2 class="widgetheading" style="text-align: center;">예약내역</h2>
			</button>
			   <ul class="nav nav-tabs">
               <li class="nav-item"><a class="nav-link active"
                   href="../user/history.jeju?userid=${login.userid}">숙박</a></li>
               <li class="nav-item"><a class="nav-link" 
                  href="../user/package.jeju?userid=${login.userid}">패키지</a></li>
           	  </ul>  		
			<table>
				<tr class="w3-center" style="color: black;">
					<th>호텔</th>
					<th>룸번호</th>
					<th>예약자</th>
					<th>체크인</th>
					<th>체크아웃</th>
					<th>결재금액</th>
					<th>사용포인트</th>
					<th>총 결제금액</th>
					<th>신청일</th>
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
					  	<c:if test="${list.checked=='승인대기'}">
					    	<button id="bang-btn" onclick="document.getElementById('selectbang${list.checked}').style.display='block'"
					    	class="btn btn-success)">${list.checked}</button>
					    </c:if>
					  	<c:if test="${list.checked=='승인완료'}">
					    	<button id="bang-btn" onclick="document.getElementById('selectbang${list.checked}').style.display='block'"
					    	class="btn btn-primary">${list.checked}</button>
					    </c:if>
					  	<c:if test="${list.checked=='승인취소'}">
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
									<b style="font-size:20px;">${list.hname} - ${list.name} 예약 취소</b>
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