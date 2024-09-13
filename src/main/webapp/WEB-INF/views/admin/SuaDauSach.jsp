<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/xml" prefix="x"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">
<head>
<!-- Required meta tags-->
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link href='https://fonts.googleapis.com/css?family=Roboto'
	rel='stylesheet'>
<!-- Title Page-->
<title>Sửa Đầu Sách</title>

<!-- Fontfaces CSS-->
<link href="<c:url value="/assets/css/font-face.css"/>" rel="stylesheet"
	media="all">
<link
	href="<c:url value="/assets/vendor/font-awesome-4.7/css/font-awesome.min.css"/>"
	rel="stylesheet" media="all">
<link
	href="<c:url value="/assets/vendor/font-awesome-5/css/fontawesome-all.min.css"/>"
	rel="stylesheet" media="all">
<link
	href="<c:url value="/assets/vendor/mdi-font/css/material-design-iconic-font.min.css"/>"
	rel="stylesheet" media="all">
<!-- Bootstrap CSS-->
<link
	href="<c:url value="/assets/vendor/bootstrap-4.1/bootstrap.min.css"/>"
	rel="stylesheet" media="all">

<!-- Vendor CSS-->
<link
	href="<c:url value="/assets/vendor/animsition/animsition.min.css"/>"
	rel="stylesheet" media="all">
<link
	href="<c:url value="/assets/vendor/bootstrap-progressbar/bootstrap-progressbar-3.3.4.min.css"/>"
	rel="stylesheet" media="all">
<link href="<c:url value="/assets/vendor/wow/animate.css"/>"
	rel="stylesheet" media="all">
<link
	href="<c:url value="/assets/vendor/css-hamburgers/hamburgers.min.css"/>"
	rel="stylesheet" media="all">
<link href="<c:url value="/assets/vendor/slick/slick.css"/>"
	rel="stylesheet" media="all">
<link href="<c:url value="/assets/vendor/select2/select2.min.css"/>"
	rel="stylesheet" media="all">
<link
	href="<c:url value="/assets/vendor/perfect-scrollbar/perfect-scrollbar.css"/>"
	rel="stylesheet" media="all">

<!-- Main CSS-->
<link href="<c:url value="/assets/css/theme_1.css"/>" rel="stylesheet"
	media="all">



</head>

