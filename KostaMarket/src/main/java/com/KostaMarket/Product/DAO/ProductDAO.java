package com.KostaMarket.Product.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.KostaMarket.Common.MyConnection;
import com.KostaMarket.Product.vo.Product;

public class ProductDAO {

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

			con = MyConnection.getConnection(); // Connection : DB연결 << new 객채를 하지 않는 이유
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

			return new Product(productCode, productName, productImage, productPrice, productCategory, productSalePct,
					productWeight, productCapacity, productDelivery, productCountryOrigin, productPacking,
					productAllergy, productExpiration, productBreedingCode, productLivestockHistory,
					productInstructions);

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

	public List<Product> relatedProduct(int productCategoryNum) throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;

		String productCode;
		String productImage;
		String productName;
		int productPrice;
		int productSalePct;
		int productCategory;

		List<Product> list = new ArrayList<Product>();

		String SQL = "select * from product where product_category = ?";
		ResultSet rs = null;

		try {

			con = MyConnection.getConnection(); // Connection : DB연결 << new 객채를 하지 않는 이유
			pstmt = con.prepareStatement(SQL); // PrepatedStatement : SQL송신

			pstmt.setInt(1, productCategoryNum);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				productCode = rs.getString("product_code");
				productImage = rs.getString("product_image");
				productName = rs.getString("product_name");
				productPrice = rs.getInt("product_price");
				productSalePct = rs.getInt("product_sale_pct");
				productCategory = rs.getInt("product_category");

				Product product = new Product();
				product.setProductCode(productCode);
				product.setProductImage(productImage);
				product.setProductName(productName);
				product.setProductPrice(productPrice);
				product.setProductSalePct(productSalePct);
				product.setProductCategory(productCategory);

				list.add(product);
			}

		} catch (Exception e) {
			throw new Exception();
		} finally {
			try {
				MyConnection.close(rs, pstmt, con);
			} catch (Exception e) {
				e.printStackTrace();
			}

		}
		return list;
	}

	public void addCartListInfo(String id, String productCode, String productCount) throws Exception {

		Connection con = null;
		PreparedStatement pstmt = null;

		String cartCode = null;
		int count = Integer.parseInt(productCount);
		String customerId = id;
		String cartProductCode = productCode;
		int row = 0;

		int flag = 0; // 조건문 종료 트리거

		// 칼트번호 질의문
		String SQL = "select * from cart";
		ResultSet rs = null;
		ResultSet compareRs = null;

		// 동일한 상품이 없을 때 업데이트 질의문
		String SQLUpdate = "insert into cart(cart_code, product_count, id_id, product_code_product_code) values(?,?,?,?)";
		// 동일한 상품이 있을 때 업데이트 질의문
		String SQLUpdate2 = "update cart set product_count = ?  where id_id=? and product_code_product_code=?";

		try {
			con = MyConnection.getConnection(); // Connection : DB연결 << new 객채를 하지 않는 이유
			pstmt = con.prepareStatement(SQL); // PrepatedStatement : SQL송신
			rs = pstmt.executeQuery();

			// id랑 상품코드가 같을때 상품 수 추가
			while (rs.next()) {
				String compareId = null;
				String compareProductCode = null;
				int compareCount = 0;

				compareId = rs.getString("id_id");
				compareProductCode = rs.getString("product_code_product_code");
				compareCount = rs.getInt("product_count");
				System.out.println("비교전 자료 확인 " + compareId + " " + compareProductCode + " " + compareCount);

				if ((compareId.equals(customerId)) && (compareProductCode.equals(cartProductCode))) {
					count = count + compareCount;
					pstmt = con.prepareStatement(SQLUpdate2);
					pstmt.setInt(1, count);
					pstmt.setString(2, customerId);
					pstmt.setString(3, cartProductCode);

					pstmt.executeUpdate();
					System.out.println("동일한 상품 있을 때 업데이트 완료"); // 동일한 상품이 있을 때 DB 결과 업데이트
					flag = 1;
				}
				cartCode = rs.getString("cart_code"); // 동일한 상품이 없을 때 DB 결과 값 커서 끝으로 이동용
				row = rs.getRow();

				System.out.println("cartCode 확인: " + cartCode + "\nRow 확인: " + row);
				row++; // cartCode 연산값 확인
			}
			if (flag == 0) {
				cartCode = "cart" + String.valueOf(row);
				System.out.println(cartCode);

				pstmt = con.prepareStatement(SQLUpdate);
				pstmt.setString(1, cartCode);
				pstmt.setInt(2, count);
				pstmt.setString(3, customerId);
				pstmt.setString(4, cartProductCode);

				pstmt.executeUpdate();
				System.out.println("동일한 상품 없을 때 업데이트 완료"); // 동일한 상품이 없을 때 DB 결과 업데이트
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				MyConnection.close(rs, pstmt, con);
			} catch (Exception e) {
				e.printStackTrace();
			}

		}
	}

	public static void main(String[] args) {

		ProductDAO cart = new ProductDAO();
		try {
			cart.addCartListInfo("id2", "p03", "3");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
