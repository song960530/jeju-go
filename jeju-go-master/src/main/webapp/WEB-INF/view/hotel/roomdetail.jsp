<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>방 상세 페이지</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript"
   src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=zjlzvjn41f"></script>
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
hr { 
  display: block;
  margin-top: 0.5em;
  margin-bottom: 0.5em;
  margin-left: auto;
  margin-right: auto;
  border-style: inset;
  border-width: 1px;
} 
</style>
<script type="text/javascript">
var lat = null;
var lng = null;
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
   <div class="w3-content">
      <c:set value="${room}" var="r" />
      <div class="w3-panel">
         <h1 style="font-family: 'Shrikhand', cursive;">
            <p style="font-family: 'Arimo', sans-serif;">${r.name}</p>
         </h1>
      </div>
      
      <c:forEach items="${r.photo}" var="photo">
         <div class="w3-display-container mySlides">
            <img src="${path}/${photo.photourl}"
               style="width: 100%; height: 100%; max-height: 500px;">
            <div class="w3-display-topleft w3-container w3-padding-32"></div>
         </div>
      </c:forEach>
      
      <div class="w3-container w3-dark-grey w3-padding w3-xlarge">
         <div class="w3-left" onclick="plusDivs(-1)">
            <i class="fa fa-arrow-circle-left w3-hover-text-teal"></i>
         </div>
         <div class="w3-right" onclick="plusDivs(1)">
            <i class="fa fa-arrow-circle-right w3-hover-text-teal"></i>
         </div>
         <div class="w3-center">
            <c:forEach items="${r.photo}" var="photo" varStatus="i">
               <span
                  class="w3-tag demodots w3-border w3-transparent w3-hover-white"
                  onclick="currentDiv(${i.index+1})"></span>
            </c:forEach>
         </div>
      </div>
      <h2 style="font-family: 'Do Hyeon', sans-serif;">
	     <hr>
	     <b style="font-size:20px;">
      	편의시설 :
      	<c:forEach items="${convenient}" var="con" varStatus="i">
      		<c:if test="${con == '엘레베이터' }">
	      		<img src="${path}/img/conve/ele.jpg" width="40px" height="40px" >${con}
      		</c:if>
      		<c:if test="${con == '비품류' }">
	      		<img src="${path}/img/conve/b.jpg" width="40px" height="40px" >${con}
      		</c:if>
      		<c:if test="${con == '에어컨' }">
	      		<img src="${path}/img/conve/e.jpg" width="40px" height="40px" >${con}
      		</c:if>
      		<c:if test="${con == '주차장' }">
	      		<img src="${path}/img/conve/ju.jpg" width="40px" height="40px" >${con}
      		</c:if>
      		<c:if test="${con == '주방시설' }">
	      		<img src="${path}/img/conve/jubang.jpg" width="40px" height="40px" >${con}
      		</c:if>
      		<c:if test="${con == '냉장고' }">
	      		<img src="${path}/img/conve/nang.jpg" width="40px" height="40px" >${con}
      		</c:if>
      		<c:if test="${con == '스파' }">
	      		<img src="${path}/img/conve/s.jpg" width="40px" height="40px" >${con}
      		</c:if>
      		<c:if test="${con == '세탁기' }">
	      		<img src="${path}/img/conve/se.jpg" width="40px" height="40px" >${con}
      		</c:if>
      		<c:if test="${con == 'TV' }">
	      		<img src="${path}/img/conve/TV.jpg" width="40px" height="40px" >${con}
      		</c:if>
      		<c:if test="${con == 'wi-fi' }">
	      		<img src="${path}/img/conve/w.jpg" width="40px" height="40px" >${con}
      		</c:if>
      	</c:forEach>
      	</b><br>
         <b style="font-size:20px;">가격 : <fmt:formatNumber value="${r.price}" pattern="###,###"/>원</b><br>
         <b style="font-size:20px;">침대/개수 : ${r.bed}/${r.bedcount }</b><br>
         <b style="font-size:20px;">제한인원수 : ${r.max}</b>
      </h2>
      <br>
   </div>
</body>
</html>