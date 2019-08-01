<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>호텔 등록 페이지</title>
<script type="text/javascript" src="http://cdn.ckeditor.com/4.5.7/full/ckeditor.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=zjlzvjn41f"></script>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=zjlzvjn41f&submodules=geocoder"></script>
<script>
	function inputchk(f){
		if(f.hname.value==""){
			alert("숙소명을 확인해주세요.")
			f.hname.focus();
			return false;
		}
		if(f.tel1.value==""||f.tel2.value==""||f.tel3.value==""){
			alert("전화번호를 확인해주세요")
			f.tel1.focus();
			return false;
		}
		if(f.location1.value==""||f.location2.value==""){
			alert("위도/경도를 확인해주세요")
			f.location1.focus();
			return false;
		}
		if(f.photoname.value==""){
			alert("사진은 필수입니다.")
			return false;
		}
		return true;
	}
</script>
<style type="text/css">
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
</style>
</head>
<body>
	<div class="container" style="margin-left: 5%; margin-right: 5%; width: 90%;">
	<div class="container">
        <div class="recent">
          <h2 class="widgetheading" style="text-align: center;">Hotel Regist</h2>
        </div>
        <div id="sendmessage">Your message has been sent. Thank you!</div>
        <div id="errormessage"></div>
        <form name="registerform" method="post" action="register.jeju" enctype="multipart/form-data" onsubmit="return inputchk(this)">
          <div class="form-group">
           <!--  <input type="text" name="name" class="form-control" id="name" placeholder="Your Name" data-rule="minlen:4" data-msg="Please enter at least 4 chars" /> -->
            <input type="text" name="hname" class="form-control" placeholder="숙소 명"/>
            <div class="validation"></div>
          </div>
          <div class="form-group">
           <!--  <input type="email" class="form-control" name="email" id="email" placeholder="Your Email" data-rule="email" data-msg="Please enter a valid email" /> -->
	            <input type="text" class="form-control" name="tel1" placeholder="전화번호 앞자리">-<input type="text" class="form-control" name="tel2" placeholder="전화번호 가운데자리"/>-<input type="text" class="form-control" name="tel3" placeholder="전화번호 뒷자리"/>
            <div class="validation"></div>
          </div>
          <div id="map" style="margin:0 auto; width:1000px; max-width:100%; height:650px;"></div>
          <div class="form-group">
<!--             <input type="text" class="form-control" name="subject" id="subject" placeholder="Subject" data-rule="minlen:4" data-msg="Please enter at least 8 chars of subject" /> -->
           	<input type="text" name="lat" class="form-control" placeholder="위도"/>
            <div class="validation"></div>
          </div>
          <div class="form-group">
<!--             <input type="text" class="form-control" name="subject" id="subject" placeholder="Subject" data-rule="minlen:4" data-msg="Please enter at least 8 chars of subject" /> -->
           	<input type="text" class="form-control" name="lng" placeholder="경도"/>
            <div class="validation"></div>
          </div>
          <div class="form-group">
          	<input type="text" class="form-control" name="address" placeholder="주소"/>
            <div class="validation"></div>
          </div>
          <br>
          <div class="form-group">
          	<h5 class="widgetheading">숙소 소개</h5>
            <textarea class="form-control" name="contents" rows="5" placeholder="숙소 소개"></textarea><script>CKEDITOR.replace("contents")</script>
            <div class="validation"></div>
          </div>
          <br>
          <div class="form-group">
          <h5 class="widgetheading">사진</h5><input multiple="multiple" type="file" name="photoname">
          <div class="validation"></div>
          </div>
          <br>
          <button type="submit" class="btn btn-default" value="숙소등록">숙소등록</button>
        </form>
     </div>
</div>
<script>
var position = new naver.maps.LatLng(33.381355, 126.546380)
var map = new naver.maps.Map('map', { // naverMap 값은 div 의 id 값
	center : position, 
	zoom : 6, 
	zoomControl : true, // 줌 컨트롤 표시 (기본값 표시안함)
	zoomControlOptions : { // 줌 컨트롤 오른쪽 위로 위치 설정
		position : naver.maps.Position.TOP_RIGHT // 오른쪽 위로 설정값
	},
	mapTypeControl : true, // 일반ㆍ위성 지도보기 컨트롤 표시 (기본값 표시안함)
});

naver.maps.Event.addListener(map, 'click', function(e){
	// 제이쿼리 사용
	$('[name=lat]').val( e.coord.lat() ); // 위도
	$('[name=lng]').val( e.coord.lng() ); // 경도
});

var infoWindow = new naver.maps.InfoWindow({
    anchorSkew: true
});

map.setCursor('pointer');

function searchCoordinateToAddress(latlng) {
	infoWindow.close();
	naver.maps.Service.reverseGeocode({
		coords : latlng,
		orders : [ naver.maps.Service.OrderType.ADDR,naver.maps.Service.OrderType.ROAD_ADDR ].join(',')
	},
	function(status, response) {
		if (status === naver.maps.Service.Status.ERROR) {
			return alert('Something Wrong!');
		}
		var items = response.v2.results, address = '', htmlAddresses = [];
		for (var i = 0, ii = items.length, item, addrType; i < ii; i++) {
			item = items[i];
			address = makeAddress(item) || '';
			htmlAddresses.push(address);
		}
		infoWindow.setContent(
				'<div style="padding:10px;width:100%;color:#000000">'
				+'<h4>주소</h4>' + htmlAddresses[0]
				+'</div>'
		);
		infoWindow.open(map, latlng);
		$('[name=address]').val( htmlAddresses[0] );
	});
}
function initGeocoder() {
	map.addListener('click', function(e) {
		searchCoordinateToAddress(e.coord);
	});

	$('#address').on('keydown', function(e) {
		var keyCode = e.which;

		if (keyCode === 13) { // Enter Key
			searchAddressToCoordinate($('#address').val());
		}
	});

	$('#submit').on('click', function(e) {
		e.preventDefault();

		searchAddressToCoordinate($('#address').val());
	});
}

	
function makeAddress(item) {
	if (!item) {
		return;
	}

	var name = item.name, region = item.region, land = item.land, isRoadAddress = name === 'roadaddr';

	var sido = '', sigugun = '', dongmyun = '', ri = '', rest = '';

	if (hasArea(region.area1)) {
		sido = region.area1.name;
	}

	if (hasArea(region.area2)) {
		sigugun = region.area2.name;
	}

	if (hasArea(region.area3)) {
		dongmyun = region.area3.name;
	}

	if (hasArea(region.area4)) {
		ri = region.area4.name;
	}

	if (land) {
		if (hasData(land.number1)) {
			if (hasData(land.type) && land.type === '2') {
				rest += '산';
			}

			rest += land.number1;

			if (hasData(land.number2)) {
				rest += ('-' + land.number2);
			}
		}

		if (isRoadAddress === true) {
			if (checkLastString(dongmyun, '면')) {
				ri = land.name;
			} else {
				dongmyun = land.name;
				ri = '';
			}

			if (hasAddition(land.addition0)) {
				rest += ' ' + land.addition0.value;
			}
		}
	}

	return [ sido, sigugun, dongmyun, ri, rest ].join(' ');
}

function hasArea(area) {
	return !!(area && area.name && area.name !== '');
}

function hasData(data) {
	return !!(data && data !== '');
}

function checkLastString(word, lastString) {
	return new RegExp(lastString + '$').test(word);
}

function hasAddition(addition) {
	return !!(addition && addition.value);
}

naver.maps.onJSContentLoaded = initGeocoder;
</script>
</body>
</html> 