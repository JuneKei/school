package com.suitup.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.UrlPathHelper;

import com.suitup.domain.SuitUpCartVO;
import com.suitup.domain.SuitUpCategoryVO;
import com.suitup.domain.SuitUpCommentVO;
import com.suitup.domain.SuitUpCustomerVO;
import com.suitup.domain.SuitUpOrderVO;
import com.suitup.domain.SuitUpProductVO;
import com.suitup.domain.SuitUpWishVO;
import com.suitup.service.SuitUpService;

@Controller
public class SuitUpController {
	@Autowired
	private SuitUpService suitupService;
	
	@Inject
	BCryptPasswordEncoder pwEncoder;
	
	@RequestMapping("/{url}.do")
	public String viewPage(@PathVariable String url, Model m) {
		// 카테고리 불러오기 위해 모든 페이지에 이 태그 넣기
		m.addAttribute("categoryList", suitupService.getCategoryList());
		return url;
	}
	
	@RequestMapping("index.do")
	public String index(Model m, String cateNum) {
		
		System.out.println("현재 인기상품 카테고리 번호 : " + cateNum);
		SuitUpProductVO vo = new SuitUpProductVO();
		if(cateNum == null)
			vo.setCateNum(1);
		else
			vo.setCateNum(Integer.parseInt(cateNum));
		
		// 카테고리 불러오기 위해 모든 페이지에 이 태그 넣기
		m.addAttribute("categoryList", suitupService.getCategoryList());
		// 인기 상품 불러오기
		m.addAttribute("popularList", suitupService.getPopularList(vo));
		// 신상품 불러오기
		m.addAttribute("newList", suitupService.getNewList());
		return "index";
	}
	
	// 장바구니 진입시
	@RequestMapping("my-page-cart.do")
	public String cart(Model m, HttpServletRequest request, HttpSession session ) {
		
		// 쿠키에서 가져올 id값을 저장할 변수 id 선언
		String id = null;
		// 쿠키 가져오기
		Cookie[] cookies = request.getCookies();
		for(Cookie cookie : cookies) {
			if(cookie.getName().equals("SuitUpidCookie"))
				id = cookie.getValue();
		}
		// 쿠키가 null 이면 세션 가져오기
		if(id == null)
		id = (String) session.getAttribute("SuitUpid");
		if(id != null) {
		SuitUpCartVO vo = new SuitUpCartVO();
		vo.setMemId(id);
		
		// 쿠키에서 가져온 id 값으로 장바구니 검색
		m.addAttribute("cartList", suitupService.getCartList(vo));
		m.addAttribute("categoryList", suitupService.getCategoryList());
		
		return "my-page-cart";
		
		}
		// id값이 없을시 로그인 페이지로
		else
			return "login-register";
			
	}
	
	// ajax로 cartNum이랑 cartCount 가져옴
	// 장바구니 수량 변경 ajax
	@RequestMapping(value = "changeCart.do",  produces="application/text;charset=UTF-8")
	@ResponseBody
	public String changeCart(SuitUpCartVO vo) {
		
		// 기존 카트 재고에 변경된 재고를 뺀값 -> su_pro 테이블에 넣을값
		int newCount = suitupService.getCartOne(vo).getCartCount() - vo.getCartCount();

		int proNum = suitupService.getCartOne(vo).getProNum();
		
		int result = suitupService.changeCart(vo);
		
		if(result == 1) {
			
			// 장바구니 수량 변경 성공시 장바구니 수량 변화한 만큼 재고도 변화
			SuitUpProductVO pro = new SuitUpProductVO();
			pro.setProNum(proNum);
			pro.setDtproCount(newCount);
			
			suitupService.updateProduct(pro);
			
			
			return "수량 변경 성공";
		}
		else
			return "수량 변경 실패";
	}
	
	// 주문하러 가기
	@RequestMapping("checkout.do")
	public String checkout(Model m, HttpServletRequest request, HttpSession session) {
		// 쿠키에서 가져올 id값을 저장할 변수 id 선언
				String id = null;
				// 쿠키 가져오기
				Cookie[] cookies = request.getCookies();
				for(Cookie cookie : cookies) {
					if(cookie.getName().equals("SuitUpidCookie"))
						id = cookie.getValue();
				}
				// 쿠키가 null 이면 세션 가져오기
				if(id == null)
				id = (String) session.getAttribute("SuitUpid");
				
				if(id != null) {
					SuitUpCartVO vo = new SuitUpCartVO();
					SuitUpCustomerVO user = new SuitUpCustomerVO();
					vo.setMemId(id);
					user.setMemId(id);
			
					// 유저 정보 넘기기
					m.addAttribute("userInfo", suitupService.getUserInfo(user));
					m.addAttribute("cartList", suitupService.getCartList(vo));
					m.addAttribute("categoryList", suitupService.getCategoryList());
					return "checkout";
		
				}
				// id값이 없을시 로그인 페이지로
				else
					return "login-register";
	}
	
