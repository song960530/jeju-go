<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%--/webapp/WEB-INF/view/alert.jsp --%>
<script>
	alert("${msg}");
	if(${msg == '숙소가 성공적으로 삭제되었습니다.' || msg=='방이 성공적으로 삭제되었습니다.'}){
		opener.location.reload();
		window.close();
	}
	location.href="${url}";
</script>