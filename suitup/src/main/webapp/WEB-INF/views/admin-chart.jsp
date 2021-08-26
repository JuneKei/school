<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
	<meta name="description" content="" />
	<meta name="author" content="" />
	<title>관리자 페이지</title>
	<link href="resources/css/admin-styles.css" rel="stylesheet" />
	<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
</head>
 <body class="sb-nav-fixed">
 <c:if test="${cookie.admin.value == null}">
<c:if test="${sessionScope.admin != 1}">
	<c:redirect url="index.do"/>
</c:if>
 </c:if> 
<c:forEach var="list" items="${list }">
	<c:set var="count" value="${count+1 }"/>
	<input type="hidden" id="monthsum${count}" value="${list.sum}">
	<c:set var="month" value="${list.month }"/>
	<input type="hidden" id="month${count}" value="${fn:substring(month,3,5) }">
</c:forEach>

<c:forEach var="list2" items="${list2 }">
	<c:set var="count2" value="${count2+1 }"/>
	<input type="hidden" id="daysum${count2}" value="${list2.sum}">
	<c:set var="day" value="${list2.day}"/>
	<input type="hidden" id="day${count2}" value="${fn:substring(day,6,8) }">
</c:forEach>

<c:forEach var="list3" items="${list3 }">
	<c:set var="count3" value="${count3+1 }"/>
	<input type="hidden" id="catecnt${count3}" value="${list3.cnt}">
	<input type="hidden" id="cate${count3}" value="${list3.num}">
</c:forEach>

<c:set var="now" value="<%=new java.util.Date() %>"/>


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
                        <h2 class="mt-4">Charts</h2>
                    
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-chart-area me-1"></i>
                                	일별 판매량
                            </div>
                            <div class="card-body"><canvas id="myAreaChart" width="100%" height="30"></canvas></div>
                            <div class="card-footer small text-muted">
								Updated 
							<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" /></div>
                        </div>
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-bar me-1"></i>
                               	         월별 판매량
                                    </div>
                                    <div class="card-body"><canvas id="myBarChart" width="100%" height="50"></canvas></div>
                                    <div class="card-footer small text-muted">
									Updated 
									<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" />
									</div>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-pie me-1"></i>
                                        카테고리별 판매량
                                    </div>
                                    <div class="card-body"><canvas id="myPieChart" width="100%" height="50"></canvas></div>
                                    <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
                                </div>
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
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" ></script>
        <script src="resources/js/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" ></script>
        <script src="resources/assets/demo/chart-area.js"></script>
        <script src="resources/assets/demo/chart-bar.js"></script>
        <script src="resources/assets/demo/chart-pie.js"></script>
    </body>
</html>