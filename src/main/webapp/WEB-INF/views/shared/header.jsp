<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<nav class="navbar">
	<div class="container">
		<!--Toggle-button-->
		<!--Active Reader-->
		<c:if test="${sessionScope.LoginReader != null}">
			<!--Mainmenu list-->
			<div class="navbar-right in fade" id="mainmenu">
				<ul class="nav navbar-nav nav-white text-uppercase"
					style="display: flex; align-items: center;">
					<li class="active"><a href="<c:url value="/trang-chu" />">Trang
							chủ</a></li>
					<li><a href="#gioithieu">Giới thiệu</a></li>
					<li><a href="<c:url value="/notification/page" />">Thông
							báo</a></li>
					<li><a href="<c:url value="/sach" />">Sách</a></li>

					<li><a>${sessionScope.LoginReader.name}</a></li>
					<li><a href="#" class="dropdown-toggle" data-toggle="dropdown">
							<img src="<c:url value="/assets/images/active_user.png" />"
							class="img-circle img-thumbnail" alt="User Img">
					</a>
						<ul class="dropdown-menu" style="color: black">
							<li><a href="<c:url value="/userInfo"/>"
								style="color: black"> <span style="color: black"><i
										class="icofont icofont-user"></i></span> Thông tin cá nhân
							</a></li>
							<li><a href="<c:url value="/userbook"/>"
								style="color: black"> <span style="color: black"><i
										class="icofont icofont-read-book"></i></span> Sách của tôi
							</a></li>
							<li><a href="<c:url value="/UserChangePassword"/>"
								style="color: black"> <span style="color: black"><i
										class="icofont icofont-ui-password"></i></span> Đổi mật khẩu
							</a></li>
							<li>

								<button type="button" class="btn btn-warning"
									style="margin-left: 20px; padding: 10px;" data-toggle="modal"
									data-target="#staticBackdrop" onclick="updateFormAction()">
									<span style="color: black"><i
										class="icofont icofont-logout"></i></span> Đăng xuất
								</button>
							</li>
						</ul></li>
				</ul>
			</div>
		</c:if>

		<!--ACTIVE ADMIN-->
		<c:if test="${sessionScope.loginAdmin != null}">
			<!--Mainmenu list-->
			<div class="navbar-right in fade" id="mainmenu">
				<ul class="nav navbar-nav nav-white text-uppercase">
					<li class="active"><a href="<c:url value="/trang-chu" />">Trang
							chủ</a></li>
					<li><a href="#gioithieu">Giới thiệu</a></li>
					<li><a href="<c:url value="/notification/page" />">Thông
							báo</a></li>
					<li><a href="<c:url value="/sach" />">Sách</a></li>
					<li><a href="<c:url value="/QuanLyThuVien"/>">Quản Lý Thư
							Viện</a></li>
					<li><a>${sessionScope.loginAdmin.name}</a></li>
					<li><a href="#" class="dropdown-toggle" data-toggle="dropdown">
							<img src="<c:url value="/assets/images/active_user.png" />"
							class="img-circle img-thumbnail" alt="User Img">
					</a>
						<ul class="dropdown-menu">
							<li><a href="<c:url value="/userInfo"/>"
								style="color: black"> <span style="color: black"><i
										class="icofont icofont-user" style="color: black"></i></span> Thông
									tin cá nhân
							</a></li>
							<li><a href="<c:url value="/UserChangePassword"/>"
								style="color: black"> <span style="color: black"><i
										class="icofont icofont-ui-password" style="color: black"></i></span>
									Đổi mật khẩu
							</a></li>
							<li>

								<button type="button" class="btn btn-warning"
									style="margin-left: 20px; padding: 10px;" data-toggle="modal"
									data-target="#staticBackdrop" onclick="updateFormAction()">
									<span style="color: black"><i
										class="icofont icofont-logout"></i></span> Đăng xuất

								</button>

							</li>
						</ul></li>
				</ul>
			</div>
		</c:if>


		<!--Mainmenu list-->
		<c:if
			test="${sessionScope.LoginReader == null && sessionScope.loginAdmin == null}">
			<div class="navbar-right in fade" id="mainmenu">
				<ul class="nav navbar-nav nav-white text-uppercase">
					<li class="active"><a href="<c:url value="/trang-chu" />">Trang
							chủ</a></li>
					<li><a href="#gioithieu">Giới thiệu</a></li>
					<li><a href="<c:url value="/notification/page" />">Thông
							báo</a></li>
					<li><a href="<c:url value="/sach" />">Sách</a></li>
					<li><a href="<c:url value="/dang-nhap"/>">Đăng nhập</a>
					<li><a href="<c:url value="/dang-ky"/>">Đăng ký</a>
				</ul>
			</div>
		</c:if>
	</div>
</nav>

<script type="text/javascript">
	var message = "${message}";
	if (message && message.trim().length > 0) {
		// Display an alert with the message content
		alert(message);
	}

	function updateFormAction() {
		var form = document.getElementById('deleteForm');
		form.action = '${pageContext.request.contextPath}/DangXuat' + id;
	}
</script>