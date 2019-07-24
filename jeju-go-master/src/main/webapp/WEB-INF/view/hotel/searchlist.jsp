<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>    
	<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>	
<head>
<meta charset="EUC-KR">
<title>호텔 리스트</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=zjlzvjn41f"></script>
<style type="text/css">
div.ex3 {
  background-color: white;
  width: 100%;
  min-height: 1000px;
  max-height: 1000px;
  overflow: auto;
}
div.left {
	width: 40%;
	float: left;
	box-sizing: border-box;
}

div.right {
	width: 59%;
	float: right;
	box-sizing: border-box;
}
body{
color:black;}
</style>
<script type="text/javascript">
   var lat = [];
   var lng = [];
   var hname = [];
</script>
</head>
<body>
	<div class="container" >
		<div class="row">
			<div class="recent">
  		<form method="post" action="../hotel/search.jeju" name="sf" onsubmit="return chksearch(this)">
			<div class="w3-col m3">
				<label><i class="fa fa-calendar-o"></i> Check In</label> <input
					class="w3-input w3-border" type="date"name="start" id="start"value="${startday }">
			</div>
			<div class="w3-col m3">
				<label><i class="fa fa-calendar-o"></i> Check Out</label> <input
					class="w3-input w3-border" type="date"name="end" id="end"value="${endday }">
			</div>
			<div class="w3-col m3">
				<label><i class="fa fa-male"></i> Adults</label> <input
					class="w3-input w3-border" type="number" name="people" value="${people}" style="height:54px;">
			</div>
			<div class="w3-col m3">
				<label><i class="fa fa-search"></i> Search</label>
				<button type="submit" class="w3-button w3-block w3-black"style="height:54px;">Search</button>
			</div>
		</form>
			</div>
		</div>
	</div>
	<div class=""style="margin-left: 5%; margin-right: 5%; width:90%;">
		<div class="left">
			<div class="">
				<div class="panel panel-default" style="width: 100%;">
					<div class="ex3">
						<c:forEach items="${list}" var="hotel" varStatus="i">
							<hr style="width: 99%; border: solid 1px black;">
							<div class="panel-body">
								<div class="media" style="max-height:200px;">
									<div class="media-left" style="width:30%; height:200px; box-sizing: border-box;">
									  <img src="${path}/${hotel.photourl}" style="width: 100%; height: 100%;" alt="">
									 </div>
									<div class="media-body" style="box-sizing: border-box; max-height:150px;">
										<h4 class="media-heading">
											<a href="hoteldetail.jeju?no=${hotel.no}"><b>${hotel.hname}</b></a>
										</h4>
										${hotel.room.convenient}
										<div class="ficon">
										
										최저 : <fmt:formatNumber value="${hotel.minprice}" pattern="###,###"/> ~ 
											<p>
												<a href="searchhoteldetail.jeju?no=${hotel.no}&start=${startday}&end=${endday}&people=${people}">예약하기</a> <i
													class="fa fa-long-arrow-right"></i>
											</p>
										<script>input(${hotel.lat}, ${hotel.lng})
										function input(location1, location2) {
											lat.push(location1)
											lng.push(location2)
										}</script>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
                      <hr style="width: 99%; border: solid 1px black;">
					</div>
				</div>
			</div>
		</div>
		<div class="right">
			<div id="map" style="width: 100%; height: 1000px; margin-top:3%;"></div>
		</div>
	</div>
	<script>
var HOME_PATH = window.HOME_PATH || '.';

var map = new naver.maps.Map('map', {
    center: new naver.maps.LatLng(33.381355, 126.546380),
    zoom: 6,
	zoomControl : true, // 줌 컨트롤 표시 (기본값 표시안함)
	zoomControlOptions : { // 줌 컨트롤 오른쪽 위로 위치 설정
		position : naver.maps.Position.TOP_RIGHT // 오른쪽 위로 설정값
	},
	mapTypeControl : true, // 일반ㆍ위성 지도보기 컨트롤 표시 (기본값 표시안함)
});

var markers = [],
   infoWindows = [];
   
for(var i = 0; i < lat.length; i++) {
    var position = new naver.maps.LatLng(lat[i], lng[i]);

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
    var contents = '호텔소개'
                    
    var infoWindow = new naver.maps.InfoWindow({
        content:contents
    });
    
    markers.push(marker);
    infoWindows.push(infoWindow);
};

naver.maps.Event.addListener(map, 'idle', function() {
    updateMarkers(map, markers);
});

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

function showMarker(map, marker) {

    if (marker.setMap()) return;
    marker.setMap(map);
}

function hideMarker(map, marker) {

    if (!marker.setMap()) return;
    marker.setMap(null);
}

// 해당 마커의 인덱스를 seq라는 클로저 변수로 저장하는 이벤트 핸들러를 반환합니다.
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
 </script>
</body>
</html>