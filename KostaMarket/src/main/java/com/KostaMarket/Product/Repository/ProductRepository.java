package com.KostaMarket.Product.Repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.KostaMarket.Common.MyConnection;
import com.KostaMarket.Product.vo.Product;

public class ProductRepository {

	public Product retrieveProductInfo(String productCodeInfo) throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;

		String productCode;
		String productAllergy;
		String productBreedingCode;
		String productCapacity;
		String productCountryOrigin;
		String productDelivery;
		String productExpiration;
		String productImage;
		String productInstructions;
		String productLivestockHistory;
		String productName;
		String productPacking;
		int productPrice;
		int productSalePct;
		String productWeight;
		int productCategory;

		String SQL = "select * from product where product_code = ?";
		ResultSet rs = null;

		try {

			con = MyConnection.getConnection(); // Connection : DB연결
			pstmt = con.prepareStatement(SQL); // PrepatedStatement : SQL송신

			pstmt.setString(1, productCodeInfo);
			
			rs = pstmt.executeQuery();

			rs.next();

			productCode = rs.getString("product_code");
			productAllergy = rs.getString("product_allergy");
			productBreedingCode = rs.getString("product_breeding_code");
			productCapacity = rs.getString("product_capacity");
			productCountryOrigin = rs.getString("product_country_origin");
			productDelivery = rs.getString("product_delivery");
			productExpiration = rs.getString("product_expiration");
			productImage = rs.getString("product_image");
			productInstructions = rs.getString("product_instructions");
			productLivestockHistory = rs.getString("product_livestock_history");
			productName = rs.getString("product_name");
			productPacking = rs.getString("product_packing");
			productPrice = rs.getInt("product_price");
			productSalePct = rs.getInt("product_sale_pct");
			productWeight = rs.getString("product_weight");
			productCategory = rs.getInt("product_category");
			
			return new Product(productCode, productName, productImage, productPrice, productCategory,
					productSalePct, productWeight, productCapacity, productDelivery,
					productCountryOrigin, productPacking, productAllergy, productExpiration,
					productBreedingCode, productLivestockHistory, productInstructions);

		} catch (Exception e) {
			throw new Exception();
		} finally {
			try {
				MyConnection.close(rs, pstmt, con);
			} catch (Exception e) {
				e.printStackTrace();
			}

		}

	}

}
