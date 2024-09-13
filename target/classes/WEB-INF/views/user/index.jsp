
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Home</title>

<!-- Place favicon.ico in the root directory -->
<link rel="apple-touch-icon"
	href="<c:url value= "/assets/images/apple-touch-icon.png" />">
<link rel="shortcut icon" type="image/ico"
	href="<c:url value= "/assets/images/favicon.ico" />" />

<!-- Plugin-CSS -->
<link href="<c:url value= "/assets/css/bootstrap.min.css" />"
	rel="stylesheet">
<link rel="stylesheet"
	href="<c:url value= "/assets/css/owl.carousel.min.css"/>">
<link rel="stylesheet" href="<c:url value= "/assets/css/icofont.css"/>">
<link rel="stylesheet" href="<c:url value= "/assets/css/animate.css"/>">
<link rel="stylesheet"
	href="<c:url value= "/assets/css/cardslider.css"/>">
<link rel="stylesheet"
	href="<c:url value= "/assets/css/responsiveslides.css"/>">

<!-- Main-Stylesheets -->
<link rel="stylesheet"
	href="<c:url value= "/assets/css/normalize.css"/>">
<link rel="stylesheet"
	href="<c:url value= "/assets/css/overright.css"/>">
<link rel="stylesheet" href="<c:url value= "/assets/css/theme.css"/>">
<link href="<c:url value= "/assets/style.css"/>" rel="stylesheet" />
<link rel="stylesheet"
	href="<c:url value= "/assets/css/responsive.css"/>">
<script src="<c:url value= "/assets/css/responsive.css"/>"></script>

<script
	src="https://www.gstatic.com/dialogflow-console/fast/messenger/bootstrap.js?v=1"></script>
<df-messenger intent="WELCOME" chat-title="Library-Management"
	agent-id="26ece399-eaf2-425d-856b-68c9b2b68caa" language-code="vi"></df-messenger>
<style type="text/css" media="screen">
df-messenger { -
	-df-messenger-bot-message: { height : 500px !important;
}

;
}
df-messenger::part(chat-wrapper) {
	height: 500px !important;
}
html {
    font-family: sans-serif;
    -webkit-text-size-adjust: 100%;
    -ms-text-size-adjust: 100%
}

body {
    margin: 0
}

article,aside,details,figcaption,figure,footer ,header,hgroup,main,menu,nav,section,summary {
    display: block
}

</style>
</head>

