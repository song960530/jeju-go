<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%--/webapp/WEB-INF/view/alert.jsp --%>
<script>
	alert("${msg}");
	if(${msg == '���Ұ� ���������� �����Ǿ����ϴ�.' || msg=='���� ���������� �����Ǿ����ϴ�.'}){
		opener.location.reload();
		window.close();
	}
	location.href="${url}";
</script>