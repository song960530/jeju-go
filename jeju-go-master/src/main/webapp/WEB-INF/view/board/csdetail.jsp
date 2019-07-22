<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
function delchk(){
    if(confirm("삭제하시겠습니까?")){
        document.f.submit();
        return true;
    } else {
        return false;
    }
}
</script>
<style type="text/css">
body {
color:black;}
</style>
</head>
<body>
<form action="csdetail.jeju" method="post" name="f"></form>
<input type="hidden" name="no" value="${board.no}">
<div class="container">
	    <div class="row">
	        <div class="recent">
	          <h2 class="widgetheading" style="text-align: center;">Detail</h2>
	        </div>
	        <div class="form-group">
				제목<input type="text" name="subject" class="form-control" value="${board.subject}" readonly/>
	            <div class="validation"></div>
	        </div>
	        <div class="form-group">
				내용<input type="text" name="content" class="form-control" value="${board.content}" readonly/>
	            <div class="validation"></div>
	        </div>
	        <div style="text-align:center">
				<a href="javascript:history.go(-1)">[게시글 목록]</a>
				<a href="csupdate.jeju?no=${board.no}">[수정]</a>
				<a href="javascript:delchk()">[삭제]</a> 
			</div>
		</div>
	</div>
</body>
</html>