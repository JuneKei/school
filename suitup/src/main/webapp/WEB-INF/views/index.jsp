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
    <title>Suit Up</title>
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
                                        <li><a href="my-page-cart.do">장바구니</a></li>
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
								<input type="hidden" value="${cookie.SuitUpidCookie.value}" name="memId"/>
								</c:when>
								<c:when test="${sessionScope.SuitUpid  != null}">
                                <li><a href="my-page.do"><span class="ti-user"></span></a></li>								
								<li id="logout"><a href="logout.do"><img src="resources/images/icons/logout.png"/></a></li>
								<input type="hidden" value="${sessionScope.SuitUpid}" name="memId"/>
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
		</div>
        <!-- Start Feature Product -->
        <section class="categories-slider-area bg__white" style="padding-bottom: 30px">
            <div class="container">
                <div class="row">
                    <!-- Start Left Feature -->
                    <div class="col-md-9 col-lg-9 col-sm-8 col-xs-12 float-left-style">
                        <!-- Start Slider Area -->
                        <div class="slider__container slider--one">
                            <div class="slider__activation__wrap owl-carousel owl-theme">
                            
                                <!-- Start Single Slide -->
                                 <c:forEach items="${newList }" var="list">
                                <div class="slide slider__full--screen slider-height-inherit slider-text-right" style="background: rgba(0, 0, 0, 0) url(resources/images/imgUpload/${fn:split(list.proImage,'/')[0]}) no-repeat scroll center center / cover ;">
                                    <div class="container">
                                        <div class="row">
                                            <div class="col-md-10 col-lg-8 col-md-offset-2 col-lg-offset-4 col-sm-12 col-xs-12">
                                            	<div class="slider__inner">
                                                    <h1><span class="text--theme">New</span></h1>
                                                    <div class="slider__btn">
                                                        <a class="htc__btn" href="product.do?proNum=${list.proNum}">shop now</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                </c:forEach>
                                <!-- End Single Slide -->
                            </div>
                        </div>
                        <!-- Start Slider Area -->
                    </div>
                    <div class="col-md-3 col-lg-3 col-sm-4 col-xs-12 float-right-style">
                        <div class="categories-menu mrg-xs">
                            <div class="category-heading">
                               <h3> 카테고리</h3>
                            </div>
                            <div class="category-menu-list">
                                <ul>
                                    <li><a href="#"><img alt="" src="images/icons/thum2.png"> 인기 상품 <i class="zmdi zmdi-chevron-right"></i></a>
                                        <div class="category-menu-dropdown" style="width: 350px">
                                            <div class="category-part-1 category-common mb--30">
                                                <h4 class="categories-subtitle"> 인기 상품</h4>
                                                <ul>
                                                    <c:set var="cateName" value=""/>
                                        <c:forEach items="${categoryList }" var="list">
                                        <c:if test="${cateName != list.cateName}">
                                            <li><a href="popularity-shop.do?cateNum=${list.cateNum }">${list.cateName }</a></li>
                                            <c:set var="cateName" value="${list.cateName }"/>
                                            </c:if>
                                            </c:forEach>
                                                </ul>
                                            </div>
                                        </div>
                                    </li>
                                    <li><a href="#"><img alt="" src="images/icons/thum3.png"> 아우터 <i class="zmdi zmdi-chevron-right"></i></a>
                                        <div class="category-menu-dropdown" style="width: 350px">
                                            <div class="category-part-1 category-common2 mb--30">
                                                <h4 class="categories-subtitle"> 아우터</h4>
                                                <ul>
                                                    <c:set var='cateNum' value='1'/>
                                        		<c:forEach items='${categoryList }' var='list'>
                                        		<c:if test='${list.cateNum eq cateNum}'>
                                        	    <li><a href='shop.do?cateNum=${list.cateNum }&cateDtnum=${list.cateDtnum}'>${list.cateDtname }</a></li>
                                            </c:if>
                                            </c:forEach> 
                                                </ul>
                                            </div>
                                            <div class="mega-banner-img">
                                                <a href="single-product.html">
                                                    <img src="images/feature-img/5.jpg" alt="">
                                                </a>
                                            </div>
                                        </div>
                                    </li>
                                    <li><a href="#"><img alt="" src="images/icons/thum4.png"> 상의 <i class="zmdi zmdi-chevron-right"></i></a>
                                        <div class="category-menu-dropdown" style="width: 350px">
                                            <div class="category-menu-dropdown-top">
                                                <div class="category-part-1 category-common2 mb--30">
                                                    <h4 class="categories-subtitle"> 상의</h4>
                                                    <ul>
                                                        <c:set var='cateNum' value='2'/>
                                        		<c:forEach items='${categoryList }' var='list'>
                                        		<c:if test='${list.cateNum eq cateNum}'>
                                        	    <li><a href='shop.do?cateNum=${list.cateNum }&cateDtnum=${list.cateDtnum}'>${list.cateDtname }</a></li>
                                            </c:if>
                                            </c:forEach> 
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </li>
                                    <li><a href="#"><img alt="" src="images/icons/thum5.png"> 하의 <i class="zmdi zmdi-chevron-right"></i></a>
                                        <div class="category-menu-dropdown" style="width: 350px">
                                            <div class="category-menu-dropdown-left">
                                                <div class="category-part-1 category-common mb--30">
                                                    <h4 class="categories-subtitle"> 하의</h4>
                                                    <ul>
                                                        <c:set var='cateNum' value='3'/>
                                        		<c:forEach items='${categoryList }' var='list'>
                                        		<c:if test='${list.cateNum eq cateNum}'>
                                        	    <li><a href='shop.do?cateNum=${list.cateNum }&cateDtnum=${list.cateDtnum}'>${list.cateDtname }</a></li>
                                            </c:if>
                                            </c:forEach> 
                                                    </ul>
                                                </div>
                                                </div>
                                            <div class="category-menu-dropdown-right">
                                                <div class="menu-right-img">
                                                    <a href="#"><img src="images/feature-img/2.png" alt=""></a>
                                                </div>
                                            </div>
                                        </div>
                                    </li>
                                    <li><a href="#"><img alt="" src="images/icons/thum6.png"> 신발 <i class="zmdi zmdi-chevron-right"></i></a>
                                        <div class="category-menu-dropdown" style="width: 350px">
                                            <div class="category-menu-dropdown-left">
                                                <div class="category-part-1 category-common">
                                                    <h4 class="categories-subtitle"> 신발</h4>
                                                    <ul>
                                                        <c:set var='cateNum' value='4'/>
                                        		<c:forEach items='${categoryList }' var='list'>
                                        		<c:if test='${list.cateNum eq cateNum}'>
                                        	    <li><a href='shop.do?cateNum=${list.cateNum }&cateDtnum=${list.cateDtnum}'>${list.cateDtname }</a></li>
                                            </c:if>
                                            </c:forEach> 
                                                    </ul>
                                                </div>
                                               </div>
                                            </div>
                                    </li>
                                    <li><a href="#"><img alt="" src="images/icons/thum6.png"> 모자 <i class="zmdi zmdi-chevron-right"></i></a>
                                        <div class="category-menu-dropdown" style="width: 350px">
                                            <div class="category-menu-dropdown-left">
                                                <div class="category-part-1 category-common">
                                                    <h4 class="categories-subtitle" id="populer"> 모자</h4>
                                                    <ul>
                                                        <c:set var='cateNum' value='5'/>
                                        		<c:forEach items='${categoryList }' var='list'>
                                        		<c:if test='${list.cateNum eq cateNum}'>
                                        	    <li><a href='shop.do?cateNum=${list.cateNum }&cateDtnum=${list.cateDtnum}'>${list.cateDtname }</a></li>
                                            </c:if>
                                            </c:forEach> 
                                                    </ul>
                                                </div>
                                                </div>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <!-- End Left Feature -->
                </div>
            </div>
        </section>
        <!-- End Feature Product -->

        <!-- Start Our Product Area -->
        <section class="htc__product__area bg__white" style="padding-bottom: 30px">
    <div class="container">
        <div class="row">
            <div class="col-md-3">
                <div class="product-categories-all">
                    <div class="product-categories-title">
                        <h3>인기 상품</h3>
                    </div>
                    <div class="product-categories-menu">
                        <ul>
                            <li><a href="index.do?cateNum=1#populer">아우터</a></li>
                            <li><a href="index.do?cateNum=2#populer">상의</a></li>
                            <li><a href="index.do?cateNum=3#populer">하의</a></li>
                            <li><a href="index.do?cateNum=4#populer">신발</a></li>
                            <li><a href="index.do?cateNum=5#populer">모자</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="col-md-9">
                <div class="product-style-tab">
                    <div class="product-tab-list">
                        <!-- Nav tabs -->
                        <ul class="tab-style" role="tablist">
                        
                        
                        <c:set var="i" value="1"/>
                        <c:forEach items="${categoryList }" var="list">
                        <c:if test="${popularList[0].cateNum == list.cateNum}">
                        <c:if test="${i ne '1' }">
                            <li>
                                <a href="#home${list.cateDtnum }" data-toggle="tab">
                                    <div class="tab-menu-text">
                                        <h4>${list.cateDtname } </h4>
                                    </div>
                                </a>
                            </li>
                        </c:if>
                        <c:if test="${i eq '1' }">
                            <li class="active">
                                <a href="#home${list.cateDtnum }" data-toggle="tab">
                                    <div class="tab-menu-text">
                                        <h4>${list.cateDtname } </h4>
                                    </div>
                                </a>
                            </li>
                            <c:set var="i" value="i+1"/>
                        </c:if>
                        </c:if>
                        </c:forEach>
                        </ul>
                    </div>
                    <c:set var="i" value="1"/>
                    <div class="tab-content another-product-style jump">
                        <c:forEach begin="1" end="5">
                        <c:if test="${i eq '1'}">
                        <div class="tab-pane active" id="home${i }">
                            <div class="row">
                                <div class="product-slider-active owl-carousel">
                                    <c:forEach items="${popularList }" var="list">
                                    <c:if test="${list.cateDtnum eq i }">
                                    <div class="col-md-4 single__pro col-lg-4 cat--1 col-sm-4 col-xs-12">
                                        <div class="product">
                                            <div class="product__inner">
                                                <div class="pro__thumb">
                                                <!-- 상세 페이지 링크 -->
                                                    <a href="product.do?proNum=${list.proNum }">
                                                        <img src="resources/images/imgUpload/${fn:split(list.proImage,'/')[0]}" alt="${list.proName }">
                                                    </a>
                                                </div>                                                        
                                            </div>                                                   
                                            <div class="product__details">
                                                <h2><a href="product.do?proNum=${list.proNum }">${list.proName }</a></h2>
                                                <ul class="product__price">
                                                    <li><fmt:formatNumber value="${list.proPrice }"/> 원</li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    </c:if>
                                   </c:forEach>
                                    <c:set var="i" value="${i + 1 }"/>
                                </div>
                            </div>
                        </div>
                        </c:if>
                        <c:if test="${i ne '1'}">
                        <div class="tab-pane" id="home${i }">
                            <div class="row">
                                <div class="product-slider-active owl-carousel">
                                    <c:forEach items="${popularList }" var="list">
                                    <c:if test="${list.cateDtnum eq i }">
                                    <div class="col-md-4 single__pro col-lg-4 cat--1 col-sm-4 col-xs-12">
                                        <div class="product">
                                            <div class="product__inner">
                                                <div class="pro__thumb">
                                                <!-- 상세 페이지 링크 -->
                                                    <a href="product.do?proNum=${list.proNum }">
                                                        <img src="resources/images/imgUpload/${fn:split(list.proImage,'/')[0]}" alt="${list.proName }">
                                                    </a>
                                                </div>
                                            </div>
                                            <div class="product__details">
                                                <h2><a href="product.do?proNum=${list.proNum }">${list.proName }</a></h2>
                                                <ul class="product__price">
                                                    <li><fmt:formatNumber value="${list.proPrice }"/> 원</li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    </c:if>
                                    </c:forEach>
                                    <c:set var="i" value="${i + 1 }"/>
                                </div>
                            </div>
                         </div>
                        </c:if>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
        <!-- End Our Product Area -->
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
    

</body>

</html>