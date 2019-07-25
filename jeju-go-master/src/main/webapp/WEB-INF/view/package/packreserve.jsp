<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<fmt:formatNumber value="${pack.price}" var="price" pattern="#,###.###"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<div class="col-md-4 w3-right" style="max-width:350px; margin-right:2%; margin-top:2%;">
        <div class="panel panel-default">
          <div class="panel-heading">
            <strong>���� �˻�</strong>
          </div>
          <div class="panel-body w3-center">
            <div class="media">
              <div class="media-body" style="width:390px;;">
              <form method="post" action="packreservechk.jeju" name="sf" onsubmit="return chksearch(this)">
              <input type="hidden" name="no" value="${pack.no}">
              <input type="hidden" name="name" value="${pack.name}">
			<div class="">
				<label><i class="fa fa-calendar-o"></i>��������</label><br>
				<font size="3">����Ⱓ : ${pack.travelday }��</font><br>
				<c:forEach items="${start}" var="start">
					<input type="radio" name="startday" value="${start}">${start}�� ���<br>
				</c:forEach>
			</div>
			<br>
			<div class="">
				<label><i class="fa fa-male"></i> Adults</label>
				<select name="people">
					<c:forEach begin="1" end="${pack.max}" var="i">
						<option value="${i}">${i}��</option>
					</c:forEach>
				</select> 
			</div>
			<br>
			<div class="">
				<label><i class="fa fa-search"></i> Search</label>
			</div>
			<br>
			<div class="">
				<c:if test="${count!=0 }">
					<input type="submit" class="w3-button w3-block w3-blue"style="height:54px;" value="�����ϱ�">
				</c:if>
				<c:if test="${count==0 }">
					<input type="button" class="w3-button w3-block w3-red"style="height:54px;opacity: 0.7;cursor: not-allowed;" value="���� �Ұ�">
				</c:if>
			</div>
		</form>
                <div class="ficon">
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="w3-content">
	<table style="margin:auto;">
		<tr>
			<td rowspan="2" width="60%" ><img alt="" src="${path}/${pack.photourl}" width="600px" height="400px"></td>
			<td style="font-size:30px; height:50px" align="center" valign="top">��ǰ�̸� : ${pack.name}</td>
		</tr>
		<tr>
			<td style="font-size:20px;" align="left" valign="top">
				<font color="red" size="5">��ǰ���� : ${price}��</font><br><br>
					${pack.mon}�� ���� <br>
				<c:forEach items="${start}" var="start">
					��� : ${start}�� ~ ���� : ${start + 7}��<br>
				</c:forEach><br>
				<font color="blue" size="5">!!�� ����Ⱓ : ${pack.travelday}��</font><br><br>
			</td>
		</tr>
	</table>
	</div>
</body>
</html>