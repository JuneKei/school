<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
     <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
     <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Suit Up | 결제 정보</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <!-- Place favicon.ico in the root directory -->
    <link rel="shortcut icon" type="image/x-icon" href="resources/images/favicon.ico">
    <link rel="apple-touch-icon" href="apple-touch-icon.png">
    

    <!-- All css files are included here. -->
    <!-- Bootstrap fremwork main css -->
    <link rel="stylesheet" href="resources/css/bootstrap.min.css">
    <!-- Owl Carousel main css -->
    <link rel="stylesheet" href="resources/css/owl.carousel.min.css">
    <link rel="stylesheet" href="resources/css/owl.theme.default.min.css">
    <!-- This core.css file contents all plugings css file. -->
    <link rel="stylesheet" href="resources/css/core.css">
    <!-- Theme shortcodes/elements style -->
    <link rel="stylesheet" href="resources/css/shortcode/shortcodes.css">
    <!-- Theme main style -->
    <link rel="stylesheet" href="resources/style.css">
    <!-- Responsive css -->
    <link rel="stylesheet" href="resources/css/responsive.css">
    <!-- User style -->
    <link rel="stylesheet" href="resources/css/custom.css">


    <!-- Modernizr JS -->
    <script src="resources/js/vendor/modernizr-2.8.3.min.js"></script>
</head>

