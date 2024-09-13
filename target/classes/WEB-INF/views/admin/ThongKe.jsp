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
<meta charset="UTF-8" />
<link rel="apple-touch-icon" sizes="76x76"
	href="<c:url value="./assets/images/apple-touch-icon.png"/>">
<link rel="icon" type="image/png"
	href="<c:url value="./assets/images/apple-touch-icon.png"/>">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>QUẢN LÝ THỐNG KÊ</title>
<meta
	content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no'
	name='viewport' />
<!--     Fonts and icons     -->
<link rel="stylesheet" type="text/css"
	href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
<!-- CSS Files -->

<!-- Fontfaces CSS-->
<link href="<c:url value= "/assets/css/font-face.css"/>"
	rel="stylesheet" media="all">
<link href='https://fonts.googleapis.com/css?family=Roboto'
	rel='stylesheet'>
<link
	href="<c:url value= "/assets/vendor/font-awesome-4.7/css/font-awesome.min.css"/>"
	rel="stylesheet" media="all">
<link
	href="<c:url value= "/assets/vendor/font-awesome-5/css/fontawesome-all.min.css"/>"
	rel="stylesheet" media="all">
<link
	href="<c:url value= "/assets/vendor/mdi-font/css/material-design-iconic-font.min.css"/>"
	rel="stylesheet" media="all">
<!-- Bootstrap CSS-->
<link
	href="<c:url value= "/assets/vendor/bootstrap-4.1/bootstrap.min.css"/>"
	rel="stylesheet" media="all">

<!-- Vendor CSS-->
<link
	href="<c:url value= "/assets/vendor/animsition/animsition.min.css"/>"
	rel="stylesheet" media="all">
<link
	href="<c:url value= "/assets/vendor/bootstrap-progressbar/bootstrap-progressbar-3.3.4.min.css"/>"
	rel="stylesheet" media="all">
<link href="<c:url value= "/assets/vendor/wow/animate.css"/>"
	rel="stylesheet" media="all">
<link rel="stylesheet"
	href="<c:url value= "/assets/css/responsiveslides.css"/>">
<link
	href="<c:url value= "/assets/vendor/css-hamburgers/hamburgers.min.css"/>"
	rel="stylesheet" media="all">
<link href="<c:url value= "/assets/vendor/slick/slick.css"/>"
	rel="stylesheet" media="all">
<link href="<c:url value= "/assets/vendor/select2/select2.min.css"/>"
	rel="stylesheet" media="all">
<link
	href="<c:url value= "/assets/vendor/perfect-scrollbar/perfect-scrollbar.css"/>"
	rel="stylesheet" media="all">

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
<!-- Main CSS-->
<link href="<c:url value= "/assets/css/theme_1.css"/>" rel="stylesheet"
	media="all">
<link rel="stylesheet" href="<c:url value= "/assets/css/theme.css"/>">
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
	google.charts.load("current", {
		packages : [ "corechart" ]
	});
	google.charts.setOnLoadCallback(drawChart);
	// Lấy dữ liệu JSON từ controller
	var jsonData = '${pieChart}';
	var parsedData = JSON.parse(jsonData);
	function drawChart() {

		var data = new google.visualization.DataTable();
		data.addColumn('string', 'Category');
		data.addColumn('number', 'Amount');

		// Thêm dữ liệu vào DataTable
		for (var i = 0; i < parsedData.length; i++) {

			data.addRow([ parsedData[i].categoryName, parsedData[i].amount ]);
		}

		var options = {
			title : 'Số lượng sách theo thể loại',
			is3D : true
		// Enable 3D effect
		};

		var chart = new google.visualization.PieChart(document
				.getElementById('piechart_3d'));
		chart.draw(data, options);

	}
</script>

