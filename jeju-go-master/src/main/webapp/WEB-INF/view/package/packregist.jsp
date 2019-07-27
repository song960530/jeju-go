<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<c:set var="now" value="<%=new java.util.Date()%>" />
<c:set var="sysYear"><fmt:formatDate value="${now}" pattern="yyyy" /></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>호텔 등록 페이지</title>
<script type="text/javascript" src="http://cdn.ckeditor.com/4.5.7/full/ckeditor.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	function inputchk(f){
		if(f.hname.value==""){
			alert("숙소명을 확인해주세요.")
			f.hname.focus();
			return false;
		}
		if(f.tel1.value==""||f.tel2.value==""||f.tel3.value==""){
			alert("전화번호를 확인해주세요")
			f.tel1.focus();
			return false;
		}
		if(f.photoname.value==""){
			alert("사진은 필수입니다.")
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
			<input type="hidden" name="check" value="1">
         		<div class="form-group">
	          		<input type="text" class="form-control" value="${sysYear}년" readonly>
	            	<div class="validation"></div>
          		</div>
          		<div class="form-group">
	          		<select name="mon" style="width:100%">
						<c:forEach begin="1" end="12" var="i">
							<option value="${i}">${i}월</option>
						</c:forEach>
					</select>
	            	<div class="validation"></div>
          		</div>
          		<div class="form-group">
            		출발일<input type="text" class="form-control" name="startday" value="1,7,14,21" readonly>
            		<div class="validation"></div>
          		</div>
          		<div class="form-group">
            		여행일수<input type="text" class="form-control" name="travelday" value="7" readonly>
            		<div class="validation"></div>
          		</div>
          		<div class="form-group">
           			<input type="text" class="form-control" name="max" placeholder="최대 인원 수"/>
            		<div class="validation"></div>
         		</div>
          		<br>
				<button type="submit" class="btn btn-default" value="패키지등록">패키지등록</button>
			</form>
		</div>
	</div>
</body>
</html> 