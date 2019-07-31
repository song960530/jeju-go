<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto">
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
   tr:nth-child(even){background-color: white}
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
   table {
    width: 100%;
    border-bottom:1px solid #444444;
  }
</style>
<title>패키지 상세보기</title>
</head>
<body>
<form action="packdelete.jeju" method="post" name="pd">
<input type="hidden" name="no" value="${pack.no}">
<input type="hidden" name="userid" value="${param.userid}">
   <div class="container">
      <h2 class="widgetheading" style="text-align: center;">패키지 상세</h2>
      <table class="w3-center" style="color: black;">
         <tr style="color: black;">
            <td style="text-align:left" rowspan="2" width="30%">
               <img alt="" src="${path}/${pack.photourl}" width="400px" height="300px">
                 </td>
                 <td colspan="2" valign="top"><font size="6%" style="font-weight:bolder">${pack.name} [${pack.mon}월]</font><br><br>
                    &nbsp;&nbsp;&nbsp;&nbsp;<font size="3%">여행기간 - 6박 ${pack.travelday}일</font><br><br>
                    &nbsp;&nbsp;&nbsp;&nbsp;<font size="3%">여행출발 -
                    <c:forEach items="${pack.startday}" var="start">
                       ${start}일&nbsp;
                    </c:forEach></font><br><br>
                    &nbsp;&nbsp;&nbsp;&nbsp;<font size="3%">최대 인원 - ${pack.max}명</font>
                 </td>
              </tr>
              <tr>
               <td height="30%">
                    <font size="5%" style="font-weight:bolder">
                       가격 : 
                      <fmt:formatNumber value="${pack.price}" pattern="###,###" />원 ~ 
                      <fmt:formatNumber value="${pack.price * pack.max}" pattern="###,###" />원
                   </font>
               </td>
               <td>
               &nbsp;&nbsp;<a href="../package/packreserve.jeju?no=${pack.no}&userid=${login.userid}">[예약하러가기]</a>
            <c:if test="${login.userid == 'admin' }">
               <a href="javascript:packdelchk1()" class="btn btn-primary">패키지 삭제</a>
            </c:if>
            </td>
             </tr>
      </table>
      <table style="border:0px">
         <tr>
            <td>
               <font>${pack.content}</font>
            </td>
         </tr>   
      </table>
   </div>
</form>
</body>
</html> 