	// 주문하기
	@RequestMapping("insertOrder.do")
	public String insertOrder(String receiver, String phone, String address, String memo, Model m, HttpServletRequest request, HttpSession session) {
		
		// 쿠키에서 가져올 id값을 저장할 변수 id 선언
				String id = null;
				// 쿠키 가져오기
				Cookie[] cookies = request.getCookies();
				for(Cookie cookie : cookies) {
					if(cookie.getName().equals("SuitUpidCookie"))
						id = cookie.getValue();
					}
				// 쿠키가 null 이면 세션 가져오기
					if(id == null)
						id = (String) session.getAttribute("SuitUpid");
				
				// 몇건 주문 들어가는지 받아올 result 변수 선언
				int result = 0;
				
				if(memo == null)
					memo = "";
				
				SuitUpCartVO cartvo = new SuitUpCartVO();
				
				if(id != null) {
					cartvo.setMemId(id);		
				
					List<SuitUpCartVO> list = suitupService.getCartList2(cartvo);
					for(SuitUpCartVO vo : list) {
						SuitUpOrderVO ordervo = new SuitUpOrderVO();
						ordervo.setMemId(vo.getMemId());
						ordervo.setProNum(vo.getProNum());
						ordervo.setDtproSize(vo.getDtproSize());
						ordervo.setDtproColor(vo.getDtproColor());
						ordervo.setOrderCount(vo.getCartCount());
						ordervo.setOrderAddress(address);
						ordervo.setOrderReceiver(receiver);
						ordervo.setOrderPhone(phone);
						ordervo.setOrderMemo(memo);
						ordervo.setProPrice(vo.getProPrice());
						ordervo.setProName(vo.getProName());
						ordervo.setCateNum(vo.getCateNum());
						ordervo.setCateDtnum(vo.getCateDtnum());
					
						result = result + suitupService.insertOrder(ordervo);
					
						
					}
					
			System.out.println(result);
			// 주문 완료 후 장바구니 비우기
			suitupService.deleteCartList(cartvo);
			m.addAttribute("categoryList", suitupService.getCategoryList());
			// 주문 성공시
			if(result > 0)
				// 주문내역 페이지 만들면 주문내역 페이지로 넘어감
				return "redirect:my-page.do";
			else
				// 주문 실패시
				return "redirect:checkout.do";
			}
		// id값이 없을시 로그인 페이지로
		else
			return "login-register";
		
	}
	
	// 장바구니 한품목 삭제
	@RequestMapping("dropCart.do")
	public String deleteCart(String cart_num, String pro_num, String count, Model m) {
		
		// 장바구니 삭제
		suitupService.deleteCart(cart_num);
		
		// 장바구니 추가한 만큼 재고 줄이기
		SuitUpProductVO vo = new SuitUpProductVO();
		vo.setProNum(Integer.parseInt(pro_num));
		vo.setDtproCount(Integer.parseInt(count));
		suitupService.updateProduct(vo);
		
		m.addAttribute("categoryList", suitupService.getCategoryList());
		return "redirect:my-page-cart.do";
	}
	
