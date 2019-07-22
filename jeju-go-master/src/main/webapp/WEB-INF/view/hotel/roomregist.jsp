<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>숙소 등록 페이지</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>
<body>
<div class="container">
    <div class="row">
        <div class="recent">
          <h2 class="widgetheading" style="text-align: center;">Room Regist</h2>
        </div>
        <div id="sendmessage">등록완료</div>
        <div id="errormessage"></div>
        <form name="registerform" method="post" action="roomregister.jeju" enctype="multipart/form-data" onsubmit="return inputchk(this)">
          <input type="hidden" name="hno" value="${no}">
          <div class="form-group">
          	<h5 class="widgetheading">사진</h5><input multiple="multiple" type="file" name="photoname">
            <div class="validation"></div>
          </div><br>
          <div class="form-group">
          <h5 class="widgetheading">방 종류
			<p><input type="radio" name="name" value="더블룸"> 더블룸
      		<input type="radio" name="name" value="디럭스"> 디럭스
      		<input type="radio" name="name" value="트윈룸"> 트윈룸
      		<input type="radio" name="name" value="스위트"> 스위트</p></h5>
            <div class="validation"></div>
          </div>
          <div class="form-group">
			 <h5 class="widgetheading">호수<p><input type="text" class="form-control" name="roomnum" style="width: 300px"></p></h5>
            <div class="validation"></div>
          </div>
          <div class="form-group">
			<h5 class="widgetheading">가격<p><input type="text" class="form-control" name="price" style="width: 300px"></p></h5>
            <div class="validation"></div>
          </div>
          <div class="form-group">
					<h5 class="widgetheading">제한 인원 수
					<p><select name="max">
						<c:forEach begin="1" end="10" var="i">
							<option value="${i}">${i}명</option>
						</c:forEach>
					</select></p></h5>
			<div class="validation"></div>
          </div>
          <div class="form-group">
					<h5 class="widgetheading">침대 종류 / 개수
					<p><select name="bed">
						<option value="싱글">싱글</option>
						<option value="트윈">트윈</option>
						<option value="더블">더블</option>
					</select>&nbsp; <select name="bedcount">
						<c:forEach begin="1" end="10" var="i">
							<option value="${i}">${i}개</option>
						</c:forEach>
					</select></h5>
					<div class="validation"></div>
          </div>
          <div class="form-group">
          	 <h5 class="widgetheading">편의 용품
          	 <p><input type="checkbox" name="convenient" value="엘레베이터">  엘레베이터
		     <input type="checkbox" name="convenient" value="wi-fi">  wi-fi
		     <input type="checkbox" name="convenient" value="주방시설">  주방시설
		     <input type="checkbox" name="convenient" value="주차장">  주차장
		     <input type="checkbox" name="convenient" value="세탁기">  세탁기
		     <input type="checkbox" name="convenient" value="비품류">  비품류
		     <input type="checkbox" name="convenient" value="TV">  TV
		     <input type="checkbox" name="convenient" value="에어컨">  에어컨
		     <input type="checkbox" name="convenient" value="냉장고">  냉장고
		     <input type="checkbox" name="convenient" value="스파">  스파</p></h5>
          <div class="validation"></div>
          </div>
          <br>
          <button type="submit" class="btn btn-default" style="align-content: center;">등록</button>
        </form>
      </div>
</div>
</body>
</html>