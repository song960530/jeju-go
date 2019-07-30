<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>패키지 리스트</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="//css.skyscnr.com/sttc/hotels-website/hotels-website//static/css/main.e29e5cd7.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://cdn.datahc.com/Styles/StyleSheet.ashx?key=Homepage&cdn=1.0.2019.204001-Cba67369227c2b38a3428f1d50a94ca8576c452d0" rel="stylesheet" type="text/css" />
</head>
<body>
	<div class="container"
		style="margin-left: 5%; margin-right: 5%; width: 90%;">
		<div class="row">
			<div class="recent">
				<button class="btn-primarys"
					style="margin-left: 45%; margin-right: 45%;">
					<h3 class="w3-center">Package List</h3>
				</button>
			</div>
		</div>
	</div>
	<div class="container" style="margin:auto; width: 50%;">
		<div class="SearchResultsDisplay_SearchResultsDisplay__card__2-jVd">
			<c:forEach items="${packlist}" var="pack">
			<fmt:formatNumber value="${pack.price}" var="price" pattern="#,###.###"/>
				<a href="packdetail.jeju?no=${pack.no}&userid=${login.userid}" class="BpkCard_bpk-card__287qD CardLayout_CardLayout__x65BH">
					<div class="CardLayout_CardLayout__colLeft__1YR5c">
						<div class="CardImage_CardImage__3uGof HotelCard_HotelCard__img__j5ZIV">
							<picture>
								<img src="${path}/${pack.photourl}" style="width: 100%; height: 100%;" alt="">
							</picture>
						</div>
					</div>
					<div class="CardLayout_CardLayout__colRight__1_bJA">
						<div class="CardLayout_CardLayout__colRightRowTop__2x9Et">
							<div class="CardLayout_CardLayout__colRightRowTopColLeft__1OwZD">
								<div class="CardLayout_CardLayout__nameAndStarsContainer__1l7OY">
									<div class="CardLayout_CardLayout__name__3PlSj">
										<div class="HotelCard_HotelCard__name__2jTNm" data-test-id="hotel-name">패키지 명 : ${pack.name}</div>
									</div>
								</div>
								<div class="CardLayout_CardLayout__nameAndStarsContainer__1l7OY">
									<div class="CardLayout_CardLayout__name__3PlSj">
										<div class="HotelCard_HotelCard__name__2jTNm" data-test-id="hotel-name">가격 : ${price}원</div>
									</div>
								</div>
								<div>
									<div class="CardLayout_CardLayout__scoreMobile__1s2wf">
										<span class="BpkText_bpk-text__WdiWu BpkText_bpk-text--sm__1-aIF CardScore_CardScore__2Gv9K CardScore_CardScore--rating_very_good__3WgpZ">8.5</span>
									</div>
								</div>
							</div>
						</div>
						<div class="CardLayout_CardLayout__colRightRowBottom__3eZwK">
							<div class="CardLayout_CardLayout__colRightRowBottomColRight__RWwIj">
								<!-- <div class="HotelCard_HotelCard__price__pZRWW">싯가</div>
								<div class="CardLayout_CardLayout__mediumLargeViewport__1r4P7">
									<div class="HotelCard_HotelCard__cta__1n4MC">
										<button type="button" class="BpkButton_bpk-button__2Jd0U">세부정보 보기&nbsp;
											<span style="line-height: 1.125rem; display: inline-block; margin-top: 0.1875rem; vertical-align: top;">
											<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="18" height="18" class="BpkIcon_bpk-icon--rtl-support__2Qefw" style="width: 1.125rem; height: 1.125rem;">
											<path d="M14.4 19.5l5.7-5.3c.4-.4.7-.9.8-1.5.1-.3.1-.5.1-.7s0-.4-.1-.6c-.1-.6-.4-1.1-.8-1.5l-5.7-5.3c-.8-.8-2.1-.7-2.8.1-.8.8-.7 2.1.1 2.8l2.7 2.5H5c-1.1 0-2 .9-2 2s.9 2 2 2h9.4l-2.7 2.5c-.5.4-.7 1-.7 1.5s.2 1 .5 1.4c.8.8 2.1.8 2.9.1z"></path></svg></span>
										</button>
									</div>
								</div> -->
							</div>
						</div>
					</div>
				</a>
			</c:forEach>
		</div>
	</div>
</body>
</html>