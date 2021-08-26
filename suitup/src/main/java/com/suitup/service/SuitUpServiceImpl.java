package com.suitup.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.suitup.dao.SuitUpDAO;
import com.suitup.domain.SuitUpCartVO;
import com.suitup.domain.SuitUpCategoryVO;
import com.suitup.domain.SuitUpCommentVO;
import com.suitup.domain.SuitUpCustomerVO;
import com.suitup.domain.SuitUpOrderVO;
import com.suitup.domain.SuitUpProductVO;
import com.suitup.domain.SuitUpWishVO;
@Service("suitupService")
public class SuitUpServiceImpl implements SuitUpService {

	@Autowired
	private SuitUpDAO suitupDAO;

	// 장바구니 불러오기(map 타입)
	public List<Map> getCartList(SuitUpCartVO vo) {
		return suitupDAO.getCartList(vo);
	}
	
	// 장바구니 불러오기(vo 타입)
	public List<SuitUpCartVO> getCartList2(SuitUpCartVO vo){
		return suitupDAO.getCartList2(vo);
	}
	
	// 장바구니 하나 불러오기(cart_num으로 호출)
	public SuitUpCartVO getCartOne(SuitUpCartVO vo) {
		return suitupDAO.getCartOne(vo);
	}
	
	// 상품번호로 상품재고 가져오기
	public int getProCount(int proNum) {
		return suitupDAO.getProCount(proNum);
	}
	// 주문 하기
	public int insertOrder(SuitUpOrderVO vo) {
		return suitupDAO.insertOrder(vo);
		
	}

	// 장바구니 전부 삭제
	public int deleteCartList(SuitUpCartVO vo) {
		return suitupDAO.deleteCartList(vo);
		
	}

	// 장바구니 한품목 삭제
	public void deleteCart(String cart_num) {
		suitupDAO.deleteCart(cart_num);		
	}

	// 장바구니 수량 변경
	public int changeCart(SuitUpCartVO vo) {
		return suitupDAO.changeCart(vo);
	}
	// 주문내역 불러오기
	public List<SuitUpOrderVO> getOrderList(SuitUpOrderVO vo) {
		return suitupDAO.getOrderList(vo);
	}
	// 주문건수 불러오기
	public int getOrderListCount(String id) {
		return suitupDAO.getOrderListCount(id);
	}
	// 회원가입
	public int userInsert(SuitUpCustomerVO vo) {
		return suitupDAO.memberInsert(vo);
	}
	// 아이디 중복 체크
	public SuitUpCustomerVO userIdCheck(SuitUpCustomerVO vo) {
		return suitupDAO.idCheck(vo);
	}
	
	// 유저 정보 불러오기
	public SuitUpCustomerVO getUserInfo(SuitUpCustomerVO vo) {
		return suitupDAO.getUserInfo(vo);
	}

	// 카테고리 목록 불러오기
	public List<SuitUpCategoryVO> getCategoryList() {
		return suitupDAO.getCategoryList();
	}

	// 상품목록 검색하기
	public List<SuitUpProductVO> getProductList(SuitUpProductVO vo){
		return suitupDAO.getProductList(vo);
	}

	// 인기상품목록 검색하기
	public List<SuitUpProductVO> getPopularList(SuitUpProductVO vo) {
		return suitupDAO.getPopularList(vo);
	}
	
	// 신제품 검색하기
	public List<SuitUpProductVO> getNewList() {
		return suitupDAO.getNewList();
	}
	
	// 상품등록
			public int Productinsert(SuitUpProductVO vo) {
				return suitupDAO.Productinsert(vo);
	}
		
			// 관리자 상품 목록 불러오기
			public List<SuitUpProductVO> getAdminList(){
				System.out.println("--------------service-----------------");
				return suitupDAO.getAdminList();
			}
			// 관리자 상품 수정하기
			public int productModify(SuitUpProductVO vo) {
				return suitupDAO.productModify(vo);	
			}
			// 관리자 상품 삭제하기
			public void productDelete(int proNum) {
				suitupDAO.productDelete(proNum);		
			}
	//정보수정
    public int memModifiy(SuitUpCustomerVO vo) {
        return suitupDAO.memberModify(vo);
    }

