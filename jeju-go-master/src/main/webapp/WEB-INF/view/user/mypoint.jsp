<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto">
<style>
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
	function listcall(page) {
	    document.reservationmanagement.pageNum.value = page;
	    document.reservationmanagement.submit();
	 }
</script>
<title>예약 목록</title>
</head>
<body>
<form name="reservationmanagement">
<input type="hidden" name="pageNum" value="1">
<input type="hidden" name="userid" value="${login.userid }">
<div class="container">
		<div>
			<span class="w3-center"><h2 class="widgetheading">포인트 내역</h2></span>
			<span class="w3-right"><b style="font-size:20px;">내 포인트 : <fmt:formatNumber value="${mypointsum}" pattern="###,###"/>pt</b></span>
			<table>
			<c:if test="${count > 0}">
				<tr class="w3-center" style="color: black;">
					<th>번호</th>
     				<th>아이디</th>
     				<th>포인트</th>
     				<th>날짜</th>
     				<th>타입</th>
				</tr>
				<c:forEach items="${list}" var="point">
					<tr style="color: black;">
						<td>${pointno}</td>
					  	<c:set var="pointno" value="${pointno - 1}"/>
         				<td style="text-align:left">
            				${point.userid}
            			</td>
             			<td>
             				<fmt:formatNumber value="${point.point}" pattern="###,###"/>pt
             			</td>
             			<td>
           					<fmt:formatDate var="rdate" value="${point.regdate}" pattern="yyyyMMdd"/>
                  			<c:if test="${today == rdate}">
                        		<fmt:formatDate value="${point.regdate}" pattern="HH:mm:ss"/>
                  			</c:if>
                  			<c:if test="${today != rdate}">
                     			<fmt:formatDate value="${point.regdate}" pattern="yy-MM-dd HH:mm"/>
                  			</c:if>
           				</td>
           				<td>
           					<c:if test="${point.type == '적립'}">
           						<font color="blue">${point.type}</font>
           					</c:if>
           					<c:if test="${point.type == '사용'}">
           						<font color="red">${point.type}</font>
           					</c:if>
           					<c:if test="${point.type == '회수'}">
           						<font color="green">${point.type}</font>
           					</c:if>
           				</td>
        			</tr>
     			</c:forEach>
     			<tr>
    				<td colspan="5" class="w3-center">
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
	  				<tr>
	  					<td colspan="5" style="text-align:center">포인트 내역이 없습니다.</td>
	  				</tr>
				</c:if>
			</table>
		</div>
	</div>
</form>
</body>
</html>  