	// 주문내역 진입시
		@RequestMapping("my-page.do")
		public String history(Model m, HttpServletRequest request, HttpSession session, String page) {
			
			// 쿠키에서 가져올 id값을 저장할 변수 id 선언
			String id = null;
			// 쿠키 가져오기
			Cookie[] cookies = request.getCookies();
			for(Cookie cookie : cookies) {
				if(cookie.getName().equals("SuitUpidCookie"))
					id = cookie.getValue();
			}
			
			// 쿠키가 null 이면 세션 가져오기
			if(id == null)
			id = (String) session.getAttribute("SuitUpid");
			
			if(id != null) {
				SuitUpOrderVO vo = new SuitUpOrderVO();
				vo.setMemId(id);
			
			
			
			
			// 주문 내역
			m.addAttribute("orderList", suitupService.getOrderList(vo));
			m.addAttribute("categoryList", suitupService.getCategoryList());
			
			// 페이징
			// 주문건수 불러오기
			int maxNum = suitupService.getOrderListCount(id);
			// 주문건수가 0건이 아닌 경우에만 페이징 처리
			if(maxNum != 0) {
				
				if(page == null)
					page = "1";
			
				int pageNum = Integer.parseInt(page);
			
				// 페이지 수가 1 미만인 경우 1로 수정
				if(pageNum < 1)
					pageNum = 1;
				
				// 한페이지에 보여줄 테이블 갯수
				int pageCount = 5;
				// 첫번째 테이블
				int min = (pageNum-1) * pageCount;
				// 마지막 테이블
				int max = (pageNum * pageCount) - 1;
				// 전체 페이지
				int totPage = (int)Math.ceil(((double)maxNum / (double)pageCount));
				// 현재 페이지가 전체 페이지보다 클 경우 전체 페이지로 변경
				if(pageNum > totPage)
					pageNum = totPage;
				// 현재 최소 페이지
				int minPage = pageNum - 4;
				// 1보다 작으면 1로 변경
				if(minPage < 1)
					minPage = 1;
				// 현재 최대 페이지
				int maxPage = pageNum + 4;
				// 현재 최대 페이지가 전체 페이지보다 클 경우 전체 페이지로 변경
				if(maxPage > totPage)
					maxPage = totPage;
				// 페이징 데이터 해쉬맵에 담기
				HashMap pageMap = new HashMap();
				pageMap.put("min", min);
				pageMap.put("max", max);
				pageMap.put("minPage", minPage);
				pageMap.put("maxPage", maxPage);
				pageMap.put("totPage", totPage);
				pageMap.put("currentPage", pageNum);
				m.addAttribute("pageMap", pageMap);
				
				}
			return "my-page";
			}
			return "login-register";
		}
		
		// 회원가입 진입시
		@RequestMapping("register.do") 
		public ModelAndView register(SuitUpCustomerVO vo, Model m) {
			String inputPw = vo.getMemPass();
			String pw = pwEncoder.encode(inputPw);
			vo.setMemPass(pw);
			suitupService.userInsert(vo); 
			
			ModelAndView mv = new ModelAndView();
			mv.setViewName("login-register-ok"); // 회원가입 완료 페이지로 이동
			
			String id= vo.getMemId();
//			
			mv.addObject("id",id);
			m.addAttribute("categoryList", suitupService.getCategoryList());
			return mv;	
			//회원가입 완료페이지로
		}
		
		// 회원가입 아이디 중복검사시 
		@RequestMapping(value="idCheck.do", produces="application/text;charset=UTF-8")
		@ResponseBody   //Ajax [String 으로 반환하면 페이지 이동이기 떄문에]
		public String idCheck(SuitUpCustomerVO vo) {
			SuitUpCustomerVO result = suitupService.userIdCheck(vo);
			String message= "사용가능한 아이디입니다.";
			if(result != null) message="이미 사용중인 아이디 입니다";
			return message;
		}
		
		//로그인시 ajax
				@RequestMapping(value="login.do",  produces="application/text;charset=UTF-8")
				@ResponseBody
				public String login(SuitUpCustomerVO vo, HttpSession session,HttpServletResponse response) {
					SuitUpCustomerVO result = suitupService.userIdCheck(vo);
					Cookie cookie = new Cookie("SuitUpidCookie", result.getMemId());
					Cookie admin = new Cookie("admin", result.getMemAdmin());
					String message ="아이디 또는 비밀번호를 확인하세요.";
					boolean pwMatch = pwEncoder.matches(vo.getMemPass(), result.getMemPass());
					System.out.println(pwMatch);
					if(result != null && pwMatch == true ) {
						message="로그인성공";
						session.setAttribute("SuitUpid", result.getMemId());
							if(vo.getMemCookie().equals("cookieOn")) {
								cookie.setMaxAge(60*60*24);
								admin.setMaxAge(60*60*24);
								
							}else {
								cookie.setMaxAge(0);
								admin.setMaxAge(0);
								
							}
							// 어드민 값이 1인 경우에만 세션에 저장
						if(result.getMemAdmin().equals("1"))
							session.setAttribute("admin", result.getMemAdmin());
					}
					
					
					response.addCookie(cookie);
					
					// 어드민 값이 1일때만 어드민 쿠키 생성
					if(result.getMemAdmin().equals("1"))
					response.addCookie(admin);
					return message;
				}
		
		// 상품목록 페이지
		@RequestMapping("shop.do")
		public void shop(Model m, SuitUpProductVO vo) {
			m.addAttribute("categoryList", suitupService.getCategoryList());
			m.addAttribute("productList", suitupService.getProductList(vo));
		}
		
