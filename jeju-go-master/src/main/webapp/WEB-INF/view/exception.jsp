<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" isErrorPage="true"%>
<!-- 
	isErrorPage="true" : exception ��ü�� ����
	exceptio ��ü : exception.CartEmptyException ��ü
 -->    
<script>
	alert("${exception.message}");
	location.href="${exception.url}"
</script>