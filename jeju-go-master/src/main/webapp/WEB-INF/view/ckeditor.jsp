<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>    
<script type='text/javascript'>
	window.parent.CKEDITOR.tools.callFunction
	(${param.CKEditorFuncNum}, '${fileName}', '�̹��� ���ε� �Ϸ�')
</script>;