<body>
	<header class="relative" id="sc1">
		<!-- Header-background-markup -->

		<div class="header-bg relative home-slide">
			<div class="item">
				<img src="<c:url value= "/assets/images/slide/slide1.jpg"/>"
					alt="library">
			</div>
			<div class="item">
				<img src="<c:url value= "/assets/images/slide/slide2.jpg"/>"
					alt="library">
			</div>
			<div class="item">
				<img src="<c:url value= "/assets/images/slide/slide3.jpg"/>"
					alt="library">
			</div>
			<div class="item">
				<img src="<c:url value= "/assets/images/slide/slide4.jpg"/>"
					alt="library">
			</div>
		</div>

		<!-- Mainmenu-markup-start -->
		<div class="mainmenu-area navbar-fixed-top" data-spy="affix"
			data-offset-top="10">
			<!-- ============== HEADER ================= -->
			<%@include file="/WEB-INF/views/shared/header.jsp"%>

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
							<h1 class="text-white">
								Có hơn
								<c:out value="${books.size()}"></c:out>
								cuốn sách ở đây
							</h1>
							<p class="text-white">Đến với thư viện đa năng của chúng tôi
								bạn có thể tận hưởng sự tuyệt vời thời đại mới tha hồ đọc, tải,
								mượn trực tuyến cùng những cuốn sách mới nhất, hay nhất!!!</p>
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
				<div class="row wow fadeInUp" data-wow-delay="0.5s">
					<div
						class="col-xs-12 col-sm-8 col-sm-offset-2 col-md-6 col-md-offset-3 ">
						<div class="panel">
							<div class="panel-heading">
								<ul class="nav nav-tabs">
									<li class="active"><a data-toggle="tab" href="#book">Tìm
											kiếm sách</a></li>
								</ul>
							</div>
							<div class="panel-body">
								<div class="tab-content">
									<div class="tab-pane fade in active" id="book">
										<form:form action="timKiemSach" method="POST"
											modelAttribute="search">
											<div class="input-group">
												<form:input type="text" class="form-control"
													placeholder="Nhập tên sách hoặc tác giả muốn tìm"
													path="bookName" name="txtSearch" />
												<div class="input-group-btn">
													<button type="submit" class="btn btn-primary">
														<i class="icofont icofont-search-alt-2"></i>
													</button>
												</div>
											</div>
										</form:form>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="space-100"></div>
		<!-- Header-jumbotron-end -->
	</header>
	<!-- Modal Logout-->
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
					<span class="text-light"> Vui lòng đăng nhập để xem chi tiết
						sách </span>
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
	<section class="gray-bg" id="sc2">
		<div class="space-80"></div>
		<div class="container" id="gioithieu">
			<div class="row">
				<div
					class="col-xs-12 col-sm-8 col-sm-offset-2 col-md-6 col-md-offset-3 text-center">
					<h2>
						<strong>Giới thiệu</strong>
					</h2>
					<div class="space-20"></div>
					<div class="title-bar blue">
						<ul class="list-inline list-unstyled">
							<li><i class="icofont icofont-square"></i></li>
							<li><i class="icofont icofont-square"></i></li>
						</ul>
					</div>
					<div class="space-30"></div>
					<p>Bạn sẽ thỏa mãn với những cuốn sách hay nhất. Chúng tôi sẽ
						luôn cập nhập sách mới nhất.</p>
				</div>
			</div>
			<div class="space-60"></div>
			<div class="row">
				<div
					class="hidden-xs hidden-sm col-sm-5 pull-right  wow fadeInRight">
					<div class="space-60"></div>
					<div class="my-slider">
						<ul>
							<c:forEach var="author" items="${authors}" end="4">
								<li><img
									src="<c:url value = "/assets/images/author/${author.image}"/>"
									alt="library"></li>
							</c:forEach>
						</ul>
					</div>
					<div class="mama"></div>
				</div>
				<div class="col-xs-12 col-md-7">
					<ul class="list-unstyled list-inline text-yellow tip">
						<li><i class="icofont icofont-square"></i></li>
						<li><i class="icofont icofont-square"></i></li>
						<li><i class="icofont icofont-square"></i></li>
					</ul>
					<div class="space-15"></div>
					<p>Thư viện sẽ đem lại điều tuyệt vời cho bạn khi ghé thăm.</p>
					<div class="space-60"></div>
					<div class="row">
						<div class="col-xs-12 col-sm-6 wow fadeIn">
							<ul class="list-unstyled list-inline icon-bar">
								<li><i class="icofont icofont-id-card"></i></li>
							</ul>
							<h3>Thẻ thành viên</h3>
							<p>Đăng kí thành viên để tận hưởng thư viện online hiện đại
								này!</p>
							<div class="space-30"></div>
						</div>
						<div class="col-xs-12 col-sm-6 wow fadeIn">
							<ul class="list-unstyled list-inline icon-bar">
								<li><i class="icofont icofont-medal-alt"></i></li>
							</ul>
							<h3>Sách chất lượng cao</h3>
							<p>Luôn cập nhập, đổi sách mới nhất, hay nhất!</p>
							<div class="space-30"></div>
						</div>
					</div>
					<div class="row">
						<div class="col-xs-12 col-sm-6 wow fadeIn">
							<ul class="list-unstyled list-inline icon-bar">
								<li><i class="icofont icofont-read-book-alt"></i></li>
							</ul>
							<h3>Miễn phí tất cả các sách</h3>
							<p>Hot Hot đang những ngày dowload sách free!</p>
							<div class="space-30"></div>
						</div>
						<div class="col-xs-12 col-sm-6 wow fadeIn">
							<ul class="list-unstyled list-inline icon-bar">
								<li><i class="icofont icofont-book-alt"></i></li>
							</ul>
							<h3>Liên tục cập nhật</h3>
							<p>Nhiều sách mới nhất đã được nhập về!</p>
							<div class="space-30"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="space-60"></div>
	</section>
	<section>
		<div class="space-80"></div>
		<div class="container">
			<div class="row">
				<div
					class="col-xs-12 col-sm-8 col-sm-offset-2 col-md-6 col-md-offset-3 text-center">
					<h2>
						<strong>Danh mục sách</strong>
					</h2>
					<div class="space-20"></div>
					<div class="title-bar blue">
						<ul class="list-inline list-unstyled">
							<li><i class="icofont icofont-square"></i></li>
							<li><i class="icofont icofont-square"></i></li>
						</ul>
					</div>
					<div class="space-30"></div>
					<p>Cùng tìm hiểu về sách nhé!!!</p>
				</div>
			</div>
			<div class="space-120"></div>
			<div class="row text-center">
				<c:forEach var="category" items="${categories}">
					<div class="col-xs-12 col-sm-6 col-md-3 wow fadeInLeft"
						data-wow-delay="0.1s">
						<div class="category-item well blue text-cetnr">
							<div class="category_icon">
								<i class="icofont icofont-book"></i>
							</div>
							<div class="space-20"></div>
							<div class="title-bar">
								<ul class="list-inline list-unstyled">
									<li><i class="icofont icofont-square"></i></li>
								</ul>
							</div>
							<div class="space-20"></div>
							<a href="#"><c:out value="${category.name}"></c:out></a>
						</div>
					</div>
				</c:forEach>
			</div>

			<div class="space-60"></div>
			<div class="row">
				<div class="col-xs-12 text-center">
					<button class="btn btn-primary" id="show-more-categories">Xem
						thêm</button>
				</div>
			</div>
		</div>
		<div class="space-80"></div>
	</section>
	<section class="relative fix" id="sc3">
		<div class="overlay-bg blue">
			<img src="<c:url value= "/assets/images/blur-bg.jpg"/>" alt="library">
		</div>
		<div class="container-fluid">
			<div class="row">
				<div class="col-xs-12 col-md-6 book-list-position padding60  ">
					<div class="book-list-photo">
						<div class="book-list">
							<!-- book list -->
							<c:forEach var="bookDto" items="${booksDto}" end="3">
								<div class="book_item">
									<div class="book_item">
										<img
											src="<c:url value = "/assets/images/book/${bookDto.bookImage}"/>"
											alt="library">
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
					<div class="bookslide_nav">
						<i class="icofont icofont-long-arrow-left testi_prev"></i> <i
							class="icofont icofont-long-arrow-right testi_next"></i>
					</div>
				</div>
				<div
					class="col-xs-12 pull-right col-md-6 padding60 gray-bg wow fadeInRight">
					<div class="space-60"></div>
					<div class="row">
						<div class="col-xs-12 col-sm-8 col-md-6">
							<h2>Sách phổ biến</h2>
							<div class="space-10"></div>
							<div class="title-bar left blue">
								<ul class="list-inline list-unstyled">
									<li><i class="icofont icofont-square"></i></li>
									<li><i class="icofont icofont-square"></i></li>
								</ul>
							</div>
							<div class="space-20"></div>
						</div>
					</div>
					<div class="space-20"></div>
					<div class="book-content">
						<!-- book details -->
						<div class="book-details">
							<c:forEach var="bookDto" items="${booksDto}" end="3">
								<div class="book-details-item">
									<h4 class="tip-left">Tiêu đề</h4>
									<p class="lead">${bookDto.bookName}</p>
									<div class="space-10"></div>
									<div class="row">
										<div class="col-xs-12 col-sm-8">
											<h4 class="tip-left">Tác giả</h4>
											<div class="media">
												<div class="media-left">
													<img
														src="<c:url value ="/assets/images/author/${bookDto.authorImage}"/>"
														class="media-object author-photo img-thumbnail"
														alt="library">
												</div>
												<div class="media-body">
													<h5>${bookDto.authorName}</h5>
													<!-- author description -->
													<p>23 Sách được viết</p>
												</div>
											</div>
										</div>
										<div class="col-xs-12 col-sm-4">
											<h4>Thể loại</h4>
											<p>${bookDto.categoryName}</p>
										</div>
									</div>
									<div class="space-30"></div>
									<h4 class="tip-left">Mô tả</h4>
									<p>${bookDto.bookDescription}</p>
									<div class="space-20"></div>
									<!-- Kiểm tra xem người dùng đã đăng nhập chưa nếu chưa thì không cho xem chi tiết sách -->
									<c:choose>
										<c:when
											test="${not empty sessionScope.LoginReader or not empty sessionScope.loginAdmin}">
											<a href="<c:url value = "/bookDetail/${bookDto.bookId}"/>"
												class="btn btn-primary hover-btn-default">Đọc Thêm</a>
										</c:when>
										<c:otherwise>
											<a href="#" data-toggle="modal" data-target="#loginModal"
												class="btn btn-primary hover-btn-default">Đọc Thêm</a>
										</c:otherwise>
									</c:choose>
								</div>
							</c:forEach>

						</div>
					</div>
					<div class="space-60"></div>
				</div>
			</div>
		</div>
	</section>
	<section class="gray-bg relative" id="sc5">
		<div class="space-80"></div>
		<div class="container">
			<div class="row">
				<div
					class="col-xs-12 col-sm-8 col-sm-offset-2 col-md-6 col-md-offset-3 text-center">
					<h2>
						<strong>Thông báo</strong>
					</h2>
					<div class="space-20"></div>
					<div class="title-bar blue">
						<ul class="list-inline list-unstyled">
							<li><i class="icofont icofont-square"></i></li>
							<li><i class="icofont icofont-square"></i></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="space-60"></div>
			<div class="row event-list">

				<div class="col-xs-12 col-md-7 col-md-offset-2">
					<c:forEach var="notification" items="${notifications}" end="1">
						<div class="event-item wow fadeInRight">
							<h4 class="show tip-left">${notification.dayCreated}</h4>
							<div class="well">
								<div class="media">
									<div class="media-left">
										<img
											src="<c:url value = "/assets/images/event/${notification.image}"/>"
											class="media-object" alt="library">
									</div>
									<div class="media-body">
										<div class="space-10"></div>
										<a href="books.html"><strong class="media-heading">${notification.title}</strong></a>
										<div class="space-10"></div>
										<p>${notification.content}</p>
									</div>
								</div>
							</div>
						</div>
						<div class="space-20"></div>
					</c:forEach>
					<div class="fix">
						<a href="<c:url value ="/notification/page"/>"
							class="btn btn-default pull-right hover-btn-primary">Xem thêm
							<span><i class="icofont icofont-long-arrow-right"></i></span>
						</a>
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
	<script src="<c:url value= "/assets/js/vendor/jquery-1.12.4.min.js"/>"></script>
	<script src="<c:url value= "/assets/js/vendor/bootstrap.min.js"/>"></script>
	<!-- Plugin-JS -->
	<script src="<c:url value= "/assets/js/owl.carousel.min.js"/>"></script>
	<script src="<c:url value= "/assets/js/responsiveslides.min.js"/>"></script>
	<script src="<c:url value= "/assets/js/jquery.cardslider.min.js"/>"></script>
	<script src="<c:url value= "/assets/js/pagination.js"/>"></script>
	<script src="<c:url value= "/assets/js/scrollUp.min.js"/>"></script>
	<script src="<c:url value= "/assets/js/wow.min.js"/>"></script>
	<script src="<c:url value= "/assets/js/plugins.js"/>"></script>
	<!-- Active-JS -->
	<script src="<c:url value= "/assets/js/main.js"/>"></script>
	<script type="text/javascript">
		var message = "${message}";
		if (message && message.trim().length > 0) {
			// Display an alert with the message content
			alert(message);
		}
	</script>
	<script>
		$(document).ready(function() {
			// Hide all categories except the first 4
			$('.category-item:gt(3)').hide();

			// Check localStorage for the initial state of "showMore"
			const showMoreString = localStorage.getItem('showMore');
			let showMore = false;
			if (showMoreString === 'true') {
				showMore = true;
			}

			// Set initial display based on localStorage
			if (showMore) {
				$('.category-item').show();
				$('#show-more-categories').text('Thu gọn');
			} else {
				$('.category-item:gt(3)').hide();
				$('#show-more-categories').text('Xem thêm');
			}

			$('#show-more-categories').click(function() {
				if (showMore) {
					// Hide all categories except the first 4
					$('.category-item:gt(3)').hide();
					$('#show-more-categories').text('Xem thêm');
				} else {
					// Show all categories
					$('.category-item').show();
					$('#show-more-categories').text('Thu gọn');
				}

				// Update localStorage
				localStorage.setItem('showMore', !showMore);

				// Update internal state variable
				showMore = !showMore;
			});
		});
	</script>
</body>
</html>
