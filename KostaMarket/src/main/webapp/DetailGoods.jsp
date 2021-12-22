<%@page import="com.KostaMarket.Product.vo.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.util.*"%>
<%-- 검토 필요 --%>
<jsp:useBean id="product" class="com.KostaMarket.Product.vo.Product" />
<jsp:setProperty name="product" property="productCode" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마켓컬리 클론</title>

<%-- import header.css --%>
<link rel="stylesheet" type="text/css" href="./css/header.css" />

<%-- import footer.css --%>
<link rel="stylesheet" type="text/css" href="<./css/footer.css" />

<%-- import product_detail.css --%>
<link rel="stylesheet" type="text/css" href="./css/product_detail.css">
<script type="text/javascript"><%@include file="./js/DetailGoods.js"%></script>

<style>
goods-add-product {
	position: relative;
}

goods-add-product-title {
	font-size: 13px;
	font-weight: 900;
	line-height: 1.8;
}

goods-add-product-title:befroe {
	width: 20px;
	height: 5px;
	background-color: #000;
	display: block;
	content: '';
}
</style>
</head>
<body>

	<%!String product_code;
	String product_allergy;
	String product_breeding_code;
	String product_capacity;
	String product_country_origin;
	String product_delivery;
	String product_expiration;
	String product_image;
	String product_instructions;
	String product_livestock_history;
	String product_name;
	String product_packing;
	int product_price;
	int product_sale_pct;
	String product_weight;
	int product_category;%>

	<%
	Product productObj = (Product) request.getAttribute("product");

	product_code = productObj.getProductCode();
	product_allergy = productObj.getProductAllergy();
	;
	product_breeding_code = productObj.getProductBreedingCode();
	;
	product_capacity = productObj.getProductCapacity();
	product_country_origin = productObj.getProductCountryOrigin();
	product_delivery = productObj.getProductDelivery();
	product_expiration = productObj.getProductExpiration();
	product_image = productObj.getProductImage();
	product_instructions = productObj.getProductInstructions();
	product_livestock_history = productObj.getProductLivestockHistory();
	product_name = productObj.getProductName();
	product_packing = productObj.getProductPacking();
	product_price = productObj.getProductPrice();
	product_sale_pct = productObj.getProductSalePct();
	product_weight = productObj.getProductWeight();
	product_category = productObj.getProductCategory();
	%>


	<%--<jsp:include page="../include/header.jsp" />--%>
	<div id="body_product">

		<br>
		<div id="main">
			<div id="content" style="opacity: 1;">
				<div class="section_view">

					<div id="shareLayer">
						<div class="layer_share">
							<div class="inner_layersns">
								<h3 class="screen_out">SNS 공유하기</h3>
								<ul class="list_share">
									<li><a class="btn btn_fb" data-sns-name="페이스북"
										data-sns="facebook" href="#none"><img
											src="./img/product/ico_facebook.jpg" alt="페이스북"><span
											class="txt">공유하기</span></a></li>
									<li><a class="btn btn_tw" data-sns-name="트위터"
										data-sns="twitter" href="#none"><img
											src="./img/product/ico_twitter.jpg" alt="트위터"><span
											class="txt">트윗하기</span></a></li>
									<li class="btn_url"><input type="text" class="inp"
										value="http://localhost:8282/MarketHani/user_product_view.do?p_num=2"
										readonly="readonly"> <a class="btn_copy off"
										data-sns-name="링크 복사" data-sns="copy" href="#none">URL 복사<img
											src="./img/product/ico_checked_x2.jpg" alt=""></a></li>
								</ul>
							</div>
						</div>

					</div>

					<div id="sectionView">
						<div class="inner_view">

							<div class="thumb">
								<img src="<%=product_image%>" class="bg">
							</div>

							<p class="goods_name">
								<input id="p_num" type="hidden" name="p_num"
									value="${param.p_num}" /> <input id="p_qty" type="hidden"
									name="p_qty" value="${dto.getP_qty()}" /> <span
									class="btn_share">
									<button id="btnShare" onclick="onDisplay();">공유하기</button>
								</span> <strong class="name"><%=product_name%></strong> <span
									class="short_desc">간단한 설명 ex:너무 좋아 멜론!</span>
							</p>
							<p class="goods_price">
								<span class="position"> <span class="dc"> <span
										class="dc_price"> <span class="won" id="price"><%=product_price%>원</span>

											<span class="dc_percent"> <span class="per">%</span></span>

									</span></span> <%--회원 할인가 end--%> <%-- 할인 전 금액 --%>
								</span> <span class="not_login"> <span>로그인 후, 적립혜택이
										제공됩니다.</span>
								</span>


							</p>
							<%-- --%>
							<div class="goods_info">
								<dl class="list fst">
									<dt class="tit">판매단위</dt>
									<dd class="desc"><%=product_capacity%></dd>
								</dl>
								<dl class="list">
									<dt class="tit">중량/용량</dt>
									<dd class="desc"><%=product_weight%>
										<br>
									</dd>
								</dl>
								<dl class="list">
									<dt class="tit">배송구분</dt>
									<%-- --%>
									<dd class="desc"><%=product_delivery%></dd>
								</dl>
								<%
								if (product_country_origin != null) {
								%>
								<dl class="list">
									<dt class="tit">원산지</dt>
									<dd class="desc"><%=product_country_origin%></dd>
								</dl>
								<%
								} else {
								}
								%>

								<dl class="list">
									<dt class="tit">포장타입</dt>
									<dd class="desc">
										<%=product_packing%>
										<br> <strong class="emph">택배배송은 에코포장이 스티로폼으로
											대체됩니다.</strong>
									</dd>
								</dl>

								<%
								if (product_country_origin != null) {
								%>
								<dl class="list">
									<dt class="tit">알레르기정보</dt>
									<dd class="desc"><%=product_country_origin%></dd>
								</dl>
								<%
								} else {
								}
								%>

								<%
								if (product_expiration != null) {
								%>
								<dl class="list">
									<dt class="tit">유통기한</dt>
									<dd class="desc"><%=product_expiration%></dd>
								</dl>
								<%
								} else {
								}
								%>

								<%
								if (product_breeding_code != null) {
								%>
								<dl class="list">
									<dt class="tit">사육환경번호</dt>
									<dd class="desc"><%=product_breeding_code%></dd>
								</dl>
								<%
								} else {
								}
								%>

								<%
								if (product_livestock_history != null) {
								%>
								<dl class="list">
									<dt class="tit">축산물이력정보</dt>
									<dd class="desc"><%=product_livestock_history%></dd>
								</dl>
								<%
								} else {
								}
								%>

								<%
								if (product_instructions != null) {
								%>
								<dl class="list">
									<dt class="tit">안내사항</dt>
									<dd class="desc"><%=product_instructions%></dd>
								</dl>
								<%
								} else {
								}
								%>

								<%-- --%>
							</div>
							<%-- --%>
						</div>
						<%-- --%>
					</div>

					<%--cart_put --%>
					<div id="cartPut">
						<div class="cart_option cartList cart_type2">
							<div class="inner_option">
								<!---->
								<!---->
								<div class="in_option">
									<div class="list_goods">
										<!---->
										<!---->
										<!---->
										<ul id="ul_product" class="list list_nopackage">
											<li class="on"><span class="btn_position">
													<button id="button_product" type="button" class="btn_del">
														<span class="txt">삭제하기</span>
													</button>
											</span> <span class="name"> <!----> [조공] 나 게살 좋아해 스틱 <!---->
											</span> <span class="tit_item">구매수량</span>
												<div class="option">
													<span class="count"> <input id="plusbtn"
														type='button' onclick='count("plus"), sum("plus")' /> <input
														id="minusbtn" type='button'
														onclick='count("minus"), sum("minus")' /> <span
														id='result'>1</span>
													</span>
													<!-- <span class="price"> <span class="dc_price">2,900원</span></span> -->
												</div></li>
										</ul>
									</div>
									<div class="total">
										<div class="price">
											<!---->
											<strong class="tit">총 상품금액 :</strong> <span class="sum">
												<span class="num" id="totalPrice"> <%=product_price%>
													<%--<fmt:formatNumber value="${dto.getP_price() * (100-dto.getP_discount()) / 100}" pattern="0,000"/> --%>
											</span> <span class="won">원</span>
											</span>
										</div>

										<c:if test="${empty user_id }">
											<p class="txt_point">
												<span class="ico">적립</span> <span class="no_login"> <!---->
													<span>로그인 후, 적립혜택 제공</span>
												</span>
												<!---->
											</p>
										</c:if>

										<c:if test="${!empty user_id }">
											<p class="txt_point">
												<span class="ico">적립</span> <span class="no_login"> <!---->
													<span>구매 시 ${dto.getP_point() }원 적립</span>
												</span>
												<!---->
											</p>
										</c:if>

									</div>
								</div>
								<div class="group_btn off">
									<div class="view_function">
										<button id="button_product" type="button"
											class="btn btn_alarm">재입고 알림</button>
									</div>
									<span class="btn_type1">
										<button id="addCart_btn" type="button" class="txt_type">장바구니
											담기</button> <!---->
									</span>
									<!---->
									<!---->
									<!---->
									<!---->
									<!---->
									<!---->
								</div>
								<!---->
							</div>
						</div>
						<div class="cart_option cartList cart_type1">
							<div class="inner_option">
								<!---->
								<!---->
								<div class="in_option">
									<div class="list_goods">
										<div class="bar_open">
											<button id="button_product" type="button" class="btn_close">
												<span class="ico">상품 선택</span>
											</button>
										</div>
										<!---->
										<!---->
										<!---->
									</div>
									<!---->
								</div>
								<div class="group_btn off">
									<div class="view_function">
										<button id="button_product" type="button"
											class="btn btn_alarm">재입고 알림</button>
									</div>
									<span class="btn_type1"><button id="button_product"
											type="button" class="txt_type">장바구니 담기</button> <!----> </span>
									<!---->
									<!---->
									<!---->
									<!---->
									<!---->
									<!---->
								</div>
								<!---->
							</div>
						</div>
						<div class="cart_option cart_type3 notify_option">
							<div class="inner_option">
								<strong class="tit">재입고 알림 신청</strong>
								<p class="name_deal">[조공] 나 게살 좋아해 스틱</p>
								<!---->
								<!---->
								<p class="notice">
									<span class="ico">·</span> 상품이 입고되면 앱 푸시 또는 알림톡으로 알려 드립니다.
								</p>
								<div class="group_btn layer_btn2">
									<span class="btn_type2">
										<button id="button_product" type="button" class="txt_type">취소</button>
									</span> <span class="btn_type1">
										<button id="button_product" type="button" class="txt_type">신청하기</button>
									</span>
								</div>
							</div>
						</div>
						<div class="cart_option cart_result cart_type3">
							<div class="inner_option">
								<button id="button_product" type="button" class="btn_close1">pc레이어닫기</button>
								<p class="success">
									상품 구매를 위한 <span class="bar"></span> 배송지를 설정해주세요
								</p>
								<div class="group_btn layer_btn2">
									<span class="btn_type2">
										<button id="button_product" type="button" class="txt_type">취소</button>
									</span> <span class="btn_type1">
										<button id="button_product" type="button" class="txt_type">
											<span class="ico_search"></span> 주소 검색
										</button>
									</span>
								</div>
							</div>
						</div>
						<form name="frmBuyNow" method="post"
							action="/shop/order/order.php">
							<input id="input_product" type="hidden" name="mode"
								value="addItem"> <input id="input_product" type="hidden"
								name="goodsno" value="">
						</form>
						<form name="frmWishlist" method="post"></form>
					</div>

				</div>
			</div>
		</div>
	</div>
	<%-- div.main end --%>

	<%-- 페이지 위로 올리는 버튼 //처음엔 안보이다가 스크롤 내릴 때 보이는 기능 추가 --%>
	<div id="topUp">
		<a href="#top" id="pageTop" class="on"
			style="opacity: 1; bottom: 25px;">맨 위로가기</a>
	</div>
	<%-- 연관상품 --%>
	<div class="goods-add-product">
		<h3 class="goods-add-product-title">RELATED PRODUCT</h3>
	

	<%-- 상단 탭  --%>

	<ul id="ul_product" class="goods-view-infomation-tab-group">

		<li><a href="#content1"
			class="goods-view-infomation-tab-anchor __active">상품설명</a></li>

		<li><a href="#content2"
			class="goods-view-infomation-tab-anchor __active">상세정보</a></li>

		<li><a href="#content3"
			class="goods-view-infomation-tab-anchor __active">후기</a></li>

		<li><a href="#content4"
			class="goods-view-infomation-tab-anchor __active">문의</a></li>
	</ul>
</body>
</html>