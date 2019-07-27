<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>숙소 상세 페이지</title>
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

var cctvlat = [];
var cctvlng = [];
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
      <c:set value="${hotel}" var="h" />
      <div class="w3-panel">
         <h1 style="font-family: 'Shrikhand', cursive;">
            <p>${h.hname}<a class="w3-right" id="wishck" href="../user/wishList.jeju" style="color: red" ><i class="fa fa-heart-o" aria-hidden="true"></i></a>
            <a class="w3-right" id="wishck" href="../user/wishList.jeju" style="color: red" ><i class="fa fa-heart" aria-hidden="true"></i></a> 
            </p>
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
      <h2 style="font-family: 'Do Hyeon', sans-serif;">
         <p>${h.address}</p>
         <script>input(${h.lat}, ${h.lng})
         function input(location1, location2) {
            lat = location1
            lng = location2
         }</script>
         <c:forEach items="${cctv}" var="c">
         <script>cctv(${c.lat}, ${c.lng})
         function cctv(loc1, loc2) {
        	 cctvlat.push(loc1)
        	 cctvlng.push(loc2)
         }</script>
         </c:forEach>
         <p>${h.content}</p>
         <p>${h.tel}</p>
      </h2>
      <br>
      <hr>
      <br>
      <c:forEach items="${h.room}" var="r">
         <div class="w3-row w3-margin">
            <div class="w3-third">
               <img src="${path}/${r.photourl}"
                  style="width: 100%; height: 100%; max-height: 200px; max-weight: 300px;">
            </div>
            <div class="w3-twothird w3-container">
               <h2>
                  <a href="roomdetail.jeju?hno=${r.hno}&name=${r.name}" style="color:black;">${r.name}</a>
               </h2>
               <p>${r.price}${r.convenient}${r.bed} / ${r.bedcount}개</p>
            </div>
         </div>
      </c:forEach>
      <div id="map" style="width: 100%; height: 400px;"></div>
   </div>
<script>
var markers = [];
var infoWindows = [];
var cctvmarkers = [];

var HOME_PATH = window.HOME_PATH || '.';
var map = new naver.maps.Map('map', {
    center: new naver.maps.LatLng(lat, lng),
    zoom: 11
});

for(var i = 0; i < cctvlat.length; i++) {
	var position = new naver.maps.LatLng(cctvlat[i], cctvlng[i]);
	
	var cctvmarker = new naver.maps.Marker({
	    map: map,
	    position: position,
	    title: name[i],
	    icon: {
	    	url: '../markerimg/marker.png',
	        anchor: new naver.maps.Point(12, 37),
	        origin: new naver.maps.Point(0, 0)
	    },
	    zIndex: 100
	});
	cctvmarkers.push(cctvmarker);
}

var position = new naver.maps.LatLng(lat, lng);
var marker = new naver.maps.Marker({
    map: map,
    position: position,
    title: name[i],
    icon: {
       url: HOME_PATH +'/img/pin_default.png',
        anchor: new naver.maps.Point(12, 37),
        origin: new naver.maps.Point(0, 0)
    },
    zIndex: 100
});

var contents = '<div><p>aaa</p></div>'
          
var infoWindow = new naver.maps.InfoWindow({
    content:contents
});
markers.push(marker);
infoWindows.push(infoWindow);

naver.maps.Event.addListener(map, 'idle', function() {
    updateMarkers(map, markers);
    cctvupdateMarkers(map, markers);
});

//화면 범위 바깥의 마커를 숨김 
function showMarker(map, marker) {

    if (marker.setMap()) return;
    marker.setMap(map);
}

function hideMarker(map, marker) {

    if (!marker.setMap()) return;
    marker.setMap(null);
}

// 마커 클릭 이벤트
function getClickHandler(seq) {
    return function(e) {
        var marker = markers[seq],
            infoWindow = infoWindows[seq];

        if (infoWindow.getMap()) {
            infoWindow.close();
        } else {
            infoWindow.open(map, marker);
        }
    }
}
for (var i=0, ii=markers.length; i<ii; i++) {
    naver.maps.Event.addListener(markers[i], 'click', getClickHandler(i));
}
// 여기까지

function updateMarkers(map, markers) {

    var mapBounds = map.getBounds();
    var marker, position;

    for (var i = 0; i < markers.length; i++) {

        marker = markers[i]
        position = marker.getPosition();

        if (mapBounds.hasLatLng(position)) {
            showMarker(map, marker);
        } else {
            hideMarker(map, marker);
        }
    }
}
function cctvupdateMarkers(map, cctvmarkers) {

    var mapBounds = map.getBounds();
    var cctvmarker, position;

    for (var i = 0; i < cctvmarkers.length; i++) {

    	cctvmarker = cctvmarkers[i]
        position = cctvmarker.getPosition();

        if (mapBounds.hasLatLng(position)) {
            showMarker(map, cctvmarker);
        } else {
            hideMarker(map, cctvmarker);
        }
    }
}
</script>
</body>
</html>