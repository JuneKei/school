package com.suitup.domain;

public class SuitUpCartVO {
	
	// 상품번호
	private int proNum;
	// 상품명
	private String proName;
	// 회원 아이디
	private String memId;
	// 상품 사이즈
	private String dtproSize;
	// 상품 컬러
	private String dtproColor;
	// 상품 수량
	private int cartCount;
	// 상품 가격
	private int proPrice;
	// 장바구니 번호
	private int cartNum;
	// 카테고리 번호
	private int cateNum;
	// 세부 카테고리 번호
	private int cateDtnum;
	
	
	public int getProNum() {
		return proNum;
	}
	public void setProNum(int proNum) {
		this.proNum = proNum;
	}
	public String getProName() {
		return proName;
	}
	public void setProName(String proName) {
		this.proName = proName;
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getDtproSize() {
		return dtproSize;
	}
	public void setDtproSize(String dtproSize) {
		this.dtproSize = dtproSize;
	}
	public String getDtproColor() {
		return dtproColor;
	}
	public void setDtproColor(String dtproColor) {
		this.dtproColor = dtproColor;
	}
	public int getCartCount() {
		return cartCount;
	}
	public void setCartCount(int cartCount) {
		this.cartCount = cartCount;
	}
	public int getProPrice() {
		return proPrice;
	}
	public void setProPrice(int proPrice) {
		this.proPrice = proPrice;
	}
	public int getCartNum() {
		return cartNum;
	}
	public void setCartNum(int cartNum) {
		this.cartNum = cartNum;
	}
	public int getCateNum() {
		return cateNum;
	}
	public void setCateNum(int cateNum) {
		this.cateNum = cateNum;
	}
	public int getCateDtnum() {
		return cateDtnum;
	}
	public void setCateDtnum(int cateDtnum) {
		this.cateDtnum = cateDtnum;
	}
	
	
	
	
}
