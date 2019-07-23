<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" isErrorPage="true"%>
<!-- 
	isErrorPage="true" : exception °´Ã¼°¡ Àü´Þ
	exceptio °´Ã¼ : exception.CartEmptyException °´Ã¼
 -->    
<script>
	alert("${exception.message}");
	location.href="${exception.url}"
</script>