		// 로그 아웃 눌렀을때 쿠키 삭제
		@RequestMapping(value="logout.do")
		public String logout(HttpServletResponse response, HttpSession session, HttpServletRequest request){

		Cookie cookie = new Cookie("SuitUpidCookie", null); // 쿠키에 대한 값을 null로 지정
		

		cookie.setMaxAge(0); // 유효시간을 0으로 설정

		response.addCookie(cookie); // 응답 헤더에 추가해서 없어지도록 함
		
		Cookie admin = new Cookie("admin", null); // 쿠키에 대한 값을 null로 지정

		admin.setMaxAge(0); // 유효시간을 0으로 설정

		response.addCookie(admin); // 응답 헤더에 추가해서 없어지도록 함
		
		session.invalidate();
		
		String referer = request.getHeader("REFERER");
		
		return "redirect:"+referer;
		}
		
		
		
		// 인기상품 페이지
		@RequestMapping("popularity-shop.do")
		public void popular(Model m, String cateNum) {
			// 카테고리 번호가 없을시 1번으로 지정
			SuitUpProductVO vo = new SuitUpProductVO();
			
			if(cateNum == null)
				cateNum = "1";
			
			vo.setCateNum(Integer.parseInt(cateNum));			
			
			m.addAttribute("categoryList", suitupService.getCategoryList());
			m.addAttribute("popularList", suitupService.getPopularList(vo));
		}
		
		//관리자 상품 등록페이지 
		@RequestMapping("product-insert.do") 
		public void productinsert(Model m) {
			
			List<SuitUpCategoryVO> categoryList=suitupService.getCategoryList();
			m.addAttribute("categoryList",categoryList);
		}
		
		//관리자 상품 DB에 저장
		@RequestMapping(value="product-save.do",method=RequestMethod.POST) 
		public String productSave(Model m,SuitUpProductVO vo,HttpServletRequest request,HttpSession session) {
						
			suitupService.Productinsert(vo);
					
			return "redirect:product-insert.do";
		}
		// 관리자 상품 목록
		@RequestMapping("product-list.do") 
		public void adminlist(Model m) {
			SuitUpProductVO vo = new SuitUpProductVO();
			
			System.out.println("--------------Controller-----------------");
			
			List<SuitUpProductVO> adminlist=suitupService.getAdminList();
			m.addAttribute("categoryList", suitupService.getCategoryList());
			m.addAttribute("adminlist",adminlist);		
		}
       
		// 관리자 상품 수정 페이지
	
 		@RequestMapping("product-modify.do")
 		 public String productModifypage(HttpServletRequest httpServletRequest, 
 				 RedirectAttributes rttr,SuitUpProductVO vo, Model m) {
	       
	       
	        String proNum1 = httpServletRequest.getParameter("mdProNum");
	        
	        int proNum;
	        proNum = Integer.parseInt(proNum1);
	        
	        vo.setProNum(proNum);
	        
	        SuitUpProductVO product = suitupService.getProductDetails(vo);
	        
	        System.out.println("데이터확인");
	        System.out.println(product.getCateDtnum());
	        System.out.println(product.getDtproCount());
	 
	        m.addAttribute("productDetails", product);
	        m.addAttribute("proNum", proNum);
	        m.addAttribute("categoryList", suitupService.getCategoryList());
	        return "product-modify";
 		}
 		//관리자 상품 DB에 수정하기
		@RequestMapping(value="productModify",method=RequestMethod.POST) 
		public String productModify(HttpServletRequest httpServletRequest, Model m,SuitUpProductVO vo) {
			System.out.println("####productModify######");
			
			String proNum1 = httpServletRequest.getParameter("proNum");
			 int proNum;
	        proNum = Integer.parseInt(proNum1);
	        
	        vo.setProNum(proNum);
			
			System.out.println(vo.getProNum()); 	
			System.out.println(vo.getProName());
			System.out.println(vo.getProPrice());
			System.out.println(vo.getCateNum());
			System.out.println(vo.getCateDtnum());
			System.out.println(vo.getDtproCount());
			System.out.println(vo.getDetail().get(0));
			System.out.println(vo.getImage().get(0));
			
			suitupService.productModify(vo);
			m.addAttribute("categoryList", suitupService.getCategoryList());
			return "redirect:product-list.do";
		}
 		// 관리자 상품 삭제
		@RequestMapping(value="productDelete",method=RequestMethod.POST) 
		public String productDelete(HttpServletRequest httpServletRequest, Model m) {
			System.out.println("####productDelete######");
			String proNum1 = httpServletRequest.getParameter("mdProNum");
			 int proNum;
	        proNum = Integer.parseInt(proNum1);
			
			suitupService.productDelete(proNum);
			return "redirect:product-list.do";
		}
				
