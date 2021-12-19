package com.KostaMarket.Product.Service;

import com.KostaMarket.Product.Repository.ProductRepository;
import com.KostaMarket.Product.vo.Product;

public class ProductService {
	ProductRepository productRepository = new ProductRepository();
	
	public Product retrieveProductInfo(String productCode) throws Exception {
		return productRepository.retrieveProductInfo(productCode);
	}

}
