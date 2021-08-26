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
    <title>Suit Up | ${productDetails.proName }</title>
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
        <!-- End Offset Wrapper -->
        <!-- Start Bradcaump area -->
        <div class="ht__bradcaump__area" style="background: rgba(0, 0, 0, 0) url(resources/images/bg/2.jpg) no-repeat scroll center center / cover ;">
            <div class="ht__bradcaump__wrap">
                <div class="container">
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="bradcaump__inner text-center">
                                <h2 class="bradcaump-title">${productDetails.proName }</h2>
                                <nav class="bradcaump-inner">
                                  <a class="breadcrumb-item" href="index.html">홈</a>
                                  <span class="brd-separetor">/</span>
                                  <span class="breadcrumb-item active">${productDetails.proName }</span>
                                </nav>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- End Bradcaump area -->
        <!-- Start Small images -->
        <section class="htc__product__details pt--120 pb--100 bg__white">
            <div class="container">
                <div class="row">
                    <div class="col-md-6 col-lg-6 col-sm-12 col-xs-12">
                        <div class="product__details__container">
                            <ul class="product__small__images" role="tablist">
                            
                            <c:forEach items="${fn:split(productDetails.proImage, '/') }" var="image" varStatus="status">
                                <c:if test="${status.count eq 1}">
                                
                                <li role="presentation" class="pot-small-img active">
                                    <a href="#img-tab-${status.count}" role="tab" data-toggle="tab">
                                        <img src="resources/images/imgUpload/${image }" alt="${productDetails.proName}" style="max-width: 150px;">
                                    </a>
                                </li>
                                </c:if>
                                
                                <c:if test="${status.count eq 2}">
                                <li role="presentation" class="pot-small-img">
                                    <a href="#img-tab-${status.count}" role="tab" data-toggle="tab">
                                        <img src="resources/images/imgUpload/${image }" alt="small-image" style="max-width: 150px;">
                                    </a>
                                </li>
                                </c:if>
                                
                                <c:if test="${status.count eq 3}">
                                <li role="presentation" class="pot-small-img hidden-xs">
                                    <a href="#img-tab-${status.count}" role="tab" data-toggle="tab">
                                        <img src="resources/images/imgUpload/${image }" alt="small-image" style="max-width: 150px;">
                                    </a>
                                </li>
                                </c:if>
                                
                                <c:if test="${status.count >= 4}">
                                <li role="presentation" class="pot-small-img hidden-xs hidden-sm">
                                    <a href="#img-tab-${status.count}" role="tab" data-toggle="tab">
                                        <img src="resources/images/imgUpload/${image }" alt="small-image" style="max-width: 150px;">
                                    </a>
                                </li>
                                </c:if>
                                
                                </c:forEach>
                                
                            </ul>
                            <!-- End Small images -->
       						 <!-- Start Product Details -->
        
                            <div class="product__big__images">
                                <div class="portfolio-full-image tab-content">
                                
                                <c:forEach items="${fn:split(productDetails.proImage, '/') }" var="image" varStatus="status">
                                <c:if test="${status.count eq 1}">
                                <div role="tabpanel" class="tab-pane fade in active product-video-position" id="img-tab-${status.count }">
                                    <img src="resources/images/imgUpload/${image }" alt="${productDetails.proName}">
                                </div>
                                </c:if>
                                <c:if test="${status.count ne 1}">
                               <div role="tabpanel" class="tab-pane fade product-video-position" id="img-tab-${status.count }">
                                    <img src="resources/images/imgUpload/${image }" alt="${productDetails.proName}">
                                </div>
                                </c:if>
                                </c:forEach>
                                
                                </div>
                            </div>
                        </div>
                    </div>
                    <form action="insertCart.do" method="post" id="insertCart">
                    
                    <div class="col-md-6 col-lg-6 col-sm-12 col-xs-12 smt-30 xmt-30">
                        <div class="htc__product__details__inner">
                            <div class="pro__detl__title">
                                <h2>${productDetails.proName }</h2>
                                <input type="hidden" value="${productDetails.proName }" name="proName"/>
                                <input type="hidden" value="${productDetails.proNum}" name="proNum"/>  
                                              <input type="hidden" value="${productDetails.cateNum }" name="cateNum"/>
                                              <input type="hidden" value="${productDetails.cateDtnum }" name="cateDtnum"/>
                            </div>
                            
                           
                            <div class="pro__dtl__rating">
                            
                                 <ul class="pro__rating">
                                 
                                <c:choose>
            <c:when test="${reviewAvg eq 0}">
                <li><span class="ti-star"></span></li>
                <li><span class="ti-star"></span></li>
                <li><span class="ti-star"></span></li>
                <li><span class="ti-star"></span></li>
                <li><span class="ti-star"></span></li>
            </c:when>

            <c:when test="${reviewAvg le 1 }">
                <li><span class="zmdi zmdi-star"></span></li>
                <li><span class="ti-star"></span></li>
                <li><span class="ti-star"></span></li>
                <li><span class="ti-star"></span></li>
                <li><span class="ti-star"></span></li>
            </c:when>

            <c:when test="${reviewAvg le 2 }">
               <li><span class="zmdi zmdi-star"></span></li>
                <li><span class="zmdi zmdi-star"></span></li>
                 <li><span class="ti-star"></span></li>
                <li><span class="ti-star"></span></li>
                <li><span class="ti-star"></span></li>
            </c:when>

            <c:when test="${reviewAvg le 3 }">
               <li><span class="zmdi zmdi-star"></span></li>
                <li><span class="zmdi zmdi-star"></span></li>
                <li><span class="zmdi zmdi-star"></span></li>
                <li><span class="ti-star"></span></li>
                <li><span class="ti-star"></span></li>
            </c:when>

            <c:when test="${reviewAvg le 4 }">
               <li><span class="zmdi zmdi-star"></span></li>
                <li><span class="zmdi zmdi-star"></span></li>
                <li><span class="zmdi zmdi-star"></span></li>
                <li><span class="zmdi zmdi-star"></span></li>
                <li><span class="ti-star"></span></li>
            </c:when>

            <c:when test="${reviewAvg le 5 }">
                <li><span class="zmdi zmdi-star"></span></li>
                <li><span class="zmdi zmdi-star"></span></li>
                <li><span class="zmdi zmdi-star"></span></li>
                <li><span class="zmdi zmdi-star"></span></li>
                <li><span class="zmdi zmdi-star"></span></li>
            </c:when>
            </c:choose>
                                </ul>
                                <span class="rat__qun">${reviewCount }개의 상품평이 있습니다</span>
                            </div>
                            <ul class="pro__dtl__prize">
                                <li><fmt:formatNumber value="${productDetails.proPrice }"/> 원</li>
                                <input type="hidden" value="${productDetails.proPrice }" name="proPrice"/>
                            </ul>
                            <div class="pro__dtl__color">
                                <h2 class="title__5">색상</h2>
                                
                                <ul class="pro__choose__color">
                                <div>
                               		 <input type="radio" name="dtproColor" value="BLACK" style="display: none" id="color1"> <label for="color1" style="cursor: pointer;"><li class="black"><i class="zmdi zmdi-circle"></i></li></label></input>
                               		 &nbsp;<input type="radio" name="dtproColor" value="WHITE" style="display: none" id="color2"> <label for="color2" style="cursor: pointer;"><li class="white"><i class="zmdi zmdi-circle"></i></li></label></input>
                               		 &nbsp;<input type="radio" name="dtproColor" value="GREY" style="display: none" id="color3"> <label for="color3" style="cursor: pointer;"><li class="grey"><i class="zmdi zmdi-circle"></i></li></label></input>
                                   &nbsp; <input type="radio" name="dtproColor" value="RED" style="display: none" id="color4"> <label for="color4" style="cursor: pointer;"><li class="red"><i class="zmdi zmdi-circle"></i></li></label></input>
                                   &nbsp; <input type="radio" name="dtproColor" value="BLUE" style="display: none" id="color5"> <label for="color5" style="cursor: pointer;"><li class="blue"><i class="zmdi zmdi-circle"></i></li></label></input>
                                    </div>                                  
                                </ul>
                            </div>
                            <div class="pro__dtl__size">
                                <h2 class="title__5">사이즈</h2>
                                <ul class="	">
                                <table>
                                <tr>
                                    <td><input type="radio" name="dtproSize" value="XS" style="display: none" id="size1"><label for="size1" style="cursor: pointer;"><li><h6>XS&nbsp;&nbsp;</h6></li></label></input>
                                    <input type="radio" name="dtproSize" value="S" style="display: none" id="size2"><label for="size2" style="cursor: pointer;"><li><h6>S&nbsp;&nbsp;</h6></li></label></input>
                                    <input type="radio" name="dtproSize" value="M" style="display: none" id="size3"><label for="size3" style="cursor: pointer;"><li><h6>M&nbsp;&nbsp;</h6></li></label></input>
                                    <input type="radio" name="dtproSize" value="L" style="display: none" id="size4"><label for="size4" style="cursor: pointer;"><li><h6>L&nbsp;&nbsp;</h6></li></label></input>
                                    <input type="radio" name="dtproSize" value="XL" style="display: none" id="size5"><label for="size5" style="cursor: pointer;"><li><h6>XL&nbsp;&nbsp;</h6></li></label></input></tr>
                               </tr>
                                </table>
                                </ul>
                            </div>
                            <div class="product-action-wrap">
                                <div class="prodict-statas"><span>수량 :</span></div>
                                <div class="product-quantity">
                                        <div class="product-quantity">
                                            <div class="cart-plus-minus" style="cursor: pointer;">
                                                <input type="text" class="cart-plus-minus-box"  name="cartCount" value="1"  style="cursor: pointer;" >
                                            </div>                                            
                                        </div>                                        
                                </div>                               
                                <div class="prodict-statas"><span>재고 : <input type="text" class="cart-box"  name="productCount" value="${productDetails.dtproCount }" readonly="readonly" ></span>
                                            </div>                                            
                            </div>
                            <ul class="pro__dtl__btn">
                            <li class="buy__now__btn" ><a href="#" onclick="product_check()">장바구니 담기</a></li>
                                <c:choose>
                                <c:when test="${wish eq null || wish eq 0}">
                                <li><a href="#;return false;" onclick="insert_wish()"><span class="ti-heart"></span></a></li>
                                </c:when>
                                <c:when test="${wish ne null }">
                                <li><a href="#;return false;" onclick="delete_wish()" style="background: #ff4136; border: 1px solid #ff4136; color: #fff;"><span class="ti-heart"></span></a></li>
   								</c:when>
    							</c:choose>
                            </ul>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- End Product Details -->
        <!-- Start Product tab -->
        <section class="htc__product__details__tab bg__white pb--120">
            <div class="container">
                <div class="row">
                    <div class="col-md-12 col-lg-12 col-sm-12 col-xs-12">
                        <ul class="product__deatils__tab mb--60" role="tablist">
                            <li role="presentation" class="active">
                                <a href="#description" role="tab" data-toggle="tab">상세설명</a>
                            </li>
                            
                            <li role="presentation">
                                <a href="#reviews" role="tab" data-toggle="tab">상품평</a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="product__details__tab__content">
                            <!-- Start Single Content -->
                            <div role="tabpanel" id="description" class="product__tab__content fade in active">
                                <div class="product__description__wrap">
                                <div class="pro__feature" align="center">
                                      <c:forEach items="${fn:split(productDetails.proDetail, '/') }" var="detail" varStatus="status">
                                    	  <img src="resources/images/imgUpload/${detail }" alt="${productDetails.proName}">
                               		  </c:forEach>
                                    </div>
                                </div>
                            </div>
                            <!-- End Single Content -->
                            <!-- Start Single Content -->
                            <div role="tabpanel" id="reviews" class="product__tab__content fade">
                                <div class="review__address__inner">
                                
                                    <!-- Start Single Review -->
                                    <c:choose>