				//주소 팝업
			    @RequestMapping("/jusoPopup.do")
			    public String zipcode() throws Exception {
			    return "jusoPopup";
			    }

			    //회원정보 수정
			    @RequestMapping("memModify.do")
			    public ModelAndView memModifiy(ModelAndView mv,SuitUpCustomerVO vo) {
			        int result = suitupService.memModifiy(vo);
			        
			        System.out.println(result);
			        mv.setViewName("redirect:my-page-modify.do");
			        mv.addObject("result", result);
			        
			        return mv;
			    }
			    
			  //회원가입 수정 정보 내보낼때
			    @RequestMapping("my-page-modify.do")
			    public void memberModify(Model m , HttpServletRequest request,HttpSession session) {
			        // 쿠키에서 가져올 id값을 저장할 변수 id 선언
			        SuitUpCustomerVO vo = new SuitUpCustomerVO();
			        String id = null;
			        // 쿠키 가져오기
			        Cookie[] cookies = request.getCookies();
			        for(Cookie cookie : cookies) {
			            if(cookie.getName().equals("SuitUpidCookie"))
			                id = cookie.getValue();
			        }
			        // 쿠키가 null 이면 세션 가져오기
			        if(id == null)
			        id = (String) session.getAttribute("SuitUpid");
			        if(id != null) {
			        vo.setMemId(id);
			        }

			        m.addAttribute("categoryList", suitupService.getCategoryList());
			        m.addAttribute("mem",suitupService.userIdCheck(vo));
			    }
			    
		// 상품 상세 페이지
		@RequestMapping("product.do")
		public String productDetails(SuitUpProductVO vo,Model m, HttpServletRequest request,HttpSession session) {
			
			 // 쿠키에서 가져올 id값을 저장할 변수 id 선언
	        String id = null;
	        // 쿠키 가져오기
	        Cookie[] cookies = request.getCookies();
	        for(Cookie cookie : cookies) {
	            if(cookie.getName().equals("SuitUpidCookie"))
	                id = cookie.getValue();
	        }
	        // 쿠키가 null 이면 세션 가져오기
	        if(id == null)
	        id = (String) session.getAttribute("SuitUpid");
	        
			SuitUpProductVO product = suitupService.getProductDetails(vo);
			
			// 잘못된 상품일 경우 에러페이지로 연결 예정
			if(product.getProName() == null) {
				return "errorPage";
			}
			
			// 리뷰 불러오기
			SuitUpCommentVO comment = new SuitUpCommentVO();
			
			comment.setProNum(vo.getProNum());
			
			long avg = 0;
			
			int count = suitupService.getReviewCount(comment);
			if(count != 0)
				avg = suitupService.getReviewAvg(comment);
			
			if(id != null) {
			// 찜 여부 넘기기
			SuitUpWishVO wish = new SuitUpWishVO();
			wish.setMemId(id);
			wish.setProNum(vo.getProNum());			
			m.addAttribute("wish", suitupService.overlapWish(wish));
			}
			else
				m.addAttribute("wish", 0);
			// 리뷰 갯수 불러오기
			m.addAttribute("reviewCount", count);		
			// 상품 별점 불러오기
			m.addAttribute("reviewAvg", avg);
			// 리뷰 불러오기
			m.addAttribute("reviewList", suitupService.getCommentList(comment));
			// 상품 설명 불러오기
			m.addAttribute("productDetails", product);
			// 카테고리 불러오기
			m.addAttribute("categoryList", suitupService.getCategoryList());
			return "product";
		}
		
		// 리뷰 등록전 구매내역 확인
		@RequestMapping(value = "orderCheck.do", produces="application/text;charset=UTF-8")
		@ResponseBody
		public int orderCheck(SuitUpCommentVO vo) {
			return suitupService.orderCheck(vo);
		}
		
		// 리뷰 등록하기
		@RequestMapping("insertReview.do")
		public String insertReview(SuitUpCommentVO vo, HttpServletRequest request,HttpSession session, HttpServletResponse response) throws IOException {
			
			// 쿠키에서 가져올 id값을 저장할 변수 id 선언
			String id = null;
			// 쿠키 가져오기
			Cookie[] cookies = request.getCookies();
				for(Cookie cookie : cookies) {
						if(cookie.getName().equals("SuitUpidCookie"))
							id = cookie.getValue();
						}
									
			// 쿠키가 null 이면 세션 가져오기
			if(id == null)
				id = (String) session.getAttribute("SuitUpid");
						
			if(id != null) {				
				vo.setMemId(id);
			}
			// 로그인이 안되있을경우 로그인 페이지로 리턴
			if(id == null)
				return "login-register";
			
			suitupService.insertComment(vo);
			
			return "redirect:product.do?proNum=" + vo.getProNum();
			
		}
		
