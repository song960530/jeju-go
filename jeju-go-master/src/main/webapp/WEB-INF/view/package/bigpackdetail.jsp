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
			<td style="font-size:30px; height:50px" align="left" valign="top">&nbsp;&nbsp;상품이름 : ${pack.name}</td>
		</tr>
		<tr>
			<td style="font-size:20px;" align="left" valign="top">&nbsp;&nbsp;
				<font color="red" size="5">상품가격 : ${price}원</font><br><br>
				<c:if test="${login.userid == 'admin'}">
				<a href="packregist.jeju">예약가능 패키지 등록</a>
				</c:if>
				<c:if test="${login.userid != 'admin'}">
					&nbsp;
				</c:if>
				<br>
				<br>
				<br>
				<form action="packdetail.jeju" method="post">
				<font size="3">
					<c:forEach items="${packlist}" var="pack">
						${pack.startday}일 출발<input type="radio" name="startday" value="${pack.startday}">
					</c:forEach><br>
				</font>
					<button type="submit" value="이동">[이동]</button>
				</form>	
			</td>
		</tr>
		<tr>
			<td colspan="2"><font size="4">상품내용 ${pack.content}</font></td>
		</tr>
	</table>
	</div>
</body>
</html>