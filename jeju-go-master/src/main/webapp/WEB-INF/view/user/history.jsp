<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto">
<link href="../css/boardstyle.css" rel="stylesheet">
<script src="../star/js/star.js"></script>
<link href="../css/star.css" rel="stylesheet">
<style>
</style>
<title>ȸ�� ����Ȯ��������</title>
<script>

function chkdate(start){
	var date = new Date();
	today = getFormatDate(date);
	var today = new Date(today)
	var start = new Date(start)
	if(today >= start){
		alert("���۵� ������� ��ҽ�û�� �Ұ����մϴ�.");
		return false;
	}
	return true;
}
function win_reviewForm(no) {
	var date = new Date(); 
	date = getFormatDate(date);
	var op = "width=1100, height=350, left=400, top=250";
	open("reviewForm.jeju?no="+no, "", op);
}
</script>
</head>
<body>
   <div  class="container">
      <div>      
         <button class="btn-primarys">         
            <h2 class="widgetheading" style="text-align: center;">���೻��</h2>
         </button>
           <ul class="nav nav-tabs">
               <li class="nav-item"><a class="nav-link active"
                   href="../user/history.jeju?userid=${login.userid}">����</a></li>
               <li class="nav-item"><a class="nav-link" 
                  href="../user/package.jeju?userid=${login.userid}">��Ű��</a></li>
                </ul>        
         <table>
            <tr class="w3-center" style="color: black;">
               <th>ȣ��</th>
               <th>���ȣ</th>
               <th>������</th>
               <th>üũ��</th>
               <th>üũ�ƿ�</th>
               <th>����ݾ�</th>
               <th>�������Ʈ</th>
               <th>�� �����ݾ�</th>
               <th>��û��</th>
               <th>����</th>
               <th>����</th>
            </tr>
            <c:forEach items="${list}" var="list">
               <tr style="color: black;">
                 <td>
                  <c:if test="${list.hno == 0}">
                    ${list.name}
                  </c:if>
                  <c:if test="${list.hno != 0 }">
                  <a href="../hotel/hoteldetail.jeju?no=${list.hno}">  ${list.hname} - ${list.name} </a>
                  </c:if>
                 </td>
                 <td>${list.roomnum}</td>
                 <td>${list.username}</td>
                 <td>${list.start}</td>
                 <td>${list.end}</td>
                 <td><fmt:formatNumber value="${list.total}" pattern="###,###"/></td>
                 <td><fmt:formatNumber value="${list.point}" pattern="###,###"/></td>
                 <td><fmt:formatNumber value="${list.total - list.point}" pattern="###,###"/></td>
                 <td><fmt:formatDate value="${list.regdate}" pattern="yyyy-MM-dd"/></td>
                 <td>
                    <c:if test="${list.checked=='���δ��'}">
                      <button id="bang-btn" onclick="document.getElementById('selectbang${list.no}').style.display='block'"
                      class="btn btn-success">${list.checked}</button>
                   </c:if>
                    <c:if test="${list.checked=='���οϷ�'}">
                      <button id="bang-btn" onclick="document.getElementById('selectbang${list.no}').style.display='block'"
                      class="btn btn-primary">${list.checked}</button>
                   </c:if>
                    <c:if test="${list.checked=='�������'}">
                      <p id="bang-btn" class="btn btn-danger">${list.checked}</p>
                   </c:if>
                    <c:if test="${list.checked=='��ҽ�û'}">
                      <p id="bang-btn" class="btn btn-warning">${list.checked}</p>
                   </c:if>
                 </td>
                 <td>
                    <c:if test="${list.checked=='���οϷ�'}">
                      <c:if test="${list.pno==0}">
                    	<c:if test="${list.reviewchk !='ok'}">
                      		<button id="bang-btn" onclick="win_reviewForm(${list.no})"
                      		class="btn btn-success">�����ۼ�</button>
                    	</c:if>
                      </c:if>
                    	<c:if test="${list.reviewchk == 'ok'}">
                      		<button id="bang-btn" onclick="#"
                      		class="btn btn-primary">�ۼ��Ϸ�</button>
                    	</c:if>
                   </c:if>
                 </td>
               </tr>
               <div id="selectbang${list.no}" class="w3-modal" style="display: none;">
                  <div class="w3-modal-content w3-animate-zoom w3-padding-large">
                     <div class="w3-container w3-white w3-center">
                        <i onclick="document.getElementById('selectbang${list.no}').style.display='none'"
                           class="fa fa-remove w3-button w3-xlarge w3-right w3-transparent"></i>
                           <div class="w3-center">
	                           <br><br>
	                           <c:if test="${list.checked=='���δ��' }">
	                             <b style="font-size:20px;">������ ����Ͻðڽ��ϱ�?</b>
	                           </c:if>
	                           <c:if test="${list.checked=='���οϷ�' }">
	                             <b style="font-size:20px;">��ǰ ��� ��û�� �Ͻðڽ��ϱ�?</b>
	                           </c:if>
	                           <br><br>
	                           <form action="../hotel/allcancle.jeju" name="df" method="post" onsubmit="return chkdate('${list.start}')">
	                           	 <input type="hidden" name="no" value="${list.no}">
	                           	 <input type="hidden" name="rno" value="${list.rno}">
	                           	 <input type="hidden" name="name" value="${list.name}">
	                           	 <input type="hidden" name="userid" value="${list.userid}">
	                           	 <input type="hidden" name="day" value="${list.day}">
	                             <input type="submit" id="bang-btn" class="btn btn-primary" value="Ȯ��">
	                           </form>
                           </div>
                     </div>
                  </div>
               </div>
            </c:forEach>
         </table>
      </div>
   </div>
</body>
</html>