		// 리뷰 수정페이지
		@RequestMapping("modify-review.do")
		public String modifyReview(SuitUpCommentVO vo, HttpServletRequest request,HttpSession session, Model m) {
			
			// 쿠키에서 가져올 id값을 저장할 변수 id 선언
			String id = null;
			// 쿠키 가져오기
			Cookie[] cookies = request.getCookies();
				for(Cookie cookie : cookies) {
						if(cookie.getName().equals("SuitUpidCookie"))
							id = cookie.getValue();
						}
											
			// 쿠키가 null 이면 세션 가져오기
			if(id == null)
				id = (String) session.getAttribute("SuitUpid");
								
			if(id != null) {				
				vo.setMemId(id);
			}
			// 로그인이 안되있을경우 로그인 페이지로 리턴
			if(id == null)
				return "login-register";
					
			// get방식으로 받아온 seqNum으로 리뷰 내용 가져옴
			vo = suitupService.getComment(vo);
			
			// seqNum으로 찾아온 아이디랑 로그인된 아이디랑 다를 경우 에러페이지로 리턴
			if(!vo.getMemId().equals(id))
					return "error";
			
			m.addAttribute("comment", vo);
			m.addAttribute("categoryList", suitupService.getCategoryList());
			return "modify-review";
					
			}
		
		// 리뷰 수정 버튼
		@RequestMapping("updateComment.do")
		public String updateComment(SuitUpCommentVO vo, HttpServletRequest request,HttpSession session) {
			// 쿠키에서 가져올 id값을 저장할 변수 id 선언
			String id = null;
			// 쿠키 가져오기
			Cookie[] cookies = request.getCookies();
				for(Cookie cookie : cookies) {
						if(cookie.getName().equals("SuitUpidCookie"))
							id = cookie.getValue();
						}
														
			// 쿠키가 null 이면 세션 가져오기
			if(id == null)
				id = (String) session.getAttribute("SuitUpid");
											
			if(id != null) {				
				vo.setMemId(id);
			}
			// 로그인이 안되있을경우 로그인 페이지로 리턴
			if(id == null)
				return "login-register";
			
			// 로그인 되어있는 아이디와 폼에서 받아온 아이디가 다르면 에러페이지로 리턴
			if(!id.equals(vo.getMemId()))
				return "error";
			
			
			int result = suitupService.updateComment(vo);
			
			// 수정된 결과가 0행이면 에러페이지로 리턴
			if(result == 0)
				return "error";
			
			
			
			return "redirect:product.do?proNum=" + vo.getProNum();
		}
		
		// 리뷰 삭제
		@RequestMapping("deleteReview.do")
		public String deleteReview(SuitUpCommentVO vo) {
			suitupService.deleteComment(vo);
			return "redirect:product.do?proNum=" + vo.getProNum();
		}
		
