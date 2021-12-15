package com.KostaMarket.Order.vo;

public class OrderDetail {
	private String orderNumber;
	private String orderProductCode;
	private int orderProductCount;
	private int orderProductPrice;
	private int orderProductSalePct;

	public OrderDetail() {
		super();
	}

	public String getOrderNumber() {
		return orderNumber;
	}

	public void setOrderNumber(String orderNumber) {
		this.orderNumber = orderNumber;
	}

	public String getOrderProductCode() {
		return orderProductCode;
	}

	public void setOrderProductCode(String orderProductCode) {
		this.orderProductCode = orderProductCode;
	}

	public int getOrderProductCount() {
		return orderProductCount;
	}

	public void setOrderProductCount(int orderProductCount) {
		this.orderProductCount = orderProductCount;
	}

	public int getOrderProductPrice() {
		return orderProductPrice;
	}

	public void setOrderProductPrice(int orderProductPrice) {
		this.orderProductPrice = orderProductPrice;
	}

	public int getOrderProductSalePct() {
		return orderProductSalePct;
	}

	public void setOrderProductSalePct(int orderProductSalePct) {
		this.orderProductSalePct = orderProductSalePct;
	}
}
