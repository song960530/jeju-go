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
<form:form modelAttribute="board" action="cswrite.jeju" name="f" onsubmit="return boardchk(this)">
<input type="hidden" name="type" value="${param.type}">
	<div class="container">
	    <div class="row">
	        <div class="recent">
	          <h2 class="widgetheading" style="text-align: center;">공지사항 작성</h2>
	        </div>
	        <div class="form-group">
	            <input type="hidden" class="form-control" name="userid" value="${login.userid}" readonly/>
	            <div class="validation"></div>
	        </div>
	        <div class="form-group">
	            <input type="text" name="subject" class="form-control" placeholder="제목"/>
	            <div class="validation"></div>
	        </div>
	        <div class="form-group">
	        	<div>
		            <textarea name="content" class="form-control" placeholder="내용" style="width:100%; height:500px"></textarea>
		            <div class="validation"></div>
	        	</div>
	        </div>
	        <br>
	        <div style="text-align:center">
				<button type="submit" class="btn btn-primary">게시글 등록</button>
			</div>
		</div>
	</div>
</form:form>
</body>
</html>