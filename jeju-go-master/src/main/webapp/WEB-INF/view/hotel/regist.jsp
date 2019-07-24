<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȣ�� ��� ������</title>
<script type="text/javascript" src="http://cdn.ckeditor.com/4.5.7/full/ckeditor.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=zjlzvjn41f"></script>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=zjlzvjn41f&submodules=geocoder"></script>
<script>
	function inputchk(f){
		if(f.hname.value==""){
			alert("���Ҹ��� Ȯ�����ּ���.")
			f.hname.focus();
			return false;
		}
		if(f.tel1.value==""||f.tel2.value==""||f.tel3.value==""){
			alert("��ȭ��ȣ�� Ȯ�����ּ���")
			f.tel1.focus();
			return false;
		}
		if(f.location1.value==""||f.location2.value==""){
			alert("����/�浵�� Ȯ�����ּ���")
			f.location1.focus();
			return false;
		}
		if(f.photoname.value==""){
			alert("������ �ʼ��Դϴ�.")
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
            <input type="text" name="hname" class="form-control" placeholder="���� ��"/>
            <div class="validation"></div>
          </div>
          <div class="form-group">
           <!--  <input type="email" class="form-control" name="email" id="email" placeholder="Your Email" data-rule="email" data-msg="Please enter a valid email" /> -->
	            <input type="text" class="form-control" name="tel1" placeholder="��ȭ��ȣ ���ڸ�">-<input type="text" class="form-control" name="tel2" placeholder="��ȭ��ȣ ����ڸ�"/>-<input type="text" class="form-control" name="tel3" placeholder="��ȭ��ȣ ���ڸ�"/>
            <div class="validation"></div>
          </div>
          <div id="map" style="margin:0 auto; width:1000px; max-width:100%; height:650px;"></div>
          <div class="form-group">
<!--             <input type="text" class="form-control" name="subject" id="subject" placeholder="Subject" data-rule="minlen:4" data-msg="Please enter at least 8 chars of subject" /> -->
           	<input type="text" name="lat" class="form-control" placeholder="����"/>
            <div class="validation"></div>
          </div>
          <div class="form-group">
<!--             <input type="text" class="form-control" name="subject" id="subject" placeholder="Subject" data-rule="minlen:4" data-msg="Please enter at least 8 chars of subject" /> -->
           	<input type="text" class="form-control" name="lng" placeholder="�浵"/>
            <div class="validation"></div>
          </div>
          <div class="form-group">
          	<input type="text" class="form-control" name="address" placeholder="�ּ�"/>
            <div class="validation"></div>
          </div>
          <br>
          <div class="form-group">
          	<h5 class="widgetheading">���� �Ұ�</h5>
            <textarea class="form-control" name="contents" rows="5" placeholder="���� �Ұ�"></textarea><script>CKEDITOR.replace("contents")</script>
            <div class="validation"></div>
          </div>
          <br>
          <div class="form-group">
          <h5 class="widgetheading">����</h5><input multiple="multiple" type="file" name="photoname">
          <div class="validation"></div>
          </div>
          <br>
          <button type="submit" class="btn btn-default" value="���ҵ��">���ҵ��</button>
        </form>
     </div>
</div>
<script>
var position = new naver.maps.LatLng(33.381355, 126.546380)
var map = new naver.maps.Map('map', { // naverMap ���� div �� id ��
	center : position, 
	zoom : 6, 
	zoomControl : true, // �� ��Ʈ�� ǥ�� (�⺻�� ǥ�þ���)
	zoomControlOptions : { // �� ��Ʈ�� ������ ���� ��ġ ����
		position : naver.maps.Position.TOP_RIGHT // ������ ���� ������
	},
	mapTypeControl : true, // �Ϲݤ����� �������� ��Ʈ�� ǥ�� (�⺻�� ǥ�þ���)
});

naver.maps.Event.addListener(map, 'click', function(e){
	// �������� ���
	$('[name=lat]').val( e.coord.lat() ); // ����
	$('[name=lng]').val( e.coord.lng() ); // �浵
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
				+'<h4>�ּ�</h4>' + htmlAddresses[0]
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
				rest += '��';
			}

			rest += land.number1;

			if (hasData(land.number2)) {
				rest += ('-' + land.number2);
			}
		}

		if (isRoadAddress === true) {
			if (checkLastString(dongmyun, '��')) {
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