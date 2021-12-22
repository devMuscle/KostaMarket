<%@page import="com.KostaMarket.Product.vo.Product"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
List<Product> list = (List)request.getAttribute("list");
%>
              <%try{
            	  if(list.isEmpty()) {
            		  System.out.print("리스트가 비어있습니다.");
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