<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<title>Admin</title>

<script type="text/javascript"
    src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script type="text/javascript"
    src="http://code.jquery.com/ui/1.11.0/jquery-ui.js"></script>
<link rel="stylesheet"
    href="http://code.jquery.com/ui/1.11.0/themes/smoothness/jquery-ui.css">

<!-- Fontfaces CSS-->
<link href="<c:url value='/assets/css/font-face.css'/>" rel="stylesheet"
    media="all">
<link
    href="<c:url value='/assets/vendor/font-awesome-4.7/css/font-awesome.min.css'/>"
    rel="stylesheet" media="all">
<link
    href="<c:url value='/assets/vendor/font-awesome-5/css/fontawesome-all.min.css'/>"
    rel="stylesheet" media="all">

<!-- Bootstrap CSS-->
<link
    href="<c:url value='/assets/vendor/bootstrap-4.1/bootstrap.min.css'/>"
    rel="stylesheet" media="all">

<!-- Vendor CSS-->
<link
    href="<c:url value='/assets/vendor/animsition/animsition.min.css'/>"
    rel="stylesheet" media="all">
<link
    href="<c:url value='/assets/vendor/css-hamburgers/hamburgers.min.css'/>"
    rel="stylesheet" media="all">
<link
    href="<c:url value='/assets/vendor/perfect-scrollbar/perfect-scrollbar.css'/>"
    rel="stylesheet" media="all">

<!-- Main CSS-->
<link href="<c:url value='/assets/css/theme_1.css'/>" rel="stylesheet"
    media="all">

<style type="text/css">

</style>
<script></script>
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
                <div class="section__content--p30">
                    <div class="space-5"></div>
                    <form
                        action="${pageContext.request.contextPath}/timKiemPhieuTraSach"
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
                    <p>
                        <strong>${ctmtDto.size()}</strong> phiếu được tìm thấy
                    </p>
                    <br>
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-sm-12 col-md-12">
                                <div class="card">
                                    <div class="card-header">
                                        <strong>Quản Lý Trả Sách</strong>
                                    </div>

                                    <div class="col-12 col-md-12">
                                        <div class="table-responsive table--no-card m-b-30">
                                            <table style="width: 100%"
                                                class="table table-borderless table-striped table-earning">
                                                <thead>
                                                    <tr class="col-sm-12">
                                                        <th>Mã Mượn</th>
                                                        <th>Sách</th>
                                                        <th>Số Lượng</th>
                                                        <th>Ngày Mượn</th>
                                                        <th>Ngày Hẹn Trả</th>
                                                        <th>Người Đọc</th>
                                                        <th></th>
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
                                                            <td><c:out value="${ctmt.readerName}" /></td>
                                                            <td
                                                                style="display: flex; justify-content: space-between;">
                                                                <button type="button" class="btn btn-info"
                                                                    data-toggle="modal" data-target="#staticBackdrop"
                                                                    onclick="updateFormAction(${ctmt.ctmtId})">Trả
                                                                    Sách</button>

                                                                <div class="modal fade" id="staticBackdrop"
                                                                    data-backdrop="static" data-keyboard="false"
                                                                    tabindex="-1" aria-labelledby="staticBackdropLabel"
                                                                    aria-hidden="true" style="z-index: 1055 !important">
                                                                    <div class="modal-dialog">
                                                                        <div class="modal-content">
                                                                            <div class="modal-header">
                                                                                <h5 class="modal-title" id="staticBackdropLabel1">Xác
                                                                                    nhận</h5>
                                                                                <button type="button" class="close"
                                                                                    data-dismiss="modal" aria-label="Close">
                                                                                    <span aria-hidden="true">&times;</span>
                                                                                </button>
                                                                            </div>
                                                                            <div class="modal-body">
                                                                                <span class="text-danger"> Bạn có chắc trả
                                                                                    phiếu này? </span>
                                                                            </div>
                                                                            <div class="modal-footer">
                                                                                <button type="button"
                                                                                    class="btn btn-warning btn-secondary"
                                                                                    data-dismiss="modal" style="margin-right: 10px;">Hủy</button>
                                                                                <form:form id="updateForm" method="POST"
                                                                                    action="${pageContext.request.contextPath}/updateTraSach/${ctmt.ctmtId}">
                                                                                    <button type="submit" class="btn btn-info">Trả
                                                                                        Sách</button>
                                                                                </form:form>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </td>
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
        </div>
        <!-- END PAGE CONTAINER-->
    </div>

    <script src="<c:url value='/assets/vendor/jquery-3.2.1.min.js'/>"></script>
    <!-- Bootstrap JS-->
    <script
        src="<c:url value='/assets/vendor/bootstrap-4.1/popper.min.js'/>"></script>
    <script
        src="<c:url value='/assets/vendor/bootstrap-4.1/bootstrap.min.js'/>"></script>
    <!-- Vendor JS -->
    <script src="<c:url value='/assets/vendor/slick/slick.min.js'/>"></script>
    <script src="<c:url value='/assets/vendor/wow/wow.min.js'/>"></script>
    <script
        src="<c:url value='/assets/vendor/animsition/animsition.min.js'/>"></script>
    <script
        src="<c:url value='/assets/vendor/bootstrap-progressbar/bootstrap-progressbar.min.js'/>"></script>
    <script
        src="<c:url value='/assets/vendor/counter-up/jquery.waypoints.min.js'/>"></script>
    <script
        src="<c:url value='/assets/vendor/counter-up/jquery.counterup.min.js'/>"></script>
    <script
        src="<c:url value='/assets/vendor/plugins/daterangepicker/daterangepicker.js'/>"></script>
    <script
        src="<c:url value='/assets/vendor/circle-progress/circle-progress.min.js'/>"></script>
    <script
        src="<c:url value='/assets/vendor/perfect-scrollbar/perfect-scrollbar.js'/>"></script>
    <script
        src="<c:url value='/assets/vendor/chartjs/Chart.bundle.min.js'/>"></script>
    <script src="<c:url value='/assets/vendor/select2/select2.min.js'/>"></script>
    <!-- Main JS-->
    <script src="<c:url value='/assets/js/main_admin.js'/>"></script>
    <script type="text/javascript"
        src="<c:url value='/assets/vendor/jquery-ui-1.13.3.custom'/>"></script>
    <script type="text/javascript">
        var message = "${message}";
        if (message && message.trim().length > 0) {
            alert(message);
        }

        function updateFormAction(id) {
            var form = document.getElementById('updateForm');
            form.action = '${pageContext.request.contextPath}/updateTraSach/' + id;
        }

        // Scroll to the top of the page when it loads
        $(window).on("load", function() {
            window.scrollTo(0, 0);
        });
    </script>
</body>
</html>
