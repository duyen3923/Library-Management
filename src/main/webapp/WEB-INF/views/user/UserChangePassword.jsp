<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!doctype html>
<html class="no-js" lang="zxx">

<head>
<meta charset="UTF-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Đổi mật khẩu</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Place favicon.ico in the root directory -->
<link rel="apple-touch-icon" href="images/apple-touch-icon.png">
<link rel="shortcut icon" type="image/ico" href="images/favicon.ico" />
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
	href="<c:url value= "/assets/css/overright.css" />">
<link rel="stylesheet" href="<c:url value= "/assets/css/theme.css" />">
<link rel="stylesheet" href="<c:url value= "/assets/style.css" />">
<link rel="stylesheet"
	href="<c:url value= "/assets/css/responsive.css" />">
<script
	src="<c:url value= "/assets/js/vendor/modernizr-2.8.3.min.js" />"></script>
</head>

<body data-spy="scroll" data-target="#mainmenu" data-offset="50">
	<header class="relative" id="sc1">
		<!-- Header-background-markup -->
		<div class="overlay-bg relative">
			<img src="<c:url value= "/assets/images/slide/slide2.jpg"/>"
				alt="library">
		</div>
		<!-- Mainmenu-markup-start -->
		<div class="mainmenu-area navbar-fixed-top" data-spy="affix"
			data-offset-top="10">
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
							<h1 class="text-white">Đổi mật khẩu</h1>
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
					<div class="row">
						<div class="col-xs-12 col-md-8 col-md-offset-4">
							<form action="UserChangePassword" method="post"
								id="register_form">
								<div class="space-20"></div>
								<div class="row">
									<div class="col-xs-12 col-md-7">
										<div class="form-group">
											<label for="old_password">Nhập mật khẩu cũ</label> <input
												name="old_password" type="password" id="old_password"
												class="form-control bg-none" placeholder="Old password..." />
											<span id="old_password_error" style="color: red"></span>
										</div>
									</div>
								</div>
								<div class="space-20"></div>
								<div class="row">
									<div class="col-xs-12 col-md-7">
										<div class="form-group">
											<label for="new_password">Mật khẩu mới</label> <input
												name="new_password" type="password" id="new_password"
												class="form-control bg-none" placeholder="New password..." />
											<span id="new_password_error" style="color: red"></span>
										</div>
									</div>
								</div>
								<div class="space-20"></div>
								<div class="row">
									<div class="col-xs-12 col-md-7">
										<div class="form-group">
											<label for="confirm_password">Xác nhận mật khẩu mới</label> <input
												name="confirm_password" type="password"
												id="confirm_password" class="form-control bg-none"
												placeholder="Confirm new password..." /> <span
												id="confirm_password_error" style="color: red"></span>
										</div>
									</div>
								</div>
								<div class="space-20"></div>
								<div class="row">
									<div class="col-xs-12 col-sm-6">
										<button id="btnDMK" type="submit" class="btn btn-default">
											Đổi mật khẩu<i class="fa fa-long-arrow-right"></i>
										</button>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="space-100"></div>
		<!-- Header-jumbotron-end -->
	</header>
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
	<script src="<c:url value= "/assetsjs/plugins.js"/>"></script>
	<!-- Active-JS -->
	<script src="<c:url value= "/assetsjs/js/main.js"/>"></script>
	<script>
		$(document).ready(
				function() {
					$("#old_password_error").hide();
					$("#new_password_error").hide();
					$("#confirm_password_error").hide();

					var old_password_error = false;
					var new_password_error = false;
					var confirm_password_error = false;

					$("#old_password").focusout(function() {
						checkOldPassword();
					});
					$("#new_password").focusout(function() {
						checkNewPassword();
					});
					$("#confirm_password").focusout(function() {
						checkConfirmPassword();
					});

					function checkOldPassword() {
						if ($("#old_password").val().length <= 0) {
							$("#old_password_error").html(
									"Bạn chưa nhập mật khẩu");
							old_password_error = true;
							$("#old_password_error").show();
						} else {
							old_password_error = false;
							$("#old_password_error").hide();
						}
					}
					function checkNewPassword() {
						if ($("#new_password").val().length < 6
								|| $("#new_password").val().length > 15) {
							$("#new_password_error").html(
									"Password phải có 6-15 kí tự");
							password_error = true;
							$("#new_password_error").show();
						} else if ($("#new_password").val().length == 0) {
							$("#new_password_error").html(
									"Vui lòng nhập mật khẩu mới");
							confirm_password_error = true;

							$("#new_password_error").show();
						} else {
							password_error = false;
							$("#new_password_error").hide();
						}
					}
					function checkConfirmPassword() {
						if ($("#confirm_password").text() != $("#new_password")
								.text()) {
							$("#confirm_password_error").html(
									"Password không giống nhau");
							confirm_password_error = true;

							$("#confirm_password_error").show();
						} else if ($("#confirm_password").val().length == 0) {
							$("#confirm_password_error").html(
									"Vui lòng nhập xác nhận mật khẩu mới");
							confirm_password_error = true;

							$("#confirm_password_error").show();

						} else {
							confirm_password_error = false;
							$("#confirm_password_error").hide();
						}
					}

					
				});
		
	</script>
	<script type="text/javascript">
		var message = "${message}";
		if (message && message.trim().length > 0) {
			// Display an alert with the message content
			alert(message);
		}
		
	</script>
</body>

</html>