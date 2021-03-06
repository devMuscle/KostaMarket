package com.KostaMarket.Customer.vo;

public class Customer {
	private String id;
	private String pw;
	private String name;
	private String zoneCode;
	private String roadAddress;
	private String detailAddress;
	private String gender;
	private String birthday;
	private String phone;
	private String email;
	private int memberShipPoint;


	public Customer() {
		super();
	}

	public Customer(String id, String pw, String name, String zoneCode, String roadAddress, String detailAddress,
			String gender, String birthday, String phone, String email, int memberShipPoint) {
		super();
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.zoneCode = zoneCode;
		this.roadAddress = roadAddress;
		this.detailAddress = detailAddress;
		this.gender = gender;
		this.birthday = birthday;
		this.phone = phone;
		this.email = email;
		this.memberShipPoint = memberShipPoint;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getZoneCode() {
		return zoneCode;
	}

	public void setZoneCode(String zoneCode) {
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

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
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

	public int getMemberShipPoint() {
		return memberShipPoint;
	}

	public void setMemberShipPoint(int memberShipPoint) {
		this.memberShipPoint = memberShipPoint;
	}

}
