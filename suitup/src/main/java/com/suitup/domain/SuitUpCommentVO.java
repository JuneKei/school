package com.suitup.domain;

public class SuitUpCommentVO {

	// 상품 번호
	private int proNum;
	// 회원 아이디
	private String memId;
	// 리뷰 제목
	private String comTitle;
	// 리뷰 내용
	private String comContent;
	// 리뷰 작성일
	private String comDate;
	// 리뷰 조회수
	private int comCount;
	// 리뷰 별점
	private long comAvg;
	// 리뷰 글번호
	private int comSeq;
	
	public int getProNum() {
		return proNum;
	}
	public void setProNum(int proNum) {
		this.proNum = proNum;
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getComTitle() {
		return comTitle;
	}
	public void setComTitle(String comTitle) {
		this.comTitle = comTitle;
	}
	public String getComContent() {
		return comContent;
	}
	public void setComContent(String comContent) {
		this.comContent = comContent;
	}
	public String getComDate() {
		return comDate;
	}
	public void setComDate(String comDate) {
		this.comDate = comDate;
	}
	public int getComCount() {
		return comCount;
	}
	public void setComCount(int comCount) {
		this.comCount = comCount;
	}
	public long getComAvg() {
		return comAvg;
	}
	public void setComAvg(long comAvg) {
		this.comAvg = comAvg;
	}
	public int getComSeq() {
		return comSeq;
	}
	public void setComSeq(int comSeq) {
		this.comSeq = comSeq;
	}	
	
}
