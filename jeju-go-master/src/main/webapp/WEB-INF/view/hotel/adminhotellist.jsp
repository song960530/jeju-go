<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȣ�� ����Ʈ</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Lato">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=zjlzvjn41f"></script>
<style>
a {
	color: black;
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

function win_delete(no) {
	var date = new Date(); 
	date = getFormatDate(date);
	var op = "width=600, height=193, left=500, top=250";
	open("deleteForm.jeju?hno="+no+"&today="+date, "", op);
}
</script>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="recent">
				<button class="btn-primarys"
					style="margin-left: 45%; margin-right: 45%;">
					<h3 class="w3-center">Hotel List</h3>
				</button>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="">
			<div class="">
				<div class="panel panel-default" style="width: 100%;">
					<c:forEach items="${list}" var="hotel">
						<hr style="width: 99%; border: solid 1px black;">
						<div class="panel-body">
							<div class="media" style="max-height: 200px;">
								<div class="media-left"
									style="width: 30%; height: 200px; box-sizing: border-box;">
									<img src="${path}/${hotel.photourl}"
										style="width: 100%; height: 100%;" alt="">
								</div>
								<div class="media-body"
									style="box-sizing: border-box; max-height: 150px;">
									<h4 class="media-heading">
										<a href="hoteldetail.jeju?no=${hotel.no}"><b>${hotel.hname}</b></a>
									</h4>
									<div style="max-height:100px; overflow:auto;">
									${hotel.content}
									</div>
									<div class="ficon">
										<a href="javascript:win_delete(${hotel.no})" alt="">�����ϱ�</a> <i class="fa fa-long-arrow-right"></i>
										<br> <a href="roomregist.jeju?no=${hotel.no}" alt="">�� ����ϱ�
											</a> <i class="fa fa-long-arrow-right"></i>
										<br> <a href="roomdeleteForm.jeju?no=${hotel.no}" alt="">�� �����ϱ�
											</a> <i class="fa fa-long-arrow-right"></i>
										<br> <a href="hreserveform.jeju?hno=${hotel.no}" alt="">����
											���� �� ����ϱ�</a> <i class="fa fa-long-arrow-right"></i>
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
</body>
</html>