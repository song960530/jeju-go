<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȣ�� ��� ������</title>
<script type="text/javascript" src="http://cdn.ckeditor.com/4.5.7/full/ckeditor.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	function inputchk(f){
		if(f.hname.value==""){
			alert("���Ҹ��� Ȯ�����ּ���.")
			f.hname.focus();
			return false;
		}
		if(f.tel1.value==""||f.tel2.value==""||f.tel3.value==""){
			alert("��ȭ��ȣ�� Ȯ�����ּ���")
			f.tel1.focus();
			return false;
		}
		if(f.photoname.value==""){
			alert("������ �ʼ��Դϴ�.")
			return false;
		}
		return true;
	}
</script>
</head>
<body>
	<div class="container" style="margin-left: 5%; margin-right: 5%; width: 90%;">
		<div class="container">
	        <div class="recent">
				<h2 class="widgetheading" style="text-align: center;">Package Regist</h2>
	        </div>
	        <div id="sendmessage">Your message has been sent. Thank you!</div>
	        <div id="errormessage"></div>
			<form name="f" method="post" action="packregist.jeju" enctype="multipart/form-data" onsubmit="return inputchk(this)">
          		<div class="form-group">
            		<input type="text" name="name" class="form-control" placeholder="��Ű�� ��"/>
           			<div class="validation"></div>
         		</div>
          		<div class="form-group">
	          		<select name="mon">
						<c:forEach begin="1" end="12" var="i">
							<option value="${i}">${i}��</option>
						</c:forEach>
					</select>
					<select name="startday">
						<c:forEach begin="1" end="31" var="i">
							<option value="${i}">${i}��</option>
						</c:forEach>
					</select>
	            	<div class="validation"></div>
          		</div>
          		<div class="form-group">
            		<input type="text" class="form-control" name="travelday" placeholder="�����ϼ�">
            		<div class="validation"></div>
          		</div>
          		<div class="form-group">
           			<input type="text" name="price" class="form-control" placeholder="����"/>
           			<div class="validation"></div>
          		</div>
          		<div class="form-group">
           			<input type="text" class="form-control" name="max" placeholder="�ִ� �ο� ��"/>
            		<div class="validation"></div>
         		</div>
          		<div class="form-group">
            		<textarea class="form-control" name="content" rows="5" placeholder="��Ű�� �Ұ�"></textarea><script>CKEDITOR.replace("contents")</script>
           			<div class="validation"></div>
          		</div>
          		<div class="form-group">
        			<h5 class="widgetheading">����</h5><input multiple="multiple" type="file" name="photoname">
          			<div class="validation"></div>
          		</div>
          		<br>
				<button type="submit" class="btn btn-default" value="��Ű�����">��Ű�����</button>
			</form>
		</div>
	</div>
</body>
</html> 