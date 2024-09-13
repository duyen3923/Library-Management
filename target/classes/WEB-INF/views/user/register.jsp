<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/user/taglib.jsp"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html class="no-js" lang="zxx">

<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Đăng ký</title>
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
	<script type="text/javascript">
		
	  document.addEventListener("DOMContentLoaded", function() {
	        const form = document.querySelector("form[action='dang-ky']");
	        const registerButton = document.getElementById("register_form");

	        function validateInput(input) {
	            const trimmedValue = input.value.trim();
	            if (trimmedValue === "") {
	                document.getElementById(input.id + "_error").innerText = "This field cannot be empty or only spaces";
	                return false;
	            } else {
	                document.getElementById(input.id + "_error").innerText = "";
	                return true;
	            }
	        }

	        form.addEventListener("input", function() {
	            let isValid = true;

	            // Select all input elements
	            const inputs = form.querySelectorAll("input[type='text'], input[type='password'],input[type='email']");
	            inputs.forEach(input => {
	                if (!validateInput(input)) {
	                    isValid = false;
	                }
	            });

	            registerButton.disabled = !isValid;
	        });

	        form.addEventListener("submit", function(event) {
	            let isFormValid = true;
	            const inputs = form.querySelectorAll("input[type='text'], input[type='password'],input[type='email']");
	            inputs.forEach(input => {
	                input.value = input.value.trim();
	                if (!validateInput(input)) {
	                    isFormValid = false;
	                }
	            });
	            if (!isFormValid) {
	                event.preventDefault();
	            }
	        });
	    });
	</script>

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
			<%@include file ="/WEB-INF/views/shared/header.jsp" %>
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
							<h1 class="text-white">Đăng ký</h1>
							<h1 class="text-white">${status}</h1>
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
							<form:form action="dang-ky" method="POST" modelAttribute="user" autocomplete="off">
								<div class="row">
									<div class="col-xs-12 col-md-7">
										<div class="form-group">
											<form:label path="name">Họ và tên</form:label>
											<form:input type="text" class="form-control bg-none"
												placeholder="Họ và tên..." path="name" id="name" required="required" />
											<span id="name_error" style="color: red;"></span>
										</div>
									</div>
								</div>
								
								<div class="row">
									<div class="col-xs-12 col-md-7">
										<div class="form-group">
											<form:label path="">Username</form:label>
											<form:input type="text" class="form-control bg-none"
												placeholder="Username..." path="username" id="username" required="required" />
											<span id="username_error" style="color: red;"></span>
										</div>
									</div>
								</div>

									<div class="row">
									<div class="col-xs-12 col-md-7">
										<div class="form-group">
											<form:label path="email">Email</form:label>
											<form:input type="email" class="form-control bg-none"
												placeholder="Email..." path="email" id="mail" required="required"/>
											<span id="mail_error" style="color: red;"></span>
										</div>
									</div>
								</div>

								<div class="row">
									<div class="col-xs-12 col-md-7">
										<div class="form-group">
											<form:label path="password">Password</form:label>
											<form:input type="password" class="form-control bg-none"
												placeholder="Mật khẩu..." path="password" required="required"/>
											<span id="password_error" style="color: red;"></span>
										</div>
									</div>
								</div>

								<div class="space-20"></div>
								<div class="row">
									<div class="col-xs-12 col-sm-6">
										<button id="register_form" type="submit" class="btn btn-default" disabled>
											Đăng ký<i class="fa fa-long-arrow-right"></i>
										</button>
									</div>
								</div>

							</form:form>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="space-100"></div>
		<!-- Header-jumbotron-end -->
	</header>

	<!-- Jquery JS-->
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
	<script src="vendor/counter-up/jquery.counterup.min.js">
		
	</script>
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
	<script src="<c:url value= "/assets/js/validate_register.js"/>"></script>
	<script type="text/javascript">
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
<!-- end document-->
