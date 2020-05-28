<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Admin</title>
<link rel="stylesheet" href="css/admin.css">
<link
	href="https://fonts.googleapis.com/css2?family=Nunito:ital,wght@0,200;0,300;0,400;0,600;0,700;0,800;0,900;1,200;1,300;1,400;1,600;1,700;1,800;1,900&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.css">
<script type="text/javascript" src="../js/admin.js"></script>
<%
	String display = "none";
if (session.getAttribute("checkFail") != null) {
	display = "block";
	session.removeAttribute("checkFail");
}
%>
</head>

<body>
	<div class="background">
		<div class="card-login">
			<div class="flex-l">
				<div class="detail-l">
					<div class="content-l">
						<h3>Login</h3>
						<div class="form-login">
							<form action="admin" method="post">
							<input type="hidden" name="command" value="CHECKLOGIN" />
								<div class="text-error" style="display:<%=display%>;">Tài
									khoản bạn đã nhập không chính xác!</div>
								<div class="row">
									<div class="icon">
										<i class="fas fa-user-tie"></i>
									</div>
									<div class="input">
										<input type="text" name="emailAdmin"
											placeholder="Nhập email của bạn...">
									</div>
								</div>
								<div class="row">
									<div class="icon">
										<i class="fas fa-key"></i>
									</div>
									<div class="input">
										<input type="password" name="passAdmin" placeholder="Mật khẩu">
									</div>
								</div>
								<div class="button-send">
									<input type="submit" value="Đăng nhập">
								</div>
							</form>
						</div>
						<div class="info-login">
							<h6>Bạn chưa có tài khoản ?</h6>
							<h6>
								Liên hệ ngay chủ cửa hàng<span>0189645327</span>
							</h6>
						</div>
					</div>
				</div>
			</div>
			<div class="flex-r">
				<img src="img/admin/imglogin.png" alt="">
			</div>
		</div>
	</div>
</body>