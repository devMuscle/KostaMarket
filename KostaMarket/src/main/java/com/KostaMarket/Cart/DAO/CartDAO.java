package com.KostaMarket.Cart.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.KostaMarket.Cart.vo.Cart;
import com.KostaMarket.Common.MyConnection;

public class CartDAO {
	   private Connection con;
	   private PreparedStatement pstmt;
	   
	   //카트에 물품이 있는 고객 정보
	   public List<Cart> cartList() {
	        List<Cart> list = new ArrayList<Cart>();
	        try {
	        	 con = MyConnection.getConnection();
	        	 
	             String query = " SELECT p.product_image, p.product_name, product_count, id_id, \r\n"
	             		+ "       p.product_price, p.product_packing, p.product_sale_pct, \r\n"
	             		+ "       cu.detail_address, cu.road_address, cu.zone_code, cart_code, product_code_product_code,\r\n"
	             		+ "       cu.email, cu.name, cu.phone, cu.member_ship_point\r\n"
	             		+ "FROM cart cart\r\n"
	             		+ "INNER JOIN customer cu ON cart.id_id = cu.id\r\n"
	             		+ "INNER JOIN product p ON cart.product_code_product_code = p.product_code";
	             
	             System.out.println("PrepareStatement: " + query);
	             
	             pstmt = con.prepareStatement(query);//preparestatement 객체 생성
	             ResultSet rs = pstmt.executeQuery();//executequery()로 미리 설정한 SQL문 실행
	             //preparestatement는 statement를 상속하므로 사용한 메서드를 그대로 사용
	             
	            while (rs.next()) {
	            	//조회한 Cart의 각 컬럼 값을 받아 옴
	                String cartCode = rs.getString("cart_code"); 
	                int productCount = rs.getInt("product_count");
	                String id = rs.getString("id_id");
	                String productCode = rs.getString("product_code_product_code");
	                
	                //조회한 Product의 각 컬럼 값을 받아 옴
	                String productImage = rs.getString("product_image");
	                String productName = rs.getString("product_name");
	                int productPrice = rs.getInt("product_price");
	                String productPacking = rs.getString("product_packing");
	                productPacking = productPacking.substring(0, 2);
	                int productSalePct = rs.getInt("product_sale_pct");
	                
	                //조회한 Customer의 각 컬럼 값을 받아 옴
	                String detailAddress = rs.getString("detail_address");
	                String roadAddress = rs.getString("road_address");
	                int zoneCode = rs.getInt("zone_code");
	                String email = rs.getString("email");
	                String phone = rs.getString("phone");
	                String name = rs.getString("name");
	                int memberShipPoint = rs.getInt("member_ship_point");
	                
	                Cart cart = new Cart();
	                cart.setCartCode(cartCode);
	                cart.setProductCount(productCount);
	                cart.setID(id);
	                cart.setProductCode(productCode); 
	                   
	                cart.setProductImage(productImage);
	                cart.setProductName(productName);
	                cart.setProductPrice(productPrice);
	                cart.setProductPacking(productPacking);
	                cart.setProductSalePct(productSalePct);
	                
	                cart.setDetailAddress(detailAddress);
	                cart.setRoadAddress(roadAddress);
	                cart.setZoneCode(zoneCode);
	                cart.setName(name);
	                cart.setEmail(email);
	                cart.setPhone(phone);
	                cart.setMemberShipPoint(memberShipPoint);
	                
	                
	                list.add(cart); //설정된 Cart객체를 다시 ArrayList에 저장
	                
	                System.out.print(productCode);
	            }
	            
	            MyConnection.close(rs, pstmt, con);
	            
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return list; //조회한 레코드의 개수만큼 Cart, Product, Customer 객체를 저장한 ArrayList를 반환
	   }
	   
	   //카트에 물품이 없는 고객정보
	   public List<Cart> customerlist() {
		   List<Cart> Clist = new ArrayList<Cart>();
	        try {
	        	 con = MyConnection.getConnection();
	        	 
	             String query = " SELECT * FROM customer";
	             
	             System.out.println("PrepareStatement: " + query);
	             
	             pstmt = con.prepareStatement(query);//preparestatement 객체 생성
	             ResultSet rs = pstmt.executeQuery();//executequery()로 미리 설정한 SQL문 실행
	             //preparestatement는 statement를 상속하므로 사용한 메서드를 그대로 사용
	             
	            while (rs.next()) {
	            	Cart Ccart = new Cart();
	            	
	                //조회한 Customer의 각 컬럼 값을 받아 옴
	            	String id = rs.getString("id");
	                String detailAddress = rs.getString("detail_address");
	                String roadAddress = rs.getString("road_address");
	                int zoneCode = rs.getInt("zone_code");
	                
	                Ccart.setID(id);
	                Ccart.setDetailAddress(detailAddress);
	                Ccart.setRoadAddress(roadAddress);
	                Ccart.setZoneCode(zoneCode);
	                Clist.add(Ccart);
	            }
	            
	            MyConnection.close(rs, pstmt, con);
	            
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return Clist; //조회한 레코드의 개수만큼 Cart, Product, Customer 객체를 저장한 ArrayList를 반환
	   }
	   
	   //카트 물품 지우기
	   public void deleteCart(String[] useCart) {
		   String id = null;
		   String productCode = null;
		 
		   try {  
			   con = MyConnection.getConnection();
			   String query = "DELETE FROM cart WHERE id_id = ? AND product_code_product_code = ?";
			   
			   pstmt = con.prepareStatement(query);
			   
			   System.out.println("PrepareStatement: " + query);
			   
			   for(int i = 0; i < useCart.length; i++){
					System.out.println(useCart[i]+"제에발");
				}
			   
			   for(int i = 0; i < useCart.length; i++) {
				   System.out.println("1");
				   if(i == 0) {
					   id = useCart[i];
					   System.out.println("살려줘");
				   } else {
					   System.out.println("살려줘2");
					   productCode = useCart[i];
					   pstmt.setString(1, id);
					   pstmt.setString(2, productCode);
					   int rs = pstmt.executeUpdate();
					   System.out.println("PrepareStatement: " + query);
				   }
			   }
			   
			   } catch (Exception e) {
				   
			   } finally {
				   MyConnection.close(pstmt, con);
			   }

	   }
	   
	   //제품 수량 수정하기
	   public void modifyCart(String id, String productCode, String productCount) {
		   int intProductCount = Integer.parseInt(productCount);
		   try {  
			   con = MyConnection.getConnection();
			   String query = "UPDATE cart\r\n"
			   		+ "SET product_count = ?\r\n"
			   		+ "WHERE product_code_product_code = ? AND id_id = ?";
			   
			   pstmt = con.prepareStatement(query);
			   pstmt.setInt(1, intProductCount);
			   pstmt.setString(2, productCode);
			   pstmt.setString(3, id);
			   
			   System.out.println("PrepareStatement: " + query);
			   
			   int rs = pstmt.executeUpdate();
			   
			   } catch (Exception e) {
				   
			   } finally {
				   MyConnection.close(pstmt, con);
			   }
	   }
}