<c:when test="${reviewList != null}">
<c:forEach items="${reviewList }" var="list">
<div class="pro__review">
    <div class="review__thumb">
       <img src="resources/images/imgUpload/${fn:split(productDetails.proImage,'/')[0]}" alt="${productDetails.proName }" style="max-width: 150px; margin-right: 35px" >
    </div>
    <div class="review__details" style="width: 100vw; margin: auto;">
    <div class="review__date">
    		<c:set var="userId" value="${list.memId}"/>
            <span>${fn:substring(userId,0,3) }******</span>
        </div>
        <div class="review__info">
            <h4><a href="#">${list.comTitle }</a></h4>
            <ul class="rating">
            <c:choose>
            <c:when test="${list.comAvg eq 0}">
                <li><i class="zmdi zmdi-star-outline"></i></li>
                <li><i class="zmdi zmdi-star-outline"></i></li>
                <li><i class="zmdi zmdi-star-outline"></i></li>
                <li><i class="zmdi zmdi-star-outline"></i></li>
                <li><i class="zmdi zmdi-star-outline"></i></li>
            </c:when>

            <c:when test="${list.comAvg le 1 }">
                <li><i class="zmdi zmdi-star"></i></li>
                <li><i class="zmdi zmdi-star-outline"></i></li>
                <li><i class="zmdi zmdi-star-outline"></i></li>
                <li><i class="zmdi zmdi-star-outline"></i></li>
                <li><i class="zmdi zmdi-star-outline"></i></li>
            </c:when>

            <c:when test="${list.comAvg le 2 }">
                <li><i class="zmdi zmdi-star"></i></li>
                <li><i class="zmdi zmdi-star"></i></li>
                <li><i class="zmdi zmdi-star-outline"></i></li>
                <li><i class="zmdi zmdi-star-outline"></i></li>
                <li><i class="zmdi zmdi-star-outline"></i></li>
            </c:when>

            <c:when test="${list.comAvg le 3 }">
                <li><i class="zmdi zmdi-star"></i></li>
                <li><i class="zmdi zmdi-star"></i></li>
                <li><i class="zmdi zmdi-star"></i></li>
                <li><i class="zmdi zmdi-star-outline"></i></li>
                <li><i class="zmdi zmdi-star-outline"></i></li>
            </c:when>

            <c:when test="${list.comAvg le 4 }">
                <li><i class="zmdi zmdi-star"></i></li>
                <li><i class="zmdi zmdi-star"></i></li>
                <li><i class="zmdi zmdi-star"></i></li>
                <li><i class="zmdi zmdi-star"></i></li>
                <li><i class="zmdi zmdi-star-outline"></i></li>
            </c:when>

            <c:when test="${list.comAvg le 5 }">
                <li><i class="zmdi zmdi-star"></i></li>
                <li><i class="zmdi zmdi-star"></i></li>
                <li><i class="zmdi zmdi-star"></i></li>
                <li><i class="zmdi zmdi-star"></i></li>
                <li><i class="zmdi zmdi-star"></i></li>
            </c:when>
            </c:choose>
            </ul>
            <div class="rating__send">
                <!-- 리뷰 작성자가 본인일 경우 수정 가능 -->
            <c:if test="${sessionScope.SuitUpid eq list.memId || cookie.SuitUpidCookie.value eq list.memId}">
            <a href="modify-review.do?comSeq=${list.comSeq }"><img src="resources/images/icons/edit-button.png"/></a>
            </c:if>
            <!-- 관리자 계정이거나 본인 계정일 경우 삭제 가능 -->
            <c:if test="${sessionScope.admin eq 1 || cookie.admin.value != null || sessionScope.SuitUpid eq list.memId || cookie.SuitUpidCookie.value eq list.memId}">
            <a href="deleteReview.do?comSeq=${list.comSeq }&proNum=${list.proNum}" onclick="if(!confirm('리뷰를 삭제하시겠습니까?')){return false;}"><i class="zmdi zmdi-close"></i></a>
            </c:if>
            
            </div>
        </div>
        <div class="review__date">
            <span>${list.comDate }</span>
        </div>
        <p>${list.comContent }</p>
    </div>
