<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<fmt:formatNumber value="${pack.price}" var="price" pattern="#,###.###"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>패키지 상세 페이지</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
   href="https://fonts.googleapis.com/css?family=Lato">
<link rel="stylesheet"
   href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://fonts.googleapis.com/css?family=Shrikhand&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon&display=swap" rel="stylesheet">
<style>
html, body, h1, h2, h3, h4 {
   font-family: "Lato", sans-serif
}

.mySlides {
   display: none
}

.w3-tag, .fa {
   cursor: pointer
}

.w3-tag {
   height: 15px;
   width: 15px;
   padding: 0;
   margin-top: 6px
}
</style>
<script type="text/javascript">
// Slideshow
var slideIndex = 1;
$(document).ready(function(){
   showDivs(slideIndex);
});
function plusDivs(n) {
  showDivs(slideIndex += n);
}
function currentDiv(n) {
  showDivs(slideIndex = n);
}
function showDivs(n) {
  var i;
  var x = document.getElementsByClassName("mySlides");
  var dots = document.getElementsByClassName("demodots");
  if (n > x.length) {slideIndex = 1}    
  if (n < 1) {slideIndex = x.length} ;
  for (i = 0; i < x.length; i++) {
    x[i].style.display = "none";  
  }
  for (i = 0; i < dots.length; i++) {
    dots[i].className = dots[i].className.replace(" w3-white", "");
  }
  x[slideIndex-1].style.display = "block";  
  dots[slideIndex-1].className += " w3-white";
}
</script>
</head>
<body>
<div class="container">
	<table style="margin:auto;">
		<tr>
			<td rowspan="2" width="60%" ><img alt="" src="${path}/${pack.photourl}" width="600px" height="400px"></td>
			<td style="font-size:30px; height:50px" align="center" valign="top">상품이름 : ${pack.name}</td>
		</tr>
		<tr>
			<td style="font-size:20px;" align="left" valign="top">&nbsp;&nbsp;
				<font color="red" size="5">상품가격 : ${price}원</font><br><br>
					&nbsp;&nbsp;${pack.mon}월 일정 <br>
				<c:forEach items="${start}" var="start">
					&nbsp;&nbsp;출발 : ${start}일 ~ 도착 : ${start + 7}일<br>
				</c:forEach><br>
				<font color="blue" size="5">&nbsp;&nbsp;총 여행기간 : ${pack.travelday}일</font><br><br>
				&nbsp;&nbsp;<a href="../package/packreserve.jeju?no=${pack.no}&userid=${login.userid}">[예약하러가기]</a>
			</td>
		</tr>
		<tr>
			<td colspan="2"><font size="4">상품내용 ${pack.content}</font></td>
		</tr>
	</table>
	</div>
</body>
</html>