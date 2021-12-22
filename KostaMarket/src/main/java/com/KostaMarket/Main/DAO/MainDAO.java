package com.KostaMarket.Main.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.KostaMarket.Product.vo.Product;
import com.KostaMarket.Common.MyConnection;

public class MainDAO {
	 private Connection con;
	 private PreparedStatement pstmt;
	 public List<Product> main(){
		 
		 List<Product> list = new ArrayList<Product>();
		 
		 try {
			 con = MyConnection.getConnection();
			 
			 String SQL = "select * from product";	
			 pstmt = con.prepareStatement(SQL);
			 ResultSet rs = pstmt.executeQuery();
			 // 컬럼명 확인할것
			 while (rs.next()) {
				 String productCode = rs.getString("product_code");
				 String productImage = rs.getString("product_image");
				 String productName = rs.getString("product_name");
				 int productPrice = rs.getInt("product_price");
				 int productSalePct = rs.getInt("product_sale_pct");
				
				 System.out.println(productImage);
				 
				 Product product = new Product();
				 product.setProductCode(productCode);
				 product.setProductImage(productImage);
				 product.setProductName(productName);
				 product.setProductPrice(productPrice);
				 product.setProductSalePct(productSalePct);
				
				 
				 list.add(product);
	         }
			 
	         
	         MyConnection.close(rs, pstmt, con);
	         
	     } catch (Exception e) {
	         e.printStackTrace();
	     }
	     return list; //조회한 레코드의 개수만큼 Cart, Product, Customer 객체를 저장한 ArrayList를 반환
	 }
}
