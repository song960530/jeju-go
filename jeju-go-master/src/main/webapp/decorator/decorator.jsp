<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%-- /webapp/decorator/decorator.jsp --%>
<%@taglib prefix="decorator"
	uri="http://www.opensymphony.com/sitemesh/decorator"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Jeju Go</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link href="../Arsha/css/bootstrap.min.css" rel="stylesheet">
<link href="../Arsha/css/responsive-slider.css" rel="stylesheet">
<!-- <link rel="stylesheet" href="../Arsha/css/animate.css">
<link rel="stylesheet" href="../Arsha/css/font-awesome.min.css">
<link rel="stylesheet" href="../Arsha/css/magnific-popup.css"> -->
<link href="../Arsha/css/style.css" rel="stylesheet">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link
	href="https://fonts.googleapis.com/css?family=Nanum+Brush+Script&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://fonts.googleapis.com/css?family=Nanum+Pen+Script&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Sunflower:300&display=swap" rel="stylesheet">
<style>
body, h1, h2, h3, h4, h5, h6 {
	font-family: "Raleway", Arial, Helvetica, sans-serif;
	color: black;
}
.mySlides {
	display: none
}
</style>
<script type="text/javascript">
	function search_check(num) {
		if (num == '1') {
			document.getElementById("searchP").style.display = "none";
			document.getElementById("searchI").style.display = "";
		} else {
			document.getElementById("searchI").style.display = "none";
			document.getElementById("searchP").style.display = "";
		}
	}
	
	function getFormatDate(date) {
		var year = date.getFullYear(); //yyyy 
		var month = (1 + date.getMonth()); //M 
		month = month >= 10 ? month : '0' + month; //month
		var day = date.getDate(); //d 
		day = day >= 10 ? day : '0' + day; //day  
		return year + '-' + month + '-' + day;
	}
	function chksearch(f) {
		var date = new Date(); 
		date = getFormatDate(date);
		
		var today = new Date(date)
		var start = new Date(f.start.value)
		var end = new Date(f.end.value)
		
		if(f.start.value=="" || f.end.value==""){
			alert('üũ��/üũ�ƿ� ��¥�� �Է����ּ���');
			return false;
		}
		if(today>start){
			alert('üũ�� ��¥�� Ȯ�����ּ���');
			f.start.focus();
			return false;
		}
		if(f.start.value==f.end.value || start>=end){
			alert('�ּ� 1���̻� ������ �����մϴ�');
			f.end.focus();
			return false;
		}
		if(today>=end){
			alert('üũ�ƿ� ��¥�� Ȯ�����ּ���');
			f.end.focus();
			return false;
		}
		
		if(f.people.value<=0){
			alert('�ο����� Ȯ�����ּ���')
			f.people.focus();
			return false;
		}
		return true;
	}
