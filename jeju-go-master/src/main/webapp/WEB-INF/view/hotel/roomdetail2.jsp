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

   <div class="col-md-4 w3-right" style="max-width:350px; margin-right:2%; margin-top:2%;">
        <div class="panel panel-default">
          <div class="panel-heading">
            <strong>숙소 검색</strong>
          </div>
          <div class="panel-body w3-center">
            <div class="media">
              <div class="media-body" style="width:390px;;">
              <form method="post" action="searchroomdetail.jeju" name="sf" onsubmit="return chksearch(this)">
              <input type="hidden" name="no" value="${room.hno }">
              <input type="hidden" name="name" value="${room.name}">
			<div class="">
				<label><i class="fa fa-calendar-o"></i> Check In</label> <input
					class="w3-input w3-border" type="date"name="start" id="start"value="${startday}">
			</div>
			<br>
			<div class="">
				<label><i class="fa fa-calendar-o"></i> Check Out</label> <input
					class="w3-input w3-border" type="date"name="end" id="end"value="${endday}">
			</div>
			<br>
			<div class="">
				<label><i class="fa fa-male"></i> Adults</label> <input
					class="w3-input w3-border" type="number" name="people" value="${people}" style="height:54px;">
			</div>
			<br>
			<div class="">
				<label><i class="fa fa-search"></i> Search</label>
				<button type="submit" class="w3-button w3-block w3-black"style="height:54px;">조회하기</button>
			</div>
			<br>
			<div class="">
				<c:if test="${count!=0 }">
				<input type="button" class="w3-button w3-block w3-blue"style="height:54px;" value="예약하기">
				</c:if>
				<c:if test="${count==0 }">
				<input type="button" class="w3-button w3-block w3-red"style="height:54px;opacity: 0.7;cursor: not-allowed;" value="예약 불가">
				</c:if>
			</div>
		</form>
                <div class="ficon">
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
   <div class="w3-content">
      <c:set value="${room}" var="r" />
         <h1 style="font-family: 'Shrikhand', cursive;">
            <p>${r.name}</p>
         </h1>
      
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
      	<p>
      	편의시설 :
      	<c:forEach items="${convenient}" var="con" varStatus="i">
      		${con}
      	</c:forEach>
      	
      	</p>
         <p>가격 : ${r.price}</p>
         <p>침대/개수 : ${r.bed}/${r.bedcount }</p>
         <p>제한인원수 : ${r.max}</p>
      </h2>
      <br>
      <hr>
      <br>
   </div>
</body>
</html>