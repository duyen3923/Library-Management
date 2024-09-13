<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
		<!-- HEADER MOBILE-->
		<header class="header-mobile d-block d-lg-none">
			<div class="header-mobile__bar">
				<div class="container-fluid">
					<div class="header-mobile-inner">
						<a class="logo" href="<c:url value="/trang-chu"/>"> <img
							src="<c:url value= "/assets/images/icon/logo.png"/>"
							alt="CoolAdmin">
						</a>
						<button class="hamburger hamburger--slider" type="button">
							<span class="hamburger-box"> <span class="hamburger-inner"></span>
							</span>
						</button>
					</div>
				</div>
			</div>
			<nav class="navbar-mobile">
				<div class="container-fluid">
					<ul class="navbar-mobile__list list-unstyled">
						<li class="has-sub"><a class="js-arrow" href="#"> <i
								class="fas fa-tachometer-alt"></i>Mượn-trả sách
						</a>
							<ul class="navbar-mobile-sub__list list-unstyled js-sub-list">
								<li><a href="<c:url value="/muontra"/>">Mượn sách</a></li>
								<li><a href="<c:url value="/traSach"/>">Trả sách</a></li>

								<li><a href="<c:url value="/themTaiKhoan"/>">Đăng kí thẻ thư viện</a></li>

							</ul></li>
						<li class="has-sub"><a class="js-arrow" href="#"> <i
								class="fas fas fa-table"></i>Quản lí
						</a>
							<ul class="navbar-mobile-sub__list list-unstyled js-sub-list">
								<li><a href="<c:url value="/ThemThongBao"/>">Thông báo</a></li>
								<li><a href="<c:url value="/dausach"/>">Đầu sách</a></li>
								<li><a href="<c:url value="/authors/page"/>">Tác giả</a></li>
								<li><a href="<c:url value="/category"/>">Thể loại</a></li>


								<li><a href="<c:url value="/dsTaiKhoan"/>">Tài khoản</a></li>

								<li><a href="<c:url value="/dsMuonTra"/>">Danh sách mượn-trả</a></li>

							</ul></li>
						<li><a href="<c:url value="/thongke"/>"> <i class="fas fa-chart-bar"></i>Thống
								kê
						</a></li>
					</ul>
				</div>
			</nav>
		</header>
		<!-- END HEADER MOBILE-->

		<!-- MENU SIDEBAR-->
		<aside class="menu-sidebar d-none d-lg-block">
			<div class="logo">
				<a href="<c:url value="/trang-chu"/>"> <img
					src="<c:url value= "/assets/images/icon/logo.png"/>"
					alt="Cool Admin">
				</a>
			</div>
			<div class="menu-sidebar__content js-scrollbar1 ps">
				<nav class="navbar-sidebar">
					<ul class="list-unstyled navbar__list">
						<li class="active has-sub"><a class="js-arrow" href="#">
								<i class="fas fa-tachometer-alt"></i>Nghiệp vụ thư viện
						</a>
							<ul class="list-unstyled navbar__sub-list js-sub-list">
								<li><a href="<c:url value="/muontra"/>">Mượn sách</a></li>
								<li><a href="<c:url value="/traSach"/>">Trả sách</a></li>

								<li><a href="<c:url value="/themTaiKhoan"/>">Đăng kí thẻ thư viện</a></li>

							</ul></li>
						<li class="has-sub"><a class="js-arrow" href="#"> <i
								class="fas fas fa-table"></i>Quản lí
						</a>
							<ul class="list-unstyled navbar__sub-list js-sub-list">
									<li><a href="<c:url value="/ThongBaoQuanLy"/>">Thông báo</a></li>
								<li><a href="<c:url value="/dausach"/>">Đầu sách</a></li>
								<li><a href="<c:url value="/authors/page"/>">Tác giả</a></li>
								<li><a href="<c:url value="/category"/>">Thể loại</a></li>

								<li><a href="<c:url value="/dsTaiKhoan"/>">Tài khoản</a></li>

								<li><a href="<c:url value="/dsMuonTra"/>">Danh sách mượn-trả</a></li>

							</ul></li>
						<li><a href="<c:url value="/thongke"/>"> <i class="fas fa-chart-bar"></i>Thống
								kê
						</a></li>
					</ul>
				</nav>
				<div class="ps__rail-x" style="left: 0px; bottom: 0px;">
					<div class="ps__thumb-x" tabindex="0"
						style="left: 0px; width: 0px;"></div>
				</div>
				<div class="ps__rail-y" style="top: 0px; right: 0px;">
					<div class="ps__thumb-y" tabindex="0"
						style="top: 0px; height: 0px;"></div>
				</div>
			</div>
		</aside>
		<!-- END MENU SIDEBAR-->