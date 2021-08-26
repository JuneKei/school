package com.suitup.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.suitup.domain.SuitUpCartVO;
import com.suitup.domain.SuitUpCategoryVO;
import com.suitup.domain.SuitUpCommentVO;
import com.suitup.domain.SuitUpCustomerVO;
import com.suitup.domain.SuitUpOrderVO;
import com.suitup.domain.SuitUpProductVO;
import com.suitup.domain.SuitUpWishVO;

@Repository("suitupDAO") 
public class SuitUpDAOImpl implements SuitUpDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;

	// 장바구니 불러오기 (map 타입)
	public List<Map> getCartList(SuitUpCartVO vo) {
		System.out.println("===> Mybatis getCartList() 호출");
		return mybatis.selectList("SuitUpDAO.getCartList", vo);
	}
	
	// 장바구니 불러오기 (vo 타입)
	public List<SuitUpCartVO> getCartList2(SuitUpCartVO vo){
		System.out.println("==> Mybatis getCartList2() 호출");
		return mybatis.selectList("SuitUpDAO.getCartList2", vo);
	}
	
	// 장바구니 하나 불러오기(cart_num으로)
	public SuitUpCartVO getCartOne(SuitUpCartVO vo) {
		System.out.println("==> Mybatis getCartOne() 호출");
		return mybatis.selectOne("SuitUpDAO.getCartOne", vo);
	}
	
	// 상품번호로 상품재고 가져오기
	public int getProCount(int proNum) {
		System.out.println("==> Mybatis getProCount() 호출");
		return mybatis.selectOne("SuitUpDAO.getProCount", proNum);
	}
	// 주문 완료
	public int insertOrder(SuitUpOrderVO vo) {
		System.out.println("===> Mybatis insertOrder() 호출");
		return mybatis.insert("SuitUpDAO.insertOrder", vo);
	}
	
	// 장바구니 전부 비우기
	public int deleteCartList(SuitUpCartVO vo) {
		System.out.println("===> Mybatis deleteCartList() 호출");
		return mybatis.delete("SuitUpDAO.deleteCartList", vo);
	}
	
	// 장바구니 한품목 삭제
	public void deleteCart(String cart_num) {
		System.out.println("===> Mybatis deleteCart() 호출");
		mybatis.delete("SuitUpDAO.deleteCart", cart_num);
	}

	// 장바구니 수량 변경
	
	public int changeCart(SuitUpCartVO vo) {
		System.out.println("==> Mybatis changeCart() 호출");
		return mybatis.update("SuitUpDAO.changeCart", vo);
	}
	// 주문내역
	public List<SuitUpOrderVO> getOrderList(SuitUpOrderVO vo) {
		System.out.println("===> Mybatis getOrderList() 호출");
		return mybatis.selectList("SuitUpDAO.orderList", vo);
	}
	// 주문 건수
	public int getOrderListCount(String id) {
		System.out.println("==> Mybatis getOrderListCount() 호출");
		return mybatis.selectOne("SuitUpDAO.orderListCount", id);
	}
	// 회원가입
	public int memberInsert(SuitUpCustomerVO vo) {
		System.out.println("===> Mybatis userInsert() 호출");
		return mybatis.insert("SuitUpDAO.userInsert",vo);
	}
	
	// id중복체크
	public SuitUpCustomerVO idCheck(SuitUpCustomerVO vo) {
		System.out.println("===> Mybatis idCheck() 호출");
		return mybatis.selectOne("SuitUpDAO.idCheck",vo);
	}
	
	// 유저 정보 불러오기
	public SuitUpCustomerVO getUserInfo(SuitUpCustomerVO vo) {
		System.out.println("==> Mybatis getUserInfo() 호출");
		return mybatis.selectOne("SuitUpDAO.getUserInfo", vo);
	}
	// 카테고리 목록 불러오기
	public List<SuitUpCategoryVO> getCategoryList() {
		System.out.println("===> Mybatis getCategoryList() 호출");
		return mybatis.selectList("SuitUpDAO.getCategoryList");
	}

	// 상품목록 불러오기
	public List<SuitUpProductVO> getProductList(SuitUpProductVO vo) {
		System.out.println("===> Mybatis getProductList() 호출");
		return mybatis.selectList("SuitUpDAO.getProductList", vo);
	}

	// 인기 상품목록 불러오기
	public List<SuitUpProductVO> getPopularList(SuitUpProductVO vo){
		System.out.println("===> Mybatis getPopularList() 호출");
		return mybatis.selectList("SuitUpDAO.getPopularList", vo);
	}

	// 신제품 불러오기
	public List<SuitUpProductVO> getNewList() {
		System.out.println("===> Mybatis getNewList() 호출");
		return mybatis.selectList("SuitUpDAO.getNewList");
	}
	
	// 관리자 상품 등록하기
		public int Productinsert(SuitUpProductVO vo) {
			System.out.println("===> Mybatis Productinsert() 호출");
			return mybatis.insert("SuitUpDAO.Productinsert",vo);
	}
		
		 // 관리자 상품 목록
		public List<SuitUpProductVO> getAdminList() {
			System.out.println("===> Mybatis getAdminList() 호출");
			return mybatis.selectList("SuitUpDAO.getAdminList");
		}
		
		// 관리자 상품 수정하기
		public int productModify(SuitUpProductVO vo) {
			System.out.println("==> Mybatis productModify() 호출");
			return mybatis.update("SuitUpDAO.productModify", vo);
		}
		// 관리자 상품 삭제하기 
	    public void productDelete(int proNum) {
	    	System.out.println("===> Mybatis productDelete() 호출");
			mybatis.delete("SuitUpDAO.productDelete", proNum);
				
			} 
		
	//정보 수정
    public int memberModify(SuitUpCustomerVO vo) {
        System.out.println("===> Mybatis memberModify() 호출");
        return mybatis.update("SuitUpDAO.memberModify",vo);

    }

	// 상품 상세 페이지
	public SuitUpProductVO getProductDetails(SuitUpProductVO vo) {
		System.out.println("==> Mybatis getProductDetails() 호출");
		return mybatis.selectOne("SuitUpDAO.getProductDetails", vo);
	}
	
	// 상품 장바구니에 담기
	public int insertCart(SuitUpCartVO vo) {
		System.out.println("==> Mybatis insertCart() 호출");
		return mybatis.insert("SuitUpDAO.insertCart", vo);
	}

	// 상품 수정
	public int updateProduct(SuitUpProductVO vo) {
		System.out.println("==> Mybatis updateProduct() 호출");
		return mybatis.update("SuitUpDAO.updateProduct", vo);
	}

	// 리뷰 불러오기
	public List<SuitUpCommentVO> getCommentList(SuitUpCommentVO vo) {
		System.out.println("==> Mybatis getCommentList() 호출");
		return mybatis.selectList("SuitUpDAO.getCommentList", vo);
	}
	// 주문내역 확인
	public int orderCheck(SuitUpCommentVO vo) {
		System.out.println("==> Mybatis orderCheck() 호출");
		return mybatis.selectOne("SuitUpDAO.orderCheck", vo);
	}
	// 리뷰 작성하기
	public int insertComment(SuitUpCommentVO vo) {
		System.out.println("==> Mybatis insertComment() 호출");
		return mybatis.insert("SuitUpDAO.insertComment", vo);
	}

	// 리뷰 삭제하기
	public int deleteComment(SuitUpCommentVO vo) {
		System.out.println("==> Mybatis deleteComment() 호출");
		return mybatis.delete("SuitUpDAO.deleteComment", vo);
	}

	// 리뷰 수정하기
	public int updateComment(SuitUpCommentVO vo) {
		System.out.println("==> Mybatis updateComment() 호출");
		return mybatis.update("SuitUpDAO.updateComment", vo);
	}
    
	// 상품 별점 가져오기
	public long getReviewAvg(SuitUpCommentVO vo) {
		System.out.println("==> Mybatis getReviewAvg() 호출");
		return mybatis.selectOne("SuitUpDAO.getReviewAvg", vo);
	}

	// 리뷰 갯수 가져오기
	public int getReviewCount(SuitUpCommentVO vo) {
		System.out.println("==> Mybatis getReviewCount() 호출");
		return mybatis.selectOne("SuitUpDAO.getReviewCount", vo);
	}

	// 리뷰 내용 가져오기
	public SuitUpCommentVO getComment(SuitUpCommentVO vo) {
		System.out.println("==> Mybatis getComment() 호출");
		return mybatis.selectOne("SuitUpDAO.getComment", vo);
	}
	
	// 회원 정보 가져오기
	public List<SuitUpCustomerVO> getCustomerList() {
		System.out.println("==> Mybatis getMemberList() 호출");
		return mybatis.selectList("SuitUpDAO.getMemberList");	
	}

	// 주문 정보 가져오기
	public List<SuitUpOrderVO> getAdminOrderList(SuitUpOrderVO vo) {
		System.out.println("==> Mybatis getAdminOrderList 호출");
		return mybatis.selectList("SuitUpDAO.getAdminOrderList",vo);	
	}
	
	// 월별 총액
	public List<Map<String,String>>  getMonthSum() {
		System.out.println("==> Mybatis getMonthSum() 호출");
		return mybatis.selectList("SuitUpDAO.getMonthSum");
	}
	
	// 일별 총액
	public List<Map<String,String>>  getDaySum() {
		System.out.println("==> Mybatis getDaySum() 호출");
		return mybatis.selectList("SuitUpDAO.getDaySum");
	}
	
	// 일별 총액
	public List<Map<String,String>>  getCateSum() {
		System.out.println("==> Mybatis getCateSum() 호출");
		return mybatis.selectList("SuitUpDAO.getCateSum");
	}

	// 배송 시작
	public int deliveryStart(SuitUpOrderVO vo) {
		System.out.println("==> Mybatis deliveryStart() 호출");
		return mybatis.update("SuitUpDAO.deliveryStart",vo);
	}

	// 배송 완료
	public int deliveryEnd(SuitUpOrderVO vo) {
		System.out.println("==> Mybatis deliveryEnd() 호출");
		return mybatis.update("SuitUpDAO.deliveryEnd",vo);
	}
	
	// 찜 추가
	public int insertWish(SuitUpWishVO vo) {
		System.out.println("==> Mybatis insertWish() 호출");
		return mybatis.insert("SuitUpDAO.insertWish", vo);
	}
	
	// 찜 삭제
	public int deleteWish(SuitUpWishVO vo) {
		System.out.println("==> Mybatis deleteWish() 호출");
		System.out.println("아이디 : " + vo.getMemId());
		System.out.println("상품 번호 : " +  vo.getProNum());
		System.out.println("찜 번호 : " + vo.getWishNum());
		return mybatis.delete("SuitUpDAO.deleteWish", vo);
	}

	// 찜 중복 체크
	public int overlapWish(SuitUpWishVO vo) {
		System.out.println("==> Mybatis overlapWish() 호출");
		return mybatis.selectOne("SuitUpDAO.overlapWish", vo);
	}

	// 찜 목록 가져오기
	public List<Map<String, String>> getWishList(String memId) {
		System.out.println("==> Mybatis getWishList() 호출");
		return mybatis.selectList("SuitUpDAO.getWishList", memId);
	}
	
	// 상품 검색하기
	public List<SuitUpProductVO> searchProductList(SuitUpProductVO vo){
		System.out.println("==> Mybatis searchProductList() 호출");
		return mybatis.selectList("SuitUpDAO.searchProductList", vo);
	}
	
	// 비밀번호 리셋
	public int userPwdReset(SuitUpCustomerVO vo) {
		System.out.println("==> Mybatis userPwdReset() 호출");		
		return mybatis.update("SuitUpDAO.userPwdReset", vo);
	}

	// 비밀번호 변경
	public int pwdModifyOk(SuitUpCustomerVO vo) {
		System.out.println("==> Mybatis pwdModifyOk() 호출");		
		return mybatis.update("SuitUpDAO.pwdModifyOk", vo);
	}

	// 회원 탈퇴
	public int myDelete(SuitUpCustomerVO vo) {
		System.out.println("==> Mybatis myDelete() 호출");		
		return mybatis.delete("SuitUpDAO.myDelete", vo);
	}

	// 비밀번호 일치 하는지
	public SuitUpCustomerVO userPassCheck(SuitUpCustomerVO vo) {
		System.out.println("==> Mybatis userPassCheck() 호출");		
		return mybatis.selectOne("SuitUpDAO.userPassCheck", vo);
	}
}
