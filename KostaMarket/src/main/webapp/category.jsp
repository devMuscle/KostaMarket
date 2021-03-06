<%@page import="com.KostaMarket.Product.vo.Product"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
List<Product> list = (List)request.getAttribute("list");
%>

    
<!DOCTYPE html>
<html>
  <head>
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <link rel="stylesheet" type="text/css" href="./css/category.css" />
    <script type="text/javascript"><%@include file="./js/category.js"%></script>
    <script>
   		$(function(){
	        $("#includedContent").load("footer.html");
	      });
    </script>
    <link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="shortcut icon" type="image/x-icon" href="./images/favicon.ico" />
<title>마켓컬리 :: 내일의 장보기, 마켓컬리</title>
    
    <meta charset="UTF-8">
  </head>
  <body>
  
    <div class="page-article">
      <div id="inr-category">
        <div class="bnr-category">
          <div class="bnr-category-image">
            <img
              src="https://img-cf.kurly.com/category/banner/pc/e6a442ea-e3e4-4ba8-80e2-88857e88fcf5"
              alt="카테고리 베너"
            />
          </div>
        </div>
        <div class="inner-title">
          <h3 class="tit">과일·견과·쌀</h3>
          <ul class="inner lists">
            <li data-start="125" data-end="188">
              <a class="on">전체보기</a>
            </li>
            <li data-start="316" data-end="367">
              <a onclick = "fresh('AA')">친환경</a>
            </li>
            <li data-start="484" data-end="547">
              <a onclick = "fresh('AB')">제철과일</a>
            </li>
            <li data-start="664" data-end="727">
              <a onclick = "fresh('AC')">국산과일</a>
            </li>
            <li data-start="844" data-end="907">
              <a onclick = "fresh('AD')">수입과일</a>
            </li>
            <li data-start="1023" data-end="1086">
              <a onclick = "fresh('AE')">간편과일</a>
            </li>
            <li data-start="1184" data-end="1266">
              <a onclick = "fresh('AF')">냉동·건과일</a>
            </li>
            <li data-start="1395" data-end="1446">
              <a onclick = "fresh('AG')">견과류</a>
            </li>
            <li data-start="1568" data-end="1626">
              <a onclick = "fresh('AH')">쌀·잡곡</a>
            </li>
          </ul>
        </div>
        <div id="goods-list">
          <div class="list-bar">
            <div class="sort-menu">
              <p class="count">
                <span class="inner-count">총 580개</span>
              </p>
              <div class="select-type">
                <a href="#">추천순 </a>
                <a href="#">신상품순</a>
                <a href="#">판매량순</a>
                <a href="#">혜택순</a>
                <a href="#">낮은 가격순</a>
                <a href="#">높은 가격순</a>
              </div>
            </div>
          </div>
          <div class="list-goods">
            <div class="inner-listgoods">
              <ul class="list">
                         
              <%try{
            	  if(list.isEmpty()) {
            		  System.out.print("123");
            	  }
            	  System.out.println(list.size());
            	  for(Product p: list) {
					  String productCode = p.getProductCode();
					  String productImage = p.getProductImage();
					  String productName = p.getProductName();
					  int productPrice = p.getProductPrice();
				      int productSalePct = p.getProductSalePct();
				      int productCategory = p.getProductCategory();
				      System.out.println(productName);
              %>
              <%if(productSalePct > 0) {System.out.println(productName);%>
              		<li>
	                  <div class="item">
	                    <div class="thumb">
	                      <a href="http://localhost:8888/KostaMarket/detailgoods?product_code=<%=productCode%>">
	                      <img src="<%=productImage%>" alt="GAP 크리스마스 샤인머스켓 포도 2kg"/>
	                      </a>
	                      <div class="group-btn">
	                        <div class="btn btn-cart">
	                          <a href="#"> </a>
	                        </div>
	                      </div>
	                    </div>
	                    <div class="info">
	                      <span class="name"><%=productName%></span>
	                      <span class="cost">
	                        <span class="dc"><%=productSalePct%>%</span>
	                        <span class="price"><%=(productPrice * (100 - productSalePct)) / 100%>원</span>
	                        <span class="original"><%=productPrice%>원</span>
	                      </span>
	                      <span class="tag"></span>
	                    </div>
	                  </div>
	                </li>
                
                <%} else { %>
	                	<li>
		                  <div class="item">
		                    <div class="thumb">
		                      <img src="<%=productImage%>" alt="GAP 황금사과 2입" />
		                      <div class="group-btn">
		                        <div class="btn btn-cart">
		                          <a href="#"> </a>
		                        </div>
		                      </div>
		                    </div>
		                    <div class="info">
		                      <span class="name"><%=productName%></span>
		                      <span class="cost">
		                        <span class="price"><%=productPrice%>원</span>
		                      </span>
		                      <span class="tag"></span>
		                    </div>
		                  </div>
		                </li>
                <%		}	
              		}
            	  } catch(NullPointerException e){
            	  }%>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
  </body>
  <footer>
    	<div id="includedContent"></div>
  </footer>
</html>
