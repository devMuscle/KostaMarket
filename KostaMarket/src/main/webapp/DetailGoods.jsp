<%@page import="com.KostaMarket.Product.vo.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>
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
<link rel="stylesheet" type="text/css"
	href="./css/detailGoodsFooter.css" />

<%-- import product_detail.css --%>
<link rel="stylesheet" type="text/css" href="./css/product_detail.css">

<%-- import slick slider --%>
<link rel="stylesheet" type="text/css"
	href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />

<%-- import javascript price count --%>
<script type="text/javascript"><%@include file="./js/DetailGoods.js"%></script>

<%-- import javascript slick slider --%>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript"
	src="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>

<%-- test --%>

<style>
html {
	scroll-behavior: smooth;
}

.slick-arrow {
	position: absolute;
	top: 35%;
	transform: translateY(-50%);
	width: 20px;
	height: 30px;
	border: none;
	text-indent: -9999px;
	overflow: hidden;
	width: 20px;
}

.slick-prev {
	z-index: 100;
	left: -3%;
	background: url(images/product/left.webp) no-repeat 0 0;
}

.slick-next {
	z-index: 100;
	left: 101%;
	background: url(images/product/right.webp) no-repeat 0 0;
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
	<%-- 현재상품 정보 불러오기 --%>
	<%
	Product productObj = (Product) request.getAttribute("product");

	product_code = productObj.getProductCode();
	product_allergy = productObj.getProductAllergy();;
	product_breeding_code = productObj.getProductBreedingCode();;
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

	DecimalFormat df = new DecimalFormat("###,###");
	String product_price2;
	product_price2 = df.format(product_price);
	%>
	<%-- 연관상품 정보 불러오기 --%>
	<%
	List<Product> list = (List) request.getAttribute("list");
	%>

	<%--<jsp:include page="../include/header.jsp" />--%>
	<div>
		<div id="body_product" style="height: auto;">
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
												src="./images/product/ico_facebook.jpg" alt="페이스북"><span
												class="txt">공유하기</span></a></li>
										<li><a class="btn btn_tw" data-sns-name="트위터"
											data-sns="twitter" href="#none"><img
												src="./images/product/ico_twitter.jpg" alt="트위터"><span
												class="txt">트윗하기</span></a></li>
										<li class="btn_url"><input type="text" class="inp"
											value="변경해야함" readonly="readonly"> <a
											class="btn_copy off" data-sns-name="링크 복사" data-sns="copy"
											href="#none">URL 복사<img
												src="./img/product/ico_checked_x2.jpg" alt=""></a></li>
									</ul>
								</div>
							</div>

						</div>

						<div id="sectionView">
							<div class="inner_view">

								<div class="thumb">
									<a
										href="http://localhost:8888/KostaMarket/detailgoods?product_code=AC01">
										<img src="<%=product_image%>" class="bg">
									</a>
								</div>

								<p class="goods_name">
									<input id="p_num" type="hidden" name="p_num"
										value="${param.p_num}" /> <input id="p_qty" type="hidden"
										name="p_qty" value="${dto.getP_qty()}" /> <span
										class="btn_share">
										<button id="btnShare" onclick="onDisplay();">테스트용 텍스트</button>
									</span> <strong class="name"><%=product_name%></strong> <span
										class="short_desc">간단한 설명 ex:너무 좋아 멜론!</span>
								</p>
								<p class="goods_price">
									<span class="position"> <span class="dc"> <span
											class="dc_price"> <span class="won" id="price"><%=product_price2%>원</span>

												<span class="dc_percent"> <span class="per"><%=product_sale_pct%>%</span></span>

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
												<strong class="tit">총 상품금액 :</strong> <span class="sum">
													<span class="num" id="totalPrice"
													value="<%=product_price%>"> <%=product_price2%></span> <span
													class="won">원</span>
												</span>
											</div>

											<c:if test="${empty user_id }">
												<p class="txt_point">
													<span class="ico">적립</span> <span class="no_login">
														<!----> <span>로그인 후, 적립혜택 제공</span>
													</span>
													<!---->
												</p>
											</c:if>

											<c:if test="${!empty user_id }">
												<p class="txt_point">
													<span class="ico">적립</span> <span class="no_login">
														<!----> <span>구매 시 ${dto.getP_point() }원 적립</span>
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
											<button type="button" class="txt_type"
												onclick='addCartList(<%=product_code%>,<%=product_price%>)'>
												장바구니 담기</button> <!---->
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
									value="addItem"> <input id="input_product"
									type="hidden" name="goodsno" value="">
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
		<div style="align: center; width: 1010px; margin: 0 auto;">
			<h3 style="font-size: 13px; font-weight: 900; line-height: 1.8;">RELATED
				PRODUCT</h3>
			<div class="responsive">

				<%
				try {
					if (list.isEmpty()) {
						System.out.print("리스트가 비어있습니다.");
					}
					for (Product p : list) {
						String productCode = p.getProductCode();
						String productImage = p.getProductImage();
						String productName = p.getProductName();
						int productPrice = p.getProductPrice();
						int productSalePct = p.getProductSalePct();
						int productCategory = p.getProductCategory();
						System.out.println(productName);
				%>
				<div style="border: 1px solid gray; margin: 0px 10px">
					<img src="<%=productImage%>" width=180px height=230px>
					<div style="padding: 10px; position: relative; min-height: 75px;">
						<p
							style="overflow: hidden; width: 100%; height: 35px; word-wrpa: break-word; font-size: 13px; font-weight: 700; color: #4c4c4c; line-height: 18px;"><%=productName%></p>
						<p
							style="font-size: 14px; position: absolute; left: 10px; bottom: 10px;"><%=productPrice%>원
						</p>
					</div>
				</div>

				<%}%>
				<%
				} catch (NullPointerException e) {
				}
				%>
			</div>
		</div>



		<%-- slick javascript--%>
		<script>
		$('.responsive').slick({
			dots : false,
			<%--prevArrow: $('.prev'), 
			nextArrow: $('.next'), --%>
			infinite : false,
			speed : 300,
			slidesToShow : 5,
			slidesToScroll : 4,
			responsive : [ {
				breakpoint : 1024,
				settings : {
					slidesToShow : 3,
					slidesToScroll : 3,
					infinite : true,
					dots : false
				}
			}, {
				breakpoint : 600,
				settings : {
					slidesToShow : 2,
					slidesToScroll : 2
				}
			}, {
				breakpoint : 480,
				settings : {
					slidesToShow : 1,
					slidesToScroll : 1
				}
			} ]
		});
	</script>

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

		<div id="contents_top" align="center">

			<%-- 상품설명 이미지  --%>
			<div id="content1">
				<img src="<%=product_image%>"
					style="align: center; width: 1010px; height: 100%;">
			</div>
			<%-- #content1 scroll end --%>

			<%-- 상세정보 이미지  --%>
			<div id="content2">
				<img src="<%=product_image%>"
					style="align: center; width: 1010px; height: 100%;">

			</div>
		</div>
		<%-- #content2 scroll end --%>
	</div>
</body>
<footer>
	<div id="bigBlock">
		<div id="avgBlock">
			<div id="smallBlock1">
				<p id="happycenter">고객행복센터</p>
				<div class="clearfix"></div>

				<table class="leftTable">
					<tr class="smallBlock1-1">
						<td rowspan=2 class="smallLeftBig"><p>0000-0000</p></td>
						<td class="smallLeftsmall">365고객센터</td>
					</tr>

					<tr class="smallBlock1-2">
						<td>오전 7시-오후 7시</td>
					</tr>
				</table>
				<div class="clearfix"></div>

				<table class="leftTable">
					<tr class="smallBlock1-1">
						<td rowspan=2 class="smallLeftBig"><button>카카오톡 문의</button></td>
						<td class="smallLeftsmall">365고객센터</td>
					</tr>

					<tr class="smallBlock1-2">
						<td>오전 7시-오후 7시</td>
					</tr>
				</table>
				<div class="clearfix"></div>

				<table class="leftTable">
					<tr class="smallBlock1-1">
						<td rowspan=2 class="smallLeftBig"><button>1:1 문의</button></td>
						<td class="smallLeftsmall">24시간 접수가능</td>
					</tr>

					<tr class="smallBlock1-2">
						<td>고객센터 운영시간에 순차적으로 답변해드리겠습니다.</td>
					</tr>
				</table>
				<div class="clearfix"></div>

				<table class="leftTable">
					<tr class="smallBlock1-1">
						<td class="smallLeftBig"><button>대량주문 문의</button></td>
						<td class="smallBlock1-2">비회원의 경우 메일로 문의바랍니다.</td>
					</tr>
				</table>

				<table class="footerTable">
					<tr class="footerTable1">
						<td rowspan=2 class="footerTable2"><a href="#none"> <img
								class="Ficon" src="./images/footer/isms.png">
						</a></td>
						<td class="footerTable3"><a href="#none">[인증범위]마켓컬리 쇼핑몰
								서비스 개발 · 운영</a></td>
					</tr>

					<tr>
						<td class="footerTable3"><a href="#none">[유효기간]2019.04.01
								~ 2022.03.31</a></td>
					</tr>
				</table>

				<table class="footerTableq">
					<tr class="footerTable1">
						<td rowspan=2 class="footerTable2"><a href="#none"> <img
								class="Ficon" src="./images/footer/private.png">
						</a></td>
						<td class="footerTable3"><a href="#none">개인정보보호 우수 웹사이트 ·</a></td>
					</tr>

					<tr>
						<td class="footerTable3"><a href="#none">개인정보처리시스템
								인증(ePRIVACY PLUS)</a></td>
					</tr>
				</table>
			</div>
			<div id="smallBlock2">
				<table class="rightTable">
					<tr>
						<a href="#none">컬리소개</a>
					</tr>
					&nbsp&nbsp
					<tr>
						<a href="#none">컬리소개영상</a>
					</tr>
					&nbsp&nbsp
					<tr>
						<a href="#none">인재채용</a>
					</tr>
					&nbsp&nbsp
					<tr>
						<a href="#none">이용약관</a>
					</tr>
					&nbsp&nbsp
					<tr>
						<a href="#none"><b>개인정보처리방침</b></a>
					</tr>
					&nbsp&nbsp
					<tr>
						<a href="#none">이용안내</a>
					</tr>
				</table>

				<div id="rightDetail">
					법인명(상호):주식회사 컬리 | 사업자등록번호:123-45-67890 <a href="#none">사업자정보확인</a><br>
					통신판매업: 제 0000-서울강남-11111호 | 개인정보보호책임자:코리<br> 주소:서울특별시 강남구 테헤란로
					222,33층(역삼동) | 대표이사:타리<br> 입점문의:<a href="#nono">입점문의하기</a> |
					제휴문의:<a href="#none">business@kurlyent.com</a><br> 채용문의:<a
						href="#nono">recruit@kurlyent.com</a><br> 팩스:070-7500-6098 |
					이메일:<a href="#nono">help@kurlyent.com</a><br> 대량주문문의:<a
						href="#nono">kurlygift@kurlyent.com</a>
				</div>

				<p>© KURLY ENT.ALL RIGHTS RESERVED</p>

				<div id="iconBlock">
					<a href="#none"><img class="icon"
						src="./images/footer/instagram.jpg"></a>&nbsp <a href="#none"><img
						class="icon" src="./images/footer/facebook.png"></a>&nbsp <a
						href="#none"><img class="icon" src="./images/footer/blog.png"></a>&nbsp
					<a href="#none"><img class="icon"
						src="./images/footer/post.png"></a>&nbsp <a href="#none"><img
						class="icon" src="./images/footer/github.png"></a>&nbsp
				</div>

				<table class="footerTablew">
					<tr class="footerTable1">
						<td rowspan=2 class="footerTable2"><a href="#none"> <img
								class="FTicon" src="./images/footer/toss.png">
						</a></td>
						<td class="footerTable3"><a href="#none">고객님의 안전거래를 위해 현금
								등으로 결제 시 저희 쇼핑몰에서 가입한</a></td>
					</tr>

					<tr>
						<td class="footerTable3"><a href="#none">토스 페이먼츠
								구매안전(에스크로) 서비스를 이용할 수 있습니다.</a></td>
					</tr>
				</table>
			</div>
		</div>
	</div>
</footer>
</html>