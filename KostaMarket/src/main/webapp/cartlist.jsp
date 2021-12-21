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
<link href = "./css/footer1.css" rel = "stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons|Material+Icons+Outlined" rel="stylesheet">
<meta charset="UTF-8">
<title>Help Me!!</title>
<script>
	
</script>
</head>
    <body>
        <div id = "titleName">
            <h2>장바구니</h2>
        </div>       
        <div id = "mainBlock">
                <div id = "leftBlock">
                    <div class="innerSelect">
                        <label class = "checkLabel">
                            <input type="checkbox" class = "checkAll" name='checkAll1' value='checkAll' checked = "" onclick = "checkAll(this); getCheckedCnt();">
               					<%
               						String arrow = null;
               						try {
               							for(Cart c : list) {
    										arrow = c.getCartCode();
    									}
               							if(arrow == null) { %>
               								<span class = "chkAllWord">전체선택(<div id = "chkNum"><%=list.size()-1%></div> /<%=list.size()-1%>)</span>
               							<% } else { %>
               								<span class = "chkAllWord">전체선택(<div id = "chkNum"><%=list.size()%></div> /<%=list.size()%>)</span>
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
										        	<td class = "chkdetail"><input type="checkbox" id = "code<%=flagI%>"class = "chkbox" name='chkbox' value = "<%=productCode%>" checked = "" onclick = "checkDetailAll(); getCheckedCnt();"></td>
										          	<td class = "tdImg"><a href = "./detailgoods?product_code=<%=productCode%>"><img src = "<%=productImage%>"></a></td>
										          	<td class = "tdName" id = "name<%=flagI%>"><a href = "./detailgoods?product_code=<%=productCode%>"><%=productName%>(<%=productPacking%>상품)</a></td>											    
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
                            <input type="checkbox" class = "checkAll" name='checkAll2' value='checkAll' checked = "" onclick = "checkAll(this); getCheckedCnt();">
                            <span class = "chkAllWord">전체선택</span>
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
                    <button id = "orderButton" onclick = "helpMe()">주문하기</button>
                    <div id = "notice">
                        <p>쿠폰/적립금은 주문서에서 사용가능합니다</p>
                        <p>'입금확인' 상태일 때는 주문 내역 상세에서 직접 주문취소가 가능합니다.</p>
                        <p>'입금확인' 이후 상태에는 고객센터로 문의해주세요.</p>
                    </div>
                </div>
           </div>
    </body>
    <footer>
    	<div id = "bigBlock">
            <div id = "avgBlock">
                <div id = "smallBlock1">
                    <p id = "happycenter">고객행복센터</p><div class="clearfix"></div>

                    <table class = "leftTable">
                        <tr class = "smallBlock1-1">
                            <td rowspan=2 class = "smallLeftBig"><p>0000-0000</p></td> 
                            <td class = "smallLeftsmall">365고객센터</td>
                        </tr>
                            
                        <tr class = "smallBlock1-2">
                            <td>오전 7시-오후 7시</td>
                        </tr>
                    </table><div class="clearfix"></div>

                    <table class = "leftTable">
                        <tr class = "smallBlock1-1">
                            <td rowspan=2 class = "smallLeftBig"><button>카카오톡 문의</button></td> 
                            <td class = "smallLeftsmall">365고객센터</td>
                        </tr>
                            
                        <tr class = "smallBlock1-2">
                            <td>오전 7시-오후 7시</td>
                        </tr>
                    </table><div class="clearfix"></div>

                    <table class = "leftTable">
                        <tr class = "smallBlock1-1">
                            <td rowspan=2 class = "smallLeftBig"><button>1:1 문의</button></td> 
                            <td class = "smallLeftsmall">24시간 접수가능</td>
                        </tr>
                            
                        <tr class = "smallBlock1-2">
                            <td>고객센터 운영시간에 순차적으로 답변해드리겠습니다.</td>
                        </tr>
                    </table><div class="clearfix"></div>

                    <table class = "leftTable">
                        <tr class = "smallBlock1-1">
                            <td class = "smallLeftBig"><button>대량주문 문의</button></td> 
                            <td class = "smallBlock1-2">비회원의 경우 메일로 문의바랍니다.</td>
                        </tr>
                    </table>

                    <table class = "footerTable">
                        <tr class = "footerTable1">
                            <td rowspan=2 class = "footerTable2">
                                <a href = "#none">
                                    <img class = "Ficon" src = "./images/footer/isms.PNG">
                                </a>
                            </td> 
                            <td class = "footerTable3"><a href = "#none">[인증범위]마켓컬리 쇼핑몰 서비스 개발 · 운영</a></td>
                        </tr>
                            
                        <tr>
                            <td class = "footerTable3"><a href = "#none">[유효기간]2019.04.01 ~ 2022.03.31</a></td>
                        </tr>
                    </table>

                    <table class = "footerTableq">
                        <tr class = "footerTable1">
                            <td rowspan=2 class = "footerTable2">
                                <a href = "#none">
                                    <img class = "Ficon" src = "./images/footer/private.PNG">
                                </a>
                            </td> 
                            <td class = "footerTable3"><a href = "#none">개인정보보호 우수 웹사이트 ·</a></td>
                        </tr>
                            
                        <tr>
                            <td class = "footerTable3"><a href = "#none">개인정보처리시스템 인증(ePRIVACY PLUS)</a></td>
                        </tr>
                    </table>
                </div>
                <div id ="smallBlock2">
                    <table class = "rightTable">
                        <tr><a href = "#none">컬리소개</a></tr>&nbsp&nbsp
                        <tr><a href = "#none">컬리소개영상</a></tr>&nbsp&nbsp
                        <tr><a href = "#none">인재채용</a></tr>&nbsp&nbsp
                        <tr><a href = "#none">이용약관</a></tr>&nbsp&nbsp
                        <tr><a href = "#none"><b>개인정보처리방침</b></a></tr>&nbsp&nbsp
                        <tr><a href = "#none">이용안내</a></tr>
                    </table>

                    <div id = "rightDetail">
                        법인명(상호):주식회사 컬리 | 사업자등록번호:123-45-67890 <a href = "#none">사업자정보확인</a><br>
                        통신판매업: 제 0000-서울강남-11111호 | 개인정보보호책임자:코리<br>
                        주소:서울특별시 강남구 테헤란로 222,33층(역삼동) | 대표이사:타리<br>
                        입점문의:<a href = "#nono">입점문의하기</a> | 제휴문의:<a href = "#none">business@kurlyent.com</a><br>
                        채용문의:<a href = "#nono">recruit@kurlyent.com</a><br>
                        팩스:070-7500-6098 | 이메일:<a href = "#nono">help@kurlyent.com</a><br>
                        대량주문문의:<a href = "#nono">kurlygift@kurlyent.com</a>
                    </div>

                    <p>© KURLY ENT.ALL RIGHTS RESERVED</p>

                    <div id = "iconBlock">
                        <a href = "#none"><img class = "icon" src = "./images/footer/instagram.jpg"></a>&nbsp
                        <a href = "#none"><img class = "icon" src = "./images/footer/facebook.png"></a>&nbsp
                        <a href = "#none"><img class = "icon" src = "./images/footer/blog.png"></a>&nbsp
                        <a href = "#none"><img class = "icon" src = "./images/footer/post.png"></a>&nbsp
                        <a href = "#none"><img class = "icon" src = "./images/footer/github.png"></a>&nbsp
                    </div>

                    <table class = "footerTablew">
                        <tr class = "footerTable1">
                            <td rowspan=2 class = "footerTable2">
                                <a href = "#none">
                                    <img class = "FTicon" src = "./images/footer/toss.PNG">
                                </a>
                            </td> 
                            <td class = "footerTable3"><a href = "#none">고객님의 안전거래를 위해 현금 등으로 결제 시 저희 쇼핑몰에서 가입한</a></td>
                        </tr>
                            
                        <tr>
                            <td class = "footerTable3"><a href = "#none">토스 페이먼츠 구매안전(에스크로) 서비스를 이용할 수 있습니다.</a></td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </footer>
</html>