		// 장바구니 담기
		@RequestMapping("insertCart.do")
		public String insertCart(SuitUpCartVO vo, HttpServletRequest request,HttpSession session) {
			// 쿠키에서 가져올 id값을 저장할 변수 id 선언
			String id = null;
			// 쿠키 가져오기
			Cookie[] cookies = request.getCookies();
				for(Cookie cookie : cookies) {
						if(cookie.getName().equals("SuitUpidCookie"))
							id = cookie.getValue();
						}
						
			// 쿠키가 null 이면 세션 가져오기
			if(id == null)
				id = (String) session.getAttribute("SuitUpid");
			
			if(id != null) {				
				vo.setMemId(id);
				
				// 장바구니에 추가
				int result = suitupService.insertCart(vo);
				
				// 장바구니 추가한 만큼 재고 줄이기
				SuitUpProductVO product = new SuitUpProductVO();
				product.setProNum(vo.getProNum());
				product.setDtproCount(vo.getCartCount() * -1);
				suitupService.updateProduct(product);
					return "redirect:my-page-cart.do";
				
				}
				// id값이 없을시 로그인 페이지로
				else
					return "login-register";
		}
		//관리자페이지 회원정보
				@RequestMapping("admin-table.do")
				public String customerInfo(Model m) {
					m.addAttribute("categoryList", suitupService.getCategoryList());
					m.addAttribute("customerList", suitupService.getCustomerList());
					return "admin-table";
				}
				//관리자페이지 주문관리
				@RequestMapping(value= {"admin-order.do","admin-delivery.do","admin-delivery-ok.do"})
				//여러 페이지
				public String orderInfo(Model m,SuitUpOrderVO vo,HttpServletRequest request) {
					// 현재 받은 페이지 값 나타내고 substring 으로 맨앞 / 삭제
					UrlPathHelper urls = new UrlPathHelper(); 
					String url = urls.getOriginatingServletPath(request).substring(1);
					String returnUrl="";
					m.addAttribute("categoryList", suitupService.getCategoryList());
					if("admin-order.do".equals(url)) {
						vo.setOrderStatus("주문완료");
						m.addAttribute("orderList", suitupService.getAdminOrderList(vo));
						returnUrl= "admin-order";				
					}else if("admin-delivery.do".equals(url)){
						vo.setOrderStatus("배송중");
						m.addAttribute("orderList", suitupService.getAdminOrderList(vo));			
						returnUrl= "admin-delivery";								
					}else {
						vo.setOrderStatus("배송완료");
						m.addAttribute("orderList", suitupService.getAdminOrderList(vo));			
						returnUrl= "admin-delivery-ok";												
					}
					return returnUrl;				
				}
				// 관리자페이지 차트
				@RequestMapping(value="admin-chart.do", method=RequestMethod.GET)
				public String getMonthSum(Model m){
					//월별
					List<Map<String,String>> list= suitupService.getMonthSum();
					//일별
					List<Map<String,String>> list2= suitupService.getDaySum();
					//카테고리별
					List<Map<String,String>> list3= suitupService.getCateSum();
					m.addAttribute("list",list);
					m.addAttribute("list2",list2);
					m.addAttribute("list3",list3);
					m.addAttribute("categoryList", suitupService.getCategoryList());
					return "admin-chart" ;
				}
				// 배송시작 ajax
				@RequestMapping(value="deliveryStart.do", produces="application/text;charset=UTF-8")
				@ResponseBody 
				public String deliveryStart(SuitUpOrderVO vo) {
					int result = suitupService.deliveryStart(vo);
					String ok = "실패";
					if(result ==1) {
						ok="성공";
					}
					return ok;
				}
				// 배송 완료 ajax
				@RequestMapping(value="deliveryEnd.do", produces="application/text;charset=UTF-8")
				@ResponseBody 
				public String deliveryEnd(SuitUpOrderVO vo) {
					int result = suitupService.deliveryEnd(vo);
					String ok = "실패";
					if(result ==1) {
						ok="성공";
					}
					return ok;
				}

		
		// 찜 등록 (AJAX)
		@RequestMapping(value = "insertWish.do", produces="application/text;charset=UTF-8")
		@ResponseBody
		public String insertWish(SuitUpWishVO vo) {
			
			if(suitupService.overlapWish(vo) > 0)
				return "이미 찜한 상품입니다";
			else {
			
			
			int result = suitupService.insertWish(vo);
			if(result == 1)
				return "찜 목록에 추가하였습니다";
			else
				return "에러가 발생했습니다";
			}
		}
		
		// 찜 삭제 (AJAX)
		@RequestMapping(value = "deleteWish.do", produces="application/text;charset=UTF-8")
		@ResponseBody
		public String deleteWish(SuitUpWishVO vo) {
			if(vo.getMemId().equals(null) || vo.getProNum() == 0)
				return "에러가 발생했습니다";
			int result = suitupService.deleteWish(vo);
			if(result == 1)
				return "찜 목록에서 삭제하였습니다";
			else
				return "에러가 발생했습니다";
		}
				
		// 찜목록 불러오기
		@RequestMapping("my-page-wishlist.do")
		public String wishList(Model m, HttpServletRequest request,HttpSession session) {
			// 쿠키에서 가져올 id값을 저장할 변수 id 선언
			String memId = null;
			// 쿠키 가져오기
			Cookie[] cookies = request.getCookies();
				for(Cookie cookie : cookies) {
						if(cookie.getName().equals("SuitUpidCookie"))
							memId = cookie.getValue();
						}
									
			// 쿠키가 null 이면 세션 가져오기
			if(memId == null)
				memId = (String) session.getAttribute("SuitUpid");
			if(memId == null)
				return "login-register";
			m.addAttribute("wishList", suitupService.getWishList(memId));
			m.addAttribute("categoryList", suitupService.getCategoryList());
				return "my-page-wishlist";
			
		}
		
