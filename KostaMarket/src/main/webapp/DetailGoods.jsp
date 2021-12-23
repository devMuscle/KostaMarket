<%--product.vo 임포트 --%>
<!-- useBean setProperty는 언제쓰는거지? -->
<%@page import="com.KostaMarket.Product.vo.Product"%>
<%@page import="com.KostaMarket.Customer.vo.Customer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%-- util, txt 임포트 --%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>

<%-- html시작 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마켓컬리 클론</title>

<%-- import header.css --%>
<link rel="stylesheet" type="text/css" href="" />

<%-- import footer.css --%>
<link rel="stylesheet" type="text/css"
	href="./css/detailGoodsFooter.css" />

<%-- import product_detail.css --%>
<link rel="stylesheet" type="text/css" href="./css/product_detail.css">

<%-- import slick slider --%>
<link rel="stylesheet" type="text/css"
	href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />

<%-- import javascript price count --%>
<script type="text/javascript" src="./js/DetailGoods.js" charset="utf-8"%></script>

<%-- import javascript slick slider --%>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript"
	src="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>

<%-- 페이지 내 부드럽게 이동 및 slick 스타일 재정의--%>
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
	<%-- product vo 변수 선언 --%>
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
	int product_category;
	int product_sale_price;
	String product_sale_price2;
	String contents_image1;
	String contents_image2;
	%>
	<%-- 로그인 세션정보 불러오기 --%>
	<%
	//HttpSession customerObj = session.getAttribute("idInfo");
	String customerId = (String)session.getAttribute("idInfo");
	if(customerId==null){
		System.out.println("비어있습니다." + customerId);
	} else{
		System.out.println("아이디"+customerId);
	}
	%>
	<%-- 현재상품 정보 불러오기 Product 오브젝 형태--%>
	<%
	Product productObj = (Product) request.getAttribute("product");
	
	//session처럼 해도 되나?
	product_code = productObj.getProductCode();
	product_allergy = productObj.getProductAllergy();
	product_breeding_code = productObj.getProductBreedingCode();
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

	product_sale_price = (product_price * (100-product_sale_pct)) / 100;
	System.out.println(product_sale_price);
	DecimalFormat df = new DecimalFormat("###,###");
	String product_price2;
	product_price2 = df.format(product_price);
	product_sale_price2 = df.format(product_sale_price);
	
	contents_image1 = product_image.substring(1);
	System.out.println(contents_image1);
	contents_image2 = product_image.substring(1,24);
	contents_image2 = contents_image2 + ".webp";
	System.out.println(contents_image2);
	%>

	<%-- 연관상품 정보 불러오기 List 형태 --%>
	<%
	List<Product> list = (List) request.getAttribute("list");
	%>

	<%-- 본격적인 HTML 바디의 시작 --%>
	<div>
		<%--상품 메인이미지 상품소개 정보 판매단위, 중량/용량 등 시작 --%>
		<div id="body_product" style="height: auto;">
			<br>
			<div id="main">
				<div id="content" style="opacity: 1;">
					<div class="section_view">

						<div id="shareLayer">
							<div class="layer_share">
								<%--안보이는 공유 div 레이어 시작--%>
								<div class="inner_layersns">
									<h3 class="screen_out">SNS 공유하기</h3>
									<ul class="list_share">
										<li><a class="btn btn_fb" data-sns-name="페이스북"
											data-sns="facebook" href="#none"> <img
												src="./images/product/ico_facebook.jpg" alt="페이스북"> <span
												class="txt">공유하기</span>
										</a></li>
										<li><a class="btn btn_tw" data-sns-name="트위터"
											data-sns="twitter" href="#none"> <img
												src="./images/product/ico_twitter.jpg" alt="트위터"> <span
												class="txt">트윗하기</span>
										</a></li>
										<li class="btn_url"><input type="text" class="inp"
											value="변경해야함" readonly="readonly"> <a
											class="btn_copy off" data-sns-name="링크 복사" data-sns="copy"
											href="#none"> URL 복사 <img
												src="./img/product/ico_checked_x2.jpg" alt="">
										</a></li>
									</ul>
								</div>
								<%--안보이는 공유 div 레이어 끝--%>
							</div>

						</div>

						<div id="sectionView">
							<%-- 상품소개 정보 판매단위, 중량/용량 등 시작 --%>
							<div class="inner_view">
								<div class="thumb">
									<img src="<%=product_image%>" class="bg">
								</div>
								<%--상품명--%>
								<p class="goods_name">
									<span class="btn_share">
										<button id="btnShare" onclick="onDisplay();">테스트용 텍스트</button>
									</span> <strong class="name"><%=product_name%></strong> <span
										class="short_desc"></span>
								</p>

								<p class="goods_price">
									<%if(product_sale_pct>0){ %>
									<%--할인된 금액  --%>
									<span class="position"> <span class="dc"> <span
											class="dc_price"> <span class="won" id="price"><%=product_sale_price2%>원</span>
												<span class="dc_percent"> <span class="per"> <%=product_sale_pct%>%
												</span>
											</span>
										</span>
									</span> <a class="original_price"> <span class="price"><%=product_price2%>원</span></span>
									<%} 
								else { %><%--할인 하지 않은 금액--%>
									<span class="position"> <span class="dc"> <span
											class="dc_price"> <span class="won" id="price">
													<%=product_price2%>원
											</span>
										</span>
									</span>
									</span>
									<%} %>
									<%--로그인 여부 및 적립금 비교 구현필요 --%>
									<span class="not_login"> <span>로그인 후, 적립혜택이
											제공됩니다.</span>
									</span>
								</p>
								<%-- 상품명 가격 적립금 p태그 끝 --%>

								<%-- 상품정보 판매, 중량/용량 등 시작 --%>
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
										<dd class="desc"><%=product_delivery%></dd>
									</dl>
									<%if (product_country_origin != null) {%>
									<dl class="list">
										<dt class="tit">원산지</dt>
										<dd class="desc"><%=product_country_origin%></dd>
									</dl>
									<%} else {}%>
									<dl class="list">
										<dt class="tit">포장타입</dt>
										<dd class="desc">
											<%=product_packing%>
											<br> <strong class="emph">택배배송은 에코포장이 스티로폼으로
												대체됩니다.</strong>
										</dd>
									</dl>
									<%if (product_country_origin != null) {%>
									<dl class="list">
										<dt class="tit">알레르기정보</dt>
										<dd class="desc"><%=product_country_origin%></dd>
									</dl>
									<%} else{}%>

									<%if (product_expiration != null) {%>
									<dl class="list">
										<dt class="tit">유통기한</dt>
										<dd class="desc"><%=product_expiration%></dd>
									</dl>
									<%} else {}%>

									<%if (product_breeding_code != null) {%>
									<dl class="list">
										<dt class="tit">사육환경번호</dt>
										<dd class="desc"><%=product_breeding_code%></dd>
									</dl>
									<%} else {}%>

									<%if (product_livestock_history != null) {%>
									<dl class="list">
										<dt class="tit">축산물이력정보</dt>
										<dd class="desc"><%=product_livestock_history%></dd>
									</dl>
									<%} else {}%>

									<%if (product_instructions != null) {%>
									<dl class="list">
										<dt class="tit">안내사항</dt>
										<dd class="desc"><%=product_instructions%></dd>
									</dl>
									<%} else {}%>
								</div>
								<%--상품정보 판매, 중량/용량 등 끝--%>
							</div>
						</div>

						<%--장바구니 담기 시작 --%>
						<div id="cartPut">
							<div class="cart_option cartList cart_type2">
								<div class="inner_option">
									<div class="in_option">
										<div class="list_goods">
											<ul id="ul_product" class="list list_nopackage"
												style="padding: 0px;">
												<li class="on"><span class="btn_position"> </span> <span
													class="tit_item">구매수량</span>
													<div class="option">
														<span class="count"> <input id="plusbtn"
															type='button' onclick='count("plus"), sum("plus")' /> <input
															id="minusbtn" type='button'
															onclick='count("minus"), sum("minus")' /> <span
															id='result'>1</span>
														</span>
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
											<%--로그인 비교 구현 필요 --%>
											<p class="txt_point">
												<span class="ico">적립</span> <span class="no_login"> <span>로그인
														후, 적립혜택 제공</span>
												</span>
											</p>
											<p class="txt_point">
												<span class="ico">적립</span> <span class="no_login"> <span>구매
														시 원 적립</span>
												</span>
											</p>
										</div>
									</div>
									<div class="group_btn off">
										<div class="view_function">
											<button id="button_product" type="button"
												class="btn btn_alarm">재입고 알림</button>
										</div>
										<span class="btn_type1">
											<button type="button" class="txt_type"
												onclick='addCartList("<%=product_code%>","<%=customerId%>")'>
												장바구니 담기</button>
										</span>
									</div>
								</div>
							</div>
							<%--옵션정보 있을 경우 구현 필요 --%>
							<div class="cart_option cartList cart_type1">
								<div class="inner_option">
									<div class="in_option">
										<div class="list_goods">
											<div class="bar_open">
												<button id="button_product" type="button" class="btn_close">
													<span class="ico">상품 선택</span>
												</button>
											</div>
										</div>
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
						
						DecimalFormat ddf = new DecimalFormat("###,###");
						String productPrice2 = null;
						productPrice2 = ddf.format(productPrice);
				%>
				<div style="border: 1px solid gray; margin: 0px 10px">
					<a
						href="http://localhost:8888/KostaMarket/detailgoods?product_code=<%=productCode%>">
						<img src="<%=productImage%>" width=180px height=230px>
					</a>
					<div style="padding: 10px; position: relative; min-height: 75px;">
						<p
							style="overflow: hidden; margin-top: 0px; margin-bottom: 30px; top: 10px; width: 100%; height: 35px; font-size: 13px; font-weight: 700; color: #4c4c4c; line-height: 18px; display: -webkit-box; -webkit-box-orient: vertical; -webkit-line-clamp: 1;"><%=productName%></p>
						<p
							style="font-size: 13px; position: absolute; left: 10px; bottom: 10px;"><%=productPrice2%>원
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
				<img src="./images<%=contents_image1%>"
					style="align: center; width: 1010px; height: 100%;">
			</div>
			<%-- #content1 scroll end --%>

			<%-- 상세정보 이미지  --%>
			<div id="content2">
				<img src="./images<%=contents_image2%>"
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