package com.suitup.domain;

public class SuitUpWishVO {
	// 찜 번호
	private int wishNum;
	// 회원 아이디
	private String memId;
	// 상품명
	private int proNum;
	
	public int getWishNum() {
		return wishNum;
	}
	public void setWishNum(int wishNum) {
		this.wishNum = wishNum;
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public int getProNum() {
		return proNum;
	}
	public void setProNum(int proNum) {
		this.proNum = proNum;
	}
	
}
