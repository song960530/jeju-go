<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link href="//www.thebanchan.co.kr/fo/css/odr.css" rel="stylesheet"
	type="text/css">
<script type="text/javascript">
	function allPoint() {
		var b="<fmt:formatNumber value="${countpoint}" pattern="###,###"/>"
		var c="<b><fmt:formatNumber value="${(f.room.price * (f.day-1))-countpoint }" pattern="###,###"/></b>"
		document.getElementById("usepoint").value=document.getElementById("userpoint").value
		document.getElementById("halin").innerHTML=b
		document.getElementById("totalprice1").innerHTML=c
		document.getElementById("totalprice2").innerHTML=c
	};
		function cancle() {
			var b="<fmt:formatNumber value="${countpoint}" pattern="###,###"/>"
			var c="<b><fmt:formatNumber value="${(f.room.price * (f.day-1))}" pattern="###,###"/></b>"
			document.getElementById("usepoint").value=0
			document.getElementById("halin").innerHTML=0
			document.getElementById("totalprice1").innerHTML=c
			document.getElementById("totalprice2").innerHTML=c
		};
		
	function confirm(){
		if(confirm("예약 신청 하시겠습니까??")){
			return true;
		}else{
			return false;
		}
	}
</script>
<style type="text/css">
h3 {
	display: block;
	padding: 0 0 16px 23px;
	font-size: 18px;
	font-weight: bold;
	line-height: 18px;
	color: #333;
}
</style>
</head>
<body>
	<div class="container">
	<form action="reservation.jeju" method="post" name="rf" onsubmit="return confirm()">
		<input type="hidden" id="userpoint" value="${countpoint}">
		<input type="hidden" name="hno" value="${f.hno}">
		<input type="hidden" name="name" value="${f.name}">
		<input type="hidden" name="pnum" value="${f.pnum}">
		<input type="hidden" name="total" value="${f.room.price * (f.day-1) }">
		<input type="hidden" name="start" value="${f.start}">
		<input type="hidden" name="end" value="${f.end}">
		<input type="hidden" name="day" value="${f.day}">
		<input type="hidden" name="hname" value="${f.hname}">
		
		<div class="odr_insTop">
			<h3>
				<span>1</span>. 결제 정보
			</h3>
			<table class="odr_insTbl">
				<colgroup>
					<col>
					<col style="width: 260px;">
					<col style="width: 110px;">
					<col style="width: 110px;">
					<col style="width: 80px;">
					<col style="width: 110px;">
				</colgroup>
				<thead>
					<tr class="w3-center">
						<th scope="col" class="w3-center">숙소</th>
						<th scope="col" class="w3-center">숙소이름</th>
						<th scope="col" class="w3-center"></th>
						<th scope="col" class="w3-center">1박당 금액</th>
						<th scope="col" class="w3-center">숙박일</th>
						<th scope="col" class="w3-center">결제금액</th>
					</tr>
				</thead>
				<tbody>
					<tr style="height:200px;">
						<td style="height:200px;" class="w3-center"> 
						<img src="${path}/${f.room.photourl}" style="padding-left:10%;padding-right:10%;width:80%;height:190px;" align="middle">
							</td>
						<td><dt style="font-size: 20px; color:grey;">${f.hname} - ${f.name}</dt></td>
						<td><span class="prc"><b
								data-cart-seq="0"></b></span></td>
						<td><span class="ori"><b style="font-size: 20px;"><fmt:formatNumber
										value="${f.room.price}" pattern="###,###" />원</b></span></td>
						<td><span class="nm">${f.day-1}박 ${f.day}일</span></td>
						<td><span class="ori"><b
								data-cart-seq="0" style="font-size: 20px;"> <fmt:formatNumber
										value="${f.room.price * (f.day-1) }" pattern="###,###" /></b>원</span></td>
					</tr>

				</tbody>
			</table>
		</div>
		<br>
		<div class="odr_insWrap" style="min-height:500px;"> 
		<div class="odr_sheet">
			<h3>
				<span>2</span>. 주문자정보
			</h3>
			<table>
				<colgroup>
					<col style="width: 220px;">
					<col>
				</colgroup>
				<tbody>
					<tr data-role="cert" data-cert-yn="N">
						<th>투숙객명<em class="pt">*</em></th>
						<td>
							<div class="cst">
								<label for="cert_orderer_nm" class="ir">투숙객 입력</label> 
								<input type="text" name="username" value="${login.username}">
							</div>
						</td>
					</tr>
					<tr data-role="cert" data-cert-yn="N">
						<th>아이디<em class="pt">*</em></th>
						<td>
							<div class="cst">
								<label for="cert_email" class="ir">이메일 입력</label> 
								<input type="text" name="userid"class="nmb_mail"
									value="${login.userid }" readonly>
									<span class="dwCk">주문관련 정보에 대한 이메일과 SMS는
									자동으로 전송됩니다.</span>
							</div>
						</td>
					</tr>

				</tbody>
			</table>
		</div>
		
		<div class="odr_sheet">
				<h3>
					<span>3</span>. 포인트 
				</h3>
				<table>
					<colgroup>
						<col style="width: 220px;">
						<col>
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">현재 포인트</th>
							<td>
								<div class="dis">
									<span class="prc"><em data-role="goods_dc">
									<fmt:formatNumber value="${countpoint}" pattern="###,###"/></em>원</span>
								</div>
							</td>
						</tr>
							<tr style="">
							<th scope="row">사용 포인트</th>
							<td>
								<div class="dis">
								
									<span class="tx">사용 가능 포인트: 
										<c:if test="${countpoint>=10000 }">
											<b style="color:blue;"><fmt:formatNumber value="${countpoint}" pattern="###,###"/></b>원
										</c:if>
										<c:if test="${countpoint<10000 }">
											<b style="color:blue;"><fmt:formatNumber value="0" pattern="###,###"/></b>원
										</c:if>
									</span>
									<c:if test="${countpoint>=10000 }">
									<span class="dwCk">
									<label for="sht_ck01"><input type="button" id="push" onclick="allPoint()" value="전액사용"></label>
									<label for="sht_ck01"><input type="button" id="push" onclick="cancle()" value="사용취소"></label>
									</span>
									</c:if>
									<c:if test="${countpoint<10000 }">
										<span class="tx">
									<b style="color:red;">10,000이상부터 사용 가능합니다.</b>
									</span>
									</c:if>
									<span class="prc"><input type="text" name="point" id="usepoint" value="0"readonly>원</span>
								</div>
							</td>
						</tr>
						
					</tbody>
				</table>
			</div>
		

		<div class="odr_insFixed">
				<div class="contain" style="position: absolute; top: 33px;">
					<div class="top">

						<div class="dlv" style="background-color:grey">결제창</div>
						<dl class="total">
							<dt>
								<b>최종결제정보</b>
							</dt>
							<dd class="tp">
								<strong>주문 합계 금액</strong><span>
								<b >
								<fmt:formatNumber value="${f.room.price * (f.day-1) }" pattern="###,###" />
								</b>원</span>
							</dd>
							<dd class="tp">
								<strong>할인 금액</strong><span><b id="halin">0</b>원</span>
								<p class="dv">
									<em  style="color:red;">10,000이상 포인트 사용 가능</em>
								</p>
							</dd>
							<dd class="tp">
								<strong>포인트 적용 금액</strong><span><b id="totalprice1">0</b>원</span>
							</dd>
							
						</dl>
							<div class="total_prc">
								<span class="prc"><strong style="color:#50c0e9;">최종 결제금액</strong><span>
									<div id="totalprice2"><b style="color:#50c0e9;"><fmt:formatNumber value="${f.room.price * (f.day-1) }"
										pattern="###,###"/>원</b></div>
								</span></span>
							</div>
						</div>
					<button type="submit" class="odr_total_ok" style="background-color:#2196F3">
						결제하기
					</button>
				</div>
			</div>
		</div>
	</form>
	</div>
</body>
</html>