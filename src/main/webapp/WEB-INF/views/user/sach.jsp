<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/xml" prefix="x"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
	href="<c:url value='/assets/images/apple-touch-icon.png'/>">
<link rel="shortcut icon" type="image/ico"
	href="<c:url value='/assets/images/favicon.ico'/>">

<!-- Plugin-CSS -->
<link rel="stylesheet"
	href="<c:url value='/assets/css/bootstrap.min.css'/>">
<link rel="stylesheet"
	href="<c:url value='/assets/css/owl.carousel.min.css'/>">
<link rel="stylesheet" href="<c:url value='/assets/css/icofont.css'/>">
<link rel="stylesheet" href="<c:url value='/assets/css/animate.css'/>">
<link rel="stylesheet"
	href="<c:url value='/assets/css/cardslider.css'/>">
<link rel="stylesheet"
	href="<c:url value='/assets/css/responsiveslides.css'/>">

<!-- Main-Stylesheets -->
<link rel="stylesheet" href="<c:url value='/assets/css/normalize.css'/>">
<link rel="stylesheet" href="<c:url value='/assets/css/overright.css'/>">
<link rel="stylesheet" href="<c:url value='/assets/css/theme.css'/>">
<link rel="stylesheet" href="<c:url value='/assets/css/style.css'/>">
<link rel="stylesheet"
	href="<c:url value='/assets/css/responsive.css'/>">
<script src="<c:url value='/assets/js/vendor/modernizr-2.8.3.min.js'/>"></script>

</head>