</script>
</head>
<decorator:head />
<body>
	<!-- Sidebar -->
	<div class="w3-sidebar w3-bar-block w3-animate-left w3-light-grey"
		style="display: none; z-index: 5;" id="mySidebar">
		<button class="w3-bar-item w3-button w3-large" onclick="w3_close()">Close
			&times;</button>
		<a href="#" class="w3-bar-item w3-button"></a>
		<c:if test="${empty sessionScope.login}">
			<button class="w3-button fa fa-home">
				&nbsp;<a href="javascript:void(0)" onclick="document.getElementById('login').style.display='block'"><b>�α����� ���ּ���</b></a>
			</button>
		</c:if>
		<c:if test="${!empty sessionScope.login}">
			<button class="w3-button fa fa-home">
				&nbsp;<b>${sessionScope.login.username}�� �ݰ����ϴ�</b>
			</button>
			<a href="${path}/user/logout.jeju"
				class="w3-bar-item w3-button fa fa-close">&nbsp;�α׾ƿ�</a>
			<a href="#" class="w3-bar-item w3-button"></a>
		</c:if>

		<c:if test="${!empty sessionScope.login}">
         <div class="w3-dropdown-hover">
            <button class="w3-button fa fa-male">
               &nbsp;&nbsp;���������� <i class="fa fa-caret-down"></i>
            </button>
            <div class="w3-dropdown-content w3-bar-block">
             <c:if test="${sessionScope.login.userid!='admin'}">
               <a href="${path}/user/mypage.jeju?userid=${login.userid}"
                  class="w3-bar-item w3-button">���� ����</a> <a href="${path}/user/updatepw.jeju"
                  class="w3-bar-item w3-button">��й�ȣ ����</a> <a href="../user/mypoint.jeju?userid=${login.userid}"
                  class="w3-bar-item w3-button">����Ʈ</a> <a href="${path}/user/history.jeju?userid=${login.userid}"
                  class="w3-bar-item w3-button">���� ����</a> <a href="${path}/user/wishList.jeju?userid=${login.userid}"
                  class="w3-bar-item w3-button">��</a> <a href="${path}/board/qnalist.jeju?userid=${login.userid}"
                  class="w3-bar-item w3-button">1:1 ���� ����</a> <a href="${path}/user/withdrawal.jeju"
                  class="w3-bar-item w3-button">ȸ��Ż�� ��û</a>
              </c:if>
              <c:if test="${sessionScope.login.userid=='admin'}">
              	<a href="${path}/user/mypage.jeju?userid=${login.userid}"
                  class="w3-bar-item w3-button">���� ����</a> <a href="${path}/user/updatepw.jeju"
                  class="w3-bar-item w3-button">��й�ȣ ����</a> <a href="../user/mypoint.jeju?userid=${login.userid}"
                  class="w3-bar-item w3-button">����Ʈ</a>
              </c:if> 
            </div>
         </div>
      </c:if>
      <c:if test="${sessionScope.login.userid=='admin'}">
         <div class="w3-dropdown-hover">
            <button class="w3-button fa fa-search">
               &nbsp;&nbsp;ȸ������ <i class="fa fa-caret-down"></i>
            </button>
            <div class="w3-dropdown-content w3-bar-block">
               <a href="${path}/admin/list.jeju" class="w3-bar-item w3-button">ȸ��
                  ���</a> <a href="${path}/admin/deletelist.jeju"
                  class="w3-bar-item w3-button">Ż�� ��û ���</a> <a href="${path}/admin/acceptlist.jeju"
                  class="w3-bar-item w3-button">���� ��û ���</a> <a href="#"
                  class="w3-bar-item w3-button">���� ���� ������</a> <a href="../admin/qnalist.jeju"
                  class="w3-bar-item w3-button">1:1���� ���</a>
            </div>
         </div>

			<div class="w3-dropdown-hover">
				<button class="w3-button fa fa-home">
					&nbsp;&nbsp;���� <i class="fa fa-caret-down"></i>
				</button>
				<div class="w3-dropdown-content w3-bar-block">
					<a href="${path}/hotel/regist.jeju" class="w3-bar-item w3-button">����
						���</a> <a href="${path}/hotel/adminhotellist.jeju"
						class="w3-bar-item w3-button">���� �� ���</a> <a
						href="${path}/hotel/adminhotellist.jeju"
						class="w3-bar-item w3-button">���� ���� �� ���</a> <a href="#"
						class="w3-bar-item w3-button">����/��Ű���� �̿� Ƚ��</a>
				</div>
			</div>

			<div class="w3-dropdown-hover">
				<button class="w3-button fa fa-plane"> &nbsp;&nbsp;��Ű�� <i class="fa fa-caret-down"></i>
				</button>
				<div class="w3-dropdown-content w3-bar-block">
					<a href="../package/bigpackregist.jeju" class="w3-bar-item w3-button">��Ű�� ���</a>
				</div>
			</div>
		</c:if>
	</div>

	<!-- Page Content -->
	<div class="w3-overlay w3-animate-opacity" onclick="w3_close()"
		style="cursor: pointer" id="myOverlay"></div>

	<div>
		<button class="w3-button w3-white w3-xxlarge" onclick="w3_open()">&#9776;</button>
	</div>

	<script>
		function w3_open() {
			document.getElementById("mySidebar").style.display = "block";
			document.getElementById("myOverlay").style.display = "block";
		}
		function w3_close() {
			document.getElementById("mySidebar").style.display = "none";
			document.getElementById("myOverlay").style.display = "none";
		}
	</script>
	<header>
		<div class="container">
			<div class="row">
				<nav class="navbar navbar-default" role="navigation">
					<div class="container-fluid">
						<div class="navbar-header">
							<div class="navbar-brand">
								<a href="../user/main.jeju"><h1
										style="font-family: 'Nanum Brush Script', cursive; font-size: 100px">JeJu
										Go</h1></a>
							</div>
						</div>
						<div class="menu">
							<ul class="nav nav-tabs" role="tablist">
								<c:if test="${empty sessionScope.login}">
									<li role="presentation"><a href="javascript:void(0)"
										onclick="document.getElementById('signin').style.display='block'"
										class="w3-bar-item w3-button" style="font-family: 'Nanum Pen Script', cursive; font-size: 30px;">ȸ������</a></li>
									<li role="presentation"><a href="javascript:void(0)"
										onclick="document.getElementById('login').style.display='block'"
										class="w3-bar-item w3-button" style="font-family: 'Nanum Pen Script', cursive; font-size: 30px;">�α���</a></li>
								</c:if>
								<li role="presentation"><a
									href="${path }/hotel/hotellist.jeju" style="font-family: 'Nanum Pen Script', cursive; font-size: 30px;">Hotel</a></li>
								<li role="presentation"><a href="../package/packlist.jeju" style="font-family: 'Nanum Pen Script', cursive; font-size: 30px;">Packages</a></li>

								<li role="presentation"><a
									href="${path }/board/csboard.jeju" style="font-family: 'Nanum Pen Script', cursive; font-size: 30px;">������</a></li>
							</ul>
						</div>
					</div>
				</nav>
			</div>
		</div>
	</header>
	<decorator:body />
	<div class="container">
		<div class="row">
			<hr>
		</div>
	</div>

	<!-- footer ���� -->
	<footer>
		<div class="container">
			<div class="row">
				<div class="col-lg-3">
					<div class="widget">
						<h5 class="widgetheading">Get in touch with us</h5>
						<address>
							<strong>Jeju Go</strong><br> ����� ��õ�� ���������2��<br>
						</address>
						<p>
							<i class="icon-phone"></i> 02)1234-5678 <br> <i
								class="icon-envelope-alt"></i> jejugo@jejugaja.com
						</p>
					</div>
				</div>
				<div class="col-lg-3">
					<div class="widget">
						<h5 class="widgetheading">Pages</h5>
						<ul class="link-list">
							<li><a href="#">Hotel</a></li>
							<li><a href="#">Packages</a></li>
							<li><a href="#">My Page</a></li>
							<li><a href="#">Customer Service</a></li>
						</ul>
					</div>
				</div>
				<div class="col-lg-3">
					<div class="widget">
						<h5 class="widgetheading">Latest posts</h5>
						<ul class="link-list">
							<li><a href="#">Lorem ipsum dolor sit amet, consectetur
									adipiscing elit.</a></li>
							<li><a href="#">Pellentesque et pulvinar enim. Quisque
									at tempor ligula</a></li>
							<li><a href="#">Natus error sit voluptatem accusantium
									doloremque</a></li>
						</ul>
					</div>
				</div>
				<div class="col-lg-3">
					<div class="widget">
						<h5 class="widgetheading">Packages Photostream</h5>
						<div class="flickr_badge">
							<script type="text/javascript"
								src="https://www.flickr.com/badge_code_v2.gne?count=8&amp;display=random&amp;size=s&amp;layout=x&amp;source=user&amp;user=34178660@N03"></script>
						</div>
						<div class="clear"></div>
					</div>
				</div>
			</div>
		</div>

		<div class="container">
			<div class="row">
				<hr>
			</div>
		</div>

		<div id="sub-footer">
			<div class="container">
				<div class="row">
					<div class="col-lg-6">
						<div class="copyright">
							<p>
								<span>&copy; Designed by <a></a></span>
							</p>
							<div class="credits">
								<!--
                  All the links in the footer should remain intact.
                  You can delete the links only if you purchased the pro version.
                  Licensing information: https://bootstrapmade.com/license/
                  Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/buy/?theme=Arsha
                -->

							</div>
						</div>
					</div>
					<div class="col-lg-6">
						<ul class="social-network">
							<li><a href="#" data-placement="top" title="Facebook"><i
									class="fa fa-facebook fa-1x"></i></a></li>
							<li><a href="#" data-placement="top" title="Twitter"><i
									class="fa fa-twitter fa-1x"></i></a></li>
							<li><a href="#" data-placement="top" title="Linkedin"><i
									class="fa fa-linkedin fa-1x"></i></a></li>
							<li><a href="#" data-placement="top" title="Pinterest"><i
									class="fa fa-pinterest fa-1x"></i></a></li>
							<li><a href="#" data-placement="top" title="Google plus"><i
									class="fa fa-google-plus fa-1x"></i></a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</footer>

	<!-- jQuery (necessary for Bootstrap's JavaScript plugins)
  <script src="js/jquery.js"></script>
  Include all compiled plugins (below), or include individual files as needed
  <script src="js/bootstrap.min.js"></script>
  <script src="js/responsive-slider.js"></script>
  <script src="js/wow.min.js"></script>
  <script src="js/jquery.magnific-popup.js"></script>
  <script src="js/functions.js"></script>
  <script src="contactform/contactform.js"></script>
  <script>
    wow = new WOW({}).init();
  </script> -->
	<div id="login" class="w3-modal" style="display: none;">
		<div class="w3-modal-content w3-animate-zoom w3-padding-large">
			<div class="w3-container w3-white w3-center">
				<i onclick="document.getElementById('login').style.display='none'"
					class="fa fa-remove w3-button w3-xlarge w3-right w3-transparent"></i>
				<h2 class="w3-wide">LogIn</h2>
				<p>�α��� ������ �Է��ϼ���.</p>
				<form:form modelattribute="user" action="${path }/user/login.jeju"
					name="lf" onsubmit="return loginchk(this)">
					<p>
						<input class="w3-input w3-border"
							style="text-transform: lowercase;" type="text" name="userid"
							placeholder="���̵�(�̸���)">
					</p>
					<p>
						<input class="w3-input w3-border"
							style="text-transform: lowercase;" type="password"
							name="password" placeholder="��й�ȣ">
					</p>
					<p>
						<a class="btn btn-primary"
							href="javascript:void(0)"
							onclick="document.getElementById('searchid').style.display='block'">���̵�/��й�ȣ
							ã��</a>
					</p>
					<button type="submit"
						class="btn btn-primary">�α���</button>
				</form:form>
			</div>
		</div>
	</div>

	<!-- ���̵�/��й�ȣ ã�� �κ� -->
	<div id=searchid class="w3-modal" style="display: none;">
		<div class="w3-modal-content w3-animate-zoom w3-padding-large">
			<div class="w3-container w3-white w3-center">
				<i
					onclick="document.getElementById('searchid').style.display='none'"
					class="fa fa-remove w3-button w3-xlarge w3-right w3-transparent"></i>
				<h2 class="w3-wide">���̵�/��й�ȣ ã��</h2>
				<p>������ �̸��ϸ� ���� ã�Ⱑ �����մϴ� .</p>
				</div>
				
				<div style="margin-bottom: 10px;"
					class="custom-control custom-radio custom-control-inline">
					<input type="radio" class="custom-control-input" id="search_1"
						name="search_total" onclick="search_check(1)" checked="checked">
					<label class="custom-control-label font-weight-bold text-white"
						for="search_1">���̵�ã��</label>
					<input type="radio" class="custom-control-input" id="search_2"
						name="search_total" onclick="search_check(2)"> <label
						class="custom-control-label font-weight-bold text-white"
						for="search_2">��й�ȣã��</label>
				</div>
				<div id="searchI">
					<form name="sf" action="userSearch.jeju" method="post">
						<div class="form-group">
							<label class="font-weight-bold text-white" for="inputName_1">�̸�</label>
							<div>
								<input type="text" class="form-control" id="username"
									name="username" placeholder="ex) �۹���">
							</div>
						</div>
						<div class="form-group">
							<label class="font-weight-bold text-white" for="inputPhone_1">�޴�����ȣ</label>
							<div>
								<input type="text" class="form-control" id="Phone" name="Phone"
									placeholder="ex) 01077779999">
							</div>
						</div>
						<div class="form-group w3-center">
							<button id="searchBtn2" type="submit"
								class="btn btn-primary">Ȯ��</button>
								<button type="reset"
								class="btn btn-primary">�ʱ�ȭ</button>
						</div>
					</form>
				</div>
				<div id="searchP" style="display: none;">
					<form name="pf" action="passSearch.jeju" method="post">
						<div class="form-group">
							<label class="font-weight-bold text-white" for="inputId">�̸���</label>
							<div>
								<input type="text" class="form-control" id="userid"
									style="text-transform: lowercase;" name="userid"
									placeholder="ex)goodee@aaa.bbb">
							</div>
						</div>
						<div class="form-group w3-center">
							<button id="searchBtn2" type="submit"
								class="btn btn-primary">Ȯ��</button>
								<button type="reset"
								class="btn btn-primary">�ʱ�ȭ</button>
						</div>
					</form>
				</div>

			</div>
		</div>
	<div id="signin" class="w3-modal" style="display: none;">
		<div class="w3-modal-content w3-animate-zoom w3-padding-large">
			<div class="w3-container w3-white w3-center">
				<i onclick="document.getElementById('signin').style.display='none'"
					class="fa fa-remove w3-button w3-xlarge w3-right w3-transparent"></i>
				<h2 class="w3-wide">Sign In</h2>
				<p>ȸ�����Կ� �ʿ��� ������ �Է��ϼ���.</p>
				<form:form modelattribute="user" name="f" action="userEntry.jeju"
					method="post" onsubmit="return passchk(this)">
					<p>
						<input class="w3-input w3-border" type="text" name="username"
							style="text-transform: lowercase;" placeholder="�̸�">
					</p>
					<p>
						<input class="w3-input w3-border" type="text" name="userid"
							style="text-transform: lowercase;" placeholder="���̵�(�̸���)">
					</p>
					<p>
						<input class="w3-input w3-border" type="password" name="password"
							style="text-transform: lowercase;" placeholder="��й�ȣ">
					</p>
					<p>
						<input class="w3-input w3-border" type="password" name="checkpassword"
							style="text-transform: lowercase;" placeholder="��й�ȣ Ȯ��">
					</p>
					<p>
						<input class="w3-input w3-border"type="text" name="phone" placeholder="��ȭ��ȣ">
					</p>
					<button type="submit"
						class="btn btn-primary">ȸ������</button>
						<button type="reset"
						class="btn btn-primary">�ʱ�ȭ</button>
				</form:form>
			</div>
		</div>
	</div>
</body>
</html>