<body>
    <!--[if lt IE 8]>
        <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
    <![endif]-->  

    <!-- Body main wrapper start -->
    <div class="wrapper fixed__footer">
        <!-- Start Header Style -->
        <header id="header" class="htc-header header--3 bg__white">
            <!-- Start Mainmenu Area -->
            <div id="sticky-header-with-topbar" class="mainmenu__area sticky__header">
                <div class="container">
                    <div class="row">
                        <div class="col-md-2 col-lg-2 col-sm-3 col-xs-3">
                            <div class="logo">
                                <a href="index.jsp">
                                    <img src="resources/images/logo/logo.png" alt="logo">
                                </a>
                            </div>
                        </div>
                        <!-- Start MAinmenu Ares -->
                        <div class="col-md-8 col-lg-8 col-sm-6 col-xs-6">
                            <nav class="mainmenu__nav hidden-xs hidden-sm">
                                <ul class="main__menu">
                                    <li class="drop"><a href="index.jsp">홈</a></li>
                                    <li class="drop"><a href="#">인기상품</a>
                                        <ul class="dropdown">
                                        <c:set var="cateName" value=""/>
                                        <c:forEach items="${categoryList }" var="list">
                                        <c:if test="${cateName != list.cateName}">
                                            <li><a href="popularity-shop.do?cateNum=${list.cateNum }">${list.cateName }</a></li>
                                            <c:set var="cateName" value="${list.cateName }"/>
                                            </c:if>
                                            </c:forEach>
                                        </ul>
                                    </li>
                                    <li class="drop"><a href="#">카테고리</a>
                                        <ul class="dropdown mega_dropdown">
                                            <!-- Start Single Mega MEnu -->
                                            <li><a class="mega__title" href="#">카테고리별</a>
                                                <ul class="mega__item" id="tab">
                                                    <li id="tabLi1"><a href="#">아우터</a></li>
                                                    <li id="tabLi2"><a href="#">상의</a></li>
                                                    <li id="tabLi3"><a href="#">하의</a></li>
                                                    <li id="tabLi4"><a href="#">신발</a></li>
                                                    <li id="tabLi5"><a href="#">모자</a></li>
                                                </ul>
                                            </li>
                                            <!-- End Single Mega MEnu -->
                                            <!-- Start Single Mega MEnu -->
                                            <li id="tabUl1" style="display: block;"><a class="mega__title" href="#" >아우터</a>
                                                <ul class="mega__item">
                                                <c:set var='cateNum' value='1'/>
                                        		<c:forEach items='${categoryList }' var='list'>
                                        		<c:if test='${list.cateNum eq cateNum}'>
                                        	    <li><a href='shop.do?cateNum=${list.cateNum }&cateDtnum=${list.cateDtnum}'>${list.cateDtname }</a></li>
                                            </c:if>
                                            </c:forEach>                                               
                                               </ul>
                                            </li>
                                            <li id="tabUl2" style="display: block;"><a class="mega__title" href="#" >상의</a>
                                                <ul class="mega__item">
                                                    <c:set var='cateNum' value='2'/>
                                        		<c:forEach items='${categoryList }' var='list'>
                                        		<c:if test='${list.cateNum eq cateNum}'>
                                        	    <li><a href='shop.do?cateNum=${list.cateNum }&cateDtnum=${list.cateDtnum}'>${list.cateDtname }</a></li>
                                            </c:if>
                                            </c:forEach> 
                                               </ul>
                                            </li>
                                            <li id="tabUl3"><a class="mega__title" href="#" >하의</a>
                                                <ul class="mega__item">
                                                    <c:set var='cateNum' value='3'/>
                                        		<c:forEach items='${categoryList }' var='list'>
                                        		<c:if test='${list.cateNum eq cateNum}'>
                                        	    <li><a href='shop.do?cateNum=${list.cateNum }&cateDtnum=${list.cateDtnum}'>${list.cateDtname }</a></li>
                                            </c:if>
                                            </c:forEach> 
                                               </ul>
                                            </li>
                                            <li id="tabUl4"><a class="mega__title" href="#" >신발</a>
                                                <ul class="mega__item">
                                                    <c:set var='cateNum' value='4'/>
                                        		<c:forEach items='${categoryList }' var='list'>
                                        		<c:if test='${list.cateNum eq cateNum}'>
                                        	    <li><a href='shop.do?cateNum=${list.cateNum }&cateDtnum=${list.cateDtnum}'>${list.cateDtname }</a></li>
                                            </c:if>
                                            </c:forEach> 
                                               </ul>
                                            </li>
                                            <li id="tabUl5"><a class="mega__title" href="#" >모자</a>
                                                <ul class="mega__item">
                                                    <c:set var='cateNum' value='5'/>
                                        		<c:forEach items='${categoryList }' var='list'>
                                        		<c:if test='${list.cateNum eq cateNum}'>
                                        	    <li><a href='shop.do?cateNum=${list.cateNum }&cateDtnum=${list.cateDtnum}'>${list.cateDtname }</a></li>
                                            </c:if>
                                            </c:forEach> 
                                               </ul>
                                            </li>
                                            <!-- End Single Mega MEnu -->
                                            <!-- Start Single Mega MEnu -->
                                            <li>
                                                <ul class="mega__item">
                                                    <li>
                                                        <div class="mega-item-img">
                                                            <a href="#">
                                                                <img src="" alt="">
                                                            </a>
                                                        </div>
                                                    </li>
                                                </ul>
                                            </li>
                                            <!-- End Single Mega MEnu -->
                                        </ul>
                                    </li>
                            
                                    <c:if test="${sessionScope.admin eq 1 || cookie.admin.value != null}">
                                    
                                    <li class="drop"><a href="#">관리자 메뉴</a>
                                        <ul class="dropdown">
                                            <li><a href="product-insert.do">상품 등록</a></li>
                                            <li><a href="product-list.do">상품 목록</a></li>
                                            <li><a href="admin-chart.do">통계 페이지</a></li>
                                        </ul>
                                    </li>
                                    </c:if>
                                </ul>
                            </nav>
                            <div class="mobile-menu clearfix visible-xs visible-sm">
                                <nav id="mobile_dropdown">
                                    <ul>
                                        <li><a href="index.jsp">홈</a></li>
                                        <li><a href="#">인기상품</a>
                                            <ul>
                                                   <c:set var="cateName" value=""/>
                                       		 <c:forEach items="${categoryList }" var="list">
                                       		 <c:if test="${cateName != list.cateName}">
                                            <li><a href="popularity-shop.do?cateNum=${list.cateNum }">${list.cateName }</a></li>
                                            <c:set var="cateName" value="${list.cateName }"/>
                                            </c:if>
                                            </c:forEach>
                                            </ul>
                                        </li>
                                     
                                        <li><a href="#">카테고리별</a>
                                            <ul>
                                                <c:set var="cateName" value=""/>
                                       			 <c:forEach items="${categoryList }" var="list">
                                        		<c:if test="${cateName != list.cateName}">
                                            <li><a href="shop.do?cateNum=${list.cateNum }">${list.cateName }</a></li>
                                            <c:set var="cateName" value="${list.cateName }"/>
                                            </c:if>
                                            </c:forEach>
                                            </ul>
                                        </li>
                                        
                                    </ul>
                                </nav>
                            </div>                          
                        </div>
                        <!-- End MAinmenu Ares -->
                        <div class="col-md-2 col-sm-4 col-xs-3">  
                            <ul class="menu-extra">
                                <li class="search search__open hidden-xs"><span class="ti-search"></span></li>
								   	<c:choose>   
								<c:when test="${cookie.SuitUpidCookie.value != null }">
								<li><a href="my-page.do"><span class="ti-user"></span></a></li>								
								<li id="logout"><a href="logout.do"><img src="resources/images/icons/logout.png"/></a></li>
								</c:when>
								<c:when test="${sessionScope.SuitUpid  != null}">
                                <li><a href="my-page.do"><span class="ti-user"></span></a></li>								
								<li id="logout"><a href="logout.do"><img src="resources/images/icons/logout.png"/></a></li>
								</c:when>
								<c:otherwise>
                                <li><a href="login-register.do"><span class="ti-user"></span></a></li>			
								</c:otherwise>
								</c:choose>
                            
                            </ul>
                        </div>
                    </div>
                    <div class="mobile-menu-area"></div>
                </div>
            </div>
            <!-- End Mainmenu Area -->
        </header>
        <!-- End Header Style -->
        
        <div class="body__overlay"></div>
        <!-- Start Offset Wrapper -->
        <div class="offset__wrapper">
            <!-- Start Search Popap -->
            <div class="search__area">
                <div class="container" >
                    <div class="row" >
                        <div class="col-md-12" >
                            <div class="search__inner">
                            <!-- 검색창 -->
                                <form action="searchPage.do" method="get">
                                    <input placeholder="" type="text" name="proName">
                                    <button type="submit"></button>
                                </form>
                                <div class="search__close__btn">
                                    <span class="search__close__btn_icon"><i class="zmdi zmdi-close"></i></span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- End Search Popap -->
        <!-- Start Bradcaump area -->
        <div class="ht__bradcaump__area" style="background: rgba(0, 0, 0, 0) url(resources/images/bg/2.jpg) no-repeat scroll center center / cover ;">
            <div class="ht__bradcaump__wrap">
                <div class="container">
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="bradcaump__inner text-center">
                                <h2 class="bradcaump-title">결제하기</h2>
                                <nav class="bradcaump-inner">
                                  <a class="breadcrumb-item" href="index.jsp">홈</a>
                                  <span class="brd-separetor">/</span>
                                  <span class="breadcrumb-item active">결제하기</span>
                                </nav>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
        <!-- End Bradcaump area -->
        <!-- cart-main-area start -->
        <div class="cart-main-area ptb--120 bg__white">
            <div class="container">
                <div class="row">
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <form action="insertOrder.do" method="post" id="payment">  
                                    
                            <div class="table-content table-responsive">
                                <table>
                                    <thead>
                                        <tr>
                                            <th class="product-thumbnail">상품이미지</th>
                                            <th class="product-name">상품명</th>
                                            <th class="product-price">가격</th>
                                            <th class="product-size">사이즈</th>
                                            <th class="product-color">색상</th>
                                            <th class="product-quantity">수량</th>
                                            <th class="product-subtotal">합계</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <!-- 장바구니 합계 구할 sum 함수 선언 -->
                                    <c:set var = "sum" value = "0" />
                                    <c:if test="${not empty cartList }">
                                   <c:set var= "i" value = "0"/>
                                    <c:forEach items="${cartList }" var="cart">
                                   
                                        <tr>
                                            <td class="product-thumbnail"><img src="resources/images/imgUpload/${fn:split(cart.proImage,'/')[0]}" alt="${cart.proName }" /></td>
                                            <td class="product-name">${cart.proName }</td>
                                            <td class="product-price"><span class="amount">${cart.proPrice } 원</span></td>
                                            <td class="product-size"><span class="amount">${cart.dtproSize }</span></td>
                                            <td class="product-color"><span class="amount">${cart.dtproColor }</span></td>
                                            <td class="product-quantity"><input type="number" value="${cart.cartCount }" readonly/></td>
                                            <td class="product-subtotal">${cart.proPrice * cart.cartCount } 원</td>
                                        </tr>
                                                          
                                        
                                        <c:set var= "sum" value="${sum + (cart.proPrice * cart.cartCount)}"/>
                                        </c:forEach>
                                        </c:if>
                                    </tbody>
                                </table>
                            </div>
                        
                    </div>
                </div>
            </div>
        </div>
        <!-- cart-main-area end -->
        <!-- Start Checkout Area -->
        <section class="our-checkout-area ptb--120 bg__white">
            <div class="container">
                <div class="row">
                    <div class="col-md-8 col-lg-8">
                        <div class="ckeckout-left-sidebar">
                            <!-- Start Checkbox Area -->
                            <div class="checkout-form">
                                <h2 class="section-title-3">주문 / 결제</h2>
                                
                                <div class="checkout-form-inner">
                                <!-- 배송지 선택하는 라디오 버튼 -->
                                <div style="width:200px; padding-bottom: 30px">
  									<input type="radio" name="add" id="new" value="new" checked><label for="new">직접 입력하기</label>
  									<input type="radio" name="add" id="default" value="default" style="margin-left: 10px"><label for="default">기존 배송지</label>
								</div>
                                    <div class="single-checkout-box">
                                    <label>수령인</label>
                                        <input type="text" placeholder="홍길동*" name="receiver" id="receiver" class="new" style="margin-left: 34px">
                                        <input type="hidden" name="receiver" id="receiver" class="default" readonly="readonly" disabled="disabled" value="${userInfo.memName }"/>
                                    </div>
                                    <div class="single-checkout-box">
                                    <label>연락처</label>
                                        <input type="text" placeholder="010-0000-0000*" name="phone" id="phone" class="new" style="margin-left: 34px">
                                        <input type="hidden" name="phone" id="phone" class="default" readonly="readonly" disabled="disabled" value="${userInfo.memPhone }"/>
                                    </div>
                                    <div class="single-checkout-box">
                                    <label>배송지</label>
                                        <input type="text" placeholder="서울시 금천구*" name="address" id="address" class="new" style="margin-left: 34px"	>
                                        <input type="hidden" name="address" id="address" class="default" readonly="readonly" disabled="disabled" value="${userInfo.memAddr }"/>
                                    </div>
                                    <div class="single-checkout-box">
                                    <label>배송 요청사항</label>
                                        <textarea placeholder="요청사항을 입력해주세요*" name="memo"></textarea>
                                    </div>
                                </div>
                            </div>
                            <!-- End Checkbox Area -->
                            <!-- Start Payment Box -->
                            <div class="payment-form">
                                <h2 class="section-title-3">결제 정보 입력</h2>
                                <p>구현하지 않은 부분입니다</p>
                                <div class="payment-form-inner">
                                <label>카드 번호</label><p/>
                                    <div class="single-checkout-box">
                                        
                                        <input type="text" placeholder="xxxx-xxxx-xxxx-xxxx*">
                                    </div>
                                    <div class="single-checkout-box select-option">
                                    <label>카드 유효기간</label>
                                    <p/>
                                        <select>
                                            <option>MM/YY*</option>
                                            <option>MM/YY</option>
                                            <option>MM/YY</option>
                                            <option>MM/YY</option>
                                            <option>MM/YY</option>
                                        </select>
                                        <p/>
                                        <label>CVC번호</label><p/>
                                        <input type="text" placeholder="카드 뒷면 숫자 3자리*">
                                    </div>
                                </div>
                            </div>
                            
                            <!-- End Payment Box -->

                        </div>
                    </div>
                    
                    <div class="col-md-4 col-lg-4">
                        <div class="checkout-right-sidebar">
                                    <div class="cart_totals">
                                        <h2>장바구니 합계</h2>
                                        <table>
                                            <tbody>
                                                <tr class="cart-subtotal">
                                                    <th>합계</th>
                                                    <td><span class="amount">${sum } 원</span></td>
                                                </tr>
                                                <tr class="shipping">
                                                    <th>배송비</th>
                                                    <td>
                                                        <ul id="shipping_method">
                                                            <li>
                                                            <!-- 10만원 미만시 2500원 -->
                                                                <label>
                                                                 <c:choose>
                                                                 <c:when test="${empty cartList or sum < 100000}">
                                                                    <span class="amount">2500 원</span>
                                                                    <c:set var= "sum" value="${sum + 2500}"/>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                    <span class="amount">무료</span>
                                                                    </c:otherwise>
                                                                    </c:choose>
                                                                </label>
                                                            </li>
                                                            <li>
                                                        </ul>
                                                        <p class="shipping-calculator-button">10만원 이상 구매시 배송비 무료</p>
                                                    </td>
                                                </tr>
                                                <tr class="order-total">
                                                    <th>합계</th>
                                                    <td>
                                                    <c:if test="${sum <= 2500}">
                                                    <c:set var="sum" value="0"/>
                                                    </c:if>
                                                        <strong><span class="amount">${sum }&nbsp;원</span></strong>
                                                    </td>
                                                </tr>
                                                <tr>
                                                <td align="right" colspan="2">
                                                
                                                <!-- Start Payment Way -->
                                <div align="right">
                                <div class="wc-proceed-to-checkout">
                                            <a href="#" onclick="payment_check()">결제하기</a>
                                </div>
                                </div>    
                                </form>
                                
                            <!-- End Payment Way -->  
                            </td>
                            </tr>              
                                                
                        
                                            </tbody>
                                        </table>

                                    </div>
                                   
                                </div>
                               
                        </div>
                        
                    </div>
                   
                </div>
            </section>                                                                   
        <!-- End Checkout Area -->
      <!-- Start Footer Area -->
        <footer class="htc__foooter__area gray-bg">
            <div class="container">
                <div class="row">
                    <div class="footer__container clearfix">
                         <!-- Start Single Footer Widget -->
                        <div class="col-md-3 col-lg-3 col-sm-6">
                            <div class="ft__widget">
                                <div class="ft__logo">
                                    <a href="index.jsp">
                                        <img src="resources/images/logo/logo.png" alt="footer logo">
                                    </a>
                                </div>
                                <div class="footer-address">
                                    <ul>
                                        <li>
                                            <div class="address-icon">
                                                <i class="zmdi zmdi-pin"></i>
                                            </div>
                                            <div class="address-text">
                                                <p>서울 금천구</p>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="address-icon">
                                                <i class="zmdi zmdi-email"></i>
                                            </div>
                                            <div class="address-text">
                                                <a href="#"> info@example.com</a>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="address-icon">
                                                <i class="zmdi zmdi-phone-in-talk"></i>
                                            </div>
                                            <div class="address-text">
                                                <p>02-2025-8523</p>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <!-- End Single Footer Widget -->
 
                        <!-- Start Single Footer Widget -->
                      <div class="col-md-3 col-lg-3 col-sm-6">
                            <div class="ft__widget">
                                <h2 class="ft__title">인기상품</h2>
                                <ul class="footer-categories">
                                    <li><a href="popularity-shop.do?cateNum=1">아우터</a></li>
                                    <li><a href="popularity-shop.do?cateNum=2">상의</a></li>
                                    <li><a href="popularity-shop.do?cateNum=3">하의</a></li>
                                    <li><a href="popularity-shop.do?cateNum=4">신발</a></li>
                                    <li><a href="popularity-shop.do?cateNum=5">모자</a></li>
                                </ul>
                            </div>
                        </div> 
                        <!-- End Single Footer Widget -->
                         <!-- Start Single Footer Widget -->
                      <div class="col-md-3 col-lg-3 col-sm-6">
                            <div class="ft__widget">
                                <h2 class="ft__title">카테고리</h2>
                                <ul class="footer-categories">
                                    <li><a href="shop.do?cateNum=1">아우터</a></li>
                                    <li><a href="shop.do?cateNum=2">상의</a></li>
                                    <li><a href="shop.do?cateNum=3">하의</a></li>
                                    <li><a href="shop.do?cateNum=4">신발</a></li>
                                    <li><a href="shop.do?cateNum=5">모자</a></li>
                                </ul>
                            </div>
                        </div> 
                        <!-- End Single Footer Widget -->
                         <!-- Start Single Footer Widget -->
                      <div class="col-md-3 col-lg-3 col-sm-6">
                            <div class="ft__widget">
                                <h2 class="ft__title">마이페이지</h2>
                                <ul class="footer-categories">
                                    <li><a href="my-page.do">주문내역</a></li>
                                    <li><a href="my-page-cart.do">장바구니</a></li>
                                    <li><a href="my-page-wishlist.do">찜 목록</a></li>
                                </ul>
                            </div>
                        </div> 
                        <!-- End Single Footer Widget -->
                    </div>
                </div>
                <!-- Start Copyright Area -->
                <div class="htc__copyright__area">
                    <div class="row">
                        <div class="col-md-12 col-lg-12 col-sm-12 col-xs-12">
                            <div class="copyright__inner">
                                <div class="copyright">
                                    <p>© 2021 KOSMO 86 GEN All Right Reserved.</p>
                                </div>
                                <ul class="footer__menu">
                                    <li><a>배준건</a></li>
                                    <li><a>안영상</a></li>
                                    <li><a>안효석</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- End Copyright Area -->
            </div>
        </footer>
        <!-- End Footer Area -->
    </div>
    <!-- Body main wrapper end -->
    
    <!-- Placed js at the end of the document so the pages load faster -->

    <!-- jquery latest version -->
    <script src="resources/js/vendor/jquery-1.12.0.min.js"></script>
    <!-- Bootstrap framework js -->
    <script src="resources/js/bootstrap.min.js"></script>
    <!-- All js plugins included in this file. -->
    <script src="resources/js/plugins.js"></script>
    <script src="resources/js/slick.min.js"></script>
    <script src="resources/js/owl.carousel.min.js"></script>
    <!-- Waypoints.min.js. -->
    <script src="resources/js/waypoints.min.js"></script>
    <!-- Main js file that contents all jQuery plugins activation. -->
    <script src="resources/js/main.js"></script>
    <!-- 유효성 검사 스크립트 -->
	<script src="resources/js/paymentCheck.js"></script>
	
	
</body>

</html>