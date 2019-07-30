<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>방 삭제 페이지</title>
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

function getFormatDate(date) {
	var year = date.getFullYear(); //yyyy 
	var month = (1 + date.getMonth()); //M 
	month = month >= 10 ? month : '0' + month; //month
	var day = date.getDate(); //d 
	day = day >= 10 ? day : '0' + day; //day  
	return year + '-' + month + '-' + day;
}

function win_delete(no,name) {
	var date = new Date(); 
	date = getFormatDate(date);
	var op = "width=600, height=193, left=500, top=250";
	open("deleteForm.jeju?hno="+no+"&today="+date+"&name="+name, "", op);
}
</script>
</head>
<body>
   <div class="w3-content">
      <c:set value="${hotel}" var="h" />
      <div class="w3-panel">
         <h1 style="font-family: 'Shrikhand', cursive;">
            <p>${h.hname}</p>
         </h1>  
      </div>
      <c:forEach items="${h.photo}" var="photo">
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
            <c:forEach items="${h.photo}" var="photo" varStatus="i">
               <span
                  class="w3-tag demodots w3-border w3-transparent w3-hover-white"
                  onclick="currentDiv(${i.index+1})"></span>
            </c:forEach>
         </div>
      </div>
      <br>
      <hr>
      <br>
      <c:forEach items="${h.room}" var="r">
         <div class="w3-row w3-margin">
            <div class="w3-third">
               <img src="${path}/${r.photourl}"
                  style="width: 100%; height: 100%; min-height: 200px; max-height: 200px; max-weight: 300px;">
            </div>
            <div class="w3-twothird w3-container">
               <h2>
                  <a href="roomdetail.jeju?hno=${r.hno}&name=${r.name}" style="color:black;">${r.name}</a>
               </h2>
               <span style="text-align: right;"><a href="javascript:win_delete(${r.hno},'${r.name}')" alt="">삭제하기</a> <i class="fa fa-long-arrow-right"></i></span>
               <h4 style="color: green; padding-left:5%">편의시설</h4> <span style="padding-left:8%">- ${r.convenient}</span>
               <h4 style="color: green; padding-left:5%">침대</h4> <span style="padding-left:8%">${r.bed}&nbsp;/&nbsp;${r.bedcount}개</span>
               <p><fmt:formatNumber value="${r.price}" pattern="###,###"/></p>
            </div>
         </div>
      </c:forEach>
      <div id="map" style="width: 100%; height: 400px;"></div>
   </div>
</body>
</html>