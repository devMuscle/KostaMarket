package com.KostaMarket.Cart.vo;

public class Cart {
	private String cartCode;
	private String ID;
	private int productCount;
	private String productCode;
	private int zoneCode;
	private String roadAddress;
	private String detailAddress;
	private String productImage;
	private String productName;
	private String productPacking;
	private int productSalePct;
	private int productPrice;
	private String phone;
	private String email;
	private String name;
	private int memberShipPoint;
	
	public int getMemberShipPoint() {
		return memberShipPoint;
	}

	public void setMemberShipPoint(int memberShipPoint) {
		this.memberShipPoint = memberShipPoint;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	public Cart() {
		super();
	}

	public String getCartCode() {
		return cartCode;
	}

	public void setCartCode(String cartCode) {
		this.cartCode = cartCode;
	}

	public String getID() {
		return ID;
	}

	public void setID(String iD) {
		ID = iD;
	}

	public int getProductCount() {
		return productCount;
	}

	public void setProductCount(int productCount) {
		this.productCount = productCount;
	}

	public String getProductCode() {
		return productCode;
	}

	public void setProductCode(String productCode) {
		this.productCode = productCode;
	}
	
	public int getZoneCode() {
		return zoneCode;
	}

	public void setZoneCode(int zoneCode) {
		this.zoneCode = zoneCode;
	}

	public String getRoadAddress() {
		return roadAddress;
	}

	public void setRoadAddress(String roadAddress) {
		this.roadAddress = roadAddress;
	}

	public String getDetailAddress() {
		return detailAddress;
	}

	public void setDetailAddress(String detailAddress) {
		this.detailAddress = detailAddress;
	}

	public String getProductImage() {
		return productImage;
	}

	public void setProductImage(String productImage) {
		this.productImage = productImage;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getProductPacking() {
		return productPacking;
	}

	public void setProductPacking(String productPacking) {
		this.productPacking = productPacking;
	}

	public int getProductSalePct() {
		return productSalePct;
	}

	public void setProductSalePct(int productSalePct) {
		this.productSalePct = productSalePct;
	}

	public int getProductPrice() {
		return productPrice;
	}

	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}
}
