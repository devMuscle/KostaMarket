package com.KostaMarket.Order.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Date;
import java.util.Random;

import com.KostaMarket.Common.MyConnection;

public class OrderDAO {
	   private Connection con;
	   private PreparedStatement pstmt;
	   
	   public void orderGo(String idVal, int point, String[] order) {
		Date date = new Date();
        long timeInMilliSeconds = date.getTime();
        java.sql.Date date1 = new java.sql.Date(timeInMilliSeconds);
        
        try {
        	 con = MyConnection.getConnection();
        	 
        	 String sql1 = "SELECT cart_code FROM cart";
        	 pstmt = con.prepareStatement(sql1);
        	 ResultSet rs = pstmt.executeQuery();
        	 String cartCode = null;
        	 
        	 while(rs.next()) {
        		 cartCode = rs.getString("cart_code");
        	 }
 
             String sql2 = "INSERT INTO order_info(order_number, order_date, id_id) values (?, ?, ?)";
             
             pstmt = con.prepareStatement(sql2);
             
             System.out.println("ㅅ흇ㅅㅎㅅㅎㅅ");
             
             pstmt.setString(1, cartCode);
             pstmt.setDate(2, date1);
             pstmt.setString(3,idVal);
             
             int rt = pstmt.executeUpdate();
             
             String sql3 = "SELECT product_count, p.product_price, p.product_sale_pct, p.product_code \r\n"
             		+ "FROM cart cart\r\n"
             		+ "INNER JOIN product p ON cart.product_code_product_code = p.product_code\r\n"
             		+ "WHERE id_id = ?";
        	 pstmt = con.prepareStatement(sql3);
        	 
        	 pstmt.setString(1, idVal);
        	 rs = pstmt.executeQuery();
        	 
        	 PreparedStatement pstmt1;
        	 System.out.println("ㅅ흇ㅅㅎㅅㅎㅅ");
             
             while(rs.next()) {
            	 Random random = new Random();
                 int length = random.nextInt(5)+5;
          
                 StringBuffer newWord = new StringBuffer();
                 for (int i = 0; i < length; i++) {
                     int choice = random.nextInt(3);
                     switch(choice) {
                         case 0:
                             newWord.append((char)((int)random.nextInt(25)+97));
                             break;
                         case 1:
                             newWord.append((char)((int)random.nextInt(25)+65));
                             break;
                         case 2:
                             newWord.append((char)((int)random.nextInt(10)+48));
                             break;
                         default:
                             break;
                     }
                 }
                 
                 String newWord1 = newWord.toString();
            	 
            	 int productCount = rs.getInt("product_count");
            	 int productPrice = rs.getInt("product_price");
            	 int productSalePct = rs.getInt("product_sale_pct");
            	 String productCode = rs.getString("product_code");
            	 
            	 String sql4 = "INSERT INTO order_detail(order_detail_code, order_product_count, \r\n"
 	             		+ "order_product_price, order_product_sale_pct, order_number_order_number, \r\n"
 	             		+ "order_product_code_product_code) values (?, ?, ?, ?, ?, ?)";
            	 
            	 pstmt1 = con.prepareStatement(sql4); 
            	 
            	 pstmt1.setString(1, newWord1);
	             pstmt1.setInt(2, productCount);
	             pstmt1.setInt(3, productPrice);
	             pstmt1.setInt(4, productSalePct);
	             pstmt1.setString(5, cartCode);
	             pstmt1.setString(6, productCode);
	             
            	 rt = pstmt1.executeUpdate();
             }	     
             
             String sql5 = "DELETE FROM cart WHERE id_id = ?";
             pstmt = con.prepareStatement(sql5);
        	 
             pstmt.setString(1, idVal);
        	 rt = pstmt.executeUpdate();
        	 
        	 String sql6 = "update customer set member_ship_point = member_ship_point + ? where id = ?";
             pstmt = con.prepareStatement(sql6);
        	 
             pstmt.setInt(1, point);
             pstmt.setString(2, idVal);
             
        	 rt = pstmt.executeUpdate();
            
            MyConnection.close(rs, pstmt, con);
            
        } catch (Exception e) {
            e.printStackTrace();
        }
	}
}
