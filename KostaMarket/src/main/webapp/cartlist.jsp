<%@page import="com.KostaMarket.Cart.vo.Cart"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
List<Cart> list = (List)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src = "./js/cartlist.js"></script>
<link href = "./css/cartlist.css" rel = "stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons|Material+Icons+Outlined" rel="stylesheet">
<meta charset="UTF-8">
<link rel="shortcut icon" type="image/x-icon" href="./images/favicon.ico" />
<title>마켓컬리 :: 내일의 장보기, 마켓컬리</title>
<script>
    $(function(){
      $("#includedContent").load("footer.html");
    });
    $(function(){
  	  $("#includedHeader").load("header.jsp");
    });
</script>
</head>
	<header>
		<div id="includedHeader"></div>
	</header>
    <body>
    	<%if(list.isEmpty()) { %>
    		<script>
    			alert("로그인해주세요");
    			window.location.href = "http://localhost:8888/KostaMarket/login";
    		</script>
    	<% } else {%>
        <div id = "titleName">
            <h2>장바구니</h2>
        </div>       
        <div id = "mainBlock">
                <div id = "leftBlock">
                    <div class="innerSelect">
                        <label class = "checkLabel">
                            <input type="checkbox" id = "boxa" class = "checkAll" name='checkAll1' value='checkAll' checked = "" onclick = "checkAll(this); getCheckedCnt();"><label for = "boxa" class = "chkAllWord">&nbsp&nbsp전체선택</label>
               					<%
               						String arrow = null;
               						try {
               							for(Cart c : list) {
    										arrow = c.getCartCode();
    									}
               							if(arrow == null) { %>
               								(<div id = "chkNum"><%=list.size()-1%></div> /<%=list.size()-1%>)</span>
               							<% } else { %>
               								(<div id = "chkNum"><%=list.size()%></div> /<%=list.size()%>)</span>
               							<% }
               							} catch(NullPointerException e) {
										}%>
                        </label>
                        <button class="btnDelete" onclick= "deleteSend()">선택삭제</button> 
                     </div>
                     <div id = "list">                     
						<%
						String flag = null;
						int totalPrice = 0;
						int totalSalePrice = 0;
						int flagI = 0;
						String id = "A";
						String roadAddress = "배송지를 입력하고";
						String detailAddress = "배송유형을 확인해 보세요!";
						try{
							if(list.size() > 0) { 
								for(Cart c : list) {
									roadAddress = c.getRoadAddress();
									id = c.getID();
									detailAddress = c.getDetailAddress();
									flag = c.getCartCode();
								}
								if(flag == null) {
									System.out.println("empty"); %>
									<p id = "emptyList">장바구니에 담긴 상품이 없습니다</p>
								<%} else {
									for(Cart c : list) {
										String productImage = c.getProductImage();
										String productName = c.getProductName();
										String productCode = c.getProductCode();
										String productPacking = c.getProductPacking();
										int productCount = c.getProductCount();
										int productPrice = c.getProductPrice();
										int productSalePct = c.getProductSalePct();
								%>	
										<table id = "carttable">
										      <thead>
										        <tr>
										          
										        </tr>
										      </thead>
										      <tbody>
										        <tr id = "tline">
										        	<td class = "chkdetail"><input type="checkbox" id = "code<%=flagI%>" class = "chkbox" name='chkbox' value = "<%=productCode%>" checked = "" onclick = "checkDetailAll(); getCheckedCnt();"><label for = "code<%=flagI%>" class = "trash">-</label></td>
										          	<td class = "tdImg"><a href = "./detailgoods?product_code=<%=productCode%>"><img src = "<%=productImage%>"></a></td>
										          	<td class = "tdName" id = "name<%=flagI%>"><a href = "./detailgoods?product_code=<%=productCode%>"><%=productName%></a></td>											    
										          	<td class = "tdCount">
										          		<div class = "numBlock">
												            <input type='button' class = "num" onclick='modifyCount("minus", <%=flagI%>)' value='-'/>
												            <div class = "resultAll" id = "count<%=flagI%>"><%=productCount %></div>
												            <input type='button' class = "num" onclick='modifyCount("plus", <%=flagI%>)' value='+'/>
												        </div>
												    </td>
												    <%if(productSalePct == 0) { %>
												    	<td class = "tdPrice" id = "price<%=flagI%>" value = "<%=productPrice%>"><%=productPrice * productCount%>원
												    		<p class = "nothing" id = "rice<%=flagI%>" value = "<%=productPrice%>"></p>
												    	</td> 
												    <% } else { System.out.println(productPrice);%>
										          		<td class = "tdPrice" id = "price<%=flagI%>" value = "<%=((productPrice * (100 - productSalePct) / 100))%>">
										          			<%=((productPrice * (100 - productSalePct) / 100)) * productCount%>원<br>
										          			<p class = "ownPrice" id = "rice<%=flagI%>" value = "<%=productPrice%>">
										          			<%=productPrice * productCount%>원
										          			</p>
										          		</td> 
										          		<%} %>
										          	<td class = "deleteOne"><button id = "deleteOneB<%=flagI%>" class = "deleteOneB" onclick = "deleteOneSend(<%=flagI%>)">X</button></td>
										        </tr>
										      </tbody>
										    </table>
										<%
											totalPrice += productPrice * productCount;
											totalSalePrice += ((productPrice * productSalePct / 100)) * productCount;
											flagI++;
											}
										} 
									}
								}catch(NullPointerException e) {
							}%>  
                     </div>
                     <div class="innerSelect">
                        <label class = "checkLabel">
                            <input type="checkbox" id = "boxb" class = "checkAll" name='checkAll2' value='checkAll' checked = "" onclick = "checkAll(this); getCheckedCnt();"><label for = "boxb" class = "chkAllWord">&nbsp&nbsp전체선택</label>
                        </label>
                        <button class="btnDelete" onclick= "deleteSend()">선택삭제</button> 
                     </div>
                </div>
                <div id = "rightBlock">
                    <div id = "addressBox">
                        <div id = "addressDetail">
                            <p id = "aD1" name = "address" value = "<%=id%>"><span class="material-icons-outlined">place</span>배송지</p>
                            <div id = "detail">
                                <p id = "aD2"><%=roadAddress %></p>
                                <p id = "aD3"><%=detailAddress %></p>
                                <button id = "addressButton" onclick = "helpMe()">배송지 변경</button>
                            </div>
                        </div>
                    </div>
                    <div id = "priceBox">
                        <div id = "detailPrice">
                            <div id = "dP1">
                                <p id = "dP1-1">상품금액</p>
                                <p id = "dP1-2" value = "<%=totalPrice%>"><%=totalPrice%>원</p>
                            </div><div class="clearfix"></div>
                            <div id = "dP2">
                                <p id = "dP2-1">상품할인금액</p>
                                <%if(totalSalePrice == 0) { %>
                                	<p id = "dP2-2"><%=totalSalePrice%>원</p>
                                <% } else { %> 
                                <p id = "dP2-2">-<%=totalSalePrice%>원</p>
                                <% } %>
                            </div> <div class="clearfix"></div>
                            <div id = "dP3">
                                <p id = "dP3-1">배송비</p>
                                <p id = "dP3-2">0원</p>
                            </div>
                        </div>
                        <div id = "totalPrice">
                            <div id = "tP">
                                <p id = "tP1">결제예정금액</p>
                                <p id = "tP2"><%=totalPrice - totalSalePrice%>원</p>
                            </div>
                        </div>
                    </div>
                    <button id = "orderButton" onclick = "moveOrder(<%=flagI%>)">주문하기</button>
                    <div id = "notice">
                        <p>쿠폰/적립금은 주문서에서 사용가능합니다</p>
                        <p>'입금확인' 상태일 때는 주문 내역 상세에서 직접 주문취소가 가능합니다.</p>
                        <p>'입금확인' 이후 상태에는 고객센터로 문의해주세요.</p>
                    </div>
                </div>
           </div>
           <%} %>
    </body>
    <footer>
    	<div id="includedContent"></div>
    </footer>
</html>