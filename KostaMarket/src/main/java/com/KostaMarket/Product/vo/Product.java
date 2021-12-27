package com.KostaMarket.Product.vo;

public class Product {
	public Product() {
		super();
	}

	private String productCode;
	private String productName;
	private String productImage;
	private int productPrice;
	private int productCategory;
	private int productSalePct;
	private String productWeight;
	private String productCapacity;
	private String productDelivery;
	private String productCountryOrigin;
	private String productPacking;
	private String productAllergy;
	private String productExpiration;
	private String productBreedingCode;
	private String productLivestockHistory;
	private String productInstructions;

	
	
	public Product(String productCode, String productName, String productImage, int productPrice, int productCategory,
			int productSalePct, String productWeight, String productCapacity, String productDelivery,
			String productCountryOrigin, String productPacking, String productAllergy, String productExpiration,
			String productBreedingCode, String productLivestockHistory, String productInstructions) {
		super();
		this.productCode = productCode;
		this.productName = productName;
		this.productImage = productImage;
		this.productPrice = productPrice;
		this.productCategory = productCategory;
		this.productSalePct = productSalePct;
		this.productWeight = productWeight;
		this.productCapacity = productCapacity;
		this.productDelivery = productDelivery;
		this.productCountryOrigin = productCountryOrigin;
		this.productPacking = productPacking;
		this.productAllergy = productAllergy;
		this.productExpiration = productExpiration;
		this.productBreedingCode = productBreedingCode;
		this.productLivestockHistory = productLivestockHistory;
		this.productInstructions = productInstructions;
	}

	public String getProductCode() {
		return productCode;
	}

	public void setProductCode(String productCode) {
		this.productCode = productCode;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getProductImage() {
		return productImage;
	}

	public void setProductImage(String productImage) {
		this.productImage = productImage;
	}

	public int getProductPrice() {
		return productPrice;
	}

	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}

	public int getProductCategory() {
		return productCategory;
	}

	public void setProductCategory(int productCategory) {
		this.productCategory = productCategory;
	}

	public int getProductSalePct() {
		return productSalePct;
	}

	public void setProductSalePct(int productSalePct) {
		this.productSalePct = productSalePct;
	}

	public String getProductWeight() {
		return productWeight;
	}

	public void setProductWeight(String productWeight) {
		this.productWeight = productWeight;
	}

	public String getProductCapacity() {
		return productCapacity;
	}

	public void setProductCapacity(String productCapacity) {
		this.productCapacity = productCapacity;
	}

	public String getProductDelivery() {
		return productDelivery;
	}

	public void setProductDelivery(String productDelivery) {
		this.productDelivery = productDelivery;
	}

	public String getProductCountryOrigin() {
		return productCountryOrigin;
	}

	public void setProductCountryOrigin(String productCountryOrigin) {
		this.productCountryOrigin = productCountryOrigin;
	}

	public String getProductPacking() {
		return productPacking;
	}

	public void setProductPacking(String productPacking) {
		this.productPacking = productPacking;
	}

	public String getProductAllergy() {
		return productAllergy;
	}

	public void setProductAllergy(String productAllergy) {
		this.productAllergy = productAllergy;
	}

	public String getProductExpiration() {
		return productExpiration;
	}

	public void setProductExpiration(String productExpiration) {
		this.productExpiration = productExpiration;
	}

	public String getProductBreedingCode() {
		return productBreedingCode;
	}

	public void setProductBreedingCode(String productBreedingCode) {
		this.productBreedingCode = productBreedingCode;
	}

	public String getProductLivestockHistory() {
		return productLivestockHistory;
	}

	public void setProductLivestockHistory(String productLivestockHistory) {
		this.productLivestockHistory = productLivestockHistory;
	}

	public String getProductInstructions() {
		return productInstructions;
	}

	public void setProductInstructions(String productInstructions) {
		this.productInstructions = productInstructions;
	}

}
