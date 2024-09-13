<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%-- <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%> --%>
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
<meta name="description" content="au theme template">
<meta name="keywords" content="au theme template">

<!-- Title Page-->
<title>Admin</title>

<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script type="text/javascript"
	src="http://code.jquery.com/ui/1.11.0/jquery-ui.js"></script>
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.11.0/themes/smoothness/jquery-ui.css">


<!-- Fontfaces CSS-->
<link href="<c:url value= "/assets/css/font-face.css"/>"
	rel="stylesheet" media="all">
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

<!-- Main CSS-->
<link href="<c:url value= "/assets/css/theme_1.css"/>" rel="stylesheet"
	media="all">


<style type="text/css">/* Chart.js */
@
-webkit-keyframes chartjs-render-animation {
	from {opacity: 0.99
}

to {
	opacity: 1
}

}
@
keyframes chartjs-render-animation {
	from {opacity: 0.99
}

to {
	opacity: 1
}

}
.chartjs-render-monitor {
	-webkit-animation: chartjs-render-animation 0.001s;
	animation: chartjs-render-animation 0.001s;
}
</style>
<script>
	
</script>
</head>


<body class="animsition" style="animation-duration: 900ms; opacity: 1;">
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
				<div class="section__content section__content--p30">
					<div class="container-fluid">
						<div class="row">
							<div class="col-sm-12 col-md-12">
								<form
									action="${pageContext.request.contextPath}/timKiemPhieuMuonTra"
									method="POST">
									<div class="input-group">
										<input type="text" class="form-control"
											placeholder="Nhập tên người đọc muốn tìm" name="name" />
										<div class="input-group-btn">
											<input type="submit" value="Search"
												class="btn btn-primary icofont icofont-search-alt-2">
										</div>
									</div>
								</form>
								<hr>
								<div class="col-sm-12 col-md-12">
									<div class="row">
										<p>
											<strong>${ctmtDto.size()}</strong> phiếu mượn trả được tìm
											thấy
										</p>
										<div class="button-container" style="margin-left: auto">
											<a class="btn btn-success" href="<c:url value='/muontra'/>">Thêm</a>
											<a class="btn btn-info" href="<c:url value='/traSach'/>">Trả
												Sách</a>
										</div>
									</div>
								</div>
								<div class="card">
									<div class="card-header">
										<strong>Danh Sách Mượn Trả</strong>
									</div>

									<div class="col-12 col-md-12">
										<div class="table-responsive table--no-card m-b-30">
											<table style="width: 100%"
												class="table  table-borderless table-striped table-earning">
												<thead>
													<tr class="col-sm-12">
														<th>Mã Mượn</th>
														<th>Sách</th>
														<th>Số lượng</th>
														<th>Ngày Mượn</th>
														<th>Ngày Hẹn Trả</th>
														<th>Trạng Thái</th>
														<th>Tên người đọc</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach var="ctmt" items="${ctmtDto}">
														<tr>
															<td><c:out value="${ctmt.ctmtId}" /></td>
															<td><c:out value="${ctmt.bookName}" /></td>
															<td><c:out value="${ctmt.ctmtAmount}" /></td>
															<td><c:out value="${ctmt.ctmtNgayMuon}" /></td>
															<td><c:out value="${ctmt.ctmtNgayTra}" /></td>
															<td><c:choose>
																	<c:when test="${ctmt.ctmtTrangThai == 0}">
                                                                        Chưa trả
                                                                    </c:when>
																	<c:when test="${ctmt.ctmtTrangThai == 1}">
                                                                        Đã trả
                                                                    </c:when>
																	<c:otherwise>
                                                                        Unknown status
                                                                    </c:otherwise>
																</c:choose></td>
															<td><c:out value="${ctmt.readerName}" /></td>
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

	<script src="<c:url value= "/assets/vendor/jquery-3.2.1.min.js"/>"></script>
	<!-- Bootstrap JS-->
	<script
		src="<c:url value= "/assets/vendor/bootstrap-4.1/popper.min.js"/>"></script>
	<script
		src="<c:url value= "/assets/vendor/bootstrap-4.1/bootstrap.min.js"/>"></script>
	<!-- Vendor JS       -->
	<script src="<c:url value= "/assets/vendor/slick/slick.min.js"/>">
		
	</script>
	<script src="<c:url value= "/assets/vendor/wow/wow.min.js"/>"></script>
	<script
		src="<c:url value= "/assets/vendor/animsition/animsition.min.js"/>"></script>
	<script
		src="<c:url value= "/assets/vendor/bootstrap-progressbar/bootstrap-progressbar.min.js"/>">
		
	</script>
	<script
		src="<c:url value= "/assets/vendor/counter-up/jquery.waypoints.min.js"/>"></script>
	<script
		src="<c:url value= "/assets/vendor/counter-up/jquery.counterup.min.js"/>">
	</script>
	<!-- date-range-picker -->
	<script
		src="<c:url value="/assets/vendor/plugins/daterangepicker/daterangepicker.js"/>"></script>
	<script
		src="<c:url value= "/assets/vendor/circle-progress/circle-progress.min.js"/>"></script>
	<script
		src="<c:url value= "/assets/vendor/perfect-scrollbar/perfect-scrollbar.js"/>"></script>
	<script
		src="<c:url value= "/assets/vendor/chartjs/Chart.bundle.min.js"/>"></script>
	<script src="<c:url value= "/assets/vendor/select2/select2.min.js"/>">
		
	</script>
	<!-- Main JS-->
	<script src="<c:url value= "/assets/js/main_admin.js"/>"></script>
	<script type="text/javascript"
		src="<c:url value="/assets/vendor/jquery-ui-1.13.3.custom"/>"></script>
</body>
</html>