<body class="animsition">
	<div class="page-wrapper">
		<%@include file="/WEB-INF/views/shared/sidebar.jsp"%>
		<!-- PAGE CONTAINER-->
		<div class="page-container">
			<!-- HEADER DESKTOP-->
			<header class="header-desktop">
				<div class="section__content section__content--p30">
					<div class="container-fluid">
						<div class="header-wrap"></div>
					</div>
				</div>
			</header>
			<!-- HEADER DESKTOP-->

			<!-- MAIN CONTENT-->
			<div class="main-content">
				<div class=" section__content--p30" style="margin: 0 auto;">
					<div class="container-fluid">
						<div class="row">
							<div class="col-sm-12 col-md-12">
								<div class="card">
									<div class="card-header">
										<strong>Sửa đầu sách</strong>
									</div>
									<div class="card-body card-block">
										<form:form method="post" action="/QLTV/editBook/${bookId}"
											modelAttribute="editBook">
											<div class="row form-group">
												<div class="col col-md-2">
													<form:label path="bookName" class="form-control-label">Tên
														sách</form:label>
												</div>
												<div class="col-12 col-md-4">
													<form:input path="bookName" type="text"
														class="form-control" id="nameBook" required="required" />
													<span id="nameBook_error" style="color: red;"></span>
												</div>

												<div class="col col-md-2">
													<form:label path="categoryId">Thể Loại</form:label>
												</div>
												<div class="col-12 col-md-4">
													<form:select path="categoryId"
														class="selectpicker show-tick form-control">
														<c:forEach var="category" items="${categories}">
															<form:option value="${category.id}">${category.name}</form:option>
														</c:forEach>
													</form:select>
												</div>
											</div>
											<div class="row form-group">
												<div class="col col-md-2">
													<form:label path="bookAmount" class="form-control-label">Số lượng</form:label>
												</div>
												<div class="col-12 col-md-10">
													<form:input path="bookAmount" type="number"
														class="form-control" value="1" id="amountBook" required="required"/>
													<span id="amountBook_error" style="color: red;"></span>
												</div>
											</div>
											<div class="row form-group">
												<div class="col col-md-2">
													<form:label path="bookDescription"
														class="form-control-label">Mô tả</form:label>
												</div>
												<div class="col-12 col-md-10">
													<form:textarea path="bookDescription"
														class="col-md-12 form-control"
														style="border: solid 1px gray;" id="descriptionBook" required="required"/>
													<span id="descriptionBook_error" style="color: red;"></span>
												</div>
											</div>
											<div class="row form-group">
												<div class="col col-md-2">
													<form:label path="authorName">Tác Giả</form:label>
												</div>

												<div class="col-12 col-md-4">
													<form:select path="authorId"
														class="selectpicker show-tick form-control">
														<c:forEach var="author" items="${authors}">
															<form:option value="${author.id}">${author.name}</form:option>
														</c:forEach>
													</form:select>
												</div>

												<div class="col col-md-2">
													<form:label path="bookDayCreated">Ngày xuất bản</form:label>
												</div>
												<div class="col-12 col-md-4">
													<form:input path="bookDayCreated" type="date"
														class="form-control " required="required" />
												</div>
											</div>
											<div class="row form-group">
												<div class="col col-md-2">
													<form:label path="bookImage" class="form-control-label">Ảnh sách</form:label>

												</div>
												<div class="col-12 col-md-4">
													<form:input path="bookImage" type="file"
														class="form-control" id="imageBook" required="required"/>
													<span id="imageBook_error" style="color: red;"></span>
												</div>
												
												<div class="col col-md-2">
													<form:label path="bookImage" class="form-control-label">File PDF</form:label>

												</div>
												<div class="col-12 col-md-4">
													<form:input path="pdf" type="file"
														class="form-control" id="filePDF" required="required"/>
													<span id="filePDF_error" style="color: red;"></span>
												</div>
											</div>

											<button id="book_form" type="button"
												class="btn btn-primary btn-danger" data-toggle="modal"
												data-target="#staticBackdrop">
												Chỉnh Sửa</button>

											<div class="modal fade" id="staticBackdrop"
												data-backdrop="static" data-keyboard="false" tabindex="-1"
												aria-labelledby="staticBackdropLabel" aria-hidden="true"
												style="z-index: 1055 !important">
												<div class="modal-dialog">
													<div class="modal-content">
														<div class="modal-header">
															<h5 class="modal-title" id="staticBackdropLabel1">Chú
																ý</h5>
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
														</div>
														<div class="modal-body">
															<span class="text-danger"> Bạn có muốn chắc sửa
																đầu sách này không? </span>
														</div>
														<div class="modal-footer">
															<button type="button"
																class="btn btn-warning  btn-secondary"
																data-dismiss="modal" style="margin-right: 10px;">Hủy</button>
															<button type="submit" class="btn btn-danger ">
																Sửa</button>
														</div>
													</div>
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
			<!-- END MAIN CONTENT-->
			<!-- END PAGE CONTAINER-->
		</div>
	</div>

	<!-- Jquery JS-->

	<script src="<c:url value="/assets/vendor/jquery-3.2.1.min.js"/>"></script>
	<!-- Bootstrap JS-->
	<script
		src="<c:url value="/assets/vendor/bootstrap-4.1/popper.min.js"/>"></script>
	<script
		src="<c:url value="/assets/vendor/bootstrap-4.1/bootstrap.min.js"/>"></script>
	<!-- Vendor JS       -->
	<script src="<c:url value="/assets/vendor/slick/slick.min.js"/>">
		
	</script>
	<script src="<c:url value="/assets/vendor/wow/wow.min.js"/>"></script>
	<script
		src="<c:url value="/assets/vendor/animsition/animsition.min.js"/>"></script>
	<script
		src="<c:url value="/assets/vendor/bootstrap-progressbar/bootstrap-progressbar.min.js"/>">
		
	</script>
	<script
		src="<c:url value="/assets/vendor/counter-up/jquery.waypoints.min.js"/>"></script>
	<script
		src="<c:url value="/assets/vendor/counter-up/jquery.counterup.min.js"/>">
		
	</script>
	<script
		src="<c:url value="/assets/vendor/circle-progress/circle-progress.min.js"/>"></script>
	<script
		src="<c:url value="/assets/vendor/perfect-scrollbar/perfect-scrollbar.js"/>"></script>
	<script
		src="<c:url value="/assets/vendor/chartjs/Chart.bundle.min.js"/>"></script>
	<script src="<c:url value="/assets/vendor/select2/select2.min.js"/>">
		
	</script>
	<!-- Main JS-->
	<script src="<c:url value="/assets/js/main_admin.js"/>"></script>
	<script src="<c:url value="/assets/js/validate_book.js"/>"></script>

	<script type="text/javascript">
		var message = "${message}";
		if (message && message.trim().length > 0) {
			// Display an alert with the message content
			alert(message);
		}
	</script>
</body>

</html>
