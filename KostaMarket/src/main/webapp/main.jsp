<%@page import="com.KostaMarket.Product.vo.Product"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<% List<Product> list = (List)request.getAttribute("list"); %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>코스타 마켓 :: 내일의 장보기</title>
    <!--아이콘 폰트-->
    <link
      rel="stylesheet"
      href="http://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css"
    />
    <link
      rel="stylesheet"
      type="text/css"
      href="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"
    />
    <!--제이쿼리-->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script
      type="text/javascript"
      src="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"
    ></script>
    <!--slide-->

    <link rel="stylesheet" type="text/css" href="css/main.css" />
  <script>
      $(function () {
        $(".slick-track").slick({});
      });
      $(function () {
        $(".ListSwiper").slick({
          infinite: true,
          slidesToShow: 4,
          slidesToScroll: 4,
        });
      });
    //해더 추가하는 자바스크립트
      $(function(){
    	  $("#includedHeader").load("header.jsp");
      });
		

      $(function(){
          $("#includedContent").load("footer1.html");
        });
    </script>
   
    <script>
      // Set the date we're counting down to
      var countDownDate = new Date("Jan 5, 2322 15:37:25").getTime();

      // Update the count down every 1 second
      var x = setInterval(function () {
        // Get today's date and time
        var now = new Date().getTime();

        // Find the distance between now and the count down date
        var distance = countDownDate - now;

        // Time calculations for days, hours, minutes and seconds
        var days = Math.floor(distance / (1000 * 60 * 60 * 24));
        var hours = Math.floor(
          (distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60)
        );
        var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
        var seconds = Math.floor((distance % (1000 * 60)) / 1000);

        // Output the result in an element with id="demo"
        document.getElementById("SaleCount").innerHTML =
          hours + "h " + minutes + "m " + seconds + "s ";

        // If the count down is over, write some text
        if (distance < 0) {
          clearInterval(x);
          document.getElementById("demo").innerHTML = "상품 매진";
        }
      }, 1000);
    </script>
    <div id="includedHeader"></div>
  </head>
  <body>
    <div id="main">
      <div id="content">
        <div id="Kosta_main">
          <div class="css-l4pnbr e150tpdg0">
            <div class="css-0 e1hbq1i00">
              <!-- 각 섹션 분류  css-0 ee57w0b0 메인 배너 Start-->
              <div class="css-0 ee57w0b0">
                <!-- 메인 슬라이드 배너 시작-->
                <div class="SectionContainer main_banner css-1wv14ue e129uam51">
                  <div class="slick-slider slick-initialized">
                    <div class="slick-list">
                      <div class="slick-track">
                        <div>
                          <img
                            src="images/main/mainBannerImage/mainBanner 0.webp"
                            alt="mainbanner01"
                          />
                        </div>
                        <div>
                          <img
                            src="images/main/mainBannerImage/mainBanner 1.jfif"
                            alt="mainbanner01"
                          />
                        </div>
                        <div>
                          <img
                            src="images/main/mainBannerImage/mainBanner 2.webp"
                            alt="mainbanner01"
                          />
                        </div>
                        <div>
                          <img
                            src="images/main/mainBannerImage/mainBanner 3.webp"
                            alt="mainbanner01"
                          />
                        </div>
                        <div>
                          <img
                            src="images/main/mainBannerImage/mainBanner 4.webp"
                            alt="mainbanner01"
                          />
                        </div>
                        <div>
                          <img
                            src="images/main/mainBannerImage/mainBanner 5.webp"
                            alt="mainbanner01"
                          />
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <!-- 메인 배너 End-->
              <!-- 각 섹션 분류 이상품 어때요 Start-->
              <div class="css-0 ee57w0b0">
                <div
                  class="
                    SectionContainer
                    today_recommendation
                    css-1wv14ue
                    e129uam51
                  "
                >
                  <div class="css-1i60c0e exhhh9i0">
                    <div class="css-0 e1e3964i0">
                      <div class="css-3j1fi2 e161d1pu0">
                        <div class="SectionTitle css-2u0lrw e1py8bme2">
                          <div class="css-7xc07p e6oc3j93">
                            <span class="css-195c6n4 e1py8bme1"
                              >이 상품 어때요?</span
                            >
                          </div>
                          <p class="css-1efm9d2 e1py8bme0"></p>
                        </div>
                        <div class="ListSwiper css-1y0s8v2 e1ys67gq4">
                          <!--슬라이드 리스트 시작-->
				<%
				try{
					for(Product p:list){
						String productImage = p.getProductImage();
						String productName = p.getProductName();
						int productSalePct = p.getProductSalePct();
						int productPrice =p.getProductPrice();
						String productCode = p.getProductCode();
						
						System.out.println("main product image");
						System.out.println(productImage);
				%>

                          <!-- 1 슬라이드 시작-->
                        
                          <div>
                            <div
                              class="
                                SliderItem
                                currentSlide
                                css-109sxf0
                                e1ys67gq3
                              "
                            >
                              <div class="css-0 ee57w0b0">
                                <div class="css-0 e97c0gb0">
                                  <!-- Thumnail 시작 -->
                                  <div class="Thumbnail css-1usngog erwlrj82">
                                    <a href="http://localhost:8888/KostaMarket/detailgoods?product_code=<%=productCode%>" class="css-13sxcdl erwlrj81">
                                      <img
                                        class="erwlrj80 css-4jombx ebkj6fl0"
                                        src="<%=productImage%>"
                                        alt="<%=productName%>"/>
                                    </a>
                                      <div clcss-8msfms e14imjkq0></div>
                                    
                                    <div class="css-1a83kvf em4wzeq1">
                                      <img
                                        class="css-1m1ntoc em4wzeq0"
                                        src="images/main/buttonIMG/cart_white_45_45.svg"
                                        alt="상품 카트에 담기 아이콘"
                                      />
                                    </div>
                                  </div>
                                  <!-- Thumnail end -->
                                  <!-- 상품 설명  Description  Start-->
                                  <div
                                    class="Description css-13fhmnl e1cjxdu03"
                                  >
                                    <p class="css-6449wc e1cjxdu02">
                                     <%=productName%>
                                    </p>
                                    <h3>
                                      <a href="#" class="css-fruqcr e1cjxdu01"
                                        ><%=productName%></a
                                      >
                                    </h3>
                                    <div class="Price css-1j97sho esl0mq04">
                                      <div class="css-1o7d3sk esl0mq02">
                                        <div class="css-1tt7nog esl0mq03">
                                          <%=productSalePct %>%
                                        </div>
                                        <div class="css-10edag5 esl0mq01">
                                          <%=( productPrice * (100- productSalePct))/100 %><span>원</span>
                                        </div>
                                      </div>
                                      <div class="css-rdpixd esl0mq00">
                                        <%=productPrice %>원
                                      </div>
                                    </div>
                                    <!-- 상품 설명  Description  End-->
                                  </div>
                                </div>
                              </div>
                            </div>
                          </div>
<%}}catch(NullPointerException e) {}%>
                          
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <!-- 이 상품 어때요 END-->
              <!-- 각 섹션 분류 중간 배너1 Start-->
              <div class="css-0 ee57w0b0">
                <div
                  class="
                    SectionContainer
                    random_line_banner
                    css-1wv14ue
                    e129uam51
                  "
                >
                  <div class="css-1i60c0e exhhh9i0">
                    <div class="css-0 ee57w0b0">
                      <a href="#" class="css-4o4zgy efst4bt3">
                        <img
                          src="images/main/line_banner01.webp"
                          alt="국물 요리 이벤트 안내 "
                        />
                      </a>
                    </div>
                  </div>
                </div>
              </div>
              <!-- 각 섹션 분류 중간 배너1 end-->
              <!-- 각 섹션 분류 일일 특가 Start-->
              <div class="css-0 ee57w0b0">
                <div
                  class="SectionContainer special_deal css-1wv14ue e129uam51"
                >
                  <div class="css-1i60c0e exhhh9i0">
                    <div
                      class="SpecialDeals dealsCount-2 css-17gixes ecpmufb0>"
                    >
                      <div class="css-1vrkvt e73fw4s0">
                        <h2>일일 특가</h2>
                        <h3>24 시간 한정 특가</h3>
                        <div class="css-k4zwli ejxw23o40">
                          <!--시계 아이콘 이미지라도 넣던가 해야할듯 -->
                          <img
                            id="count"
                            src="images/main/etc/Wedges-9.1s-244px.svg"
                            alt="카운트다운 로딩 아이콘"
                          />

                          <!--시간 카운트 다운-->
                          <div class="css-13lh3pe ejxw23o2">
                            <div class="css-74rjlf ejxw23o1">
                              <div id="SaleCount"></div>
                            </div>
                          </div>

                          <!--시간 카운트 다운-->
                        </div>
                        <p>망설이면 늦어요!</p>
                        <!--일일 특가 제품들 -->
                      </div>
                      <div class="css-lv1kje e1c1uwir2">
                        <div class="css-pirfdp e1c1uwir1">
                          <div class="css-zkaslx e1c1uwir0">
                            <div class="css-0 ee57w0b0">
                              <div class="css-0 e97c0gb0">
                                <div class="Thumbnail css-1usngog erwlrj82">
                                  <a
                                    href="#"
                                    class="css-13sxcdl erwlrj81"
                                    style="width: 338px; height: 434px"
                                  >
                                    <img
                                      class="erwlrj80 css-4jombx ebkj6fl0"
                                      src="images/main/timeDeal/1.jpg"
                                      alt="[벨지오이오소] 부라타 치즈"
                                      loading="lazy"
                                    />
                                    <div class="css-8msfms e14imjkq0">
                                      <div
                                        class="Sticker css-ks9z5y eea9if71"
                                        style="
                                          background-color: rgb(189, 118, 255);
                                          opacity: 0.9;
                                        "
                                      >
                                        <div
                                          class="css-i2s33r eea9if70"
                                          style="font-weight: bold"
                                        >
                                          일일특가
                                        </div>
                                      </div>
                                    </div>
                                  </a>
                                  <div class="css-1a83kvf em4wzeq1">
                                    <button class="css-1m1ntoc em4wzeq0">
                                      <img
                                        src="images/main/buttonIMG/cart_white_45_45.svg"
                                        alt="상품 카트에 담기 아이콘"
                                      />
                                    </button>
                                  </div>
                                </div>
                                <div class="Description css-13fhmnl e1cjxdu03">
                                  <p class="css-6449wc e1cjxdu02">
                                    버터처럼 부드러운 크림이 들어있는 생치즈
                                  </p>
                                  <h3>
                                    <a href="#" class="css-fruqcr e1cjxdu01"
                                      >[벨지오이오소] 부라타 치즈</a
                                    >
                                  </h3>
                                  <div class="Price css-1j97sho esl0mq04">
                                    <div class="css-1o7d3sk esl0mq02">
                                      <div class="css-1tt7nog esl0mq03">
                                        35%
                                      </div>
                                      <div class="css-10edag5 esl0mq01">
                                        9,685<span>원</span>
                                      </div>
                                    </div>
                                    <div class="css-rdpixd esl0mq00">
                                      14,900원
                                    </div>
                                  </div>
                                </div>
                              </div>
                            </div>
                          </div>
                          <div class="css-zkaslx e1c1uwir0">
                            <div class="css-0 ee57w0b0">
                              <div class="css-0 e97c0gb0">
                                <div class="Thumbnail css-1usngog erwlrj82">
                                  <a
                                    href="#"
                                    class="css-13sxcdl erwlrj81"
                                    style="width: 338px; height: 434px"
                                  >
                                    <img
                                      class="erwlrj80 css-4jombx ebkj6fl0"
                                      src="images/main/timeDeal/2.jpg"
                                      alt="[kim's butcher] 미국산 초이스 토마호크 스테이크용 500g (냉동)"
                                      loading="lazy"
                                    />
                                    <div class="css-8msfms e14imjkq0">
                                      <div
                                        class="Sticker css-ks9z5y eea9if71"
                                        style="
                                          background-color: rgb(189, 118, 255);
                                          opacity: 0.9;
                                        "
                                      >
                                        <div
                                          class="css-i2s33r eea9if70"
                                          style="font-weight: bold"
                                        >
                                          일일특가
                                        </div>
                                      </div>
                                    </div>
                                  </a>
                                  <div class="css-1a83kvf em4wzeq1">
                                    <button class="css-1m1ntoc em4wzeq0">
                                      <img
                                        src="images/main/buttonIMG/cart_white_45_45.svg"
                                        alt="상품 카트에 담기 아이콘"
                                      />
                                    </button>
                                  </div>
                                </div>
                                <div class="Description css-13fhmnl e1cjxdu03">
                                  <p class="css-6449wc e1cjxdu02">
                                    100g 당9,980원
                                  </p>
                                  <h3>
                                    <a href="#" class="css-fruqcr e1cjxdu01">
                                      [kim's butcher] 미국산 초이스 토마호크
                                      스테이크용 500g (냉동)
                                    </a>
                                  </h3>
                                  <div class="Price css-1j97sho esl0mq04">
                                    <div class="css-1o7d3sk esl0mq02">
                                      <div class="css-1tt7nog esl0mq03">
                                        30%
                                      </div>
                                      <div class="css-10edag5 esl0mq01">
                                        34,930<span>원</span>
                                      </div>
                                    </div>
                                    <div class="css-rdpixd esl0mq00">
                                      49,900원
                                    </div>
                                  </div>
                                  <div class="Tags css-1o6sptz e12yayul1">
                                    <div class="kurlyOnly css-fipbik e12yayul0">
                                      Kurly Only
                                    </div>
                                  </div>
                                </div>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <!-- 각 섹션 분류 일일 특가 End-->
              <!-- 각 섹션 분류 놓치면 후회할 가격 Start-->
              <div class="css-0 ee57w0b0">
                <div
                  class="
                    SectionContainer
                    today_recommendation
                    css-1wv14ue
                    e129uam51
                  "
                >
                  <div class="css-1i60c0e exhhh9i0">
                    <div class="css-0 e1e3964i0">
                      <div class="css-3j1fi2 e161d1pu0">
                        <div class="SectionTitle css-2u0lrw e1py8bme2">
                          <div class="css-7xc07p e6oc3j93">
                            <span class="css-195c6n4 e1py8bme1"
                              >놓치면 후회할 가격 </span
                            ><span class="css-z1z4sz e6oc3j90"
                              ><img
                                src="images/main/etc/arrow_title_32_32.svg"
                                alt="더보기 아이콘"
                            /></span>
                          </div>
                          <p class="css-1efm9d2 e1py8bme0"></p>
                        </div>
                        <div class="ListSwiper css-1y0s8v2 e1ys67gq4">
                          <!--슬라이드 리스트 시작-->

                          <!-- 1 슬라이드 시작-->
                          <div>
                            <div
                              class="
                                SliderItem
                                currentSlide
                                css-109sxf0
                                e1ys67gq3
                              "
                            >
                              <div class="css-0 ee57w0b0">
                                <div class="css-0 e97c0gb0">
                                  <!-- Thumnail 시작 -->
                                  <div class="Thumbnail css-1usngog erwlrj82">
                                    <a href="#" class="css-13sxcdl erwlrj81">
                                      <img
                                        class="erwlrj80 css-4jombx ebkj6fl0"
                                        src="images/main/thirdSlider/1.webp"
                                        alt="무알콜 스파클링 750ml"
                                      />
                                      <div clcss-8msfms e14imjkq0></div>
                                    </a>
                                    <div class="css-1a83kvf em4wzeq1">
                                      <img
                                        class="css-1m1ntoc em4wzeq0"
                                        src="images/main/buttonIMG/cart_white_45_45.svg"
                                        alt="상품 카트에 담기 아이콘"
                                      />
                                    </div>
                                  </div>
                                  <!-- Thumnail end -->
                                  <!-- 상품 설명  Description  Start-->
                                  <div
                                    class="Description css-13fhmnl e1cjxdu03"
                                  >
                                    <p class="css-6449wc e1cjxdu02">
                                      [토스트] 무알콜 스파클링 750mL(성인용)
                                    </p>
                                    <h3>
                                      <a href="#" class="css-fruqcr e1cjxdu01"
                                        >[토스트] 무알콜 스파클링
                                        750mL(성인용)</a
                                      >
                                    </h3>
                                    <div class="Price css-1j97sho esl0mq04">
                                      <div class="css-1o7d3sk esl0mq02">
                                        <div class="css-1tt7nog esl0mq03">
                                          5%
                                        </div>
                                        <div class="css-10edag5 esl0mq01">
                                          10,355<span>원</span>
                                        </div>
                                      </div>
                                      <div class="css-rdpixd esl0mq00">
                                        10,900원
                                      </div>
                                    </div>
                                    <!-- 상품 설명  Description  End-->
                                  </div>
                                </div>
                              </div>
                            </div>
                          </div>

                          <!-- 2 슬라이드 시작-->
                          <div>
                            <div
                              class="
                                SliderItem
                                currentSlide
                                css-109sxf0
                                e1ys67gq3
                              "
                            >
                              <div class="css-0 ee57w0b0">
                                <div class="css-0 e97c0gb0">
                                  <!-- Thumnail 시작 -->
                                  <div class="Thumbnail css-1usngog erwlrj82">
                                    <a href="#" class="css-13sxcdl erwlrj81">
                                      <img
                                        class="erwlrj80 css-4jombx ebkj6fl0"
                                        src="images/main/thirdSlider/2.jpg"
                                        alt="[한미양행] 간에는 밀크씨슬 (90일분)"
                                      />
                                      <div clcss-8msfms e14imjkq0></div>
                                    </a>
                                    <div class="css-1a83kvf em4wzeq1">
                                      <img
                                        class="css-1m1ntoc em4wzeq0"
                                        src="images/main/buttonIMG/cart_white_45_45.svg"
                                        alt="상품 카트에 담기 아이콘"
                                      />
                                    </div>
                                  </div>
                                  <!-- Thumnail end -->
                                  <!-- 상품 설명  Description  Start-->
                                  <div
                                    class="Description css-13fhmnl e1cjxdu03"
                                  >
                                    <p class="css-6449wc e1cjxdu02">
                                      [한미양행] 간에는 밀크씨슬 (90일분)
                                    </p>
                                    <h3>
                                      <a href="#" class="css-fruqcr e1cjxdu01"
                                        >[한미양행] 간에는 밀크씨슬 (90일분)</a
                                      >
                                    </h3>
                                    <div class="Price css-1j97sho esl0mq04">
                                      <div class="css-1o7d3sk esl0mq02">
                                        <div class="css-1tt7nog esl0mq03">
                                          60%
                                        </div>
                                        <div class="css-10edag5 esl0mq01">
                                          11,600<span>원</span>
                                        </div>
                                      </div>
                                      <div class="css-rdpixd esl0mq00">
                                        2,900원
                                      </div>
                                    </div>
                                    <!-- 상품 설명  Description  End-->
                                  </div>
                                </div>
                              </div>
                            </div>
                          </div>

                          <!-- 3 슬라이드 시작-->
                          <div>
                            <div
                              class="
                                SliderItem
                                currentSlide
                                css-109sxf0
                                e1ys67gq3
                              "
                            >
                              <div class="css-0 ee57w0b0">
                                <div class="css-0 e97c0gb0">
                                  <!-- Thumnail 시작 -->
                                  <div class="Thumbnail css-1usngog erwlrj82">
                                    <a href="#" class="css-13sxcdl erwlrj81">
                                      <img
                                        class="erwlrj80 css-4jombx ebkj6fl0"
                                        src="images/main/thirdSlider/4.jpg"
                                        alt="[레오나르디] 발사믹 그레이즈6종"
                                      />
                                      <div clcss-8msfms e14imjkq0></div>
                                    </a>
                                    <div class="css-1a83kvf em4wzeq1">
                                      <img
                                        class="css-1m1ntoc em4wzeq0"
                                        src="images/main/buttonIMG/cart_white_45_45.svg"
                                        alt="상품 카트에 담기 아이콘"
                                      />
                                    </div>
                                  </div>
                                  <!-- Thumnail end -->
                                  <!-- 상품 설명  Description  Start-->
                                  <div
                                    class="Description css-13fhmnl e1cjxdu03"
                                  >
                                    <p class="css-6449wc e1cjxdu02">
                                      [레오나르디] 발사믹 그레이즈6종
                                    </p>
                                    <h3>
                                      <a href="#" class="css-fruqcr e1cjxdu01"
                                        >[레오나르디] 발사믹 그레이즈6종</a
                                      >
                                    </h3>
                                    <div class="Price css-1j97sho esl0mq04">
                                      <div class="css-1o7d3sk esl0mq02">
                                        <div class="css-1tt7nog esl0mq03">
                                          30%
                                        </div>
                                        <div class="css-10edag5 esl0mq01">
                                          8,400<span>원</span>
                                        </div>
                                      </div>
                                      <div class="css-rdpixd esl0mq00">
                                        12,000원
                                      </div>
                                    </div>
                                    <!-- 상품 설명  Description  End-->
                                  </div>
                                </div>
                              </div>
                            </div>
                          </div>

                          <!-- 4 슬라이드 시작-->
                          <div>
                            <div
                              class="
                                SliderItem
                                currentSlide
                                css-109sxf0
                                e1ys67gq3
                              "
                            >
                              <div class="css-0 ee57w0b0">
                                <div class="css-0 e97c0gb0">
                                  <!-- Thumnail 시작 -->
                                  <div class="Thumbnail css-1usngog erwlrj82">
                                    <a href="#" class="css-13sxcdl erwlrj81">
                                      <img
                                        class="erwlrj80 css-4jombx ebkj6fl0"
                                        src="images/main/thirdSlider/5.jpg"
                                        alt="[우주인피자] 허니 고르곤졸라"
                                      />
                                      <div clcss-8msfms e14imjkq0></div>
                                    </a>
                                    <div class="css-1a83kvf em4wzeq1">
                                      <img
                                        class="css-1m1ntoc em4wzeq0"
                                        src="images/main/buttonIMG/cart_white_45_45.svg"
                                        alt="상품 카트에 담기 아이콘"
                                      />
                                    </div>
                                  </div>
                                  <!-- Thumnail end -->
                                  <!-- 상품 설명  Description  Start-->
                                  <div
                                    class="Description css-13fhmnl e1cjxdu03"
                                  >
                                    <p class="css-6449wc e1cjxdu02">
                                      [우주인피자] 허니 고르곤졸라
                                    </p>
                                    <h3>
                                      <a href="#" class="css-fruqcr e1cjxdu01"
                                        >[우주인피자] 허니 고르곤졸라</a
                                      >
                                    </h3>
                                    <div class="Price css-1j97sho esl0mq04">
                                      <div class="css-1o7d3sk esl0mq02">
                                        <div class="css-1tt7nog esl0mq03">
                                          10%
                                        </div>
                                        <div class="css-10edag5 esl0mq01">
                                          10,710<span>원</span>
                                        </div>
                                      </div>
                                      <div class="css-rdpixd esl0mq00">
                                        11,900
                                      </div>
                                    </div>
                                    <!-- 상품 설명  Description  End-->
                                  </div>
                                </div>
                              </div>
                            </div>
                          </div>

                          <!-- 5 슬라이드 시작-->
                          <div>
                            <div
                              class="
                                SliderItem
                                currentSlide
                                css-109sxf0
                                e1ys67gq3
                              "
                            >
                              <div class="css-0 ee57w0b0">
                                <div class="css-0 e97c0gb0">
                                  <!-- Thumnail 시작 -->
                                  <div class="Thumbnail css-1usngog erwlrj82">
                                    <a href="#" class="css-13sxcdl erwlrj81">
                                      <img
                                        class="erwlrj80 css-4jombx ebkj6fl0"
                                        src="images/main/thirdSlider/6.jpeg"
                                        alt="[빕스] 바베큐 폭립 오리지날"
                                      />
                                      <div clcss-8msfms e14imjkq0></div>
                                    </a>
                                    <div class="css-1a83kvf em4wzeq1">
                                      <img
                                        class="css-1m1ntoc em4wzeq0"
                                        src="images/main/buttonIMG/cart_white_45_45.svg"
                                        alt="상품 카트에 담기 아이콘"
                                      />
                                    </div>
                                  </div>
                                  <!-- Thumnail end -->
                                  <!-- 상품 설명  Description  Start-->
                                  <div
                                    class="Description css-13fhmnl e1cjxdu03"
                                  >
                                    <p class="css-6449wc e1cjxdu02">
                                      [빕스] 바베큐 폭립 오리지날
                                    </p>
                                    <h3>
                                      <a href="#" class="css-fruqcr e1cjxdu01"
                                        >[빕스] 바베큐 폭립 오리지날</a
                                      >
                                    </h3>
                                    <div class="Price css-1j97sho esl0mq04">
                                      <div class="css-1o7d3sk esl0mq02">
                                        <div class="css-1tt7nog esl0mq03">
                                          20%
                                        </div>
                                        <div class="css-10edag5 esl0mq01">
                                          11,840<span>원</span>
                                        </div>
                                      </div>
                                      <div class="css-rdpixd esl0mq00">
                                        14,800원
                                      </div>
                                    </div>
                                    <!-- 상품 설명  Description  End-->
                                  </div>
                                </div>
                              </div>
                            </div>
                          </div>

                          <!-- 6 슬라이드 시작-->
                          <div>
                            <div
                              class="
                                SliderItem
                                currentSlide
                                css-109sxf0
                                e1ys67gq3
                              "
                            >
                              <div class="css-0 ee57w0b0">
                                <div class="css-0 e97c0gb0">
                                  <!-- Thumnail 시작 -->
                                  <div class="Thumbnail css-1usngog erwlrj82">
                                    <a href="#" class="css-13sxcdl erwlrj81">
                                      <img
                                        class="erwlrj80 css-4jombx ebkj6fl0"
                                        src="images/main/thirdSlider/6.jpg"
                                        alt="alt=[창화당] 대구식 납작만두 300g (15g x 20입)"
                                      />
                                      <div clcss-8msfms e14imjkq0></div>
                                    </a>
                                    <div class="css-1a83kvf em4wzeq1">
                                      <img
                                        class="css-1m1ntoc em4wzeq0"
                                        src="images/main/buttonIMG/cart_white_45_45.svg"
                                        alt="상품 카트에 담기 아이콘"
                                      />
                                    </div>
                                  </div>
                                  <!-- Thumnail end -->
                                  <!-- 상품 설명  Description  Start-->
                                  <div
                                    class="Description css-13fhmnl e1cjxdu03"
                                  >
                                    <p class="css-6449wc e1cjxdu02">
                                      [창화당] 대구식 납작만두 300g (15g x
                                      20입)"
                                    </p>
                                    <h3>
                                      <a href="#" class="css-fruqcr e1cjxdu01"
                                        >[창화당] 대구식 납작만두 300g (15g x
                                        20입)</a
                                      >
                                    </h3>
                                    <div class="Price css-1j97sho esl0mq04">
                                      <div class="css-1o7d3sk esl0mq02">
                                        <div class="css-1tt7nog esl0mq03">
                                          10%
                                        </div>
                                        <div class="css-10edag5 esl0mq01">
                                          4,000<span>원</span>
                                        </div>
                                      </div>
                                      <div class="css-rdpixd esl0mq00">
                                        4,400원
                                      </div>
                                    </div>
                                    <!-- 상품 설명  Description  End-->
                                  </div>
                                </div>
                              </div>
                            </div>
                          </div>

                          <!-- 7 슬라이드 시작-->
                          <div>
                            <div
                              class="
                                SliderItem
                                currentSlide
                                css-109sxf0
                                e1ys67gq3
                              "
                            >
                              <div class="css-0 ee57w0b0">
                                <div class="css-0 e97c0gb0">
                                  <!-- Thumnail 시작 -->
                                  <div class="Thumbnail css-1usngog erwlrj82">
                                    <a href="#" class="css-13sxcdl erwlrj81">
                                      <img
                                        class="erwlrj80 css-4jombx ebkj6fl0"
                                        src="images/main/thirdSlider/7.jpg"
                                        alt="[낭만어시장] 땡초 넣은 모듬 조개탕"
                                      />
                                      <div clcss-8msfms e14imjkq0></div>
                                    </a>
                                    <div class="css-1a83kvf em4wzeq1">
                                      <img
                                        class="css-1m1ntoc em4wzeq0"
                                        src="images/main/buttonIMG/cart_white_45_45.svg"
                                        alt="상품 카트에 담기 아이콘"
                                      />
                                    </div>
                                  </div>
                                  <!-- Thumnail end -->
                                  <!-- 상품 설명  Description  Start-->
                                  <div
                                    class="Description css-13fhmnl e1cjxdu03"
                                  >
                                    <p class="css-6449wc e1cjxdu02">
                                      [낭만어시장] 땡초 넣은 모듬 조개탕
                                    </p>
                                    <h3>
                                      <a href="#" class="css-fruqcr e1cjxdu01"
                                        >[낭만어시장] 땡초 넣은 모듬 조개탕</a
                                      >
                                    </h3>
                                    <div class="Price css-1j97sho esl0mq04">
                                      <div class="css-1o7d3sk esl0mq02">
                                        <div class="css-1tt7nog esl0mq03">
                                          12%
                                        </div>
                                        <div class="css-10edag5 esl0mq01">
                                          11,000<span>원</span>
                                        </div>
                                      </div>
                                      <div class="css-rdpixd esl0mq00">
                                        12,500원
                                      </div>
                                    </div>
                                    <!-- 상품 설명  Description  End-->
                                  </div>
                                </div>
                              </div>
                            </div>
                          </div>

                          <!-- 8 슬라이드 시작-->
                          <div>
                            <div
                              class="
                                SliderItem
                                currentSlide
                                css-109sxf0
                                e1ys67gq3
                              "
                            >
                              <div class="css-0 ee57w0b0">
                                <div class="css-0 e97c0gb0">
                                  <!-- Thumnail 시작 -->
                                  <div class="Thumbnail css-1usngog erwlrj82">
                                    <a href="#" class="css-13sxcdl erwlrj81">
                                      <img
                                        class="erwlrj80 css-4jombx ebkj6fl0"
                                        src="images/main/thirdSlider/8.jpg"
                                        alt="[닥터하우스] 데일리 조리도구 6종 세트 누디핑크"
                                      />
                                      <div clcss-8msfms e14imjkq0></div>
                                    </a>
                                    <div class="css-1a83kvf em4wzeq1">
                                      <img
                                        class="css-1m1ntoc em4wzeq0"
                                        src="images/main/buttonIMG/cart_white_45_45.svg"
                                        alt="상품 카트에 담기 아이콘"
                                      />
                                    </div>
                                  </div>
                                  <!-- Thumnail end -->
                                  <!-- 상품 설명  Description  Start-->
                                  <div
                                    class="Description css-13fhmnl e1cjxdu03"
                                  >
                                    <p class="css-6449wc e1cjxdu02">
                                      [닥터하우스] 데일리 조리도구 6종 세트
                                      누디핑크
                                    </p>
                                    <h3>
                                      <a href="#" class="css-fruqcr e1cjxdu01"
                                        >[닥터하우스] 데일리 조리도구 6종 세트
                                        누디핑크</a
                                      >
                                    </h3>
                                    <div class="Price css-1j97sho esl0mq04">
                                      <div class="css-1o7d3sk esl0mq02">
                                        <div class="css-1tt7nog esl0mq03">
                                          25%
                                        </div>
                                        <div class="css-10edag5 esl0mq01">
                                          29,925<span>원</span>
                                        </div>
                                      </div>
                                      <div class="css-rdpixd esl0mq00">
                                        399,000원
                                      </div>
                                    </div>
                                    <!-- 상품 설명  Description  End-->
                                  </div>
                                </div>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <!-- 놓치면 후회할 가격END-->
              <!--각 섹션 분류 인기 신상품 랭킹 Start-->
              <div class="css-0 ee57w0b0">
                <div
                  class="
                    SectionContainer
                    today_recommendation
                    css-1wv14ue
                    e129uam51
                  "
                >
                  <div class="css-1i60c0e exhhh9i0">
                    <div class="css-0 e1e3964i0">
                      <div class="css-3j1fi2 e161d1pu0">
                        <div class="SectionTitle css-2u0lrw e1py8bme2">
                          <div class="css-7xc07p e6oc3j93">
                            <span class="css-195c6n4 e1py8bme1">
                              인기 신상품 랭킹 </span
                            ><span class="css-z1z4sz e6oc3j90"
                              ><img
                                src="images/main/etc/arrow_title_32_32.svg"
                                alt="더보기 아이콘"
                            /></span>
                          </div>
                          <p class="css-1efm9d2 e1py8bme0"></p>
                        </div>
                        <div class="ListSwiper css-1y0s8v2 e1ys67gq4">
                          <!--슬라이드 리스트 시작-->

                          <!-- 1 슬라이드 시작-->
                          <div>
                            <div
                              class="
                                SliderItem
                                currentSlide
                                css-109sxf0
                                e1ys67gq3
                              "
                            >
                              <div class="css-0 ee57w0b0">
                                <div class="css-0 e97c0gb0">
                                  <!-- Thumnail 시작 -->
                                  <div class="Thumbnail css-1usngog erwlrj82">
                                    <a href="#" class="css-13sxcdl erwlrj81">
                                      <img
                                        class="erwlrj80 css-4jombx ebkj6fl0"
                                        src="images/main/fourthSlide/01.jpg"
                                        alt="[데일리콤마] 크리스탈 홀로그램 디퓨저 100ml"
                                      />
                                      <div clcss-8msfms e14imjkq0></div>
                                    </a>
                                    <div class="css-1a83kvf em4wzeq1">
                                      <img
                                        class="css-1m1ntoc em4wzeq0"
                                        src="images/main/buttonIMG/cart_white_45_45.svg"
                                        alt="상품 카트에 담기 아이콘"
                                      />
                                    </div>
                                  </div>
                                  <!-- Thumnail end -->
                                  <!-- 상품 설명  Description  Start-->
                                  <div
                                    class="Description css-13fhmnl e1cjxdu03"
                                  >
                                    <p class="css-6449wc e1cjxdu02">
                                      [데일리콤마] 크리스탈 홀로그램 디퓨저
                                      100ml
                                    </p>
                                    <h3>
                                      <a href="#" class="css-fruqcr e1cjxdu01"
                                        >[데일리콤마] 크리스탈 홀로그램 디퓨저
                                        100ml</a
                                      >
                                    </h3>
                                    <div class="Price css-1j97sho esl0mq04">
                                      <div class="css-1o7d3sk esl0mq02">
                                        <div class="css-1tt7nog esl0mq03">
                                          20%
                                        </div>
                                        <div class="css-10edag5 esl0mq01">
                                          3,900<span>원</span>
                                        </div>
                                      </div>
                                      <div class="css-rdpixd esl0mq00">
                                        4,900원
                                      </div>
                                    </div>
                                    <!-- 상품 설명  Description  End-->
                                  </div>
                                </div>
                              </div>
                            </div>
                          </div>

                          <!-- 2 슬라이드 시작-->
                          <div>
                            <div
                              class="
                                SliderItem
                                currentSlide
                                css-109sxf0
                                e1ys67gq3
                              "
                            >
                              <div class="css-0 ee57w0b0">
                                <div class="css-0 e97c0gb0">
                                  <!-- Thumnail 시작 -->
                                  <div class="Thumbnail css-1usngog erwlrj82">
                                    <a href="#" class="css-13sxcdl erwlrj81">
                                      <img
                                        class="erwlrj80 css-4jombx ebkj6fl0"
                                        src="images/main/fourthSlide/02.jpg"
                                        alt="[루나] 소프트 포뮬라 펜슬 4종"
                                      />
                                      <div clcss-8msfms e14imjkq0></div>
                                    </a>
                                    <div class="css-1a83kvf em4wzeq1">
                                      <img
                                        class="css-1m1ntoc em4wzeq0"
                                        src="images/main/buttonIMG/cart_white_45_45.svg"
                                        alt="상품 카트에 담기 아이콘"
                                      />
                                    </div>
                                  </div>
                                  <!-- Thumnail end -->
                                  <!-- 상품 설명  Description  Start-->
                                  <div
                                    class="Description css-13fhmnl e1cjxdu03"
                                  >
                                    <p class="css-6449wc e1cjxdu02">
                                      [루나] 소프트 포뮬라 펜슬 4종
                                    </p>
                                    <h3>
                                      <a href="#" class="css-fruqcr e1cjxdu01"
                                        >[루나] 소프트 포뮬라 펜슬 4종</a
                                      >
                                    </h3>
                                    <div class="Price css-1j97sho esl0mq04">
                                      <div class="css-1o7d3sk esl0mq02">
                                        <div class="css-1tt7nog esl0mq03">
                                          30%
                                        </div>
                                        <div class="css-10edag5 esl0mq01">
                                          10,500<span>원</span>
                                        </div>
                                      </div>
                                      <div class="css-rdpixd esl0mq00">
                                        15,000원
                                      </div>
                                    </div>
                                    <!-- 상품 설명  Description  End-->
                                  </div>
                                </div>
                              </div>
                            </div>
                          </div>

                          <!-- 3 슬라이드 시작-->
                          <div>
                            <div
                              class="
                                SliderItem
                                currentSlide
                                css-109sxf0
                                e1ys67gq3
                              "
                            >
                              <div class="css-0 ee57w0b0">
                                <div class="css-0 e97c0gb0">
                                  <!-- Thumnail 시작 -->
                                  <div class="Thumbnail css-1usngog erwlrj82">
                                    <a href="#" class="css-13sxcdl erwlrj81">
                                      <img
                                        class="erwlrj80 css-4jombx ebkj6fl0"
                                        src="images/main/fourthSlide/03.jpg"
                                        alt="[정호영셰프의 우동카덴] 오리지널 우동"
                                      />
                                      <div clcss-8msfms e14imjkq0></div>
                                    </a>
                                    <div class="css-1a83kvf em4wzeq1">
                                      <img
                                        class="css-1m1ntoc em4wzeq0"
                                        src="images/main/buttonIMG/cart_white_45_45.svg"
                                        alt="상품 카트에 담기 아이콘"
                                      />
                                    </div>
                                  </div>
                                  <!-- Thumnail end -->
                                  <!-- 상품 설명  Description  Start-->
                                  <div
                                    class="Description css-13fhmnl e1cjxdu03"
                                  >
                                    <p class="css-6449wc e1cjxdu02">
                                      [정호영셰프의 우동카덴] 오리지널 우동
                                    </p>
                                    <h3>
                                      <a href="#" class="css-fruqcr e1cjxdu01"
                                        >[정호영셰프의 우동카덴] 오리지널
                                        우동</a
                                      >
                                    </h3>
                                    <div class="Price css-1j97sho esl0mq04">
                                      <div class="css-1o7d3sk esl0mq02">
                                        <div class="css-1tt7nog esl0mq03">
                                          7%
                                        </div>
                                        <div class="css-10edag5 esl0mq01">
                                          5,115<span>원</span>
                                        </div>
                                      </div>
                                      <div class="css-rdpixd esl0mq00">
                                        5,500원
                                      </div>
                                    </div>
                                    <!-- 상품 설명  Description  End-->
                                  </div>
                                </div>
                              </div>
                            </div>
                          </div>

                          <!-- 4 슬라이드 시작-->
                          <div>
                            <div
                              class="
                                SliderItem
                                currentSlide
                                css-109sxf0
                                e1ys67gq3
                              "
                            >
                              <div class="css-0 ee57w0b0">
                                <div class="css-0 e97c0gb0">
                                  <!-- Thumnail 시작 -->
                                  <div class="Thumbnail css-1usngog erwlrj82">
                                    <a href="#" class="css-13sxcdl erwlrj81">
                                      <img
                                        class="erwlrj80 css-4jombx ebkj6fl0"
                                        src="images/main/fourthSlide/04.webp"
                                        alt="[솔트24] 르뱅쿠키 생지 2종"
                                      />
                                      <div clcss-8msfms e14imjkq0></div>
                                    </a>
                                    <div class="css-1a83kvf em4wzeq1">
                                      <img
                                        class="css-1m1ntoc em4wzeq0"
                                        src="images/main/buttonIMG/cart_white_45_45.svg"
                                        alt="상품 카트에 담기 아이콘"
                                      />
                                    </div>
                                  </div>
                                  <!-- Thumnail end -->
                                  <!-- 상품 설명  Description  Start-->
                                  <div
                                    class="Description css-13fhmnl e1cjxdu03"
                                  >
                                    <p class="css-6449wc e1cjxdu02">
                                      [솔트24] 르뱅쿠키 생지 2종
                                    </p>
                                    <h3>
                                      <a href="#" class="css-fruqcr e1cjxdu01"
                                        >[솔트24] 르뱅쿠키 생지 2종</a
                                      >
                                    </h3>
                                    <div class="Price css-1j97sho esl0mq04">
                                      <div class="css-1o7d3sk esl0mq02">
                                        <div class="css-1tt7nog esl0mq03">
                                          10%
                                        </div>
                                        <div class="css-10edag5 esl0mq01">
                                          9,000<span>원</span>
                                        </div>
                                      </div>
                                      <div class="css-rdpixd esl0mq00">
                                        10,000원
                                      </div>
                                    </div>
                                    <!-- 상품 설명  Description  End-->
                                  </div>
                                </div>
                              </div>
                            </div>
                          </div>

                          <!-- 5 슬라이드 시작-->
                          <div>
                            <div
                              class="
                                SliderItem
                                currentSlide
                                css-109sxf0
                                e1ys67gq3
                              "
                            >
                              <div class="css-0 ee57w0b0">
                                <div class="css-0 e97c0gb0">
                                  <!-- Thumnail 시작 -->
                                  <div class="Thumbnail css-1usngog erwlrj82">
                                    <a href="#" class="css-13sxcdl erwlrj81">
                                      <img
                                        class="erwlrj80 css-4jombx ebkj6fl0"
                                        src="images/main/fourthSlide/05.jpg"
                                        alt="[리터스포트] 윈터 에디션 초콜렛 3종"
                                      />
                                      <div clcss-8msfms e14imjkq0></div>
                                    </a>
                                    <div class="css-1a83kvf em4wzeq1">
                                      <img
                                        class="css-1m1ntoc em4wzeq0"
                                        src="images/main/buttonIMG/cart_white_45_45.svg"
                                        alt="상품 카트에 담기 아이콘"
                                      />
                                    </div>
                                  </div>
                                  <!-- Thumnail end -->
                                  <!-- 상품 설명  Description  Start-->
                                  <div
                                    class="Description css-13fhmnl e1cjxdu03"
                                  >
                                    <p class="css-6449wc e1cjxdu02">
                                      [리터스포트] 윈터 에디션 초콜렛 3종
                                    </p>
                                    <h3>
                                      <a href="#" class="css-fruqcr e1cjxdu01"
                                        >[리터스포트] 윈터 에디션 초콜렛 3종</a
                                      >
                                    </h3>
                                    <div class="Price css-1j97sho esl0mq04">
                                      <div class="css-1o7d3sk esl0mq02">
                                        <div class="css-1tt7nog esl0mq03">
                                          20%
                                        </div>
                                        <div class="css-10edag5 esl0mq01">
                                          2,784<span>원</span>
                                        </div>
                                      </div>
                                      <div class="css-rdpixd esl0mq00">
                                        3,480원
                                      </div>
                                    </div>
                                    <!-- 상품 설명  Description  End-->
                                  </div>
                                </div>
                              </div>
                            </div>
                          </div>

                          <!-- 6 슬라이드 시작-->
                          <div>
                            <div
                              class="
                                SliderItem
                                currentSlide
                                css-109sxf0
                                e1ys67gq3
                              "
                            >
                              <div class="css-0 ee57w0b0">
                                <div class="css-0 e97c0gb0">
                                  <!-- Thumnail 시작 -->
                                  <div class="Thumbnail css-1usngog erwlrj82">
                                    <a href="#" class="css-13sxcdl erwlrj81">
                                      <img
                                        class="erwlrj80 css-4jombx ebkj6fl0"
                                        src="images/main/fourthSlide/06.webp"
                                        alt="[커피빈] 잉글리쉬 브렉퍼스트 라떼 파우치"
                                      />
                                      <div clcss-8msfms e14imjkq0></div>
                                    </a>
                                    <div class="css-1a83kvf em4wzeq1">
                                      <img
                                        class="css-1m1ntoc em4wzeq0"
                                        src="images/main/buttonIMG/cart_white_45_45.svg"
                                        alt="상품 카트에 담기 아이콘"
                                      />
                                    </div>
                                  </div>
                                  <!-- Thumnail end -->
                                  <!-- 상품 설명  Description  Start-->
                                  <div
                                    class="Description css-13fhmnl e1cjxdu03"
                                  >
                                    <p class="css-6449wc e1cjxdu02">
                                      [커피빈] 잉글리쉬 브렉퍼스트 라떼 파우치
                                    </p>
                                    <h3>
                                      <a href="#" class="css-fruqcr e1cjxdu01"
                                        >[커피빈] 잉글리쉬 브렉퍼스트 라떼
                                        파우치</a
                                      >
                                    </h3>
                                    <div class="Price css-1j97sho esl0mq04">
                                      <div class="css-1o7d3sk esl0mq02">
                                        <div class="css-1tt7nog esl0mq03">
                                          10%
                                        </div>
                                        <div class="css-10edag5 esl0mq01">
                                          4,000<span>원</span>
                                        </div>
                                      </div>
                                      <div class="css-rdpixd esl0mq00">
                                        4,400원
                                      </div>
                                    </div>
                                    <!-- 상품 설명  Description  End-->
                                  </div>
                                </div>
                              </div>
                            </div>
                          </div>

                          <!-- 7 슬라이드 시작-->
                          <div>
                            <div
                              class="
                                SliderItem
                                currentSlide
                                css-109sxf0
                                e1ys67gq3
                              "
                            >
                              <div class="css-0 ee57w0b0">
                                <div class="css-0 e97c0gb0">
                                  <!-- Thumnail 시작 -->
                                  <div class="Thumbnail css-1usngog erwlrj82">
                                    <a href="#" class="css-13sxcdl erwlrj81">
                                      <img
                                        class="erwlrj80 css-4jombx ebkj6fl0"
                                        src="images/main/fourthSlide/07.jpg"
                                        alt="[장네론 라귀올] 나이프 10종"
                                      />
                                      <div clcss-8msfms e14imjkq0></div>
                                    </a>
                                    <div class="css-1a83kvf em4wzeq1">
                                      <img
                                        class="css-1m1ntoc em4wzeq0"
                                        src="images/main/buttonIMG/cart_white_45_45.svg"
                                        alt="상품 카트에 담기 아이콘"
                                      />
                                    </div>
                                  </div>
                                  <!-- Thumnail end -->
                                  <!-- 상품 설명  Description  Start-->
                                  <div
                                    class="Description css-13fhmnl e1cjxdu03"
                                  >
                                    <p class="css-6449wc e1cjxdu02">
                                      [장네론 라귀올] 나이프 10종
                                    </p>
                                    <h3>
                                      <a href="#" class="css-fruqcr e1cjxdu01"
                                        >[장네론 라귀올] 나이프 10종</a
                                      >
                                    </h3>
                                    <div class="Price css-1j97sho esl0mq04">
                                      <div class="css-1o7d3sk esl0mq02">
                                        <div class="css-1tt7nog esl0mq03">
                                          20%
                                        </div>
                                        <div class="css-10edag5 esl0mq01">
                                          16,800<span>원</span>
                                        </div>
                                      </div>
                                      <div class="css-rdpixd esl0mq00">
                                        21,000원
                                      </div>
                                    </div>
                                    <!-- 상품 설명  Description  End-->
                                  </div>
                                </div>
                              </div>
                            </div>
                          </div>

                          <!-- 8 슬라이드 시작-->
                          <div>
                            <div
                              class="
                                SliderItem
                                currentSlide
                                css-109sxf0
                                e1ys67gq3
                              "
                            >
                              <div class="css-0 ee57w0b0">
                                <div class="css-0 e97c0gb0">
                                  <!-- Thumnail 시작 -->
                                  <div class="Thumbnail css-1usngog erwlrj82">
                                    <a href="#" class="css-13sxcdl erwlrj81">
                                      <img
                                        class="erwlrj80 css-4jombx ebkj6fl0"
                                        src="images/main/fourthSlide/08.webp"
                                        alt="[식부관] 플레인 식빵"
                                      />
                                      <div clcss-8msfms e14imjkq0></div>
                                    </a>
                                    <div class="css-1a83kvf em4wzeq1">
                                      <img
                                        class="css-1m1ntoc em4wzeq0"
                                        src="images/main/buttonIMG/cart_white_45_45.svg"
                                        alt="상품 카트에 담기 아이콘"
                                      />
                                    </div>
                                  </div>
                                  <!-- Thumnail end -->
                                  <!-- 상품 설명  Description  Start-->
                                  <div
                                    class="Description css-13fhmnl e1cjxdu03"
                                  >
                                    <p class="css-6449wc e1cjxdu02">
                                      [식부관] 플레인 식빵
                                    </p>
                                    <h3>
                                      <a href="#" class="css-fruqcr e1cjxdu01"
                                        >[식부관] 플레인 식빵</a
                                      >
                                    </h3>
                                    <div class="Price css-1j97sho esl0mq04">
                                      <div class="css-1o7d3sk esl0mq02">
                                        <div class="css-1tt7nog esl0mq03">
                                          10%
                                        </div>
                                        <div class="css-10edag5 esl0mq01">
                                          5,400<span>원</span>
                                        </div>
                                      </div>
                                      <div class="css-rdpixd esl0mq00">
                                        6,000원
                                      </div>
                                    </div>
                                    <!-- 상품 설명  Description  End-->
                                  </div>
                                </div>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <!--각 섹션 분류 인기 신상품 랭킹 End-->
              <!--각 섹션 분류 두번째 배너 Strat-->
              <div class="css-0 ee57w0b0">
                <div
                  class="
                    SectionContainer
                    random_line_banner
                    css-1wv14ue
                    e129uam51
                  "
                >
                  <div class="css-1i60c0e exhhh9i0">
                    <div class="css-0 ee57w0b0">
                      <a href="#" class="css-4o4zgy efst4bt3">
                        <img
                          src="images/main/line_banner02.webp"
                          alt="한정판 2022 마켓컬리 캘린더 안내"
                        />
                      </a>
                    </div>
                  </div>
                </div>
              </div>
              <!--각 섹션 분류 두번째 배너 End-->
            </div>
          </div>
        </div>
      </div>
  </body>
   <footer>
    	<div id="includedContent"></div>
    </footer>
</html>
