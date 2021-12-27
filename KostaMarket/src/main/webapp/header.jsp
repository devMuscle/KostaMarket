<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.KostaMarket.Customer.vo.Customer"%>
<!DOCTYPE html>
<html>
<head>
  	<meta charset="UTF-8">
    <link rel="stylesheet" href="./css/header.css" />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap"
      rel="stylesheet"/>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
 <body>
 <%-- 로그인 세션정보 불러오기 --%>
	<%
	//HttpSession customerObj = session.getAttribute("idInfo");
	String customerId = (String)session.getAttribute("idInfo");
	String customerName = (String)session.getAttribute("loginName");
	%>
    <div id="header">
      <div class="bnr_header" id="top_message">
        <a href="#" id="eventLanding">
          지금 가입하고 인기상품 <b>100원</b>에 받아가세요!
          <img src="./images/icon/main/ico_arrow_fff_84x84.webp" class="bnr_arr" />
          <div class="bnr_top">
            <div class="inner_top_close">
              <!-- <button id="top-message-close" class="btn_top_bnr"> --> 
                가입하고 혜택받기
              </button>
            </div>
          </div>
        </a>
      </div>

      <div id="userMenu">
        <div id="header1">
        <%if(customerId==null){ %>
          <ul class="list_menu">
            <li class="menu none_sub menu_join">
              <a href="./signup.jsp" class="link_menu">회원가입</a>
            </li>
            <li class="menu none_sub menu_join">
              <a href="./login.jsp" class="link_menu">로그인</a>
            </li>
            <li class="menu 1st">
              <a href="#" class="link_menu">고객센터</a>
            </li>
          </ul>
         <%} else{%>
	         <ul class="list_menu">
	            <li class="menu none_sub menu_join">
	              <span class="txt">
		              <span class="link_menu"><%=customerName %>님</span>
	              </span>
	            <li class="menu 1st">
	              <a href="로그아웃.jsp 넣어야함" class="link_menu">로그아웃</a>
	            </li>
	          </ul>
	     <%} %>
        </div>
        <div class="clearfix"></div>
      </div>
      <div id="headerLogo" class="layout-wrapper">
        <h1 class="logo">
          <a href="./main" class="link_main">
            <span id="gnbLogoContainer"></span>
            <img src="./images/icon/main/logo_x2.webp" alt="마켓컬리 로고" />
          </a>
        </h1>

        <a href="#" class="bnr_delivery">
          <img src="images/icon/main/delivery_210801.webp" width="121" height="22" />
        </a>
      </div>
	<!-- 메뉴바 고정시킬꺼임 시작 -->
	<!-- 고정 스크립트 -->
	<script>
      $( document ).ready( function() {
        var jbOffset = $( '.jbMenu' ).offset();
        $( window ).scroll( function() {
          if ( $( document ).scrollTop() > jbOffset.top ) {
            $( '.jbMenu' ).addClass( 'gnb-fixed' );
          }
          else {
            $( '.jbMenu' ).removeClass( 'gnb-fixed' );
          }
        });
      } );
    </script>
      <div class="jbMenu gnb" >
        <div class="gnbMenu">
          <ul class="gnbDetail">
            <ul class="menu1">
              <div class="menu1_sub" >
                <img class="all-icon" src="./images/icon/main/ico_gnb_all_off.webp" />
                <span class="menuName1">전체 카테고리</span>
              </div>
              <ul class="category" >	<!-- 2단 드랍다운 만들기용 -->
                <li class="category_sub">
                  <a href="fruitCategory.html">
                    <img class="icon" src="./images/icon/main/icon_fruit.png" />
                    <span class="category_text">과일·견과·쌀</span>
                  </a>
	              	<ul class="category_sub_three"> <!--3단 드랍다운 수평-->
	                  	<li class="category_sub_three_sub">
	                  		<span class="category_text">친환경</span>
	                  	</li>
	                  	<li class="category_sub_three_sub">
	                  		<span class="category_text">제철과일</span>
	                  	</li>
	                  	<li class="category_sub_three_sub">
	                  		<span class="category_text">국산과일</span>
	                  	</li>
	                  	<li class="category_sub_three_sub">
	                  		<span class="category_text">수입과일</span>
	                  	</li>
	                  	<li class="category_sub_three_sub">
	                  		<span class="category_text">간편과일</span>
	                  	</li>
	                  	<li class="category_sub_three_sub">
	                  		<span class="category_text">냉동·건과일</span>
	                  	</li>
	                  	<li class="category_sub_three_sub">
	                  		<span class="category_text">견과류</span>
	                  	</li>
	                  	<li class="category_sub_three_sub">
	                  		<span class="category_text">쌀·잡곡</span>
	                  	</li>             		
	                </ul> 
                </li>
                <li class="category_sub" >
                  <a href="vegetableCategory.html">
                    <img class="icon" src="./images/icon/main/icon_veggies.png"/>
                    <span class="category_text">채소</span>
                  </a>
                  <ul class="category_sub_three"> <!--3단 드랍다운 수평-->
	                  	<li class="category_sub_three_sub">
	                  		<span class="category_text">친환경</span>
	                  	</li>
	                  	<li class="category_sub_three_sub">
	                  		<span class="category_text">고구마·감자·당근</span>
	                  	</li>
	                  	<li class="category_sub_three_sub">
	                  		<span class="category_text">시금치·쌈채소·나물</span>
	                  	</li>
	                  	<li class="category_sub_three_sub">
	                  		<span class="category_text">브로콜리·파프리카·양배추</span>
	                  	</li>
	                  	<li class="category_sub_three_sub">
	                  		<span class="category_text">양파·대파·마늘·배추</span>
	                  	</li>
	                  	<li class="category_sub_three_sub">
	                  		<span class="category_text">오이·호박·고추</span>
	                  	</li>
	                  	<li class="category_sub_three_sub">
	                  		<span class="category_text">냉동·이색·간편채소</span>
	                  	</li>
	                  	<li class="category_sub_three_sub">
	                  		<span class="category_text">콩나물·버섯</span>
	                  	</li>             		
	                </ul> 
                </li>
                <li class="category_sub">
                  <a href="meatCategory.html">
                    <img class="icon" src="./images/icon/main/icon_meat.png" />
                    <span class="category_text">정육·계란</span>
                  </a>
                  <ul class="category_sub_three"> <!--3단 드랍다운 수평-->
	                  	<li class="category_sub_three_sub">
	                  		<span class="category_text">국내산소고기</span>
	                  	</li>
	                  	<li class="category_sub_three_sub">
	                  		<span class="category_text">수입산소고기</span>
	                  	</li>
	                  	<li class="category_sub_three_sub">
	                  		<span class="category_text">돼지고기</span>
	                  	</li>
	                  	<li class="category_sub_three_sub">
	                  		<span class="category_text">계란류</span>
	                  	</li>
	                  	<li class="category_sub_three_sub">
	                  		<span class="category_text">닭·오리고기</span>
	                  	</li>
	                  	<li class="category_sub_three_sub">
	                  		<span class="category_text">양념육·돈까스</span>
	                  	</li>
	                  	<li class="category_sub_three_sub">
	                  		<span class="category_text">양고기</span>
	                  	</li>
	                  <ul class="category_sub_three"> <!--3단 드랍다운 수평-->
	                  	<li class="category_sub_three_sub">
	                  		<span class="category_text">친환경</span>
	                  	</li>
	                  	<li class="category_sub_three_sub">
	                  		<span class="category_text">제철과일</span>
	                  	</li>
	                  	<li class="category_sub_three_sub">
	                  		<span class="category_text">국산과일</span>
	                  	</li>
	                  	<li class="category_sub_three_sub">
	                  		<span class="category_text">수입과일</span>
	                  	</li>
	                  	<li class="category_sub_three_sub">
	                  		<span class="category_text">간편과일</span>
	                  	</li>
	                  	<li class="category_sub_three_sub">
	                  		<span class="category_text">냉동·건과일</span>
	                  	</li>
	                  	<li class="category_sub_three_sub">
	                  		<span class="category_text">견과류</span>
	                  	</li>
	                  	<li class="category_sub_three_sub">
	                  		<span class="category_text">쌀·잡곡</span>
	                  	</li>             		
	                  </ul> 
	                </ul> 
                </li>
                <li class="category_sub">
                  <img class="icon" src="./images/icon/main/icon_seafood.png" />
                  <span class="category_text">수산·해산·건어물</span>
                </li>
                <li class="category_sub">
                  <img class="icon" src="./images/icon/main/icon_side_inactive.png" />
                  <span class="category_text">국·반찬·메인요리</span>
                </li>
                <li class="category_sub">
                  <img class="icon" src="./images/icon/main/icon_convenient.png" />
                  <span class="category_text">샐러드·간편식</span>
                </li>
                <li class="category_sub">
                  <img class="icon" src="./images/icon/main/icon_sauce.png" />
                  <span class="category_text">면·양념·오일</span>
                </li>
                <li class="category_sub">
                  <img class="icon" src="./images/icon/main/icon_snacks.png" />
                  <span class="category_text">생수·음료·우유·커피</span>
                </li>
                <li class="category_sub">
                  <img class="icon" src="./images/icon/main/icon_cookie.png" />
                  <span class="category_text">간식·과자·떡</span>
                </li>
                <li class="category_sub">
                  <img class="icon" src="./images/icon/main/icon_deli.png" />
                  <span class="category_text">베이커리·치즈·델리</span>
                </li>
              </ul>
            </ul>
            <li class="menu2">신상품</li>
            <li class="menu3">베스트</li>
            <li class="menu4">알뜰쇼핑</li>
            <li class="menu5">특가/혜택</li>
          </ul>

  		  <div class="location_search">
            <input class= "search" />
            <input
              type="image"
              class="search_icon"
              src="images/icon/main/ico_search_x2.webp"/>
          </div>
          <div class="location_set">
            <a href="#">
              <img src="images/icon/main/ico_delivery_setting.svg" />
            </a>
          </div>
          <div class="location_set">
          	  <%if(customerId == null) {%>
          	  	<a href="http://localhost:8888/KostaMarket/login" onclick = alert("로그인해주세요")>
	            	<img src="./images/icon/main/ico_cart.svg" class="cart_btn" />
	         	</a>
          	  <%} else { %>
	          <a href="http://localhost:8888/KostaMarket/cart">
	            <img src="./images/icon/main/ico_cart.svg" class="cart_btn" />
	          </a>
	          <%} %>
           </div>
        </div>		
        
      </div>
    </div>
  </body>
</html>