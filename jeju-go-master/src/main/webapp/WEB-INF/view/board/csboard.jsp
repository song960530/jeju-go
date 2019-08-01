<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto">
<link href="https://fonts.googleapis.com/css?family=Arimo&display=swap" rel="stylesheet">
<style>
   .w3-sidebar a {font-family: "Roboto", sans-serif}
   body,h1,h2,h3,h4,h5,h6,.w3-wide {font-family: "Montserrat", sans-serif;}
   div.left {
      width: 20%;
      float: left;
      box-sizing: border-box;
   }
   div.right {
      width: 70%;
      float: right;
      box-sizing: border-box;
   }
   table {
     border-collapse: collapse;
     width: 100%;
   }
   th, td {
     text-align: left;
     padding: 8px;
   }
   tr:nth-child(even){background-color: #f2f2f2}
   tr:nth-child(odd){background-color: white;}
   th {
     background-color: #56A9E8;
     color: white;
   }
   th {
     background-color: #56A9E8;
     color: white;
   }
   .styled-select {
      background: url(http://i62.tinypic.com/15xvbd5.png) no-repeat 96% 0;
      height: 29px;
      overflow: hidden;
      width: 240px;
   }
   
   .styled-select select {
      background: transparent;
      border: none;
      font-size: 14px;
      height: 29px;
      padding: 5px; /* If you add too much padding here, the options won't show in IE */
      width: 268px;
   }
   
   .styled-select.slate {
      background: url(http://i62.tinypic.com/2e3ybe1.jpg) no-repeat right center;
      height: 34px;
      width: 240px;
   }
   
   .styled-select.slate select {
      border: 1px solid #ccc;
      font-size: 16px;
      height: 34px;
      width: 268px;
   }
   
   /* -------------------- Rounded Corners */
   .rounded {
      -webkit-border-radius: 20px;
      -moz-border-radius: 20px;
      border-radius: 20px;
   }
   
   .semi-square {
      -webkit-border-radius: 5px;
      -moz-border-radius: 5px;
      border-radius: 5px;
   }
   
   /* -------------------- Colors: Background */
   .slate   { background-color: #ddd; }
   .green   { background-color: #779126; }
   .blue    { background-color: #3b8ec2; }
   .yellow  { background-color: #eec111; }
   .black   { background-color: #000; }
   
   /* -------------------- Colors: Text */
   .slate select   { color: #000; }
   .green select   { color: #fff; }
   .blue select    { color: #fff; }
   .yellow select  { color: #000; }
   .black select   { color: #fff; }
   
   
   /* -------------------- Select Box Styles: danielneumann.com Method */
   /* -------------------- Source: http://danielneumann.com/blog/how-to-style-dropdown-with-css-only/ */
   #mainselection select {
      border: 0;
      color: #EEE;
      background: transparent;
      font-size: 20px;
      font-weight: bold;
      padding: 2px 10px;
      width: 378px;
      *width: 350px;
      *background: #58B14C;
      -webkit-appearance: none;
   }
   
   #mainselection {
      overflow:hidden;
      width:350px;
      -moz-border-radius: 9px 9px 9px 9px;
      -webkit-border-radius: 9px 9px 9px 9px;
      border-radius: 9px 9px 9px 9px;
      box-shadow: 1px 1px 11px #330033;
      background: #58B14C url("http://i62.tinypic.com/15xvbd5.png") no-repeat scroll 319px center;
   }
   
   
   /* -------------------- Select Box Styles: stackoverflow.com Method */
   /* -------------------- Source: http://stackoverflow.com/a/5809186 */
   select#soflow, select#soflow-color {
      -webkit-appearance: button;
      -webkit-border-radius: 2px;
      -webkit-box-shadow: 0px 1px 3px rgba(0, 0, 0, 0.1);
      -webkit-padding-end: 20px;
      -webkit-padding-start: 2px;
      -webkit-user-select: none;
      background-image: url(http://i62.tinypic.com/15xvbd5.png), -webkit-linear-gradient(#FAFAFA, #F4F4F4 40%, #E5E5E5);
      background-position: 97% center;
      background-repeat: no-repeat;
      border: 1px solid #AAA;
      color: #555;
      font-size: inherit;
      margin: 20px;
      overflow: hidden;
      padding: 5px 10px;
      text-overflow: ellipsis;
      white-space: nowrap;
      width: 300px;
   }
   
   select#soflow-color {
      color: #fff;
      background-image: url(http://i62.tinypic.com/15xvbd5.png), -webkit-linear-gradient(#779126, #779126 40%, #779126);
      background-color: #779126;
      -webkit-border-radius: 20px;
      -moz-border-radius: 20px;
      border-radius: 20px;
      padding-left: 15px;
   }
</style>
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
<title>예약 목록</title>
</head>
<body>
	<form action="csboard.jeju" method="post" name="csboard">
		<input type="hidden" name="notpageNum" value="1"> 
		<input type="hidden" name="qnapageNum" value="1">
		<div class="container">
      		<div>
      			<div id="minfo" class="info" style="width: 100%;">
        			<h2 class="widgetheading w3-center" style="font-family: 'Sunflower', sans-serif;"><b>공지사항</b></h2>
         			<table class="w3-center" style="color: black;">
				<tr>
               		<ul class="nav nav-tabs">
               			<li class="nav-item">
               				<a class="nav-link active" data-toggle="tab" href="javascript:disp_div('minfo', 'tab2')" style="font-family: 'Arimo', sans-serif;">공지사항</a>
               			</li>
               			<li class="nav-item">
               				<a class="nav-link" data-toggle="tab" href="javascript:disp_div('oinfo','tab1')" style="font-family: 'Arimo', sans-serif;">Q&A</a>
               			</li>
					</ul>
            	</tr>
            	<c:if test="${noticecount > 0}">
            		<tr>
               			<th width="10%" class="w3-center">번호</th>
                 		<th width="40%" class="w3-center">제목</th>
                 		<th width="20%" class="w3-center">작성자</th>
                 		<th width="30%" class="w3-center">날짜</th>
            		</tr>
            		<c:forEach items="${noticelist}" var="board">
               			<tr style="color: black;">
                  			<td class="w3-center">${notboardno}</td>
                    		<c:set var="notboardno" value="${notboardno - 1}"/>
                     		<td style="text-align:center">
								<a href="../board/csdetail.jeju?no=${board.no}&type=${board.type}&type2=${board.type2}">${board.subject}</a>
							</td>
                      		<td class="w3-center">${board.userid}</td>
                      		<td class="w3-center">
                      			<fmt:formatDate var="rdate" value="${board.regdate}" pattern="yyyyMMdd"/> 
                      			<c:if test="${today == rdate}">
									<fmt:formatDate value="${board.regdate}" pattern="HH:mm:ss" />
                              	</c:if>
                              	<c:if test="${today != rdate}">
                                	<fmt:formatDate value="${board.regdate}" pattern="yy-MM-dd HH:mm" />
                              	</c:if>
                        	</td>
                 		</tr>
              		</c:forEach>
              	<tr>
                	<td colspan="4" class="w3-center">
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
				<tr>
					<td colspan="5">등록된 게시글이 없습니다.</td>
				</tr>
			</c:if>
		</table>
		<c:if test="${login.userid == 'admin'}">
			<p style="float: right;">
                  <input type="button" onclick="location.href='../board/cswrite.jeju?type=1'" class="btn btn-primary" value="글쓰기">
            </p>
		</c:if>
      	</div>
      	<div id="oinfo" class="info">
			<h2 class="widgetheading w3-center" style="font-family: 'Sunflower', sans-serif;"><b>Q&A</b></h2>
            	<table class="w3-center">
					<tr>
						<ul class="nav nav-tabs">
	                     	<li class="nav-item">
	                     		<a class="nav-link active" data-toggle="tab" href="javascript:disp_div('minfo', 'tab2')">공지사항</a>
	                     	</li>
	                     	<li class="nav-item">
	                     		<a class="nav-link" data-toggle="tab" href="javascript:disp_div('oinfo','tab1')">Q&A</a>
	                     	</li>
                  		</ul>
                	</tr>
                	<c:if test="${qnacount > 0}">
                		<tr>
                  			<th width="10%" class="w3-center">번호</th>
                    		<th width="40%" class="w3-center">제목</th>
                    		<th width="20%" class="w3-center">작성자</th>
                    		<th width="30%" class="w3-center">날짜</th>
                		</tr>
                     	<c:forEach items="${qnalist}" var="board">
                        	<tr>
                           		<td class="w3-center">${qnaboardno}</td>
                           		<c:set var="qnaboardno" value="${qnaboardno - 1}" />
                           		<td style="text-align: center">
                           			<a href="../board/csdetail.jeju?no=${board.no}&type=${board.type}&type2=${board.type2}">${board.subject}</a>
                           		</td>
                           		<td class="w3-center">${board.userid}</td>
                           		<td class="w3-center">
                           			<fmt:formatDate var="rdate" value="${board.regdate}" pattern="yyyyMMdd" />
                           			<c:if test="${today == rdate}">
										<fmt:formatDate value="${board.regdate}" pattern="HH:mm:ss" />
                              		</c:if>
                              		<c:if test="${today != rdate}">
										<fmt:formatDate value="${board.regdate}" pattern="yy-MM-dd HH:mm" />
                              		</c:if>
                              	</td>
                        	</tr>
                     	</c:forEach>
						<tr>
							<td colspan="4" class="w3-center">
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
                     	<tr>
                        	<td colspan="5">등록된 게시글이 없습니다.</td>
                     	</tr>
                  	</c:if>
               	</table>
               	<c:if test="${login.userid != 'admin'}">
                  	<p style="float: right;">
                     	<input type="button" onclick="location.href='../board/qnawrite.jeju?type=3'" class="btn btn-primary" value="문의하기">
                  	</p>
               	</c:if>
               	<c:if test="${login.userid == 'admin'}">
               		<p style="float: right;">
                  		<input type="button" onclick="location.href='../board/cswrite.jeju?type=2'" class="btn btn-primary" value="글쓰기">
               		</p>
            	</c:if>
			</div>
		</div>
	</div>
</form>
</body>
</html> 