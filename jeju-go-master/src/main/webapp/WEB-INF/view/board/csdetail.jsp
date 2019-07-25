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
			          <h2 class="widgetheading" style="text-align: center;">1:1 문의 내용</h2>
		        </div>
		     <%--    <div class="form-group">
					제목<input type="text" name="subject" class="form-control" value="${bdetail.subject}" readonly/>
		            <div class="validation"></div>
		        </div>
		        <div class="form-group">
					내용<input type="text" name="content" class="form-control" value="${bdetail.content}" readonly/>
		            <div class="validation"></div>
		        </div> --%>
					<div style="padding-left: 7%; padding-right: 7%;">
						<div class="w3-card-4" style="width: 100%;">
							<header class="w3-container w3-blue">
								<h2 style="color: white;">${bdetail.subject}</h2>
							</header>
							<p>${bdetail.content}</p>
						</div>
					</div>
					<br>
					<c:if test="${login.userid == 'admin'}">
		        <div style="text-align:center">
		        	<a href="../admin/qnalist.jeju" class="btn btn-primary">게시글 목록</a>
					<a href="javascript:delchk1()" class="btn btn-primary">1:1문의 삭제</a>
				</div>
				<hr/>
				</c:if>
			</form>
			<div class="recent">
		          <h2 class="widgetheading" style="text-align: center;">답변</h2>
	        </div>
			<%-- <div class="form-group">
				제목<input type="text" name="subject" class="form-control" value="${rdetail.subject}" readonly/>
	            <div class="validation"></div>
	        </div>
	        <div class="form-group">
				내용<input type="text" name="content" class="form-control" value="${rdetail.content}" readonly/>
	            <div class="validation"></div>
	        </div> --%>
				<form action="replydelete.jeju" method="post" id="f">
					<input type="hidden" name="ref" value="${param.no}"> <input
						type="hidden" name="reflevel" value="1"> <input
						type="hidden" name="type" value="${param.type}"> <input
						type="hidden" name="type2" value="${param.type2}">
					<div style="padding-left: 7%; padding-right: 7%;">
						<div class="w3-card-4" style="width: 100%;">
							<header class="w3-container w3-blue">
								<h2 style="color: white;">${rdetail.subject}</h2>
							</header>
							<p>"${rdetail.content}</p>
						</div>

						<c:if test="${login.userid == 'admin'}">
							<div style="text-align: center">
								<a href="#" onclick="document.getElementById('f').submit();" class="btn btn-primary">답글삭제</a>
							</div>
							<hr />
						</c:if>
					</div>
				</form>
			</c:if>
	</div>
	
	<div class="row">
    	<c:if test="${count == 1}">
    		<form action="csdelete.jeju" name="f2" method="post">
    		<input type="hidden" name="no" value="${param.no}">
    		<input type="hidden" name="count" value="${count}">
    		<input type="hidden" name="type" value="${param.type}">
    			<div class="recent">
    			<c:if test="${param.type ==1}">
	          		<h2 class="widgetheading" style="text-align: center;">공지사항</h2>
	          	</c:if>	
    			<c:if test="${param.type ==2}">
	          		<h2 class="widgetheading" style="text-align: center;">Q&A</h2>
	          	</c:if>	
    			<c:if test="${param.type ==3}">
	          		<h2 class="widgetheading" style="text-align: center;">1:1문의</h2>
	          	</c:if>	
		        </div>
		      <%--   <div class="form-group">
					제목<input type="text" name="subject" class="form-control" value="${bdetail.subject}" readonly/>
		            <div class="validation"></div>
		        </div>
		        <div class="form-group">
					내용<input type="text" name="content" class="form-control" value="${bdetail.content}" readonly/>
		            <div class="validation"></div>
		        </div> --%>
					<div style="padding-left: 7%; padding-right: 7%;">
						<div class="w3-card-4" style="width: 100%;">
							<header class="w3-container w3-blue">
								<h1 style="color: white;">${bdetail.subject}</h1>
							</header>
							<p>${bdetail.content}</p>
						</div>
					</div>
					<c:if test="${param.type == 3}">
		        <c:if test="${login.userid == 'admin'}">
		        <div style="text-align:center">
		        	<a href="../admin/qnalist.jeju" class="btn btn-primary">게시글 목록</a>
					<a href="javascript:delchk2()" class="btn btn-primary">1:1문의 삭제</a>
				</div>
				</c:if>
				</c:if>
				<c:if test="${param.type == 3}">
				<c:if test="${login.userid == bdetail.userid}">
		        <div style="text-align:center">
		        	<a href="../admin/qnalist.jeju" class="btn btn-primary">게시글 목록</a>
					<a href="javascript:delchk2()" class="btn btn-primary">1:1문의 삭제</a>
				</div>
				</c:if>
				</c:if>
				<c:if test="${param.type == 1 || param.type == 2}">
				<div style="text-align:center">
					<a href="../board/csboard.jeju" class="btn btn-primary">게시글 목록</a>
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
							<div style="padding-left: 7%; padding-right: 7%;">
								<div class="recent" style="width: 100%;">
									<button class="btn-primarys">
										<h3>1:1문의 답글 작성</h3>
									</button>
								</div>
								<div id="errormessage"></div>
								<form action="" method="post" role="form" class="contactForm">
									<div class="form-group">
										<input type="text" name="subject" class="form-control" id="name"
											placeholder="제목을 입력하세요" data-rule="minlen:4"
											data-msg="Please enter at least 4 chars">
										<div class="validation"></div>
									</div>
									<div class="form-group">
										<textarea class="form-control" name="content" rows="5"
											data-rule="required" data-msg="Please write something for us"
											placeholder="내용을 입력하세요"></textarea>
										<div class="validation"></div>
									</div>
									<div class="form-group" style="text-align: center;">
									<button type="submit" class="btn btn-default">답글 등록</button>
									</div>
								</form>
							</div>
							<!-- <table>
						<caption>게시판 답글 등록</caption>
							<tr>
								<td><input type="text" name="subject" placeholder="제목을 입력하세요"></td>
							</tr>
							<tr>
								<td><input type="text" name="content" placeholder="내용을 입력하세요"></td>
							</tr>
							<tr><td colspan="2"><input class="btn btn-primary" type="submit" value="등록"></td></tr>
						</table> -->
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