<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>  
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>MyPage</title>
<script type="text/javascript">
	$(document).ready(function() {
		$("#info").show();
		$("#oinfo").hide();
		$(".saleLine").each(function() {
			$(this).hide();
		})
		$("#tab1").addClass("select"); 
	})
	function disp_div(id, tab) {
		$(".info").each(function() {
			$(this).hide();
		})
		$(".tab").each(function() {
			$(this).removeClass("select");
		})
		$("#" + id).show();
		$("#" + tab).addClass("select");
	}
	function list_disp(id) {
		$("#" + id).toggle();
	}
	function notlistcall(page) {
		document.csboard.notpageNum.value=page;
		document.csboard.submit();
	}
	function qnalistcall(page) {
		document.csboard.qnapageNum.value=page;
		document.csboard.submit();
	}
</script>
<style type="text/css">
	.select {
		padding:3px;
		background-color:#0000ff;
	}
	.select > a {
		text-decoration:none; 
		font-weight:bold;
		color:#ffffff;
	}
	body{
	color:black;}
</style>
</head>
<body>
<table>
	<tr>
		<td id="tab1" class="tab">
			<a href="javascript:disp_div('minfo','tab1')">공지사항</a>
		</td>
		<td id="tab2" class="tab">
			<a href="javascript:disp_div('oinfo', 'tab2')">QnA</a>
		</td>
	</tr>
</table>
<%-- 공지사항 --%>
<%-- type1 --%>
<form action="csboard.jeju" method="post" name="csboard">
<input type="hidden" name="notpageNum" value="1">
<input type="hidden" name="qnapageNum" value="1">
	<div id="minfo" class="info" style="width:100%;">
		<table>
		<c:if test="${noticecount > 0}">
			<tr><td>글개수 : ${noticecount}</td></tr>
			<tr><th>번호</th><th>제목</th><th>작성자</th><th>날짜</th></tr>
			<c:forEach items="${noticelist}" var="board">
				<tr><td>${notboardno}</td>
					<c:set var="notboardno" value="${notboardno - 1}"/>
					<td style="text-align:left">
						<a href="../board/csdetail.jeju?no=${board.no}&type=${board.type}&type2=${board.type2}">${board.subject}</a></td>
					<td>${board.userid}</td>
					<td><fmt:formatDate var="rdate" value="${board.regdate}" pattern="yyyyMMdd"/>
		                 <c:if test="${today == rdate}">
			                 	<fmt:formatDate value="${board.regdate}" pattern="HH:mm:ss"/>
		                 </c:if>
		                 <c:if test="${today != rdate}">
		                 	<fmt:formatDate value="${board.regdate}" pattern="yy-MM-dd HH:mm"/>
		                 </c:if></td>
				</tr>
			</c:forEach>
			<tr><td colspan="5">
				<c:if test="${notpageNum > 1}">
					<a href="javascript:notlistcall(${notpageNum - 1})">[이전]</a>
				</c:if>
				<c:if test="${notpageNum <= 1}">[이전]</c:if>
				<c:forEach var="a" begin="${notstartpage}" end="${notendpage}">
					<c:if test="${a == notpageNum}">[${a}]</c:if>
					<c:if test="${a != notpageNum}">
						<a href="javascript:notlistcall(${a})">[${a}]</a>
					</c:if>
				</c:forEach>
				<c:if test="${notpageNum < notmaxpage}">
					<a href="javascript:notlistcall(${notpageNum + 1})">[다음]</a>
				</c:if>
				<c:if test="${notpageNum >= notmaxpage}">[다음]</c:if>
				</td>
			</tr>
		</c:if>
		<c:if test="${noticecount == 0}">
			<tr><td colspan="5">등록된 게시물이 없습니다.</td></tr>
		</c:if>
		<c:if test="${login.userid == 'admin'}">
		<tr>
			<td colspan="5" align="right">
				<a href="cswrite.jeju?type=1">[글쓰기]</a>
			</td>
		</tr>
		</c:if>
		</table>
	</div>
	<%-- QnA --%>
	<%-- type2 --%>
	<div id="oinfo" class="info">
		<table>
		<c:if test="${qnacount > 0}">
			<tr><td>글개수 : ${qnacount}</td></tr>
			<tr><th>번호</th><th>제목</th><th>작성자</th><th>날짜</th></tr>
			<c:forEach items="${qnalist}" var="board">
				<tr><td>${qnaboardno}</td>
					<c:set var="qnaboardno" value="${qnaboardno - 1}"/>
					<td style="text-align:left">
						<a href="csdetail.jeju?no=${board.no}">${board.subject}</a></td>
					<td>${board.userid}</td>
					<td><fmt:formatDate var="rdate" value="${board.regdate}" pattern="yyyyMMdd"/>
		                 <c:if test="${today == rdate}">
			                 	<fmt:formatDate value="${board.regdate}" pattern="HH:mm:ss"/>
		                 </c:if>
		                 <c:if test="${today != rdate}">
		                 	<fmt:formatDate value="${board.regdate}" pattern="yy-MM-dd HH:mm"/>
		                 </c:if></td>
				</tr>
			</c:forEach>
			<tr><td colspan="5">
				<c:if test="${qnapageNum > 1}">
					<a href="javascript:qnalistcall(${qnapageNum - 1})">[이전]</a>
				</c:if>
				<c:if test="${qnapageNum <= 1}">[이전]</c:if>
				<c:forEach var="a" begin="${qnastartpage}" end="${qnaendpage}">
					<c:if test="${a == qnapageNum}">[${a}]</c:if>
					<c:if test="${a != qnapageNum}">
						<a href="javascript:qnalistcall(${a})">[${a}]</a>
					</c:if>
				</c:forEach>
				<c:if test="${qnapageNum < qnamaxpage}">
					<a href="javascript:qnalistcall(${qnapageNum + 1})">[다음]</a>
				</c:if>
				<c:if test="${qnapageNum >= qnamaxpage}">[다음]</c:if>
				</td>
			</tr>
		</c:if>
		<c:if test="${qnacount == 0}">
			<tr><td colspan="5">등록된 게시물이 없습니다.</td></tr>
		</c:if>
		<c:if test="${login.userid == 'admin'}">
		<tr>
			<td colspan="5" align="right">
				<a href="cswrite.jeju?type=2">[글쓰기]</a>
			</td>
		</tr>
		</c:if>
		<c:if test="${login.userid != 'admin'}">
		<tr>
			<td colspan="5" align="right">
				<a href="qnawrite.jeju?type=3">[문의하기]</a>
			</td>
		</tr>
		</c:if>
		
		
		</table>
	</div><br>
</form>
</body>
</html>