<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���� ��� ������</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>
<body>
<div class="container">
    <div class="row">
        <div class="recent">
          <h2 class="widgetheading" style="text-align: center;">Room Regist</h2>
        </div>
        <div id="sendmessage">��ϿϷ�</div>
        <div id="errormessage"></div>
        <form name="registerform" method="post" action="roomregister.jeju" enctype="multipart/form-data" onsubmit="return inputchk(this)">
          <input type="hidden" name="hno" value="${no}">
          <div class="form-group">
          	<h5 class="widgetheading">����</h5><input multiple="multiple" type="file" name="photoname">
            <div class="validation"></div>
          </div><br>
          <div class="form-group">
          <h5 class="widgetheading">�� ����
			<p><input type="radio" name="name" value="�����"> �����
      		<input type="radio" name="name" value="�𷰽�"> �𷰽�
      		<input type="radio" name="name" value="Ʈ����"> Ʈ����
      		<input type="radio" name="name" value="����Ʈ"> ����Ʈ</p></h5>
            <div class="validation"></div>
          </div>
          <div class="form-group">
			 <h5 class="widgetheading">ȣ��<p><input type="text" class="form-control" name="roomnum" style="width: 300px"></p></h5>
            <div class="validation"></div>
          </div>
          <div class="form-group">
			<h5 class="widgetheading">����<p><input type="text" class="form-control" name="price" style="width: 300px"></p></h5>
            <div class="validation"></div>
          </div>
          <div class="form-group">
					<h5 class="widgetheading">���� �ο� ��
					<p><select name="max">
						<c:forEach begin="1" end="10" var="i">
							<option value="${i}">${i}��</option>
						</c:forEach>
					</select></p></h5>
			<div class="validation"></div>
          </div>
          <div class="form-group">
					<h5 class="widgetheading">ħ�� ���� / ����
					<p><select name="bed">
						<option value="�̱�">�̱�</option>
						<option value="Ʈ��">Ʈ��</option>
						<option value="����">����</option>
					</select>&nbsp; <select name="bedcount">
						<c:forEach begin="1" end="10" var="i">
							<option value="${i}">${i}��</option>
						</c:forEach>
					</select></h5>
					<div class="validation"></div>
          </div>
          <div class="form-group">
          	 <h5 class="widgetheading">���� ��ǰ
          	 <p><input type="checkbox" name="convenient" value="����������">  ����������
		     <input type="checkbox" name="convenient" value="wi-fi">  wi-fi
		     <input type="checkbox" name="convenient" value="�ֹ�ü�">  �ֹ�ü�
		     <input type="checkbox" name="convenient" value="������">  ������
		     <input type="checkbox" name="convenient" value="��Ź��">  ��Ź��
		     <input type="checkbox" name="convenient" value="��ǰ��">  ��ǰ��
		     <input type="checkbox" name="convenient" value="TV">  TV
		     <input type="checkbox" name="convenient" value="������">  ������
		     <input type="checkbox" name="convenient" value="�����">  �����
		     <input type="checkbox" name="convenient" value="����">  ����</p></h5>
          <div class="validation"></div>
          </div>
          <br>
          <button type="submit" class="btn btn-default" style="align-content: center;">���</button>
        </form>
      </div>
</div>
</body>
</html>