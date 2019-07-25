<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>MyPage</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto">
<link href="https://fonts.googleapis.com/css?family=Sunflower:300&display=swap" rel="stylesheet">
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
		document.csboard.notpageNum.value = page;
		document.csboard.submit();
	}
	function qnalistcall(page) {
		document.csboard.qnapageNum.value = page;
		document.csboard.submit();
	}
</script>
<style type="text/css">
.select {
	padding: 3px;
	background-color: #0000ff;
}

.select>a {
	text-decoration: none;
	font-weight: bold;
	color: #ffffff;
}

table {
	border-collapse: collapse;
	width: 100%;
}

tr:nth-child(even) {
	background-color: #f2f2f2
}

tr:nth-child(odd) {
	background-color: white;
}

th {
	background-color: #56A9E8;
	color: white;
	text-align: center;
}
</style>
</head>
<body>
	<div class="container">
		<div>
			<!-- <div style="margin-left: 5%; margin-right: 5%; width: 90%;"> -->
			<button class="btn-primarys">
				<h2 class="widgetheading w3-center" style="font-family: 'Sunflower', sans-serif;"><b>고객센터</b></h2>
			</button>
				<!-- <tr>
					<td id="tab1" class="tab"><a href="javascript:disp_div('minfo','tab1')">공지사항</a></td>
					<td id="tab2" class="tab"><a href="javascript:disp_div('oinfo', 'tab2')">QnA</a></td>
				</tr> -->
				<ul class="nav nav-tabs">
					<li class="nav-item"><a class="nav-link active"
						data-toggle="tab" href="javascript:disp_div('minfo', 'tab2')">공지사항</a></li>
					<li class="nav-item"><a class="nav-link" data-toggle="tab"
						href="javascript:disp_div('oinfo','tab1')">Q&A</a></li>
				</ul>
				<!-- <div class="w3-bar w3-blue">
					<button class="w3-bar-item w3-button"
						onclick="javascript:disp_div('minfo','tab1')">공지사항</button>
					<button class="w3-bar-item w3-button"
						onclick="javascript:disp_div('oinfo', 'tab2')">Q&A</button>
				</div> -->
			<form action="csboard.jeju" method="post" name="csboard">
				<input type="hidden" name="notpageNum" value="1"> <input
					type="hidden" name="qnapageNum" value="1">
				<div id="minfo" class="info" style="width: 100%;">
				<h2 class="widgetheading w3-center" style="font-family: 'Sunflower', sans-serif;">공지사항</h2>
					<table class="w3-center">
						<c:if test="${noticecount > 0}">
							<tr style="color: black;">
								<th>번호</th>
								<th>제목</th>
								<th>작성자</th>
								<th>작성날짜</th>
							</tr>
							<c:forEach items="${noticelist}" var="board">
								<tr>
									<td>${notboardno}</td>
									<c:set var="notboardno" value="${notboardno - 1}" />
									<td style="text-align: left"><a
										href="../board/csdetail.jeju?no=${board.no}&type=${board.type}&type2=${board.type2}">${board.subject}</a></td>
									<td>${board.userid}</td>
									<td><fmt:formatDate var="rdate" value="${board.regdate}"
											pattern="yyyyMMdd" /> <c:if test="${today == rdate}">
											<fmt:formatDate value="${board.regdate}" pattern="HH:mm:ss" />
										</c:if> <c:if test="${today != rdate}">
											<fmt:formatDate value="${board.regdate}"
												pattern="yy-MM-dd HH:mm" />
										</c:if></td>
								</tr>
							</c:forEach>
							<tr>
								<td colspan="5"><c:if test="${notpageNum > 1}">
										<a href="javascript:notlistcall(${notpageNum - 1})">[이전]</a>
									</c:if> <c:if test="${notpageNum <= 1}">[이전]</c:if> <c:forEach var="a"
										begin="${notstartpage}" end="${notendpage}">
										<c:if test="${a == notpageNum}">[${a}]</c:if>
										<c:if test="${a != notpageNum}">
											<a href="javascript:notlistcall(${a})">[${a}]</a>
										</c:if>
									</c:forEach> <c:if test="${notpageNum < notmaxpage}">
										<a href="javascript:notlistcall(${notpageNum + 1})">[다음]</a>
									</c:if> <c:if test="${notpageNum >= notmaxpage}">[다음]</c:if></td>
							</tr>
						</c:if>
					</table>
				</div>
				<!-- Q&A 부분 -->
				<div id="oinfo" class="info">
				<h2 class="widgetheading w3-center" style="font-family: 'Sunflower', sans-serif;">Q&A</h2>
					<table class="w3-center">
						<c:if test="${qnacount > 0}">
							<tr>
								<th>번호</th>
								<th>제목</th>
								<th>작성자</th>
								<th>날짜</th>
							</tr>
							<c:forEach items="${qnalist}" var="board">
								<tr>
									<td>${qnaboardno}</td>
									<c:set var="qnaboardno" value="${qnaboardno - 1}" />
									<td style="text-align: left"><a
										href="../board/csdetail.jeju?no=${board.no}&type=${board.type}&type2=${board.type2}">${board.subject}</a></td>
									<td>${board.userid}</td>
									<td><fmt:formatDate var="rdate" value="${board.regdate}"
											pattern="yyyyMMdd" /> <c:if test="${today == rdate}">
											<fmt:formatDate value="${board.regdate}" pattern="HH:mm:ss" />
										</c:if> <c:if test="${today != rdate}">
											<fmt:formatDate value="${board.regdate}"
												pattern="yy-MM-dd HH:mm" />
										</c:if></td>
								</tr>
							</c:forEach>
							<tr>
								<td colspan="5"><c:if test="${qnapageNum > 1}">
										<a href="javascript:qnalistcall(${qnapageNum - 1})">[이전]</a>
									</c:if> <c:if test="${qnapageNum <= 1}">[이전]</c:if> <c:forEach var="a"
										begin="${qnastartpage}" end="${qnaendpage}">
										<c:if test="${a == qnapageNum}">[${a}]</c:if>
										<c:if test="${a != qnapageNum}">
											<a href="javascript:qnalistcall(${a})">[${a}]</a>
										</c:if>
									</c:forEach> <c:if test="${qnapageNum < qnamaxpage}">
										<a href="javascript:qnalistcall(${qnapageNum + 1})">[다음]</a>
									</c:if> <c:if test="${qnapageNum >= qnamaxpage}">[다음]</c:if></td>
							</tr>
						</c:if>
						<c:if test="${qnacount == 0}">
							<tr>
								<td colspan="5">등록된 게시물이 없습니다.</td>
							</tr>
						</c:if>
					</table>
					<c:if test="${login.userid == 'admin'}">
						<!-- <tr>
						<td colspan="5" align="right"><a href="cswrite.jeju?type=2">[글쓰기]</a>
						</td>
					</tr> -->
						<p style="float: right;">
							<input type="button"
								onclick="location.href='../board/cswrite.jeju?type=2'"
								class="btn btn-primary" value="답변하기">
						</p>
					</c:if>
					<c:if test="${login.userid != 'admin'}">
						<!-- <tr>
						<td colspan="5" align="right"><a href="qnawrite.jeju?type=3">[문의하기]</a>
						</td>
					</tr> -->
						<p style="float: right;">
							<input type="button"
								onclick="location.href='../board/qnawrite.jeju?type=3'"
								class="btn btn-primary" value="문의하기">
						</p>
					</c:if>
				</div>
				<c:if test="${login.userid == 'admin'}">
					<p style="float: right;">
						<input type="button"
							onclick="location.href='../board/cswrite.jeju?type=1'"
							class="btn btn-primary" value="글쓰기">
					</p>
				</c:if>
			</form>
		</div>
	</div>
</body>
</html>