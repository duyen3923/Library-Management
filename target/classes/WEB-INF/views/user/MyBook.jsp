<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/xml" prefix="x"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!doctype html>
<html class="no-js" lang="zxx">


<head>
<meta charset="UTF-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Sách của tôi</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Place favicon.ico in the root directory -->
<link rel="apple-touch-icon"
	href="<c:url value = "/assets/images/apple-touch-icon.png"/>">
<link rel="shortcut icon" type="image/ico"
	href="<c:url value = "/assets/images/favicon.ico"/>" />

<!-- Plugin-CSS -->
<link rel="stylesheet"
	href="<c:url value = "/assets/css/bootstrap.min.css"/>">
<link rel="stylesheet"
	href="<c:url value = "/assets/css/owl.carousel.min.css"/>">
<link rel="stylesheet" href="<c:url value = "/assets/css/icofont.css"/>">
<link rel="stylesheet" href="<c:url value = "/assets/css/animate.css"/>">
<link rel="stylesheet"
	href="<c:url value = "/assets/css/cardslider.css"/>">
<link rel="stylesheet"
	href="<c:url value = "/assets/css/responsiveslides.css"/>">

<!-- Main-Stylesheets -->
<link rel="stylesheet"
	href="<c:url value = "/assets/css/normalize.css"/>">
<link rel="stylesheet"
	href="<c:url value = "/assets/css/overright.css"/>">
<link rel="stylesheet" href="<c:url value = "/assets/css/theme.css"/>">
<link rel="stylesheet" href="<c:url value = "/assets/style.css"/>">
<link rel="stylesheet"
	href="<c:url value = "/assets/css/responsive.css"/>">
<script
	src="<c:url value = "/assets/js/vendor/modernizr-2.8.3.min.js"/>"></script>
</head>

