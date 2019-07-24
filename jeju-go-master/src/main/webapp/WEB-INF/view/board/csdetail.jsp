<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
function delchk1(){
    if(confirm("삭제하시겠습니까?")){
        document.f1.submit();
    } else {
        return false;
    }
}
function delchk2(){
    if(confirm("삭제하시겠습니까?")){
        document.f2.submit();
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
<div class="container">
    <div class="row">
	    <c:if test="${count > 1}">
	    	<form action="csdelete.jeju" name="f1" method="post">
		    	<input type="hidden" name="no" value="${param.no}">
		    	<input type="hidden" name="count" value="${count}">
		    	<div class="recent">
			          <h2 class="widgetheading" style="text-align: center;">Detail</h2>
		        </div>
		        <div class="form-group">
					제목<input type="text" name="subject" class="form-control" value="${bdetail.subject}" readonly/>
		            <div class="validation"></div>
		        </div>
		        <div class="form-group">
					내용<input type="text" name="content" class="form-control" value="${bdetail.content}" readonly/>
		            <div class="validation"></div>
		        </div>
		        <c:if test="${login.userid == 'admin'}">
		        <div style="text-align:center">
		        	<a href="../admin/qnalist.jeju">[게시글 목록]</a>
					<a href="javascript:delchk1()">[삭제]</a>
				</div>
				<hr/>
				</c:if>
			</form>
			<div class="recent">
		          <h2 class="widgetheading" style="text-align: center;">Reply</h2>
	        </div>
			<div class="form-group">
				제목<input type="text" name="subject" class="form-control" value="${rdetail.subject}" readonly/>
	            <div class="validation"></div>
	        </div>
	        <div class="form-group">
				내용<input type="text" name="content" class="form-control" value="${rdetail.content}" readonly/>
	            <div class="validation"></div>
	        </div>
		</c:if>
	</div>
	
	<div class="row">
    	<c:if test="${count == 1}">
    		<form action="csdelete.jeju" name="f2" method="post">
    		<input type="hidden" name="no" value="${param.no}">
    		<input type="hidden" name="count" value="${count}">
    		<input type="hidden" name="type" value="${param.type}">
    			<div class="recent">
	          		<h2 class="widgetheading" style="text-align: center;">Detail</h2>
		        </div>
		        <div class="form-group">
					제목<input type="text" name="subject" class="form-control" value="${bdetail.subject}" readonly/>
		            <div class="validation"></div>
		        </div>
		        <div class="form-group">
					내용<input type="text" name="content" class="form-control" value="${bdetail.content}" readonly/>
		            <div class="validation"></div>
		        </div>
		        <c:if test="${param.type == 3}">
		        <c:if test="${login.userid == 'admin'}">
		        <div style="text-align:center">
		        	<a href="../admin/qnalist.jeju">[게시글 목록]</a>
					<a href="javascript:delchk2()">[삭제]</a>
				</div>
				</c:if>
				</c:if>
				<c:if test="${login.userid == bdetail.userid}">
		        <div style="text-align:center">
		        	<a href="../admin/qnalist.jeju">[게시글 목록]</a>
					<a href="javascript:delchk2()">[삭제]</a>
				</div>
				</c:if>
				</form>
				<hr/>
				<c:if test="${param.type == 3}">
					<c:if test="${login.userid == 'admin'}">
					<form:form modelAttribute="board" action="qnareply.jeju" method="post" name="f">
						<input type="hidden" name="userid" value="admin">
						<input type="hidden" name="no" value="${param.no}">
						<input type="hidden" name="ref" value="${param.no}">
						<input type="hidden" name="type" value="${param.type}">
						<input type="hidden" name="type2" value="${param.type2}">
						<table>
						<caption>게시판 답글 등록</caption>
							<tr>
								<td><input type="text" name="subject" placeholder="제목을 입력하세요"></td>
							</tr>
							<tr>
								<td><input type="text" name="content" placeholder="내용을 입력하세요"></td>
							</tr>
							<tr><td colspan="2"><input type="submit" value="등록"></td></tr>
						</table>
					</form:form>
					</c:if>
				</c:if>
				<c:if test="${param.type != 3}">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				</c:if>
		</c:if>
	</div>
</div>
</body>
</html>