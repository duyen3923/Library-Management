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
<title>QUẢN LÝ THÔNG BÁO</title>

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
										<strong>Thêm thông báo</strong>
									</div>
									<div class="card-body card-block">
										<input type="button" value="Thêm thông báo"
											class="btn btn-primary"
											onclick="location.href='${pageContext.request.contextPath}/ThemThongBao'">
									</div>

									<div class="col-12 col-md-12">
										<div class="table-responsive table--no-card m-b-30">
											<table style="width: 100%"
												class="table  table-borderless table-striped table-earning">
												<thead>
													<tr class="col-sm-12">

														
														<th>Tên thông báo</th>
														<th>Nội dung</th>
														<th>Ngày tạo</th>
														<th>Ảnh bìa</th>
														<th>Sửa và Xóa</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach var="noti" items="${notifications}">
														<tr>
															
															<td><c:out value="${noti.title}" /></td>

															<td><c:out value="${noti.content}" /></td>

															<td><c:out value="${noti.dayCreated}" /></td>
															<td style="width:150px"><img alt="Hinh anh event"
																src="<c:url value = "/assets/images/event/${noti.image}"/>"></td>

															<td><a
																style="display: inline-block; margin-right: 5px;"
																class="btn btn-warning pull-left"
																href="<c:url value='/SuaThongBao/${noti.id}'/>">Sửa</a>
																<button type="button" class="btn btn-danger"
																	data-toggle="modal" data-target="#staticBackdrop" onclick="updateFormAction(${noti.id})">Xoá</button>

																<div class="modal fade" id="staticBackdrop"
																	data-backdrop="static" data-keyboard="false"
																	tabindex="-1" aria-labelledby="staticBackdropLabel"
																	aria-hidden="true" style="z-index: 1055 !important">
																	<div class="modal-dialog">
																		<div class="modal-content">
																			<div class="modal-header">
																				<h5 class="modal-title" id="staticBackdropLabel1">Chú
																					ý</h5>
																				<button type="button" class="close"
																					data-dismiss="modal" aria-label="Close">
																					<span aria-hidden="true">&times;</span>
																				</button>
																			</div>
																			<div class="modal-body">
																				<span class="text-danger"> Bạn có muốn xóa
																					thông báo này </span>
																			</div>
																			<div class="modal-footer">
																				<button type="button"
																					class="btn btn-warning  btn-secondary"
																					data-dismiss="modal" style="margin-right: 10px;">Hủy</button>
																				<form:form id="deleteForm" method="POST">
																					<button type="submit" class="btn btn-danger">Xóa</button>
																				</form:form>
																			</div>
																		</div>
																	</div>
																</div></td>
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
	<script src="<c:url value="assets/js/main_admin.js"/>"></script>


	<script type="text/javascript">
		var message = "${message}";
		if (message && message.trim().length > 0) {
			// Display an alert with the message content
			alert(message);
		}

		function updateFormAction(id) {
			var form = document.getElementById('deleteForm');
			form.action = '${pageContext.request.contextPath}/XoaThongBao/'
					+ id;
		}
	</script>
</body>

</html>
