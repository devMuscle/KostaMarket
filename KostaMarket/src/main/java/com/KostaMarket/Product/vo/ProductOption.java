package com.KostaMarket.Product.vo;

public class ProductOption {
	private String productCode;
	private String productOptionCode;
	private String productOptionName;
	private int productOptionPrice;
	private int productSalePct;
	private int productCount;
	
	public ProductOption() {
		super();
	}

	public String getProductCode() {
		return productCode;
	}

	public void setProductCode(String productCode) {
		this.productCode = productCode;
	}

	public String getProductOptionCode() {
		return productOptionCode;
	}

	public void setProductOptionCode(String productOptionCode) {
		this.productOptionCode = productOptionCode;
	}

	public String getProductOptionName() {
		return productOptionName;
	}

	public void setProductOptionName(String productOptionName) {
		this.productOptionName = productOptionName;
	}

	public int getProductOptionPrice() {
		return productOptionPrice;
	}

	public void setProductOptionPrice(int productOptionPrice) {
		this.productOptionPrice = productOptionPrice;
	}

	public int getProductSalePct() {
		return productSalePct;
	}

	public void setProductSalePct(int productSalePct) {
		this.productSalePct = productSalePct;
	}

	public int getProductCount() {
		return productCount;
	}

	public void setProductCount(int productCount) {
		this.productCount = productCount;
	}
	
}