<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
	google.charts.load("current", {
		packages : [ "corechart" ]
	});
	google.charts.setOnLoadCallback(drawChart);
	// Lấy dữ liệu JSON từ controller
	var jsonData = '${pieChart}';
	var parsedData = JSON.parse(jsonData);
	function drawChart() {

		var data = new google.visualization.DataTable();
		data.addColumn('string', 'Category');
		data.addColumn('number', 'Amount');

		// Thêm dữ liệu vào DataTable
		for (var i = 0; i < parsedData.length; i++) {

			data.addRow([ parsedData[i].categoryName, parsedData[i].amount ]);
		}

		var options = {
			title : 'TỈ LỆ SÁCH THEO TỪNG THỂ LOẠI',
			is3D : true
		// Enable 3D effect
		};

		var chart = new google.visualization.PieChart(document
				.getElementById('piechart_3d'));
		chart.draw(data, options);

	}

	google.charts.setOnLoadCallback(drawColumnChart);

	function drawColumnChart() {
		var jsonData = '${listReceipt}';
		var parsedData = JSON.parse(jsonData);

		var data = new google.visualization.DataTable();
		data.addColumn('string', 'Month');
		data.addColumn('number', 'Số lượng');

		for ( var month in parsedData) {
			data.addRow([ month, parseInt(parsedData[month]) ]);
		}

		var options = {
			title : 'THỐNG KÊ SỐ SÁCH ĐƯỢC MƯỢN THEO TỪNG THÁNG TRONG NĂM 2024',
			vAxis : {
				title : 'Tổng số sách',
				format : '#'
			}
		};

		var chart = new google.visualization.ColumnChart(document
				.getElementById('columnchart'));
		chart.draw(data, options);
	}
</script>

<link rel="stylesheet" href="<c:url value= "/assets/css/theme.css"/>">

</head>

