package com.suitup.domain;

import java.util.List;

public class SuitUpOrderVO {

	// 주문번호
	private int orderNum;
	// 회원아이디
	private String memId;
	// 상품번호
	private int proNum;
	// 상품 사이즈
	private String dtproSize;
	// 상품 색상
	private String dtproColor;
	// 주문량
	private int orderCount;
	// 주문상태
	private String orderStatus;
	// 주문날짜
	private String orderDate;
	// 배송지
	private String orderAddress;
	// 수취인
	private String orderReceiver;
	// 수취인 연락처
	private String orderPhone;
	// 배송 요청사항
	private String orderMemo;
	// 상품 가격(1개기준)
	private int proPrice;
	// 상품명
	private String proName;
	// 카테고리 번호
	private int cateNum;
	// 상세 카테고리 번호
	private int cateDtnum;
	
	
	
	public int getOrderNum() {
		return orderNum;
	}
	public void setOrderNum(int orderNum) {
		this.orderNum = orderNum;
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
	public int getOrderCount() {
		return orderCount;
	}
	public void setOrderCount(int orderCount) {
		this.orderCount = orderCount;
	}
	public String getOrderStatus() {
		return orderStatus;
	}
	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}
	public String getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}
	public String getOrderAddress() {
		return orderAddress;
	}
	public void setOrderAddress(String orderAddress) {
		this.orderAddress = orderAddress;
	}
	public String getOrderReceiver() {
		return orderReceiver;
	}
	public void setOrderReceiver(String orderReceiver) {
		this.orderReceiver = orderReceiver;
	}
	public String getOrderPhone() {
		return orderPhone;
	}
	public void setOrderPhone(String orderPhone) {
		this.orderPhone = orderPhone;
	}
	public String getOrderMemo() {
		return orderMemo;
	}
	public void setOrderMemo(String orderMemo) {
		this.orderMemo = orderMemo;
	}
	public int getProPrice() {
		return proPrice;
	}
	public void setProPrice(int proPrice) {
		this.proPrice = proPrice;
	}
	public String getProName() {
		return proName;
	}
	public void setProName(String proName) {
		this.proName = proName;
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
