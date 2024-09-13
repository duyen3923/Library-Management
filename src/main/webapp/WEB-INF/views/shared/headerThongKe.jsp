<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<nav class="navbar">
	<div class="container">
		<!--Toggle-button-->
		<!--Active Reader-->

		<!--ACTIVE ADMIN-->
		<c:if test="${sessionScope.loginAdmin != null}">
			<!--Mainmenu list-->
			<div class="navbar-right in fade" id="mainmenu"
				style="margin-right: auto; margin-left: auto;">
				<ul class="nav navbar-nav nav-white text-uppercase flex-row justify-content-between">
					<li class="active"><a href="<c:url value="trang-chu" />">Trang
							chủ</a></li>
					
					<li><a href="<c:url value="/notification/page" />">Thông báo</a></li>
					<li><a href="<c:url value="/sach" />">Sách</a></li>
					<li><a href="<c:url value="QuanLyThuVien"/>">Quản Lý Thư
							Viện</a></li>
					<li><a>${sessionScope.loginAdmin.name}</a></li>
					<li><a href="#" class="dropdown-toggle" data-toggle="dropdown" id="dropdownMenuButton"  >
							<img src="<c:url value="/assets/images/active_user.png" />"
							class="img-circle img-thumbnail" alt="User Img">
					</a>
						<ul class="dropdown-menu" aria-labelledby="dropdownMenuButton" style="position: absolute;">
							<li class="dropdown-item"><a href="<c:url value="userInfo"/>" style="color: black">
									<span style="color: black"><i
										class="icofont icofont-user" style="color: black"></i></span> Thông
									tin cá nhân
							</a></li>
							<li class="dropdown-item"><a href="<c:url value="UserChangePassword"/>"
								style="color: black"> <span style="color: black"><i
										class="icofont icofont-ui-password" style="color: black"></i></span>
									Đổi mật khẩu
							</a></li>
							<li class="dropdown-item">

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