<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>  
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>MyPage</title>
<script type="text/javascript">
	function listcall(page) {
		document.qnalist.pageNum.value=page;
		document.qnalist.submit();
	}
</script>
</head>
<body>
<form action="qnalist.jeju" method="post" name="qnalist">
<input type="hidden" name="pageNum" value="1">
<input type="hidden" name="userid" value="${param.userid}">
<select name="type2">
	<option value="">��ü</option>
	<option value="1">Ż��</option>
	<option value="2">����</option>
	<option value="3">����</option>
</select> 
<input type="submit" name="search" value="�̵�">
</form>
	<table>
	<c:if test="${count > 0}">
		<tr><td>�۰��� : ${count}</td></tr>
		<tr><th>��ȣ</th><th>����</th><th>�ۼ���</th><th>��¥</th></tr>
		<c:forEach items="${list}" var="board">
			<tr><td>${boardno}</td>
				<c:set var="boardno" value="${boardno - 1}"/>
				<c:if test="${empty param.type2}">
				<td style="text-align:left">
					<a href="../board/csdetail.jeju?no=${board.no}&type=${board.type}&type2=${board.type2}">[��ü]${board.subject}</a></td>
				</c:if>
				<c:if test="${param.type2 == '1'}">
				<td style="text-align:left">
					<a href="../board/csdetail.jeju?no=${board.no}&type=${board.type}&type2=${board.type2}">[Ż��]${board.subject}</a></td>
				</c:if>
				<c:if test="${param.type2 == '2'}">
				<td style="text-align:left">
					<a href="../board/csdetail.jeju?no=${board.no}&type=${board.type}&type2=${board.type2}">[����]${board.subject}</a></td>
				</c:if>
				<c:if test="${param.type2 == '3'}">
				<td style="text-align:left">
					<a href="../board/csdetail.jeju?no=${board.no}&type=${board.type}&type2=${board.type2}">[����]${board.subject}</a></td>
				</c:if>
				<td>${board.userid}</td>
				<td><fmt:formatDate var="rdate" value="${board.regdate}" pattern="yyyyMMdd"/>
	                 <c:if test="${today == rdate}">
		                 	<fmt:formatDate value="${board.regdate}" pattern="HH:mm:ss"/>
	                 </c:if>
	                 <c:if test="${today != rdate}">
	                 	<fmt:formatDate value="${board.regdate}" pattern="yy-MM-dd HH:mm"/>
	                 </c:if>
				</td>
			</tr>
		</c:forEach>
		<tr><td colspan="5">
			<c:if test="${pageNum > 1}">
				<a href="javascript:listcall(${pageNum - 1})">[����]</a>
			</c:if>
			<c:if test="${pageNum <= 1}">[����]</c:if>
			<c:forEach var="a" begin="${startpage}" end="${endpage}">
				<c:if test="${a == pageNum}">[${a}]</c:if>
				<c:if test="${a != pageNum}">
					<a href="javascript:listcall(${a})">[${a}]</a>
				</c:if>
			</c:forEach>
			<c:if test="${pageNum < maxpage}">
				<a href="javascript:listcall(${pageNum + 1})">[����]</a>
			</c:if>
			<c:if test="${pageNum >= maxpage}">[����]</c:if>
			</td>
		</tr>
	</c:if>
	<c:if test="${count == 0}">
		<tr><td colspan="5">��ϵ� ���Ǳ��� �����ϴ�.</td></tr>
	</c:if>
	<c:if test="${login.userid == 'admin'}">
	<tr>
		<td colspan="5" align="right">
			<a href="cswrite.jeju?type=1">[�۾���]</a>
		</td>
	</tr>
	</c:if>
	</table>
</body>
</html>