</div>
<hr/>
</c:forEach>
</c:when>
<c:otherwise>
<hr/>
</c:otherwise>
</c:choose>
<!-- End Single Review -->
                                                             
                                </div>
                                <!-- Start RAting Area -->
                                <div class="rating__wrap">
                                    
                                    <h2 class="rating-title">상품평 작성하기 </h2>
                                    <h4 class="rating-title-2">구매만족도</h4>
                                    <div class="rating__list">
                                        <!-- Start Single List -->
                                     <ul class="rating" style="cursor: pointer;">
                                            <li><i id='star1' onclick="star1();" class="zmdi zmdi-star"></i></li>
                                            <li><i id='star2' onclick="star2();" class="zmdi zmdi-star"></i></li>
                                            <li><i id='star3' onclick="star3();" class="zmdi zmdi-star"></i></li>
                                            <li><i id='star4' onclick="star4();" class="zmdi zmdi-star"></i></li>
                                            <li><i id='star5' onclick="star5();" class="zmdi zmdi-star"></i></li>
                                        
                                                                                    
                                          </ul>
                                        <!-- End Single List -->
                                    </div>
                                </div>
                                <!-- End RAting Area -->
                                <div class="review__box">
                                    <form action="insertReview.do" method="post" id="insertReview">
                                    
                                      
                                            <c:choose> 
								  
								<c:when test="${cookie.SuitUpidCookie.value != null }">
								<input type="hidden" value="${cookie.SuitUpidCookie.value}" name="memId"/>
								</c:when>
								
								<c:when test="${sessionScope.SuitUpid  != null}">
                               <input type="hidden" value="${sessionScope.SuitUpid}" name="memId"/>
								</c:when>
								</c:choose>
								
                                              <input type="hidden" value="${productDetails.proNum}" name="proNum"/>  
                                              <input type="hidden" value="${productDetails.cateNum }" name="cateNum"/>
                                              <input type="hidden" value="${productDetails.cateDtnum }" name="cateDtnum"/>
                                                <!-- placeholder 에 사용자 아이디 받아올 때 subString-->
                                              
                                        
                                        <div class="single-review-form">
                                            <div class="review-box name">
                                                <input type="text" placeholder="상품평 제목을 입력해주세요" name="comTitle"></input>
                                            </div>
                                        </div>
                                        <div class="single-review-form">
                                            <div class="review-box message">
                                                <textarea placeholder="상품평 내용을 입력해주세요" name="comContent"></textarea>
                                            </div>
                                        </div>
                                        
                                        <input type="hidden" id='starCount' name="comAvg" value="5">
										<div class="review-btn">
										<a class="fv-btn" href="#" onclick="review_check()" >상품평 작성완료</a>
                                           <!-- <input type="image" src="resources/images/icons/reviewSubmit.png"> -->
                                        </div>
                                    </form>                                
                                </div>
                            </div>
                            <!-- End Single Content -->
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- End Product tab -->
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
<script src="resources/js/product.js"></script>

</body>

</html>