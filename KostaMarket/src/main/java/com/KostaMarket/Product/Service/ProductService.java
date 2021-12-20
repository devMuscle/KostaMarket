package com.KostaMarket.Product.Service;

import com.KostaMarket.Product.DAO.ProductDAO;
import com.KostaMarket.Product.vo.Product;

public class ProductService {
	ProductDAO productRepository = new ProductDAO();
	
	public Product retrieveProductInfo(String productCode) throws Exception {
		return productRepository.retrieveProductInfo(productCode);   //메모리를 그릴 수있다면 좋을 듯
	}																//호출했던 내용 그대로 반환?

}
