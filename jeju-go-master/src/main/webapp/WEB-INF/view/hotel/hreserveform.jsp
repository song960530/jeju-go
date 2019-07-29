<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>예약 방 등록</title>
<style type="text/css">
body {
	color: black;
}
</style>
</head>
<body>
	<div class="container">

		<div class="">
			<div class="">
				<div class="panel panel-default" style="width: 100%;">
					<c:forEach items="${room}" var="room">
						<hr style="width: 99%; border: solid 1px black;">
						<div class="panel-body">
							<div class="media" style="max-height: 200px;">
								<div class="media-body"
									style="box-sizing: border-box; max-height: 150px;">
									<h4 class="media-heading">
										<b>${room.name}</b>
									</h4>
									<form action="yesroom.jeju" method="post" name="yf">
									<input type="hidden" name="hno" value="${room.hno}">
									<input type="hidden" name="name" value="${room.name}">
									<input type="hidden" name="max" value="${room.max}">
									<select style="color: black" name="roomnum">
										<c:forEach items="${room.roomnums}" var="r">
											<option value="${r}">${r }호</option>
										</c:forEach>
									</select>
									<input type="date" name="startday" style="color:black;">
									&nbsp;~&nbsp;
									<input type="date" name="endday" style="color:black;">
									<div class="ficon">
										&nbsp;&nbsp;<button type="submit" class="btn btn-default" style="align-content: center;">등록</button>
										<i class="fa fa-long-arrow-right"></i>
									</div>
									</form>
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