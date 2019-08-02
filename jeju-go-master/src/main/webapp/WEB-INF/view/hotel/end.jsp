<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script>
	function setCookie(name, value, expiredays) {
		var todayDate = new Date();
		todayDate.setDate(todayDate.getDate() + expiredays);
		document.cookie = name + "=" + escape(value) + "; path=/; expires="
				+ todayDate.toGMTString() + ";"
	}
	function closeWin() {
		if (document.notice_form.chkbox.checked) {
			setCookie("maindiv", "done", 1);
		}
		document.all['divpop'].style.visibility = "hidden";
	}
</script>
</head>
<body>
<div class="container">
	<div id="divpop"
		style="position: absolute; left: 395px; top: 190px; z-index: 200; visibility: hidden;">
		<table width=300 height=400 cellpadding=2 cellspacing=0>
			<tr>
				<td style="border: 1px #666666 solid" height=360 align=center 
					bgcolor=white target="_blank" ><a  href="http://192.168.0.167:8080/4four/board/realmain.deco" target="_blank"><img src="${path}/img/popup.jpg" height="100%" width="100%"/></a></td>
			</tr>
			<tr>
				<form name="notice_form">
					<td align=right bgcolor=white><input type="checkbox"
						name="chkbox" value="checkbox">오늘 하루 이 창을 열지 않음 <a
						href="javascript:closeWin();"><B>[닫기]</B></a></td>
			</tr>
			</form>
		</table>
	</div>
	
	<div style="min-height:300px;">
	<br><br>
			<div class="w3-center"><h2 class="widgetheading">결제 신청이 완료되었습니다.</h2></div>
			<div class="w3-center">
				<h3>
					입금 계좌
						<br><br>
						예금주 : <b style="color:blue;">JeJuGo</b>
						<br><br>
					<div>
					<span class="tx">은행: 
							<b style="color:blue;">하나은행</b>
					</span>	<br><br>
					
								<div class="dis">
									<span class="tx">계좌번호: 
											<b style="color:blue;">123-456789-123</b> 
									</span>
									<br><br>
									<p class="tx">금액: 
											<b style="color:blue;" id="totalprice3"><fmt:formatNumber value="${param.total}" pattern="###,###"/>원</b>
									</p>
									
									<input type="button" class="btn btn-primary" onclick="location.href='../user/main.jeju'" value="확인">
								</div>
					</div>
				</h3>
			</div>
			
	</div>
	<script language="Javascript">
		cookiedata = document.cookie;
		if (cookiedata.indexOf("maindiv=done") < 0) {
			document.all['divpop'].style.visibility = "visible";
		} else {
			document.all['divpop'].style.visibility = "hidden";
		}
	</script>
	</div>
</body>
</html>