<body class="">
	<header class="relative" id="sc1">
		<!-- Header-background-markup -->

		<div class="header-bg relative home-slide">
			<div class="item">
				<img src="<c:url value= "/assets/images/stats2.avif"/>"
					alt="library">
			</div>
			<div class="item">
				<img src="<c:url value= "/assets/images/new-bg.jpg"/>" alt="library">
			</div>
			<div class="item">
				<img src="<c:url value= "/assets/images/new-bg-2.jpg"/>"
					alt="library">
			</div>
			<div class="item">
				<img src="<c:url value= "/assets/images/new-bg-3.jpg"/>"
					alt="library">
			</div>
		</div>

		<!-- Mainmenu-markup-start -->
		<div class="mainmenu-area navbar-fixed-top" data-spy="affix"
			data-offset-top="10">
			<!-- ============== HEADER ================= -->
			<%@include file="/WEB-INF/views/shared/headerThongKe.jsp"%>

		</div>
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
		<div class="space-100"></div>

		<!-- Mainmenu-markup-end -->
		<!-- Header-jumbotron -->

		<div class="space-100"></div>
		<div class="header-text">
			<div class="container">
				<div class="row wow fadeInUp" style="justify-content: center;">
					<div class="col-xs-12 col-sm-10 col-sm-offset-1 text-center">
						<div class="jumbotron" style="background: none">

							<p class="text-white">Thư viện của chúng tôi luôn cập nhật
								liên tục với hơn 100 cuốn sách mới mỗi tháng, đảm bảo bạn luôn
								có những tựa sách mới nhất để khám phá.</p>
						</div>

						<div class="space-40"></div>
					</div>
				</div>

			</div>
			<div class="space-100"></div>
			<!-- Header-jumbotron-end -->
	</header>
	<div class="space-100"></div>
	<!-- END HEADER  -->
	<div class="content">
		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-3 col-md-6 col-sm-6">
					<div class="card card-stats" style="background: #92C7CF;">
						<div class="card-header card-header-warning card-header-icon">
							<div class="card-icon">
								<i class="material-icons">content_copy</i>
							</div>
							<p class="card-category">Tổng số lượng sách</p>
							<h3 class="card-title">
								${bookAmount } <small></small>
							</h3>
						</div>
						<div class="card-footer">
							<div class="stats">
								<i class="material-icons text-danger"></i> <a
									href="<c:url value="/sach"/>">Xem sách...</a>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-md-6 col-sm-6">
					<div class="card card-stats" style="background: #AAD7D9;">
						<div class="card-header card-header-success card-header-icon">
							<div class="card-icon">
								<i class="material-icons">store</i>
							</div>
							<p class="card-category">Số sách đang được mượn</p>
							<h3 class="card-title">${borrowedBooksAmount }</h3>
						</div>
						<div class="card-footer">
							<div class="stats">
								<i class="material-icons">date_range</i>Just Updated
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-md-6 col-sm-6">
					<div class="card card-stats" style="background: #FBF9F1;">
						<div class="card-header card-header-danger card-header-icon">
							<div class="card-icon">
								<i class="material-icons">info_outline</i>
							</div>
							<p class="card-category">Mức độ mượn sách</p>
							<h3 class="card-title">${borrowedRate}%</h3>
						</div>
						<div class="card-footer">
							<div class="stats d-flex align-items-center">
								<i class="material-icons">local_offer</i>
								<c:choose>
									<c:when test="${borrowedRate * 100 < 20}">
										<p>Mật độ mượn sách thấp</p>
									</c:when>
									<c:otherwise>
										<p>Mật độ mượn sách tốt</p>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-md-6 col-sm-6">
					<div class="card card-stats" style="background: #E5E1DA;">
						<div class="card-header card-header-info card-header-icon">
							<div class="card-icon">
								<i class="fa fa-twitter"></i>
							</div>
							<p class="card-category">Followers</p>
							<h3 class="card-title">+${readersAmount }</h3>
						</div>
						<div class="card-footer">
							<div class="stats">
								<i class="material-icons">update</i> Just Updated
							</div>
						</div>
					</div>
				</div>
			</div>
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
			<div class="row">

				<!-- PIE CHART -->

				<div class="col-md-6">
					<div class="card card-chart">
						<div class="card-header card-header-warning">
							<!-- <div class="ct-chart" id="websiteViewsChart"></div> -->
							<!-- TEST CHART -->
							<div id="piechart_3d" style="min-height: 500px"></div>

						</div>
						<div class="card-body" style="min-height: 122px">

							<h4 class="card-title">Thống kê tỉ lệ sách theo từng thể
								loại</h4>
							<p class="card-category" id="thongKeMax">
								Thể loại sách có số lương sách nhiều nhất là <b>${categoryMaxName}</b>
								với số lượng là <b>${categoryMaxAmount}</b>
							</p>
							<p class="card-category" id="thongKeMin">
								Thể loại sách có số lương sách ít nhất là <b>${categoryMinName}</b>
								với số lượng là <b>${categoryMinAmount}</b>
							</p>

						</div>
						<div class="card-footer">
							<div class="stats"></div>
						</div>
					</div>
				</div>

				<!-- COLUMN CHART  -->

				<div class="col-md-6">
					<div class="card card-chart">
						<div class="card-header card-header-success">

							<div id="columnchart" style="min-height: 500px"></div>
						</div>
						<div class="card-body" style="min-height: 100px">
							<p>
								Thể loại sách được quan tâm nhất <b>${mostFavoriteCategoryName}</b>
								với <b>${mostFavoriteCategoryAmount}</b> lượt mượn
							</p>
							<p>
								Thể loại sách ít được quan tâm nhất <b>${leastFavoriteCategoryName}</b>
								với <b>${leastFavoriteCategoryAmount}</b> lượt mượn
							</p>
						</div>
						<div class="card-footer"></div>
					</div>
				</div>

			</div>
		</div>
		<div class="row">
			<div class=" col-md-6">
				<div class="card">
					<div class="card-header card-header-warning">
						<h4 class="card-title">Thông tin người đọc</h4>
						<p class="card-category">Just updated</p>
					</div>
					<div class="card-body table-responsive">
						<table class="table table-hover table-striped"
							style="text-align: center;">
							<thead class="text-warning">
								<th class="text-center">ID</th>
								<th class="text-center">Họ tên</th>
								<th class="text-center">Số sách đã mượn</th>
								<th class="text-center">Số sách chưa trả</th>
							</thead>
							<tbody>
								<c:forEach var="reader" items="${readers}">
									<tr>
										<td>${reader.readerId}</td>
										<td>${reader.readerName}</td>
										<td>${reader.bookAmount}</td>
										<td>${reader.ctmtAmount}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>

			<div class="col-md-6">
				<div class="card">
					<div class="card-header card-header-warning">
						<h4 class="card-title">Thông tin tác giả</h4>
						<p class="card-category">Tác giả có đầu sách được mượn nhiều
							nhất</p>
					</div>
					<div class="card-body table-responsive">
						<table class="table table-hover table-striped"
							style="text-align: center;">
							<thead class="text-warning">
								<th class="text-center">ID</th>
								<th class="text-center">Tác giả</th>
								<th class="text-center">Tên sách</th>
								<th class="text-center">Số lượt mượn</th>
							</thead>
							<tbody>
								<c:forEach var="author" items="${authors}">
									<tr>
										<td>${author.id}</td>
										<td>${author.name}</td>
										<td>${author.bookname}</td>
										<td>${author.amount}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>

	</div>
	</div>


	<script src="<c:url value="/assets/js/material-dashboard.js?v=2.1.1"/>"
		type="text/javascript"></script>
	<script src="<c:url value="/assets/js/ThongKe.js"/>"></script>
	<script src="<c:url value= "/assets/js/vendor/jquery-1.12.4.min.js"/>"></script>
	<script
		src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
	<script
		src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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

</body>

</html>