<body data-spy="scroll" data-target="#mainmenu" data-offset="50">
	<header class="relative" id="sc1">
		<!-- Header-background-markup -->
		<div class="overlay-bg relative">
			<img src="<c:url value= "/assets/images/slide/slide1.jpg"/>"
				alt="library">
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
					<!--Mainmenu list-->
					<%@include file="/WEB-INF/views/shared/header.jsp"%>
				</div>
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

	<!-- Modal cho chi tiết sách-->
	<div class="modal fade" id="loginModal" tabindex="-1" role="dialog"
		aria-labelledby="loginModalLabel" aria-hidden="true"
		style="z-index: 1055 !important;">
		<div class="modal-dialog" style="width: 500px;">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title text-danger" id="loginModalLabel">Chú ý</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<span class="text-light"> Vui lòng đăng nhập để xem chi
						tiết sách </span>
				</div>
				<div class="modal-footer" style="display: flex;">
					<button type="button" class="btn btn-warning btn-secondary"
						data-dismiss="modal" style="margin-right: 10px;">Đóng</button>
					<a href="${pageContext.request.contextPath}/dang-nhap"
						class="btn btn-success">Đăng nhập</a>
				</div>
			</div>
		</div>
	</div>
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
								<c:forEach var="category" items="${categories}">
									<li><a href="#" onclick="filterCategory(${category.id})">${category.name}</a></li>
								</c:forEach>
							</ul>
						</div>
						<div class="space-20"></div>
					</aside>
				</div>
				<!-- Sidebar-End -->
				<div class="col-xs-12 col-md-10 pull-right">
					<h4>Tìm kiếm</h4>
					<div class="space-5"></div>
					<form:form action="${pageContext.request.contextPath}/timKiemSach"
						method="POST" modelAttribute="search">
						<div class="input-group">
							<form:input type="text" class="form-control"
								placeholder="Nhập tên sách muốn tìm" path="bookName"
								id="tenSach" />
							<div class="input-group-btn">
								<button type="submit" class="btn btn-primary">
									<i class="icofont icofont-search-alt-2"></i>
								</button>
							</div>
						</div>
					</form:form>
					<div class="space-30"></div>
					<div class="row">
						<div class="pull-left col-xs-12 col-sm-5 col-md-6">
							<p>
								<strong>${pagination.totalItems}</strong> cuốn sách được tìm
								thấy
							</p>
						</div>
					</div>
					<hr>
					<div class="space-20"></div>
					<div class="row">
						<form id="categoryFilterForm"
							action="<c:url value="/filterCategory/page" />" method="GET"
							style="display: none;">
							<input type="hidden" id="selectedId" name="categoryId">
						</form>

						<c:if test="${empty pagination.content}">
							<div class="alert alert-info">${message}</div>
						</c:if>
						<c:if test="${not empty pagination.content}">
							<c:forEach var="book" items="${pagination.content}">
								<div class="col-xs-12 col-md-6">
									<div class="category-item well yellow">
										<div class="media">
											<div class="media-left">
												<img
													src="<c:url value='/assets/images/book/${book.bookImage}'/>"
													class="media-object" style="width: 120px; height: 150px;"
													alt="">
											</div>
											<div class="media-body">
												<h4>${book.bookName}</h4>
												<h6>Tác giả: ${book.authorName}</h6>
												<h6>Thể loại: ${book.categoryName}</h6>
												<div class="space-10"></div>
												<p>Đọc để hiểu, thư giãn tâm hồn</p>

												<!-- Kiểm tra xem người dùng đã đăng nhập chưa nếu chưa thì không cho xem chi tiết sách -->
												<c:choose>
													<c:when
														test="${not empty sessionScope.LoginReader or not empty sessionScope.loginAdmin}">
														<a href="<c:url value="/bookDetail/${book.bookId}"/>">See
															the Book</a>
													</c:when>
													<c:otherwise>
														<a href="#" data-toggle="modal" data-target="#loginModal">See
															the Book</a>
													</c:otherwise>
												</c:choose>
											</div>
										</div>
									</div>
								</div>
							</c:forEach>
						</c:if>
					</div>
					<div class="space-60"></div>
					<div class="row">
						<div class="col-xs-12">
							<div class="text-center">
								<ul class="pagination justify-content-center">
									<li
										class="page-item ${pagination.currentPage == 1 ? 'disabled' : ''}">
										<a class="page-link"
										href="<c:url value='/filterCategory/page'/>?page=1&amp;categoryId=${selectedId}"
										onclick="${pagination.currentPage == 1 ? 'event.preventDefault();' : ''}">
											First </a>
									</li>
									<li
										class="page-item ${pagination.currentPage == 1 ? 'disabled' : ''}">
										<a class="page-link"
										href="<c:url value='/filterCategory/page'/>?page=${pagination.currentPage - 1}&amp;categoryId=${selectedId}"
										onclick="${pagination.currentPage == 1 ? 'event.preventDefault();' : ''}">
											Previous </a>
									</li>
									<c:forEach var="pageNumber" begin="1"
										end="${pagination.totalPages}">
										<li
											class="page-item ${pagination.currentPage == pageNumber ? 'active' : ''}">
											<a class="page-link"
											href="<c:url value='/filterCategory/page'/>?page=${pageNumber}&amp;categoryId=${selectedId}">
												${pageNumber} </a>
										</li>
									</c:forEach>
									<li
										class="page-item ${pagination.currentPage == pagination.totalPages ? 'disabled' : ''}">
										<a class="page-link"
										href="<c:url value='/filterCategory/page'/>?page=${pagination.currentPage + 1}&amp;categoryId=${selectedId}"
										onclick="${pagination.currentPage == pagination.totalPages ? 'event.preventDefault();' : ''}">
											Next </a>
									</li>
									<li
										class="page-item ${pagination.currentPage == pagination.totalPages ? 'disabled' : ''}">
										<a class="page-link"
										href="<c:url value='/filterCategory/page'/>?page=${pagination.totalPages}&amp;categoryId=${selectedId}"
										onclick="${pagination.currentPage == pagination.totalPages ? 'event.preventDefault();' : ''}">
											Last </a>
									</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="space-80"></div>
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
	<script type="text/javascript">
	var message = "${message}";
	 if (message && message.trim().length > 0) {
        // Display an alert with the message content
        alert(message);
    }
	 
	 function filterCategory(id) {
		    var form = document.getElementById('categoryFilterForm');
		    document.getElementById('selectedId').value = id;
		    form.action = '${pageContext.request.contextPath}/filterCategory/page?page=1&categoryId=' + id;
		    form.submit();
		}
	</script>
	<a id="scrollUp" href="#top"
		style="position: fixed; z-index: 2147483647; display: none;"><i
		class="icofont icofont-long-arrow-up"></i></a>
</body>
</html>
