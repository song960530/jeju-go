<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript" src="http://cdn.ckeditor.com/4.5.7/full/ckeditor.js"></script>
<script>
function boardchk(f) {
	if (f.subject.value == "") {
		alert("제목입력 ㄱㄱ");
		return false;
	}
	if (f.content.value == "") {
		alert("내용입력 ㄱㄱ");
		return false;
	}
	return true;
}
</script>
<style type="text/css">
body{
	color:black;
}
</style>
</head>
<body>
<form:form modelAttribute="board" action="csupdate.jeju" name="f" onsubmit="return boardchk(this)">
<input type="hidden" name="type" value="${param.type}">
<input type="hidden" name="no" value="${board.no}">
	<div class="container">
	    <div class="row">
	        <div class="recent">
	          <h2 class="widgetheading" style="text-align: center;">Update</h2>
	        </div>
	        <div class="form-group">
	            <input type="text" name="subject" class="form-control" placeholder="제목"/>
	            <div class="validation"></div>
	        </div>
	        <div class="form-group">
	        	<div>
	            <textarea name="content" class="form-control" placeholder="내용"></textarea>
					<script>
						CKEDITOR.replace("content", {
						filebrowserImageUploadUrl : "imgupload.shop"})
					</script>
				</div>
	            <div class="validation"></div>
	        </div>
	        <div style="text-align:center">
				<button type="submit"
                  class="w3-button w3-padding-large w3-green w3-margin-bottom">[수정완료]</button>
			</div>
		</div>
	</div>
</form:form>
</body>
</html>