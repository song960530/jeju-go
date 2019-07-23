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
<script type="text/javascript">
	function allPoint() {
		document.getElementById("usepoint").value=document.getElementById("userpoint").value
		document.getElementById("halin").innerHTML=document.getElementById("userpoint").value
	}
</script>
</head>
<body>
	<div class="container">
	<form>
		<input type="hidden" id="userpoint" value="${countpoint}">
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
						<th scope="col">숙소이름</th>
						<th scope="col">혜택</th>
						<th scope="col">할인금액</th>
						<th scope="col">1박당 금액</th>
						<th scope="col">숙박일</th>
						<th scope="col">결제금액</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><span class="tx"> <strong>${f.room.name }</strong>
								<em data-cart-seq="0"
								style="display: none;">예정적립금 : <b 
									data-cart-seq="0">0</b>원
							</em> <em class="frz" data-cart-seq="0"
								style="display: none;"></em>
						</span> <span class="img"><a href="javascript:void(0);"> <img
									src="${path}/${f.room.photourl}" width="80" height="80" alt="">
							</a></span></td>
						<td></td>
						<td><span class="prc"><b
								data-cart-seq="0">0</b>원</span></td>
						<td><span class="ori"><b><fmt:formatNumber
										value="${f.room.price}" pattern="###,###" /></b>원</span></td>
						<td><span class="nm">${f.day-1}박 ${f.day}일</span></td>
						<td><span class="ori"><b
								data-cart-seq="0"> <fmt:formatNumber
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
									<span class="dwCk">
									<label for="sht_ck01"><input type="button" id="push" onclick="allPoint()" value="전액사용"></label></span>
									<span class="prc"><input type="text" value="" id="usepoint" readonly>원</span>
								</div>
							</td>
						</tr>
						
					</tbody>
				</table>
			</div>
		

		<div class="odr_insFixed">
				<div class="contain" style="position: absolute; top: 33px;">
					<div class="top">

						<div class="dlv">결제창</div>
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
								<strong>할인 적용 금액</strong><span><b id="halin">0</b>원</span>
								<p></p>
							</dd>
							<dd class="tp">
								<strong>배송비</strong><span><b>2,900</b>원</span>
								<p class="dv">
									<em>45,000원
										이상 구매 시 무료</em>
									
									<em style="display: none;">배송비
										쿠폰 사용</em>
								</p>
							</dd>
							
						</dl>
						<div class="total_prc">
							<span class="prc"><strong>최종 결제금액</strong><span><b>15,100</b>원</span></span> <span class="save" style="display:none">예정적립금
								: <b>0</b>원
							</span>
						</div>
					</div>
					<button type="button" class="odr_total_ok">
						결제하기<em class="ir">주문확인레이어 열기</em>
					</button>
				</div>
			</div>
		</div>
	</form>
	</div>
</body>
</html>