<body data-spy="scroll" data-target="#mainmenu" data-offset="50">
	<header class="relative" id="sc1">
		<!-- Header-background-markup -->
		<div class="overlay-bg relative">
			<img src="<c:url value= "/assets/images/slide/slide1.jpg"/>"
				alt="library">
		</div>
		<!-- Mainmenu-markup-start -->
		<div class="mainmenu-area navbar-fixed-top affix-top" data-spy="affix"
			data-offset-top="10">
			<nav class="navbar">
				<div class="container">
					<div class="navbar-header">
						<div class="space-10"></div>
						<button type="button" class="navbar-toggle" data-toggle="collapse"
							data-target="#mainmenu">
							<span class="icon-bar"></span> <span class="icon-bar"></span> <span
								class="icon-bar"></span>
						</button>
						<!--Logo-->
						<!-- <a href="#sc1" class="navbar-left show"><img src="images/logo.png" alt="library"></a> -->
						<div class="space-10"></div>
					</div>
					<!--Mainmenu list-->
					<%@include file="/WEB-INF/views/shared/header.jsp"%>
			</nav>
		</div>
		<div class="space-100"></div>
		<!-- Mainmenu-markup-end -->
		<!-- Header-jumbotron -->
		<div class="space-100"></div>
		<div class="header-text">
			<div class="container fix">
				<div class="row wow fadeInUp"
					style="visibility: visible; animation-name: fadeInUp;">
					<div class="col-xs-12 col-sm-10 col-sm-offset-1 text-center">
						<div class="jumbotron">
							<h1 class="text-white">Chọn sách của bạn và tận hưởng</h1>
						</div>
						<div class="title-bar white">
							<ul class="list-inline list-unstyled">
								<li><i class="icofont icofont-square"></i></li>
								<li><i class="icofont icofont-square"></i></li>
							</ul>
						</div>
						<div class="space-40"></div>
					</div>
				</div>
			</div>
		</div>
		<div class="space-100"></div>
		<!-- Header-jumbotron-end -->
	</header>
	<section>
		<div class="space-80"></div>
		<div class="container">
			<div class="row">
				<!-- Sidebar-Start -->
				<div class="col-xs-12 col-md-2">
					<aside>
						<div class="single-sidebar">
							<h4>
								<i class="icofont icofont-listine-dots"></i> Danh mục
							</h4>
							<hr>
							<ul class="list-unstyled menu-tip">
								<li><a class="active" href="<c:url value="userInfo"/>">Thông
										tin cá nhân</a></li>
								<li><a href="<c:url value="UserChangePassword"/>">Đổi
										mật khẩu</a></li>
								<li><a href="<c:url value="userbook"/>">Sách của tôi</a></li>
							</ul>
						</div>
						<div class="space-20"></div>
					</aside>
				</div>
				<!-- Sidebar-End -->
				<div class="col-xs-12 col-md-10 pull-right">
					<h4>Tìm kiếm</h4>
					<div class="space-5"></div>
					<form:form
						action="${pageContext.request.contextPath}/searchBorrowedBook"
						method="POST">
						<div class="input-group">
							<input type="text" class="form-control"
								placeholder="Nhập tên sách muốn tìm" name="searchKeyword">
							<div class="input-group-btn">
								<button type="submit" class="btn btn-primary">
									<i class="icofont icofont-search-alt-2"></i>
								</button>
							</div>
						</div>
					</form:form>
					<div class="space-30"></div>
					<div class="row">
						<!-- Total Books -->
						<div class="pull-left col-xs-12 col-sm-5 col-md-6">
							<c:set var="totalBooksBorrowed" value="0" />

							<c:forEach var="ctmtDto" items="${ctmtDtos}">
								<c:set var="totalBooksBorrowed"
									value="${totalBooksBorrowed + ctmtDto.ctmtAmount}" />
							</c:forEach>
							<p>
								<strong>${totalBooksBorrowed}</strong> cuốn sách đã mượn
							</p>

						</div>
					</div>
					<hr>
					<div class="space-20"></div>
					<div class="row">
						<c:forEach var="ctmtDto" items="${ctmtDtos}">
							<div class="col-xs-12 col-md-6">
								<div class="category-item well yellow">
									<div class="media">
										<c:forEach var="book" items="${bookDtos}">
											<c:if test="${ctmtDto.bookId == book.bookId}">
												<div class="media-left">
													<img
														src="<c:url value='/assets/images/book/${book.bookImage}'/>"
														class="media-object" style="width: 150px; height: 200px;"
														alt="">
												</div>
												<div class="media-body">
													<h4>${book.bookName}</h4>
													<h6>Tác giả: ${book.authorName}</h6>
													<h6>Thể loại: ${book.categoryName}</h6>
													<h6>Số lượng: ${ctmtDto.ctmtAmount}</h6>
													<h6>Ngày mượn: ${ctmtDto.ctmtNgayMuon}</h6>
													<h6>Ngày hẹn trả: ${ctmtDto.ctmtNgayTra}</h6>
													<div class="space-10"></div>
													<a href="<c:url value="/bookDetail/${book.bookId}"/>"
														class="text-primary">See the Book</a>
												</div>
											</c:if>
										</c:forEach>
									</div>
								</div>
							</div>
						</c:forEach>
						<div class="space-60"></div>
				</div>
			</div>
			<div class="space-80"></div>
				<!-- Modal -->
		<div class="modal fade" id="staticBackdrop" data-backdrop="static"
			data-keyboard="false" tabindex="-1"
			aria-labelledby="staticBackdropLabel" aria-hidden="true"
			style="z-index: 1055 !important">
			<div class="modal-dialog" style="width: 500px;">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="staticBackdropLabel1">Chú ý</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<span class="text-danger"> Bạn có muốn đăng xuất </span>

					</div>
					<div class="modal-footer" style="display: flex;">
						<button type="button" class="btn btn-warning  btn-secondary"
							data-dismiss="modal" style="margin-right: 10px;">Hủy</button>
						<form:form id="deleteForm" action="DangXuat" method="POST">
							<button type="submit" class="btn btn-danger">Đăng xuất</button>

						</form:form>
					</div>
				</div>
			</div>

		</div>
	</section>
	<!-- Footer-Area -->
	<%@include file="/WEB-INF/views/shared/footer.jsp"%>
	<!-- Footer-Area-End -->

	<!-- Vandor-JS -->
	<script src="<c:url value='/assets/js/vendor/jquery-1.12.4.min.js'/>"></script>
	<script src="<c:url value='/assets/js/vendor/bootstrap.min.js'/>"></script>
	<!-- Plugin-JS -->
	<script src="<c:url value='/assets/js/owl.carousel.min.js'/>"></script>
	<script src="<c:url value='/assets/js/responsiveslides.min.js'/>"></script>
	<script src="<c:url value='/assets/js/jquery.cardslider.min.js'/>"></script>
	<script src="<c:url value='/assets/js/pagination.js'/>"></script>
	<script src="<c:url value='/assets/js/scrollUp.min.js'/>"></script>
	<script src="<c:url value='/assets/js/wow.min.js'/>"></script>
	<script src="<c:url value='/assets/js/plugins.js'/>"></script>
	<!-- Active-JS -->
	<script src="<c:url value='/assets/js/main.js'/>"></script>
	<a id="scrollUp" href="#top"
		style="position: fixed; z-index: 2147483647; display: none;"><i
		class="icofont icofont-long-arrow-up"></i></a>
</body>

</html>