	// 상품 상세 페이지
	public SuitUpProductVO getProductDetails(SuitUpProductVO vo) {
		return suitupDAO.getProductDetails(vo);
	}

	// 장바구니 추가하기
	public int insertCart(SuitUpCartVO vo) {
		return suitupDAO.insertCart(vo);
	}

	// 상품 재고 수정
	public int updateProduct(SuitUpProductVO vo) {
		return suitupDAO.updateProduct(vo);
	}

	// 리뷰 불러오기
	public List<SuitUpCommentVO> getCommentList(SuitUpCommentVO vo) {
		return suitupDAO.getCommentList(vo);
	}

	// 리뷰 등록하기
	public int insertComment(SuitUpCommentVO vo) {
		return suitupDAO.insertComment(vo);
	}

	public int orderCheck(SuitUpCommentVO vo) {
		return suitupDAO.orderCheck(vo);
	}
	// 리뷰 삭제하기
	public int deleteComment(SuitUpCommentVO vo) {
		return suitupDAO.deleteComment(vo);
	}

	// 리뷰 수정하기
	public int updateComment(SuitUpCommentVO vo) {
		return suitupDAO.updateComment(vo);
	}

	// 상품 별점 가져오기
	public long getReviewAvg(SuitUpCommentVO vo) {
		return suitupDAO.getReviewAvg(vo);
	}

	// 상품 리뷰 갯수 가져오기
	public int getReviewCount(SuitUpCommentVO vo) {
		return suitupDAO.getReviewCount(vo);
	}

	// 리뷰 내용 불러오기
	public SuitUpCommentVO getComment(SuitUpCommentVO vo) {
		return suitupDAO.getComment(vo);
	}
	// 회원 리스트
	public List<SuitUpCustomerVO> getCustomerList() {
		return suitupDAO.getCustomerList();
	}

	// 주문 리스트
	public List<SuitUpOrderVO> getAdminOrderList(SuitUpOrderVO vo) {
		return suitupDAO.getAdminOrderList(vo);
	}
	
	//월별 총액
	public List<Map<String, String>> getMonthSum() {
		return suitupDAO.getMonthSum();
	}
	
	//일별 총액
	public List<Map<String, String>> getDaySum() {
		return suitupDAO.getDaySum();
	}

	//일별 총액
	public List<Map<String, String>> getCateSum() {
		return suitupDAO.getCateSum();
	}

	//배송 시작
	public int deliveryStart(SuitUpOrderVO vo) {
		return suitupDAO.deliveryStart(vo);
	}

	//배송 완료
	public int deliveryEnd(SuitUpOrderVO vo) {
		return suitupDAO.deliveryEnd(vo);
	}

	// 찜 추가
	public int insertWish(SuitUpWishVO vo) {
		return suitupDAO.insertWish(vo);
	}

	// 찜 삭제
	public int deleteWish(SuitUpWishVO vo) {
		return suitupDAO.deleteWish(vo);
	}
	// 찜 중복 확인
	public int overlapWish(SuitUpWishVO vo) {
		return suitupDAO.overlapWish(vo);
	}

	// 찜목록 리스트 가져오기
	public List<Map<String, String>> getWishList(String memId) {
		return suitupDAO.getWishList(memId);
	}
	
	// 상품 검색
	public List<SuitUpProductVO> searchProductList(SuitUpProductVO vo){
		return suitupDAO.searchProductList(vo);
	}
	// 비밀번호 리셋
	public int userPwdReset(SuitUpCustomerVO vo) {
		return suitupDAO.userPwdReset(vo);
	}
	
	// 비밀번호 변경
	public int pwdModifyOk(SuitUpCustomerVO vo) {
		return suitupDAO.pwdModifyOk(vo);
	}
	
	// 회원탈퇴
	public int myDelete(SuitUpCustomerVO vo) {
		return suitupDAO.myDelete(vo);
	}

	// 비밀번호 일치하는지
	public SuitUpCustomerVO userPassCheck(SuitUpCustomerVO vo) {
		return suitupDAO.userPassCheck(vo);
	}

}
