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
	function listcall(page) {
		document.searchform.pageNum.value=page;
		document.searchform.submit();
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
		<c:if test="${user.userId != 'admin'}">
			<td id="tab2" class="tab">
				<a href="javascript:disp_div('oinfo', 'tab2')">QnA</a>
			</td>
		</c:if>
	</tr>
</table>
<%-- 공지사항 --%>
<%-- type1 --%>
<form action="csboard.jeju" method="post">
	<div id="minfo" class="info" style="width:100%;">
	<input type="hidden" name="pageNum" value="1">
		<table>
		<c:if test="${noticecount > 0}">
			<tr><td>글개수 : ${noticecount}</td></tr>
			<tr><th>번호</th><th>제목</th><th>작성자</th><th>날짜</th></tr>
			<c:forEach items="${noticelist}" var="board">
				<tr><td>${boardno}</td>
					<c:set var="boardno" value="${boardno - 1}"/>
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
				<c:if test="${pageNum > 1}">
					<a href="javascript:listcall(${pageNum - 1})">[이전]</a>
				</c:if>
				<c:if test="${pageNum <= 1}">[이전]</c:if>
				<c:forEach var="a" begin="${startpage}" end="${endpage}">
					<c:if test="${a == pageNum}">[${a}]</c:if>
					<c:if test="${a != pageNum}">
						<a href="javascript:listcall(${a})">[${a}]</a>
					</c:if>
				</c:forEach>
				<c:if test="${pageNum < maxpage}">
					<a href="javascript:listcall(${pageNum + 1})">[다음]</a>
				</c:if>
				<c:if test="${pageNum >= maxpage}">[다음]</c:if>
				</td>
			</tr>
		</c:if>
		<c:if test="${listcount == 0}">
			<tr><td colspan="5">등록된 게시물이 없습니다.</td></tr>
		</c:if>
		<tr>
			<td colspan="5" align="right">
				<a href="cswrite.jeju?type=1">[글쓰기]</a>
			</td>
		</tr>
		</table>
	</div>
	<%-- QnA --%>
	<%-- type2 --%>
	<div id="oinfo" class="info">
	<input type="hidden" name="pageNum" value="1">
		<table>
		<c:if test="${qnacount > 0}">
			<tr><td>글개수 : ${qnacount}</td></tr>
			<tr><th>번호</th><th>제목</th><th>작성자</th><th>날짜</th></tr>
			<c:forEach items="${qnalist}" var="board">
				<tr><td>${boardno}</td>
					<c:set var="boardno" value="${boardno - 1}"/>
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
				<c:if test="${pageNum > 1}">
					<a href="javascript:listcall(${pageNum - 1})">[이전]</a>
				</c:if>
				<c:if test="${pageNum <= 1}">[이전]</c:if>
				<c:forEach var="a" begin="${startpage}" end="${endpage}">
					<c:if test="${a == pageNum}">[${a}]</c:if>
					<c:if test="${a != pageNum}">
						<a href="javascript:listcall(${a})">[${a}]</a>
					</c:if>
				</c:forEach>
				<c:if test="${pageNum < maxpage}">
					<a href="javascript:listcall(${pageNum + 1})">[다음]</a>
				</c:if>
				<c:if test="${pageNum >= maxpage}">[다음]</c:if>
				</td>
			</tr>
		</c:if>
		<c:if test="${listcount == 0}">
			<tr><td colspan="5">등록된 게시물이 없습니다.</td></tr>
		</c:if>
		<tr>
			<td colspan="5" align="right">
				<a href="cswrite.jeju?type=2">[글쓰기]</a>
			</td>
		</tr>
		</table>
	</div><br>
</form>
</body>
</html>