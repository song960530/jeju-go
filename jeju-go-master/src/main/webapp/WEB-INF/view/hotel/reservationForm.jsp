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
				<span>1</span>. ���� ����
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
						<th scope="col">�����̸�</th>
						<th scope="col">����</th>
						<th scope="col">���αݾ�</th>
						<th scope="col">1�ڴ� �ݾ�</th>
						<th scope="col">������</th>
						<th scope="col">�����ݾ�</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><span class="tx"> <strong>${f.room.name }</strong>
								<em data-cart-seq="0"
								style="display: none;">���������� : <b 
									data-cart-seq="0">0</b>��
							</em> <em class="frz" data-cart-seq="0"
								style="display: none;"></em>
						</span> <span class="img"><a href="javascript:void(0);"> <img
									src="${path}/${f.room.photourl}" width="80" height="80" alt="">
							</a></span></td>
						<td></td>
						<td><span class="prc"><b
								data-cart-seq="0">0</b>��</span></td>
						<td><span class="ori"><b><fmt:formatNumber
										value="${f.room.price}" pattern="###,###" /></b>��</span></td>
						<td><span class="nm">${f.day-1}�� ${f.day}��</span></td>
						<td><span class="ori"><b
								data-cart-seq="0"> <fmt:formatNumber
										value="${f.room.price * (f.day-1) }" pattern="###,###" /></b>��</span></td>
					</tr>

				</tbody>
			</table>
		</div>
		<br>
		<div class="odr_insWrap" style="min-height:500px;"> 
		<div class="odr_sheet">
			<h3>
				<span>2</span>. �ֹ�������
			</h3>
			<table>
				<colgroup>
					<col style="width: 220px;">
					<col>
				</colgroup>
				<tbody>
					<tr data-role="cert" data-cert-yn="N">
						<th>��������<em class="pt">*</em></th>
						<td>
							<div class="cst">
								<label for="cert_orderer_nm" class="ir">������ �Է�</label> 
								<input type="text" name="username" value="${login.username}">
							</div>
						</td>
					</tr>
					<tr data-role="cert" data-cert-yn="N">
						<th>���̵�<em class="pt">*</em></th>
						<td>
							<div class="cst">
								<label for="cert_email" class="ir">�̸��� �Է�</label> 
								<input type="text" name="userid"class="nmb_mail"
									value="${login.userid }" readonly>
									<span class="dwCk">�ֹ����� ������ ���� �̸��ϰ� SMS��
									�ڵ����� ���۵˴ϴ�.</span>
							</div>
						</td>
					</tr>

				</tbody>
			</table>
		</div>
		
		<div class="odr_sheet">
				<h3>
					<span>3</span>. ����Ʈ 
				</h3>
				<table>
					<colgroup>
						<col style="width: 220px;">
						<col>
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">���� ����Ʈ</th>
							<td>
								<div class="dis">
									<span class="prc"><em data-role="goods_dc">
									<fmt:formatNumber value="${countpoint}" pattern="###,###"/></em>��</span>
								</div>
							</td>
						</tr>
							<tr style="">
							<th scope="row">��� ����Ʈ</th>
							<td>
								<div class="dis">
								
									<span class="tx">��� ���� ����Ʈ: 
										<c:if test="${countpoint>=10000 }">
											<b style="color:blue;"><fmt:formatNumber value="${countpoint}" pattern="###,###"/></b>��
										</c:if>
										<c:if test="${countpoint<10000 }">
											<b style="color:blue;"><fmt:formatNumber value="0" pattern="###,###"/></b>��
										</c:if>
									</span>
									<span class="dwCk">
									<label for="sht_ck01"><input type="button" id="push" onclick="allPoint()" value="���׻��"></label></span>
									<span class="prc"><input type="text" value="" id="usepoint" readonly>��</span>
								</div>
							</td>
						</tr>
						
					</tbody>
				</table>
			</div>
		

		<div class="odr_insFixed">
				<div class="contain" style="position: absolute; top: 33px;">
					<div class="top">

						<div class="dlv">����â</div>
						<dl class="total">
							<dt>
								<b>������������</b>
							</dt>
							<dd class="tp">
								<strong>�ֹ� �հ� �ݾ�</strong><span>
								<b >
								<fmt:formatNumber value="${f.room.price * (f.day-1) }" pattern="###,###" />
								</b>��</span>
							</dd>
							<dd class="tp">
								<strong>���� ���� �ݾ�</strong><span><b id="halin">0</b>��</span>
								<p></p>
							</dd>
							<dd class="tp">
								<strong>��ۺ�</strong><span><b>2,900</b>��</span>
								<p class="dv">
									<em>45,000��
										�̻� ���� �� ����</em>
									
									<em style="display: none;">��ۺ�
										���� ���</em>
								</p>
							</dd>
							
						</dl>
						<div class="total_prc">
							<span class="prc"><strong>���� �����ݾ�</strong><span><b>15,100</b>��</span></span> <span class="save" style="display:none">����������
								: <b>0</b>��
							</span>
						</div>
					</div>
					<button type="button" class="odr_total_ok">
						�����ϱ�<em class="ir">�ֹ�Ȯ�η��̾� ����</em>
					</button>
				</div>
			</div>
		</div>
	</form>
	</div>
</body>
</html>