<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>MyPage</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link href="https://fonts.googleapis.com/css?family=Sunflower:300&display=swap" rel="stylesheet">
<script type="text/javascript">
   function listcall(page) {
      document.qnalist.pageNum.value=page;
      document.qnalist.submit();
   }
</script>
<style>
body,h1,h2,h3,h4,h5,h6,.w3-wide {font-family: "Montserrat", sans-serif;}\
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
  text-align: center;
  padding: 8px;
}
tr:nth-child(even){background-color: #f2f2f2}
tr:nth-child(odd){background-color: white;}
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
</head>
<body>
<div class="container">
<h2 class="widgetheading" style="text-align: center;">1:1 문의 목록</h2>
      <form action="qnalist.jeju" method="post" name="qnalist">
<input type="hidden" name="pageNum" value="1">
<input type="hidden" name="userid" value="${param.userid}">
<select name="type2">
   <option value="">전체</option>
   <option value="1"<c:if test="${param.type2 == 1}">selected="selected"</c:if>>탈퇴</option>
      <option value="2"<c:if test="${param.type2 == 2}">selected="selected"</c:if>>결제</option>
      <option value="3"<c:if test="${param.type2 == 3}">selected="selected"</c:if>>예약</option>
</select> 
<input class="btn btn-primary" type="submit" name="search" value="이동">
</form>
<br>
   <table class="w3-center">
   <c:if test="${count > 0}">
      <tr><th>번호</th><th>제목</th><th>작성자</th><th>날짜</th></tr>
      <c:forEach items="${list}" var="board">
         <c:if test="${board.reflevel == 0}">
         <tr><td>${boardno}</td>
            <c:set var="boardno" value="${boardno - 1}"/>
            <c:if test="${empty param.type2}">
            <td style="text-align:left">
               <a href="${path}/board/csdetail.jeju?no=${board.no}&type=${board.type}&type2=${board.type2}">${board.subject}</a></td>
            </c:if>
            
            <c:if test="${param.type2 == '1'}">
            <td style="text-align:left">
               <a href="${path}/board/csdetail.jeju?no=${board.no}&type=${board.type}&type2=${board.type2}">[탈퇴]${board.subject}</a></td>
            </c:if>
            
            <c:if test="${param.type2 == '2'}">
            <td style="text-align:left">
               <a href="${path}/board/csdetail.jeju?no=${board.no}&type=${board.type}&type2=${board.type2}">[결제]${board.subject}</a></td>
            </c:if>
            
            <c:if test="${param.type2 == '3'}">
            <td style="text-align:left">
               <a href="${path}/board/csdetail.jeju?no=${board.no}&type=${board.type}&type2=${board.type2}">[예약]${board.subject}</a></td>
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
         </c:if>
      </c:forEach>
      <tr class="w3-center"><td colspan="5">
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
   <c:if test="${count == 0}">
      <tr><td colspan="5">등록된 문의글이 없습니다.</td></tr>
   </c:if>
   </table>
</div>
</body>
</html>