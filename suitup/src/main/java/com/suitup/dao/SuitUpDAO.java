package com.suitup.dao;

import java.util.List;
import java.util.Map;

import com.suitup.domain.SuitUpCartVO;
import com.suitup.domain.SuitUpCategoryVO;
import com.suitup.domain.SuitUpCommentVO;
import com.suitup.domain.SuitUpCustomerVO;
import com.suitup.domain.SuitUpOrderVO;
import com.suitup.domain.SuitUpProductVO;
import com.suitup.domain.SuitUpWishVO;

public interface SuitUpDAO {

	public List<Map> getCartList(SuitUpCartVO vo);
	
	public List<SuitUpCartVO> getCartList2(SuitUpCartVO vo);
	
	public SuitUpCartVO getCartOne(SuitUpCartVO vo);
	
	public int getProCount(int proNum);
	
	public int insertOrder(SuitUpOrderVO vo);
		
	public void deleteCart(String cart_num);
	
	public int deleteCartList(SuitUpCartVO vo);
	
	int changeCart(SuitUpCartVO vo);
	
	public List<SuitUpOrderVO> getOrderList(SuitUpOrderVO vo);
	
	public int getOrderListCount(String id);
		
	int memberInsert(SuitUpCustomerVO vo);
	
	SuitUpCustomerVO idCheck(SuitUpCustomerVO vo);
	
	public List<SuitUpCategoryVO> getCategoryList();
	
	public List<SuitUpProductVO> getProductList(SuitUpProductVO vo);
	
	public List<SuitUpProductVO> getPopularList(SuitUpProductVO vo);
	
	public List<SuitUpProductVO> getNewList();
	
	//관리자 상품등록
		public int Productinsert(SuitUpProductVO vo);
			
		//관리자 상품목록
		public List<SuitUpProductVO> getAdminList();
		
		//관리자 상품삭제
		public void productDelete(int proNum);
		
		//관리자 상품수정
		public int productModify(SuitUpProductVO vo);
	
	//회원정보 수정
	public int memberModify(SuitUpCustomerVO vo);

	//상품 상세 페이지
	public SuitUpProductVO getProductDetails(SuitUpProductVO vo);
	
	public int insertCart(SuitUpCartVO vo);
	
	public int updateProduct(SuitUpProductVO vo);
	
	public List<SuitUpCommentVO> getCommentList(SuitUpCommentVO vo);
	
	int orderCheck(SuitUpCommentVO vo);
	
	public int insertComment(SuitUpCommentVO vo);
	
	public int deleteComment(SuitUpCommentVO vo);
	
	public int updateComment(SuitUpCommentVO vo);
	
	public long getReviewAvg(SuitUpCommentVO vo);
	
	public int getReviewCount(SuitUpCommentVO vo);
	
	public SuitUpCommentVO getComment(SuitUpCommentVO vo);
	
	public SuitUpCustomerVO getUserInfo(SuitUpCustomerVO vo);
	
	public List<SuitUpCustomerVO> getCustomerList();

	public List<SuitUpOrderVO> getAdminOrderList(SuitUpOrderVO vo);

	public List<Map<String,String>> getMonthSum();

	public List<Map<String,String>> getDaySum();

	public List<Map<String,String>> getCateSum();
	
	public int deliveryStart(SuitUpOrderVO vo);
	
	public int deliveryEnd(SuitUpOrderVO vo);

	public int insertWish(SuitUpWishVO vo);
	
	public int deleteWish(SuitUpWishVO vo);
	
	public int overlapWish(SuitUpWishVO vo);
	
	public List<Map<String, String>> getWishList(String memId);
	
	List<SuitUpProductVO> searchProductList(SuitUpProductVO vo);
	
	public int userPwdReset(SuitUpCustomerVO vo);

	public int pwdModifyOk(SuitUpCustomerVO vo);
	
	public int myDelete(SuitUpCustomerVO vo);

	public SuitUpCustomerVO userPassCheck(SuitUpCustomerVO vo);

}
