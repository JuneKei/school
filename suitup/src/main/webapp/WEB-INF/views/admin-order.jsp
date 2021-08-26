<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>

<html lang="ko">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>관리자 - 회원 정보</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
        <link href="resources/css/admin-styles.css" rel="stylesheet" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
    </head>
    <body class="sb-nav-fixed">
 <c:if test="${cookie.admin.value == null}">
<c:if test="${sessionScope.admin != 1}">
	<c:redirect url="index.do"/>
</c:if>
 </c:if> 
    
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="admin-chart.do">관리자 페이지</a>
            <!-- Sidebar Toggle-->
            <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
            <!-- Navbar Search-->
            <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
              
            </form>
            <!-- Navbar-->
            <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="#!">Settings</a></li>
                        <li><a class="dropdown-item" href="#!">Activity Log</a></li>
                        <li><hr class="dropdown-divider" /></li>
                        <li><a class="dropdown-item" href="#!">Logout</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                            <a class="nav-link" href="index.do">
                                <div class="sb-nav-link-icon"><i class="fas fa-home"></i></div>
                           		     홈페이지
                            </a>
                            <div class="sb-sidenav-menu-heading">Addons</div>
                            <a class="nav-link" href="admin-chart.do">
                                <div class="sb-nav-link-icon"><i class="fas fa-chart-area"></i></div>
                        		   차트
                            </a>
                            <a class="nav-link" href="admin-table.do">
                                <div class="sb-nav-link-icon"><i class="fas fa-address-card"></i></div>
                                	회원 정보
                            </a>
                            <div class="sb-sidenav-menu-heading">주문 관리</div>
                             <a class="nav-link" href="admin-order.do">
                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                주문 완료
                            </a>
                             <a class="nav-link" href="admin-delivery.do">
                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                배송 중
                            </a>
                             <a class="nav-link" href="admin-delivery-ok.do">
                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                배송 완료
                            </a>
                        </div>
                    </div>   
                </nav>
            </div>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h2 class="mt-4">주문 관리</h2>
                       
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                결제 완료된 상품
                            </div>
                            <div class="card-body">
                                <table id="datatablesSimple">
                                    <thead>
                                        <tr>
                                            <th>주문번호</th>
                                            <th>아이디</th>
                                            <th>주소</th>
                                            <th>주문날짜</th>
                                            <th>상품이름</th>
                                            <th>배송</th>                                            
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>주문번호</th>
                                            <th>아이디</th>
                                            <th>주소</th>
                                            <th>주문날짜</th>
                                            <th>상품이름</th>
                                            <th>배송</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                    	<c:forEach items="${orderList}" var="order">
                                    	<c:set var="cnt" value="${cnt+1}"/>
                                    		<tr>
                                    			<td>${order.orderNum}</td>
                                    			<td>${order.memId}</td>
                                    			<td>${order.orderAddress}</td>
                                    			<td>${order.orderDate}</td>
                                    			<td>${order.proName}</td>
                                    			<td>
                                    			<button class="delete" id="${order.orderNum }" >
                                    			배송시작
                                    			</button>
                                    			</td>
                                    		</tr>
                                    		
                                    	</c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </main>
                <footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid px-4">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted">Copyright &copy; Your Website 2021</div>
                            <div>
                                <a href="#">Privacy Policy</a>
                                &middot;
                                <a href="#">Terms &amp; Conditions</a>
                            </div>
                        </div>
                    </div>
                </footer>
            </div>
        </div>
        <script src="resources/js/vendor/jquery-1.12.0.min.js"></script>
		<script src="resources/assets/demo/chart-order.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
        <script src="resources/js/scripts.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"></script>
        <script src="resources/js/datatables-simple-demo.js"></script>
    </body>
</html>