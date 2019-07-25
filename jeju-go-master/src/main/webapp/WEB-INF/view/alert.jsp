<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%--/webapp/WEB-INF/view/alert.jsp --%>
<script>
if(${msg} != null){
	alert("${msg}");
}
	location.href="${url}";
</script>