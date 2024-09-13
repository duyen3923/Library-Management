<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/user/taglib.jsp"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html class="no-js" lang="zxx">

<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Đăng nhập</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Place favicon.ico in the root directory -->
<link rel="apple-touch-icon"
	href="<c:url value ="/assets/images/apple-touch-icon.png"/>">
<link rel="shortcut icon" type="image/ico"
	href="<c:url value ="/assets/favicon.ico" />" />
<!-- Plugin-CSS -->
<link rel="stylesheet"
	href="<c:url value= "/assets/css/bootstrap.min.css"/>">
<link rel="stylesheet"
	href="<c:url value= "/assets/css/owl.carousel.min.css"/>">
<link rel="stylesheet" href="<c:url value= "/assets/css/icofont.css"/>">
<link rel="stylesheet" href="<c:url value="/assets/css/animate.css"/>">
<link rel="stylesheet"
	href="<c:url value="/assets/css/cardslider.css"/>">
<link rel="stylesheet"
	href="<c:url value="/assets/css/responsiveslides.css"/>">
<!-- Main-Stylesheets -->
<link rel="stylesheet" href="<c:url value="/assets/css/normalize.css"/>">
<link rel="stylesheet" href="<c:url value="/assets/css/overright.css"/>">
<link rel="stylesheet" href="<c:url value="/assets/css/theme.css"/>">
<link rel="stylesheet" href="<c:url value="/assets/css/style.css"/>">
<link rel="stylesheet"
	href="<c:url value="/assets/css/responsive.css"/>">
<script src="<c:url value="/assets/js/vendor/modernizr-2.8.3.min.js"/>"></script>

</head>

<body data-spy="scroll" data-target="#mainmenu" data-offset="50">
	<header class="relative" id="sc1">
		<!-- Header-background-markup -->
		<div class="overlay-bg relative">
			<img src="<c:url value="assets/images/slide/slide2.jpg" />" alt="">
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
							<h1 class="text-white">QUÊN MẬT KHẨU</h1>
							<h1 class="text-white">${statusLG}</h1>
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
							<form action="ForgotPassword" method="POST" >
								<div class="space-20"></div>
								<div class="row">
									<div class="col-xs-12 col-md-7">
										<div class="form-group">
											<label for="email">Your registered email</label>
											<input name = "email" type="email" class="form-control bg-none"
												placeholder="Email đăng kí..."  id="email" />
											<span id="errorEmail" style="color: red;"></span>
										</div>
									</div>
								</div>
								<div class="space-20"></div>
								<div class="row">
									<div class="col-xs-12 col-sm-6"
										style="display: flex; align-items: center; justify-content: space-between;">
										<button id="btnDN" type="submit" class="btn btn-default">
											Gửi<i class="fa fa-long-arrow-right"></i>
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
	<script src="<c:url value="assets/js/vendor/jquery-1.12.4.min.js"/>"></script>
	<script src="<c:url value="assets/js/vendor/bootstrap.min.js"/>"></script>
	<!-- Plugin-JS -->
	<script src="<c:url value="assets/js/owl.carousel.min.js"/>"></script>
	<script src="<c:url value="assets/js/responsiveslides.min.js"/>"></script>
	<script src="<c:url value="assets/js/jquery.cardslider.min.js"/>"></script>
	<script src="<c:url value="assets/js/pagination.js"/>"></script>
	<script src="<c:url value="assets/js/scrollUp.min.js"/>"></script>
	<script src="<c:url value="assets/js/wow.min.js"/>"></script>
	<script src="<c:url value="assets/js/plugins.js"/>"></script>
	<!-- Active-JS -->
	<script src="<c:url value="assets/js/main.js"/>"></script>
	
	<script type="text/javascript">
		var message = "${message}";
		if (message && message.trim().length > 0) {
			// Display an alert with the message content
			alert(message);
		}
		
	</script>
</body>

</html>