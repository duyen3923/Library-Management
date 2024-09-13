<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Sách</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Place favicon.ico in the root directory -->
<link rel="apple-touch-icon"
	href="<c:url value ="/assets/images/apple-touch-icon.png"/>">
<link rel="shortcut icon" type="image/ico"
	href="<c:url value ="/assets/images/favicon.ico"/>" />
<!-- Plugin-CSS -->
<link rel="stylesheet"
	href="<c:url value ="/assets/css/bootstrap.min.css"/>">
<link rel="stylesheet"
	href="<c:url value ="/assets/css/owl.carousel.min.css"/>">
<link rel="stylesheet" href="<c:url value ="/assets/css/icofont.css"/>">
<link rel="stylesheet" href="<c:url value ="/assets/css/animate.css"/>">
<link rel="stylesheet"
	href="<c:url value ="/assets/css/cardslider.css"/>">
<link rel="stylesheet"
	href="<c:url value ="/assets/css/responsiveslides.css"/>">
<!-- Main-Stylesheets -->
<link rel="stylesheet"
	href="<c:url value ="/assets/css/normalize.css"/>">
<link rel="stylesheet"
	href="<c:url value ="/assets/css/overright.css"/>">
<link rel="stylesheet" href="<c:url value ="/assets/css/theme.css"/>">
<link rel="stylesheet" href="<c:url value ="/assets/css/style.css"/>">
<link rel="stylesheet"
	href="<c:url value ="/assets/css/responsive.css"/>">
<script src="<c:url value ="/assets/js/vendor/modernizr-2.8.3.min.js"/>"></script>
</head>
<body data-spy="scroll" data-target="#mainmenu" data-offset="50">
	<header class="relative" id="sc1">
		<!-- Header-background-markup -->
		<div class="overlay-bg relative">
			<img src="<c:url value ="/assets/images/slide/slide1.jpg"/>" alt="">
		</div>
		<!-- Mainmenu-markup-start -->
		<div class="mainmenu-area navbar-fixed-top" data-spy="affix"
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
					<%@include file="/WEB-INF/views/shared/header.jsp"%>
				</div>
			</nav>
		</div>
		<div class="space-100"></div>
		<!-- Mainmenu-markup-end -->
		<!-- Header-jumbotron -->
		<div class="space-100"></div>
		<div class="header-text">
			<div class="container">
				<div class="row wow fadeInUp">
					<div class="col-xs-12 col-sm-10 col-sm-offset-1 text-center">
						<div class="jumbotron">
							<h1 class="text-white">Chi tiết cuốn sách</h1>
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
					<form:form id="deleteForm"
						action="${pageContext.request.contextPath}/DangXuat" method="POST">
						<button type="submit" class="btn btn-danger">Đăng xuất</button>

					</form:form>
				</div>
			</div>
		</div>

	</div>
	<section>
		<div class="space-80"></div>
		<div class="container">
			<div class="row">
				<div class="col-xs-12 col-md-10 pull-right">
					<hr>
					<div class="space-20"></div>
					<div class="row">
						<div class="book-details-item">
							<h4 class="tip-left">Tiêu đề</h4>
							<div class="media-left">
								<img
									src="<c:url value ="/assets/images/book/${selectedId.bookImage}"/>"
									class="media-object author-photo img-thumbnail" alt="library">
							</div>

							<div class="media-body">
								<p class="lead">${selectedId.bookName}</p>
							</div>
							<div class="space-10"></div>
							<div class="row">
								<div class="col-xs-12 col-sm-8">
									<h4 class="tip-left">Tác giả</h4>
									<div class="media">
										<div class="media-left">
											<img
												src="<c:url value ="/assets/images/author/${selectedId.authorImage}"/>"
												class="media-object author-photo img-thumbnail"
												alt="library">
										</div>
										<div class="media-body">
											<h5>${selectedId.authorName}</h5>
										</div>
									</div>
								</div>
								<div class="col-xs-12 col-sm-4">
									<h4>Thể loại</h4>
									<p>${selectedId.categoryName}</p>
								</div>
							</div>
							<div class="space-30"></div>
							<h4 class="tip-left">Mô tả</h4>
							<p>${selectedId.bookDescription}</p>
							<div class="space-20"></div>

								<embed src="<c:url value="/assets/images/sach_pdf/${selectedId.pdf}"/>" type="application/pdf" width="100%" height="700px"></embed>
							</div>

					</div>
					<div class="space-60"></div>
				</div>
				<!-- Sidebar-Start -->
				<div class="col-xs-12 col-md-2">
					<aside>
						<div class="space-30"></div>
						<div class="sigle-sidebar">
							<h4>Danh mục</h4>
							<hr>
							<form id="categoryFilterForm"
								action="<c:url value="/filterCategory/page" />" method="GET"
								style="display: none;">
								<input type="hidden" id="selectedId" name="categoryId">
							</form>
							<ul class="list-unstyled menu-tip">
								<c:forEach var="category" items="${categories}">
									<li><a href="#" onclick="filterCategory(${category.id})">${category.name}</a></li>
								</c:forEach>
							</ul>
							<a href="<c:url value = "/sach"/>" class="btn btn-primary btn-xs">Xem
								thêm</a>
						</div>
						<div class="space-20"></div>
					</aside>
				</div>
				<!-- Sidebar-End -->
			</div>
		</div>
		<div class="space-80"></div>
	</section>
	<!-- Footer-Area -->
	<%@include file="/WEB-INF/views/shared/footer.jsp"%>
	<!-- Footer-Area-End -->
	<!-- Vandor-JS -->
	<script src="<c:url value ="/assets/js/vendor/jquery-1.12.4.min.js"/>"></script>
	<script src="<c:url value ="/assets/js/vendor/bootstrap.min.js"/>"></script>
	<!-- Plugin-JS -->
	<script src="<c:url value ="/assets/js/owl.carousel.min.js"/>"></script>
	<script src="<c:url value ="/assets/js/responsiveslides.min.js"/>"></script>
	<script src="<c:url value ="/assets/js/jquery.cardslider.min.js"/>"></script>
	<script src="<c:url value ="/assets/js/pagination.js"/>"></script>
	<script src="<c:url value ="/assets/js/scrollUp.min.js"/>"></script>
	<script src="<c:url value ="/assets/js/wow.min.js"/>"></script>
	<script src="<c:url value ="/assets/js/plugins.js"/>"></script>
	<!-- Active-JS -->
	<script src="<c:url value ="/assets/js/main.js"/>"></script>

	<script type="text/javascript">
	function filterCategory(id) {
	    var form = document.getElementById('categoryFilterForm');
	    document.getElementById('selectedId').value = id;
	    form.action = "${pageContext.request.contextPath}/filterCategory/page?page=1&categoryId=" + id;
	    form.submit();
	}
	</script>
</body>
</html>