		// 찜 삭제 (개별 삭제, 전체 삭제 포함)	
		@RequestMapping(value="dropWishlist.do",produces="application/text;charset=UTF-8")
		@ResponseBody
		public String dropWishlist(SuitUpWishVO vo) {
			int result = suitupService.deleteWish(vo);
			System.out.println("찜 목록 삭제 갯수 : " + result);
			if(result > 1)
				return "삭제되었습니다";
			else
				return "찜 목록이 비어있습니다";
		}
		
		// 장바구니 삭제
		@RequestMapping(value="deleteCartlist.do", produces="application/text;charset=UTF-8")
		@ResponseBody
		public String deleteCartlist(SuitUpCartVO vo) {
		
			List<Map> cartList = suitupService.getCartList(vo);
			
			if(cartList == null)
				return "장바구니가 비어있습니다";
			
			for(Map map : cartList) {
				
				int dtproCount = (Integer.parseInt(map.get("cartCount").toString()));

				int proNum = (Integer.parseInt(map.get("proNum").toString()));
				
				// 장바구니 수량 변경 성공시 장바구니 수량 변화한 만큼 재고도 변화
				SuitUpProductVO pro = new SuitUpProductVO();
				pro.setProNum(proNum);
				pro.setDtproCount(dtproCount);
				
				suitupService.updateProduct(pro);
			}
			
			
			int result = suitupService.deleteCartList(vo);
			System.out.println("삭제된 장바구니 수 : " + result);
			if(result > 0) {			
				return "장바구니가 전부 삭제되었습니다";
			}
			else
				return "장바구니가 비어있습니다";
		}
		
		// 검색
		@RequestMapping("searchPage.do")
		public void search(SuitUpProductVO vo, Model m) {
			m.addAttribute("categoryList", suitupService.getCategoryList());
			m.addAttribute("searchProductList", suitupService.searchProductList(vo));
			
		}
		
		//비밀번호 리셋 ajax
		@RequestMapping(value="pwdReset.do",  produces="application/text;charset=UTF-8")
		@ResponseBody
		public String pwdReset(SuitUpCustomerVO vo) {
			String save= vo.getMemPass();
			
			String result="일치하는 정보가 없습니다.";
			String inputPw = save;
			String pw = pwEncoder.encode(inputPw);
			vo.setMemPass(pw);

			int count = suitupService.userPwdReset(vo);
			if(count == 1) {
				result= "임시 비밀번호 : "+save+"로 변경되었습니다.";
			}
			return result;
		}
		//비밀번호 변경 ajax
		@RequestMapping(value="pwdModify.do",  produces="application/text;charset=UTF-8")
		@ResponseBody
		public String pwdModify(SuitUpCustomerVO vo) {
			SuitUpCustomerVO result = suitupService.userIdCheck(vo);
			boolean pwMatch = pwEncoder.matches(vo.getMemPass(), result.getMemPass());
			String ok= "no";
			if(result != null && pwMatch == true) {
				ok= "ok";				
			}
			return ok;
		}
		//비밀번호 변경 완료 ajax
		@RequestMapping(value="pwdModifyOk.do",  produces="application/text;charset=UTF-8")
		@ResponseBody
		public String pwdModifyOk(SuitUpCustomerVO vo) {
			String result= "";
			String inputPw = vo.getMemPass();
			String pw = pwEncoder.encode(inputPw);
			vo.setMemPass(pw);
			int count = suitupService.pwdModifyOk(vo);
			if(count == 1) {
				result= "비밀번호가 변경되었습니다.";
			}else {
				result = "오류";
			}
			return result;
		}
		//회원탈퇴
		@RequestMapping(value="myDelete.do",  produces="application/text;charset=UTF-8")
		@ResponseBody
		public String myDelete(SuitUpCustomerVO vo ,HttpServletResponse response, HttpSession session, HttpServletRequest request) {
			String ok="no";
			SuitUpCustomerVO result = suitupService.userIdCheck(vo);
			boolean pwMatch = pwEncoder.matches(vo.getMemPass(), result.getMemPass());
			if(pwMatch == true) {
				int count = suitupService.myDelete(vo);
				if(count == 1) {
					ok= "ok";
					Cookie cookie = new Cookie("SuitUpidCookie", null); // 쿠키에 대한 값을 null로 지정
					cookie.setMaxAge(0); // 유효시간을 0으로 설정
					response.addCookie(cookie); // 응답 헤더에 추가해서 없어지도록 함
					session.invalidate();
				}
			}
			return ok;
		}
}
