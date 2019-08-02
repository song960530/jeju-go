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
	<div id="divpop"
		style="position: absolute; left: 395px; top: 190px; z-index: 200; visibility: hidden;">
		<table width=300 height=400 cellpadding=2 cellspacing=0>
			<tr>
				<td style="border: 1px #666666 solid" height=360 align=center
					bgcolor=white><img src="${path}/img/popup.jpg" height="100%" width="100%" onclick="location.href='192.168.0.167'" /></td>
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
	<script language="Javascript">
		cookiedata = document.cookie;
		if (cookiedata.indexOf("maindiv=done") < 0) {
			document.all['divpop'].style.visibility = "visible";
		} else {
			document.all['divpop'].style.visibility = "hidden";
		}
	</script>
</body>
</html>