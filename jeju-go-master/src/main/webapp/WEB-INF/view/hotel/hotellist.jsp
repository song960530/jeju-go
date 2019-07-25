<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>호텔 리스트</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="//css.skyscnr.com/sttc/hotels-website/hotels-website//static/css/main.e29e5cd7.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Lato">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link
	href="https://cdn.datahc.com/Styles/StyleSheet.ashx?key=Homepage&cdn=1.0.2019.204001-Cba67369227c2b38a3428f1d50a94ca8576c452d0"
	rel="stylesheet" type="text/css" />
<script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=zjlzvjn41f"></script>
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
</style>
<script type="text/javascript">
	var lat = [];
	var lng = [];
	var hname = [];
</script>
</head>
<body>
	<div class="container"
		style="margin-left: 5%; margin-right: 5%; width: 90%;">
		<div class="row">
			<div class="recent">
				<button class="btn-primarys"
					style="margin-left: 45%; margin-right: 45%;">
					<h3 class="w3-center">Hotel List</h3>
				</button>
			</div>
		</div>
	</div>
	<div class="container"
		style="margin-left: 5%; margin-right: 5%; width: 90%;">
		<div class="left">
		<fieldset>
			<div class="">
			<div class="ex3">
				<div class="SearchResultsDisplay_SearchResultsDisplay__card__2-jVd">
				<c:forEach items="${list}" var="hotel">
					<a href="hoteldetail.jeju?no=${hotel.no}" class="BpkCard_bpk-card__287qD CardLayout_CardLayout__x65BH">
					<div class="CardLayout_CardLayout__colLeft__1YR5c">
							<div class="CardImage_CardImage__3uGof HotelCard_HotelCard__img__j5ZIV">
								<picture>
								<img src="${path}/${hotel.photourl}" style="width: 100%; height: 100%;" alt="">
								</picture>
							</div>
						</div>
						<div class="CardLayout_CardLayout__colRight__1_bJA">
							<div class="CardLayout_CardLayout__colRightRowTop__2x9Et">
								<div class="CardLayout_CardLayout__colRightRowTopColLeft__1OwZD">
									<div class="CardLayout_CardLayout__nameAndStarsContainer__1l7OY">
										<div class="CardLayout_CardLayout__name__3PlSj">
											<div class="HotelCard_HotelCard__name__2jTNm"
												data-test-id="hotel-name">${hotel.hname}</div>
										</div>
									</div>
									<div>
										<div class="CardLayout_CardLayout__scoreMobile__1s2wf">
											<span
												class="BpkText_bpk-text__WdiWu BpkText_bpk-text--sm__1-aIF CardScore_CardScore__2Gv9K CardScore_CardScore--rating_very_good__3WgpZ">8.5</span>
										</div>
										<!-- 별점 처리 부분 -->
										<!-- <div class="CardLayout_CardLayout__starsAndRating__37sFL">
											<div class="CardLayout_CardLayout__starsAndRatingItem__1SbzL">
												<div aria-label="4성급"
													class="BpkStarRating_bpk-star-rating__2hyc2">
													<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"
														width="18" height="18"
														class="BpkStar_bpk-star__25SLX BpkStar_bpk-star--filled__hAnAp BpkIcon_bpk-icon--rtl-support__2Qefw"
														style="width: 1.125rem; height: 1.125rem;">
														<path
															d="M17.349 14.762l3.535-4.415a.528.528 0 0 0-.26-.838L15.35 8.131l-2.915-4.887a.484.484 0 0 0-.841 0l-2.881 4.83-5.337 1.394a.528.528 0 0 0-.26.839L6.61 14.67l-.383 5.748a.5.5 0 0 0 .68.518l5.04-3.172 5.1 3.198a.5.5 0 0 0 .68-.518z"></path></svg>
													<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"
														width="18" height="18"
														class="BpkStar_bpk-star__25SLX BpkStar_bpk-star--filled__hAnAp BpkIcon_bpk-icon--rtl-support__2Qefw"
														style="width: 1.125rem; height: 1.125rem;">
														<path
															d="M17.349 14.762l3.535-4.415a.528.528 0 0 0-.26-.838L15.35 8.131l-2.915-4.887a.484.484 0 0 0-.841 0l-2.881 4.83-5.337 1.394a.528.528 0 0 0-.26.839L6.61 14.67l-.383 5.748a.5.5 0 0 0 .68.518l5.04-3.172 5.1 3.198a.5.5 0 0 0 .68-.518z"></path></svg>
													<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"
														width="18" height="18"
														class="BpkStar_bpk-star__25SLX BpkStar_bpk-star--filled__hAnAp BpkIcon_bpk-icon--rtl-support__2Qefw"
														style="width: 1.125rem; height: 1.125rem;">
														<path
															d="M17.349 14.762l3.535-4.415a.528.528 0 0 0-.26-.838L15.35 8.131l-2.915-4.887a.484.484 0 0 0-.841 0l-2.881 4.83-5.337 1.394a.528.528 0 0 0-.26.839L6.61 14.67l-.383 5.748a.5.5 0 0 0 .68.518l5.04-3.172 5.1 3.198a.5.5 0 0 0 .68-.518z"></path></svg>
													<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"
														width="18" height="18"
														class="BpkStar_bpk-star__25SLX BpkStar_bpk-star--filled__hAnAp BpkIcon_bpk-icon--rtl-support__2Qefw"
														style="width: 1.125rem; height: 1.125rem;">
														<path
															d="M17.349 14.762l3.535-4.415a.528.528 0 0 0-.26-.838L15.35 8.131l-2.915-4.887a.484.484 0 0 0-.841 0l-2.881 4.83-5.337 1.394a.528.528 0 0 0-.26.839L6.61 14.67l-.383 5.748a.5.5 0 0 0 .68.518l5.04-3.172 5.1 3.198a.5.5 0 0 0 .68-.518z"></path></svg>
												</div>
											</div>
											<div class="CardLayout_CardLayout__starsAndRatingItem__1SbzL">
												<span
													class="BpkText_bpk-text__WdiWu BpkText_bpk-text--sm__1-aIF CardScore_CardScore__2Gv9K CardScore_CardScore--rating_very_good__3WgpZ">8.5</span>
											</div>
										</div> -->
									</div>
								</div>
							</div>
							<div class="CardLayout_CardLayout__colRightRowBottom__3eZwK">
								<div
									class="CardLayout_CardLayout__colRightRowBottomColLeft__1_D_8">
									<div
										class="CardLayout__colRightRowBottomColLeftRowTop CardLayout_CardLayout__smallTabletViewport__2eLXs">
										<div class="HotelCard_HotelCard__amenities__pBAgr">
											<div
												class="CardAmenity_CardAmenity__WJ2tj HotelCard_HotelCard__amenity__1qPk-">
												<span
													class="BpkText_bpk-text__WdiWu BpkText_bpk-text--sm__1-aIF CardAmenity_CardAmenity__txt__ZbFB7">${hotel.room.convenient}</span>
											</div>
										</div>
									</div>
								</div>
								<script type="text/javascript">
									input(${hotel.lat}, ${hotel.lng})
									function input(location1, location2) {
										lat.push(location1)
										lng.push(location2)
									}
								</script>
								<div
									class="CardLayout_CardLayout__colRightRowBottomColRight__RWwIj">
									<div class="HotelCard_HotelCard__price__pZRWW"><br><br><!-- 싯가  --></div>
									<div class="CardLayout_CardLayout__mediumLargeViewport__1r4P7">
										<div class="HotelCard_HotelCard__cta__1n4MC">
											<button type="button" class="BpkButton_bpk-button__2Jd0U">
												세부정보 보기&nbsp;
												<span
													style="line-height: 1.125rem; display: inline-block; margin-top: 0.1875rem; vertical-align: top;"><svg
														xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"
														width="18" height="18"
														class="BpkIcon_bpk-icon--rtl-support__2Qefw"
														style="width: 1.125rem; height: 1.125rem;">
														<path
															d="M14.4 19.5l5.7-5.3c.4-.4.7-.9.8-1.5.1-.3.1-.5.1-.7s0-.4-.1-.6c-.1-.6-.4-1.1-.8-1.5l-5.7-5.3c-.8-.8-2.1-.7-2.8.1-.8.8-.7 2.1.1 2.8l2.7 2.5H5c-1.1 0-2 .9-2 2s.9 2 2 2h9.4l-2.7 2.5c-.5.4-.7 1-.7 1.5s.2 1 .5 1.4c.8.8 2.1.8 2.9.1z"></path></svg></span>
											</button>
										</div>
									</div>
								</div>
							</div>
						</div>
						</a>
						<br>
						</c:forEach>
				</div>
				</div>
				<%-- <div class="panel panel-default" style="width: 100%;">
					<div class="ex3">
						<c:forEach items="${list}" var="hotel">
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
											<p>
												<a href="hoteldetail.jeju?no=${hotel.no}" alt="">보러가기</a> <i
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
				</div> --%>
			</div>
			</fieldset>
		</div>
		<div class="right">
			<div id="map" style="width: 100%; height: 1000px;"></div>
		</div>
	</div>
	<script>
		var HOME_PATH = window.HOME_PATH || '.';

		var map = new naver.maps.Map('map', {
			center : new naver.maps.LatLng(33.381355, 126.546380),
			zoom : 6,
			zoomControl : true, // 줌 컨트롤 표시 (기본값 표시안함)
			zoomControlOptions : { // 줌 컨트롤 오른쪽 위로 위치 설정
				position : naver.maps.Position.TOP_RIGHT // 오른쪽 위로 설정값
			},
			mapTypeControl : true, // 일반ㆍ위성 지도보기 컨트롤 표시 (기본값 표시안함)
		});

		var markers = [], infoWindows = [];

		for (var i = 0; i < lat.length; i++) {
			var position = new naver.maps.LatLng(lat[i], lng[i]);

			var marker = new naver.maps.Marker({
				map : map,
				position : position,
				title : name[i],
				icon : {
					url : HOME_PATH + '/img/pin_default.png',
					anchor : new naver.maps.Point(12, 37),
					origin : new naver.maps.Point(0, 0)
				},
				zIndex : 100
			});
			var contents = '호텔소개'

			var infoWindow = new naver.maps.InfoWindow({
				content : contents
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

			if (marker.setMap())
				return;
			marker.setMap(map);
		}

		function hideMarker(map, marker) {

			if (!marker.setMap())
				return;
			marker.setMap(null);
		}

		// 해당 마커의 인덱스를 seq라는 클로저 변수로 저장하는 이벤트 핸들러를 반환합니다.
		function getClickHandler(seq) {
			return function(e) {
				var marker = markers[seq], infoWindow = infoWindows[seq];

				if (infoWindow.getMap()) {
					infoWindow.close();
				} else {
					infoWindow.open(map, marker);
				}
			}
		}

		for (var i = 0, ii = markers.length; i < ii; i++) {
			naver.maps.Event.addListener(markers[i], 'click',
					getClickHandler(i));
		}
	</script>
</body>
</html>