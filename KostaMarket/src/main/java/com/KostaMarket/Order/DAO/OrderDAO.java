package com.KostaMarket.Order.DAO;

import java.nio.charset.Charset;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;

import com.KostaMarket.Cart.vo.Cart;
import com.KostaMarket.Common.MyConnection;

class GenerateAlphaNumericString {
    static String getRandomString() 
    { 
    	int i = 15;
    	
    	byte[] bytearray;
        // bind the length 
        bytearray = new byte[256];         
        String mystring;
        StringBuffer thebuffer;
        String theAlphaNumericS;

        new Random().nextBytes(bytearray); 

        mystring 
            = new String(bytearray, Charset.forName("UTF-8")); 
            
        thebuffer = new StringBuffer();
        
        //remove all spacial char 
        theAlphaNumericS 
            = mystring 
                .replaceAll("[^A-Z0-9]", ""); 

        //random selection
        for (int m = 0; m < theAlphaNumericS.length(); m++) { 

            if (Character.isLetter(theAlphaNumericS.charAt(m)) 
                    && (i > 0) 
                || Character.isDigit(theAlphaNumericS.charAt(m)) 
                    && (i > 0)) { 

                thebuffer.append(theAlphaNumericS.charAt(m)); 
                i--; 
            } 
        } 

        // the resulting string 
        return thebuffer.toString(); 
    } 

public class OrderDAO {
	   private Connection con;
	   private PreparedStatement pstmt;
	   
	   //카트에 물품이 있는 고객 정보
	   public void orderAll(String id, String[] order) {
		   	Date date = new Date();
	        long timeInMilliSeconds = date.getTime();
	        java.sql.Date date1 = new java.sql.Date(timeInMilliSeconds);
	        
	        String orderDetailCode = getRandomString();
	        
	        try {
	        	 con = MyConnection.getConnection();
	        	 
	        	 String sql1 = "SELECT cart_code FROM cart";
	        	 pstmt = con.prepareStatement(sql1);
	        	 ResultSet rs = pstmt.executeQuery();
	        	 
	        	 String cartCode = rs.getString("cart_code");
	        	 
	             String sql2 = "INSERT INTO order_info(order_number, order_date, id_id) values (?, ?, ?)";
	             
	             pstmt = con.prepareStatement(sql2);
	             
	             pstmt.setString(1, cartCode);
	             pstmt.setDate(2, date1);
	             pstmt.setString(3, id);
	             
	             int rt = pstmt.executeUpdate();
	             
	             String sql3 = "SELECT product_count, p.product_price, p.product_sale_pct, p.product_code \r\n"
	             		+ "FROM cart cart\r\n"
	             		+ "INNER JOIN product p ON cart.product_code_product_code = p.product_code\r\n"
	             		+ "WHERE id_id = ?";
	        	 pstmt = con.prepareStatement(sql3);
	        	 
	        	 rs = pstmt.executeQuery();
	        	 
	        	 PreparedStatement pstmt1;
	        
	             while(rs.next()) {
	            	 int productCount = rs.getInt("product_count");
	            	 int productPrice = rs.getInt("product_price");
	            	 int productSalePct = rs.getInt("product_sale_pct");
	            	 String productCode = rs.getString("product_code");
	            	 
	            	 String sql4 = "INSERT INTO order_detail(order_detail_code, order_product_count, \r\n"
	 	             		+ "order_product_price, order_product_sale_pct, order_number_order_number, \r\n"
	 	             		+ "order_product_code_product_code) values (?, ?, ?, ?, ?, ?)";
	            	 
	            	 pstmt1 = con.prepareStatement(sql4); 
	            	 
	            	 pstmt1.setString(1, orderDetailCode);
		             pstmt1.setInt(2, productCount);
		             pstmt1.setInt(3, productPrice);
		             pstmt1.setInt(4, productSalePct);
		             pstmt1.setString(5, cartCode);
		             pstmt1.setString(6, productCode);
		             
	            	 rt = pstmt1.executeUpdate();
	             }	     
	             
	             String sql5 = "DELETE FROM cart WHERE id_id = ?";
	             pstmt = con.prepareStatement(sql5);
	        	 
	        	 rt = pstmt.executeUpdate();
	            
	            MyConnection.close(rs, pstmt, con);
	            
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	   }
	}
}
