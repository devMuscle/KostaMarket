<%@page import="com.KostaMarket.Cart.vo.Cart"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
List<Cart> list = (List)request.getAttribute("list");
%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="shortcut icon" type="image/x-icon" href="./images/favicon.ico" />
<title>마켓컬리 :: 내일의 장보기, 마켓컬리</title>
    <link rel="stylesheet" type="text/css" href="./css/payment.css" />
    <div id="includedHeader"></div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="./js/payment.js">></script>
    <script>
	    $(function(){
	  	  $("#includedHeader").load("header.jsp");
	    });
	    $(function(){
	        $("#includedContent").load("footer1.html");
	      });
    </script>
  </head>
  <body class="order-order">
    <div id="container">
      <div id="main">
        <div class="tit_page">
          <h2 class="tit">주문서</h2>
        </div>
        <div id="content">
          <div class="user_form">
            <!-- 주문 상품 Start-->
            <h2 class="tit_section fst">주문상품</h2>
            <div id="itemList" class="page_aticle order_goodslist">
              <div class="info_product" onclick="listDropDown">
                <a class="btn" href="#" id="drop_down">
                  <img src="" />
                </a>
                <% String productName = null;
                String email = null;
                String name = null;
                String phone = null;
                String detailAddress = null;
                String roadAddress = null;
                String id = null;
                int totalPrice = 0;
                int salePct = 0;
                int memberShipPoint = 0;
                int flag = 0;
                for(Cart c : list) { 
                	id = c.getID();
                	productName = c.getProductName();
                	email = c.getEmail();
                	name = c.getName();
                	phone = c.getPhone();
                	roadAddress = c.getRoadAddress();
                	detailAddress = c.getDetailAddress();
                	memberShipPoint = c.getMemberShipPoint();
                } %>
                <div class="short_info">
                  <%=productName %> 외
                  <span class="num"><%=list.size()%></span>개의 상품을 주문합니다.
                </div>
              </div>
              <!--장바구니에 담긴 제품 주문 리스트 Start-->
              <ul class="list_product">
              	<%try {
              		for(Cart c : list) {
              			String productImage = c.getProductImage();
						productName = c.getProductName();
						String productCode = c.getProductCode();
						int productCount = c.getProductCount();
						int productPrice = c.getProductPrice();
						int productSalePct = c.getProductSalePct();
              		%>
                <li>
                  <div class="thumb">
                    <img
                      src="<%=productImage %>"
                      alt="상품이미지"
                    />
                  </div>
                  <div class="name">
                    <div class="inner_name">
                      <%=productName %>
                    </div>
                  </div>
                  <div class="ea"><%=productCount %></div>
                  <div class="info_price">
                    <span class="num">
                      <span class="price"><%=productCount * productPrice %></span>
                    </span>
                  </div>
                   <div id ="aa<%=flag %>" value = '<%=productCode %>' style = "visibility: hidden"></div>
                </li>
                <%	flag++; 
                totalPrice += productPrice * productCount;
				if(productSalePct > 0) {
					salePct += ((productPrice * productSalePct) / 100) * productCount;
				}	
				} 
              	} catch (NullPointerException e) {
              		e.printStackTrace();
              	}%>
              </ul>
              <!--장바구니에 담긴 제품 주문 리스트 End-->
            </div>
            <!-- 주문 상품 end-->
            <!--주문자 정보 Start-->
            <form id="form" name="frmOrder" method="post" class="order_view">
              <h2 class="tit_section" id="titFocusOrderer">주문자 정보</h2>
              <div class="order_section data_orderer">
                <table class="goodsinfo_table">
                  <tbody>
                    <tr class="fst">
                      <th>보내는 분</th>
                      <td>
                        <%=name %>
                        <input
                          type="hidden"
                          id = "nameId"
                          name="orderer_name"
                          value="<%=id %>"
                        />
                      </td>
                    </tr>
                    <tr>
                      <th>휴대폰</th>
                      <td>
                        <%=phone %>
                        <input
                          type="hidden"
                          name="orderer_phone"
                          value="01049357423"
                        />
                      </td>
                    </tr>
                    <tr>
                      <th>이메일</th>
                      <td>
                        <input
                          type="hidden"
                          id="email"
                          name="orderer_email"
                          value="cocoroto@naver.com"
                          option="regEmail"
                        />
                        <%=email %>
                        <p class="txt_guide">
                          <span class="txt txt_case1"
                            >이메일을 통해 주문처리과정을 보내드립니다.</span
                          >
                          <span class="txt txt_case2"
                            >정보 변경은
                            <span class="txt_desc"
                              >마이컬리 &gt; 개인정보 수정</span
                            >
                            메뉴에서 가능합니다.</span
                          >
                        </p>
                      </td>
                    </tr>
                  </tbody>
                </table>
              </div>
            </form>
            <!-- 주문자 정보 End-->
            <!--배송정보 Start-->
            <h2 class="tit_section" id="divAddressWrapper">
              배송 정보
              <span class="desc"
                >배송 휴무일: 샛별배송(휴무없음), 택배배송(일요일)</span
              >
            </h2>
            <div class="order_section order_address" id="dataDelivery">
              <h3 href="#none" class="section_crux">배송지</h3>
              <div class="section_full">
                <span class="address" id="divDestination" style="">
                  <span
                    class="default on"
                    id="addrDefault"
                    data-text="기본배송지"
                    >기본배송지</span
                  >
                  <span class="addr" id="addrInfo"
                    ><%=roadAddress %> <br>
                    <%=detailAddress %></span
                  >
                  <span class="tag" id="addrTags">
                    <span class="badge star" id="addrBadge">샛별배송</span>
                  </span>
                </span>
              </div>
              <div
                class="order_section order_reception"
                id="divReception"
                style=""
              >
                <h3 class="section_crux">상세 정보</h3>
                <div class="section_full">
                  <div class="receiving" id="receiverInfo">
                    <%=name %>, <%=phone %>
                  </div>
                  <div class="way" id="wayPlace">
                    <span class="place" id="areaInfo">문 앞</span>

                    <span class="txt" id="meanType">공동현관 비밀번호</span>

                    <div class="message" id="deliveryMessage" style="">
                      <span class="place" id="deliveryMessageTitle"
                        >배송완료 메시지</span
                      >
                      <span class="txt" id="deliveryMessageDetail"
                        >오전 7시</span
                      >
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <!--배송정보 End-->
            <!-- All Pater 안내 배너 Start-->
            <div id="bnrOrder" class="bnr_order" style="display: block">
              <img
                src="images/payment/banner-order-paper_1050_107@2x.webp"
                alt="All Paper Challenge"
              />
              <p class="screen_out">
                사람에게도 환경에도 더 이로운 배송 친환경 포장재 자세히 보기
              </p>
            </div>
            <!--All Pater 안내 배너 End-->
            <!--결제 금액 안태 창 Start-->
            <div class="tax_absolute">
              <div class="inner_sticky" id="sticky" style="top: 0px">
                <h2 class="tit_section">결제금액</h2>
                <div id="orderitem_money_info">
                  <dl class="amount fst">
                    <dt class="tit">주문금액</dt>
                    <dd class="price">
                      <span id="productsTotalPrice"><%=totalPrice - salePct %></span> 원
                    </dd>
                  </dl>
                  <dl class="amount sub">
                    <dt class="tit">상품금액</dt>
                    <dd class="price">
                      <span id="paper_goodsprice"><%=totalPrice %></span> 원
                    </dd>
                  </dl>
                  <dl class="amount sub">
                    <dt class="tit">상품할인금액</dt>
                    <dd class="price sales_area">
                      <span class="pm_sign normal" style="display: inline"
                        >-</span
                      >
                      <span id="special_discount_amount" class="normal"
                        ><%=salePct %></span
                      >
                      원
                    </dd>
                    <dd id="paper_sale" class="screen_out"><%=salePct %></dd>
                  </dl>
                  <dl class="amount">
                    <dt class="tit">배송비</dt>
                    <dd class="price delivery_area">
                      <div id="paper_delivery_msg1" style="display: block">
                        <span class="pm_sign" style="display: none">+</span>
                        <span id="paper_delivery" class="">0</span>
                        <span id="paper_delivery2" style="display: none"
                          >0</span
                        >
                        원
                      </div>
                      <div id="paper_delivery_msg2" style="display: none"></div>
                      <div
                        id="paper_delivery_msg_extra"
                        class="small"
                        style="display: none"
                      ></div>
                      <span id="free_delivery_coupon_msg" class="screen_out"
                        >미적용</span
                      >
                      <input type="hidden" name="free_delivery" value="0" />
                    </dd>
                  </dl>
                  <dl class="amount">
                    <dt class="tit">쿠폰할인금액</dt>
                    <dd class="price coupon_area">
                      <span class="pm_sign" style="display: none">-</span>
                      <span id="apr_coupon_data">0</span>
                      원
                      <input
                        type="hidden"
                        name="coupon"
                        size="12"
                        value="0"
                        readonly=""
                      />
                    </dd>
                  </dl>
                  <dl class="amount">
                    <dt class="tit">적립금사용</dt>
                    <dd class="price">
                      <span class="num pay_sum" id="paper_reserves">0 원</span>
                      <input
                        type="hidden"
                        name="coupon_emoney"
                        size="12"
                        value="0"
                        readonly=""
                      />
                    </dd>
                  </dl>
                  <dl class="amount lst">
                    <dt class="tit">최종결제금액</dt>
                    <dd class="price">
                      <span id="paper_settlement"><%=totalPrice - salePct %></span>
                      <span class="won">원</span>
                    </dd>
                  </dl>
                  <p class="reserve" style="display: block">
                    <span class="ico">적립</span> 구매 시
                    <span class="emph"
                      ><span id="expectAmount" value = "<%=(int)((totalPrice - salePct) * 0.05) %>"><%=(int)((totalPrice - salePct) * 0.05) %></span> 원 (<span
                        class="ratio"
                        >5</span
                      >%) 적립</span
                    >
                  </p>
                </div>
              </div>
            </div>
            <!--결제 금액 안내 창 End-->
            <!--쿠폰 적립금 Strat-->
            <div class="data_payment">
              <div class="tbl_left">
                <h2 class="tit_section">쿠폰 / 적립금</h2>

                <table class="goodsinfo_table">
                  <tbody>
                    <tr>
                      <th>쿠폰 적용</th>
                      <td>
                        <div class="view_popselbox">
                          <div id="popselboxView" class="select_box">
                            사용 가능 쿠폰 <span id="useCoupon">1</span>개 /
                            전체 <span id="haveCoupon">1</span>개
                          </div>
                          <div id="popSelbox" class="layer_coupon">
                            <ul id="addpopSelList" class="list">
                              <li class="fst checked">
                                <div class="inner_item">
                                  <span class="txt_tit default"
                                    >쿠폰 적용 안 함</span
                                  >
                                </div>
                              </li>
                              <li>
                                <div class="inner_item">
                                  <div class="item_row">
                                    <div class="item_td left">
                                      <span class="txt_apr">9,000</span
                                      ><span class="txt_is_dc">원 할인</span>
                                    </div>
                                    <div class="item_td">
                                      <span class="txt_tit"
                                        >9천원 할인쿠폰(4만원 이상 주문, 만료일
                                        24시까지)</span
                                      >
                                      <span class="txt_desc"
                                        >4만원 이상 주문 시 9천원 할인</span
                                      >
                                      <span class="txt_expire"
                                        >유효기간 2021-12-29 까지</span
                                      >
                                      <div
                                        id="apply_delivery_coupon"
                                        class="is_delivery_coupon"
                                        style="display: none"
                                      >
                                        0
                                      </div>
                                      <div
                                        class="txt_apply_coupon"
                                        style="display: none"
                                      >
                                        796186377
                                      </div>
                                      <ul
                                        id="payment_gateways"
                                        style="display: none"
                                      >
                                        <li>ALL</li>
                                      </ul>
                                      <div
                                        id="point_allowed"
                                        style="display: none"
                                      >
                                        true
                                      </div>
                                      <span
                                        class="credit_card_id"
                                        style="display: none"
                                      ></span>
                                    </div>
                                  </div>
                                </div>
                              </li>
                            </ul>
                            <div
                              class="coupon_list_default"
                              style="display: none"
                            >
                              <li class="fst checked">
                                <div class="inner_item">
                                  <span class="txt_tit default"
                                    >쿠폰 적용 안 함</span
                                  >
                                </div>
                              </li>
                            </div>
                            <div id="listItem" style="display: none">
                              <div class="inner_item">
                                <div class="item_row">
                                  <div class="item_td left">
                                    <span class="txt_apr"></span>
                                  </div>
                                  <div class="item_td">
                                    <span class="txt_tit"></span>
                                    <span class="txt_desc"></span>
                                    <span class="txt_expire"></span>
                                    <div
                                      id="apply_delivery_coupon"
                                      class="is_delivery_coupon"
                                      style="display: none"
                                    ></div>
                                    <div
                                      class="txt_apply_coupon"
                                      style="display: none"
                                    ></div>
                                    <ul
                                      id="payment_gateways"
                                      style="display: none"
                                    ></ul>
                                    <div
                                      id="point_allowed"
                                      style="display: none"
                                    ></div>
                                    <span
                                      class="credit_card_id"
                                      style="display: none"
                                    ></span>
                                  </div>
                                </div>
                              </div>
                            </div>
                            <button
                              id="popSelboxCancel"
                              type="button"
                              class="btn btn_cancel screen_out"
                            >
                              취소
                            </button>
                            <button
                              id="popSelboxSelect"
                              type="button"
                              class="btn btn_conf screen_out"
                            >
                              확인
                            </button>
                            <button
                              id="popSelboxClose"
                              type="button"
                              class="btn_close screen_out"
                            >
                              닫기
                            </button>
                          </div>
                        </div>
                        <div
                          id="notavailableMsg"
                          class="txt_notavailable"
                          style="display: none"
                        ></div>
                        <p class="txt_inquiry">
                          <a href="#none" class="link" id="happyTalk"
                            >쿠폰사용문의(카카오톡)</a
                          >
                        </p>
                      </td>
                    </tr>
                    <tr class="emoney_use">
                      <th class="">
                        적립금 적용
                        <input type="hidden" value="1667" name="checkEmoney" />
                      </th>
                      <td>
                        <div id="ondealCheck">
                          <div class="emoney_reg">
                            <input
                              type="text"
                              name="using_point"
                              id="emoney"
                              class="number_only"
                              value=""
                              placeholder="0"
                              pattern="[0-9]*"
                              inputmode="decimal"
                              onblur="chk_emoney(this);"
                              onkeyup="debounceCalcuSettle();"
                              onkeydown="if (event.keyCode == 13) {return false}"
                            />
                            <div class="check">
                              <label class="emoney_chkbox">
                                <input type="checkbox" name="" />
                                <span class="txt_checkbox">모두사용</span>
                              </label>
                            </div>
                          </div>
                          <p class="possess">
                            보유 적립금 :
                            <strong class="emph"><%=memberShipPoint %></strong>원
                            <input
                              type="hidden"
                              name="emoney_max"
                              value="1667"
                            />
                          </p>
                          <ul class="list_notice">
                            <li>· 보유 적립금 1천원 이상부터 사용가능</li>
                            <li>· 적립금 내역: 마이컬리 &gt; 적립금</li>
                          </ul>
                        </div>
                        <p id="msgNomoney"></p>
                      </td>
                    </tr>
                  </tbody>
                </table>
              </div>
            </div>
            <!-- 쿠폰 적립금 End-->

            <!--결제 수단Start-->
            <div class="data_method">
              <h2 class="tit_section" id="titFocusMethod">결제 수단</h2>

              <input type="hidden" name="escrow" value="N" />
              <div class="type_form" style="display: block">
                <input type="hidden" name="save_payment_method" value="true" />
                <label>
                  <input
                    type="checkbox"
                    name="check_save_payment_method"
                    checked="checked"
                  />
                  <span class="ico"></span>
                  선택한 결제 수단을 다음에도 사용
                </label>
              </div>
              <table class="goodsinfo_table tbl_left">
                <tbody>
                  <tr>
                    <th>결제수단 선택</th>
                    <td>
                      <div class="payment_first">
                        <label
                          id="kakaopayPayment"
                          class="kakaopay"
                          data-payment="kakao"
                        >
                          <input
                            type="radio"
                            name="settlekind"
                            value="kakao-pay"
                            onclick="input_escrow(this,'N')"
                            checked="checked"
                          />
                          <img
                            src="https://res.kurly.com/mobile/service/order/2109/ico_kakao-pay.png"
                            alt="카카오페이"
                            class="logo_kakao"
                          />
                          <span
                            id="paymentBenefitKakao"
                            class="icon_benefit"
                            style="display: inline"
                            >혜택</span
                          >
                        </label>
                        <div
                          id="only_kakao"
                          class="credit_montly_wrap"
                          style="display: none"
                        >
                          <p class="title">
                            카카오페이
                            <span
                              class="kakaopay_benefit_icon"
                              style="display: inline"
                              >혜택</span
                            >
                          </p>
                          <p class="guide">
                            카카오페이 전용 쿠폰 사용 시, 카카오페이 결제만
                            가능합니다.
                          </p>
                        </div>
                      </div>

                      <ul class="menu_payment">
                        <li class="card on">
                          <label
                            class="checked"
                            id="settlekindCard"
                            onclick="option_pay_standard('');"
                            data-payment="card"
                          >
                            <input
                              type="radio"
                              name="settlekind"
                              value="c"
                              onclick="input_escrow(this,'N');"
                            />
                            신용카드
                            <span id="paymentBenefitCard" class="icon_benefit"
                              >혜택</span
                            >
                          </label>
                        </li>
                        <li class="simple">
                          <label for="paymentChai" data-payment="simple">
                            간편결제
                            <span
                              id="paymentBenefitSimple"
                              class="icon_benefit"
                              style="display: inline"
                              >혜택</span
                            >
                          </label>
                        </li>
                        <li class="phone">
                          <label data-payment="mobilians">
                            <input
                              type="radio"
                              data-phone="mobilians"
                              name="settlekind"
                              value="h"
                              onclick="input_escrow(this,'N')"
                            />
                            휴대폰
                          </label>
                        </li>
                      </ul>

                      <div class="card_detail" style="display: block">
                        <div id="cardSelect">
                          <div>
                            <div class="card_select">
                              <div class="select_box">
                                <strong class="tit">현대 (무이자)</strong>
                                <input
                                  type="hidden"
                                  name="lguplus_card_code"
                                  value="61"
                                />
                                <ul class="list off">
                                  <li><a class="on">현대 (무이자)</a></li>
                                  <li><a class="">신한 (무이자)</a></li>
                                  <li><a class="">비씨 (무이자)</a></li>
                                  <li><a class="">KB국민 (무이자)</a></li>
                                  <li><a class="">삼성 (무이자)</a></li>
                                  <li><a class="">씨티 (무이자)</a></li>
                                  <li><a class="">롯데 (무이자)</a></li>
                                  <li><a class="">하나(외환) (무이자)</a></li>
                                  <li><a class="">NH채움 (무이자)</a></li>
                                  <li><a class="">우리 (무이자)</a></li>
                                  <li><a class="">수협</a></li>
                                  <li><a class="">광주 (무이자)</a></li>
                                  <li><a class="">전북 (무이자)</a></li>
                                  <li><a class="">제주</a></li>
                                  <li><a class="">신협체크</a></li>
                                  <li><a class="">MG새마을체크</a></li>
                                  <li><a class="">저축은행체크</a></li>
                                  <li><a class="">우체국카드</a></li>
                                  <li><a class="">KDB산업은행</a></li>
                                  <li><a class="">카카오뱅크</a></li>
                                </ul>
                              </div>
                              <div class="select_box">
                                <strong class="tit">일시불</strong>
                                <input
                                  type="hidden"
                                  name="lguplus_card_installment_month"
                                  value="0"
                                />
                                <ul class="list off">
                                  <li><a class="on">일시불</a></li>
                                  <li><a class="">2개월 (무이자)</a></li>
                                  <li><a class="">3개월 (무이자)</a></li>
                                  <li><a class="">4개월 (무이자)</a></li>
                                  <li><a class="">5개월 (무이자)</a></li>
                                  <li><a class="">6개월 (무이자)</a></li>
                                  <li><a class="">7개월 (무이자)</a></li>
                                  <li><a class="">8개월</a></li>
                                  <li><a class="">9개월</a></li>
                                  <li><a class="">10개월</a></li>
                                  <li><a class="">11개월</a></li>
                                  <li><a class="">12개월</a></li>
                                </ul>
                              </div>
                            </div>
                            <!---->
                            <div class="card_noti">
                              은행계열/체크/기프트/선불/법인/개인사업자
                              기업카드는 무이자 할부 시 제외
                            </div>
                            <!---->
                          </div>
                        </div>
                      </div>

                      <ul
                        id="simplePayments"
                        class="payments"
                        style="display: none"
                      >
                        <li class="chai">
                          <label class="label_radio" for="paymentChai">
                            <input
                              type="radio"
                              name="settlekind"
                              value="chai"
                              onclick="input_escrow(this,'N')"
                              id="paymentChai"
                            />
                            차이
                            <span class="txt_benefit" style="display: inline"
                              >혜택</span
                            >
                          </label>
                        </li>
                        <li class="toss">
                          <label class="label_radio">
                            <input
                              type="radio"
                              name="settlekind"
                              value="toss"
                              onclick="input_escrow(this,'N')"
                            />
                            토스
                            <span class="txt_benefit" style="display: inline"
                              >혜택</span
                            >
                          </label>
                        </li>
                        <li class="npay naver-pay">
                          <label class="label_radio">
                            <input
                              type="radio"
                              name="settlekind"
                              value="n"
                              onclick="input_escrow(this,'N');"
                            />
                            네이버페이
                            <span class="txt_benefit">혜택</span>
                          </label>
                        </li>
                        <li class="payco">
                          <label class="label_radio">
                            <input
                              type="radio"
                              name="settlekind"
                              value="t"
                              onclick="input_escrow(this,'N');check_naverNcashUseAble();"
                            />
                            페이코
                            <span class="txt_benefit" style="display: inline"
                              >혜택</span
                            >
                          </label>
                        </li>
                        <li class="spay smile-pay">
                          <label class="label_radio">
                            <input
                              type="radio"
                              name="settlekind"
                              value="s"
                              onclick="input_escrow(this,'N')"
                            />
                            스마일페이
                            <span class="txt_benefit">혜택</span>
                          </label>
                        </li>
                      </ul>

                      <div class="benefit_event">
                        <div
                          id="cardBenefitKakaopay"
                          class="benefit kakao on"
                          style="display: none"
                        >
                          <strong class="tit_benefit">카카오페이</strong>
                          <p class="sub_benefit">
                            6만원 이상 결제 시 <span>3천원 즉시할인</span>
                          </p>
                          <p class="info_benefit">
                            <span class="info"
                              >· 12/27 00시 ~ 12/31 24시, 카카오페이 ID당
                              1회(실명인증 기준), 선착순</span
                            >
                          </p>
                        </div>

                        <div
                          id="cardBenefitSimple"
                          class="benefit on"
                          style="display: none"
                        >
                          <div id="cardBenefitChai" class="simple">
                            <strong class="tit_benefit">차이</strong>
                            <p class="sub_benefit">
                              2만원 이상 생애 첫 결제 시
                              <span>3천원 즉시할인</span>
                            </p>
                            <p class="info_benefit">
                              <span class="info"
                                >· 12/1 11시 ~ 12/31 24시, 기간 내 차이 ID당
                                1회, 선착순</span
                              >
                            </p>
                          </div>
                          <div id="cardBenefitToss" class="simple">
                            <strong class="tit_benefit">토스</strong>
                            <p class="sub_benefit">
                              6만원 이상 결제 시 <span>3천원 즉시할인</span>
                            </p>
                            <p class="info_benefit">
                              <span class="info"
                                >· 12/27 00시 ~ 12/31 24시, 기간 내 1회, 선착순
                                토스로 결제 시 적용</span
                              >
                            </p>
                          </div>
                          <div id="cardBenefitNaverpay" class="simple"></div>
                          <div id="cardBenefitPayco" class="simple">
                            <strong class="tit_benefit">페이코</strong>
                            <p class="sub_benefit">
                              페이코 충전포인트로 결제할 때마다
                              <span>최대 10% 적립</span>
                            </p>
                            <p class="info_benefit">
                              <span class="info"
                                >· 12/27 00시 ~ 12/31 24시, 상시 5% + 추가 5%
                                페이코 포인트 더블 적립 (건당 최대 2,000원)<br />·
                                페이코로 15,000원 이상 구매 시 페이코 앱 내
                                1천원 쿠폰 적용 (1일 ID당 1회)<br />· *페이코 앱
                                내 쿠폰영역에서 마켓컬리 쿠폰 다운로드, 결제 시
                                페이코 앱 내 적용</span
                              >
                            </p>
                          </div>
                          <div id="cardBenefitSmilepay" class="simple"></div>
                        </div>
                      </div>
                    </td>
                  </tr>
                  <tr>
                    <td class="txt_notice" colspan="2">
                      <ul>
                        <li>
                          ※ 카카오페이, 차이, 토스, 네이버페이, 페이코 결제 시,
                          결제하신 수단으로만 환불되는 점 양해부탁드립니다.
                        </li>
                        <li>
                          ※ 고객님은 안전거래를 위해 현금 등으로 결제시 저희
                          쇼핑몰에서 가입한 토스 페이먼츠의 구매안전(에스크로)
                          서비스를 이용하실 수 있습니다.
                        </li>

                        <li id="coupon_typinfo" style="display: none">
                          ※ 무통장입금에서만 사용가능한 쿠폰을 선택하였습니다.
                          다른 결제 수단을 선택하시려면 쿠폰을 제거 하여
                          주십시오.
                        </li>
                      </ul>
                    </td>
                  </tr>
                </tbody>
              </table>
              <input type="hidden" name="undeliver_way" value="2" />

              <div id="cash" style="display: none">
                <h2 class="tit_section">현금영수증발급</h2>
                <table class="goodsinfo_table">
                  <tbody>
                    <tr>
                      <th>현금영수증</th>
                      <td>
                        <label class="label_radio">
                          <input
                            type="radio"
                            name="cashreceipt"
                            value="Y"
                            onclick="cash_required()"
                          />
                          신청
                        </label>
                        <label class="label_radio checked">
                          <input
                            type="radio"
                            name="cashreceipt"
                            value="N"
                            onclick="cash_required()"
                            checked=""
                          />
                          신청안함
                        </label>
                      </td>
                    </tr>
                    <tr>
                      <th>발행용도</th>
                      <td>
                        <label class="label_radio checked">
                          <input
                            type="radio"
                            name="cashuseopt"
                            value="0"
                            onclick="setUseopt()"
                            checked=""
                          />
                          소득공제용
                        </label>
                        <label class="label_radio">
                          <input
                            type="radio"
                            name="cashuseopt"
                            value="1"
                            onclick="setUseopt()"
                          />
                          지출증빙용
                        </label>
                      </td>
                    </tr>
                    <tr>
                      <th>
                        <span id="cert_0" style="display: block"
                          >휴대폰번호</span
                        >
                        <span id="cert_1" style="display: none"
                          >사업자번호</span
                        >
                      </th>
                      <td style="padding-top: 14px">
                        <input
                          type="text"
                          name="cashcertno"
                          value=""
                          option="regNum"
                          class="line"
                          placeholder="- 생략"
                        />
                      </td>
                    </tr>
                  </tbody>
                </table>
              </div>
              <script></script>
            </div>
            <!--결제 수단 End-->
            <!-- 개인정보 수집 제공 동의 Start-->
            <h2 class="tit_section" id="titFocusAgree">개인정보 수집/제공</h2>
            <table class="goodsinfo_table">
              <tbody>
                <tr>
                  <td class="reg_agree">
                    <div class="bg_dim"></div>
                    <div class="check type_form">
                      <label class="agree_check">
                        <input
                          type="checkbox"
                          name="ordAgree"
                          value="y"
                          required=""
                          fld_esssential=""
                          label="결제 진행 필수 동의"
                          msgr="결제 진행 필수 동의 내용에 동의하셔야 결제가 가능합니다."
                        />
                        <span class="ico"></span>
                        결제 진행 필수 동의
                      </label>
                      <ul class="list_agree">
                        <li>
                          <span class="subject"
                            >개인정보 수집 · 이용 및 처리 동의
                            <span class="emph">(필수)</span></span
                          >
                          <a href="#" class="link_terms">보기</a>
                        </li>
                        <li id="pgTerms" style="display: list-item">
                          <span class="subject"
                            >결제대행 서비스 약관 동의
                            <span class="emph">(필수)</span></span
                          >
                          <a href="#" class="link_terms">보기</a>
                        </li>
                        <li id="kurlyTerms">
                          <span class="subject"
                            >전자지급 결제대행 서비스 이용약관 동의
                            <span class="emph">(필수)</span></span
                          >
                          <a href="#" class="link_terms">보기</a>
                        </li>
                      </ul>
                    </div>
                  </td>
                </tr>
              </tbody>
            </table>
            <!-- 개인정보 수집 제공 동의 End-->
            <!-- 결제하기 버튼 Start -->
            <input
              type="button"
              value="<%=totalPrice %>원 결제하기"
              id = "btn_paypay"
              class="btn_payment" onclick = "pay(<%=flag %>)"
            />
            <!-- 결제하기 버튼 End-->
            <!-- 결제 버튼 밑 안내사항 Start-->
            <ul class="notice_order">
              <li>직접 주문취소는 ‘입금확인’ 상태일 경우에만 가능합니다.</li>
              <li>
                미성년자가 결제 시 법정대리인이 그 거래를 취소할 수 있습니다.
              </li>
              <li>상품 미배송 시, 결제수단으로 환불됩니다.</li>
              <li>
                카카오페이, 차이, 토스, 네이버페이, 페이코 결제 시, 결제하신
                수단으로만 환불됩니다.
              </li>
            </ul>
            <!--결제 버튼 밑 안내사항 End-->
          </div>
        </div>
      </div>
    </div>
    <script></script>
  </body>
   <footer>
    	<div id="includedContent"></div>
    </footer>
</html>
