package com.KostaMarket.Category.DAO;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import com.KostaMarket.Product.vo.Product;
import com.KostaMarket.Cart.vo.Cart;
import com.KostaMarket.Common.MyConnection;

public class CategoryDAO {
	 private Connection con;
	 private PreparedStatement pstmt;
	 
	 public List<Product> categoryList(String productCode){
		 
		 List<Product> list = new ArrayList<Product>();
		 String categoryCode = productCode + "%";
		 System.out.println("categoryCode 테스트 : " + categoryCode);
		 try {
			 con = MyConnection.getConnection();
			 
			 String SQL = "select * from product where product_code like ?";
			 pstmt = con.prepareStatement(SQL);
			 pstmt.setString(1, categoryCode);
			 ResultSet rs = pstmt.executeQuery();
			 System.out.println("DB A문 선택 테스트용");	//테스트용
			 
			 while (rs.next()) {
				 String categoryproductCode = rs.getString("product_code");
				 String productImage = rs.getString("product_image");
				 String productName = rs.getString("product_name");
				 int productPrice = rs.getInt("product_price");
				 int productSalePct = rs.getInt("product_sale_pct");
				 int productCategory = rs.getInt("product_category");
				 
				 
				 Product product = new Product();
				 product.setProductCode(categoryproductCode);
				 product.setProductImage(productImage);
				 product.setProductName(productName);
				 product.setProductPrice(productPrice);
				 product.setProductSalePct(productSalePct);
				 product.setProductCategory(productCategory);
				 
				 list.add(product);
	         }
			 
	         
	         MyConnection.close(rs, pstmt, con);
	         
	     } catch (Exception e) {
	         e.printStackTrace();
	     }
	     return list; 
	 }
	 
	 public List<Product> detailCategoryList(String DproductCode){
		 List<Product> list = new ArrayList<Product>();
		 
		 try {
			 con = MyConnection.getConnection();
			 
			 String SQL = " SELECT * FROM product";
			 pstmt = con.prepareStatement(SQL);
			 ResultSet rs = pstmt.executeQuery();
			 
			 while (rs.next()) {
				 String productCode = rs.getString("product_code");
				 String productImage = rs.getString("product_image");
				 String productName = rs.getString("product_name");
				 int productPrice = rs.getInt("product_price");
				 int productSalePct = rs.getInt("product_sale_pct");
				 int productCategory = rs.getInt("product_category");
				 
				 String flag = productCode.substring(0 ,2);
				 Product product = new Product();
				 
				 if(flag.equals(DproductCode)) {
					 product.setProductCode(productCode);
					 product.setProductImage(productImage);
					 product.setProductName(productName);
					 product.setProductPrice(productPrice);
					 product.setProductSalePct(productSalePct);
					 product.setProductCategory(productCategory);
					 list.add(product);
				 }
				
	         }
			 System.out.println(list.size());
	         
	         MyConnection.close(rs, pstmt, con);
	         
	     } catch (Exception e) {
	         e.printStackTrace();
	     }
		 return list; 
	 }
	 
	 public List<Product> saleList(){
		 
		 List<Product> list = new ArrayList<Product>();
		 
		 try {
			 con = MyConnection.getConnection();
			 
			 String SQL = "select * from product where product_sale_pct > 0";
			 pstmt = con.prepareStatement(SQL);
			 ResultSet rs = pstmt.executeQuery();
			 System.out.println("-------");	
			 
			 while (rs.next()) {
				 String categoryproductCode = rs.getString("product_code");
				 String productImage = rs.getString("product_image");
				 String productName = rs.getString("product_name");
				 int productPrice = rs.getInt("product_price");
				 int productSalePct = rs.getInt("product_sale_pct");
				 int productCategory = rs.getInt("product_category");
				 
				 
				 Product product = new Product();
				 product.setProductCode(categoryproductCode);
				 product.setProductImage(productImage);
				 product.setProductName(productName);
				 product.setProductPrice(productPrice);
				 product.setProductSalePct(productSalePct);
				 product.setProductCategory(productCategory);
				 
				 list.add(product);
	         }
			 
	         
	         MyConnection.close(rs, pstmt, con);
	         
	     } catch (Exception e) {
	         e.printStackTrace();
	     }
	     return list; 
	 }

	public List<Product> bestList(){
		 
		List<Cart> Clist = new ArrayList<Cart>();
		List<Product> list = new ArrayList<Product>();
		 
		 try {
			 con = MyConnection.getConnection();
			 
			 String SQL1 = "select distinct product_code_product_code from cart";
			 pstmt = con.prepareStatement(SQL1);
			 ResultSet rs = pstmt.executeQuery();
			 System.out.println("-------");	
			 
			 while (rs.next()) {
				 String compareProductCode = rs.getString("product_code_product_code"); 
				 
				 Cart cart = new Cart();
				 cart.setProductCode(compareProductCode);
				 
				 Clist.add(cart);
			 }
			
			 String SQL2 = "select * from product where product_code like ? ";
			 pstmt = con.prepareStatement(SQL2);
			 
			 for(Cart c : Clist) {
				 pstmt.setString(1, c.getProductCode());
				 rs = pstmt.executeQuery();
				 while (rs.next()) {
					 String categoryproductCode = rs.getString("product_code");
					 String productImage = rs.getString("product_image");
					 String productName = rs.getString("product_name");
					 int productPrice = rs.getInt("product_price");
					 int productSalePct = rs.getInt("product_sale_pct");
					 int productCategory = rs.getInt("product_category");
					 
					 
					 Product product = new Product();
					 product.setProductCode(categoryproductCode);
					 product.setProductImage(productImage);
					 product.setProductName(productName);
					 product.setProductPrice(productPrice);
					 product.setProductSalePct(productSalePct);
					 product.setProductCategory(productCategory);
					 
					 list.add(product);
				 }
			 }
	        MyConnection.close(rs, pstmt, con);
	        
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return list; 
	}
	
	public List<Product> newList(){
		 
		 List<Product> list = new ArrayList<Product>();
		 
		 long miliseconds = System.currentTimeMillis();
	     Date date = new Date(miliseconds);

		 
		 try {
			 con = MyConnection.getConnection();
			 
			 String SQL = "select * from product";
			 pstmt = con.prepareStatement(SQL);
			 ResultSet rs = pstmt.executeQuery();
			 System.out.println("-------");	
			 
			 while (rs.next()) {
				 String categoryproductCode = rs.getString("product_code");
				 String productImage = rs.getString("product_image");
				 String productName = rs.getString("product_name");
				 int productPrice = rs.getInt("product_price");
				 int productSalePct = rs.getInt("product_sale_pct");
				 int productCategory = rs.getInt("product_category");
				 Date updateDate = rs.getDate("update_date");
				 
				 long calDate = date.getTime() - updateDate.getTime(); 
			        
			     long calDateDays = calDate / ( 24*60*60*1000);
				 
			     if(calDateDays >= 14) {
					 Product product = new Product();
					 product.setProductCode(categoryproductCode);
					 product.setProductImage(productImage);
					 product.setProductName(productName);
					 product.setProductPrice(productPrice);
					 product.setProductSalePct(productSalePct);
					 product.setProductCategory(productCategory);
					 
					 list.add(product);
			     }
	         }

	         MyConnection.close(rs, pstmt, con);
	         
	     } catch (Exception e) {
	         e.printStackTrace();
	     }
	     return list; 
	 }
}

