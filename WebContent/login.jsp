<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Login</title>

<link
	href="https://fonts.googleapis.com/css2?family=Quicksand:wght@300;400;500;600;700&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.css">
<link rel="stylesheet" href="css/all.css">
<script type="text/javascript" src="js/all.js"></script>
<style>
body {
	height: 88vh;
	background-image: linear-gradient(120deg, #a1c4fd 0%, #c2e9fb 100%);
}
</style>

<%
	String display = "none";
if (session.getAttribute("checkFail") != null) {
	display = "block";
	session.removeAttribute("checkFail");
	System.out.println("Error text run...");
}
%>
</head>

<body>
	<div class="background">
		<div class="card-body" style="width: 80% !important;">
			<div class="card-img" style="width: 55vw !important;">
				<img class="mySlides" src="img/slide/login/rsz_1slide-login1.jpg"
					style="width: 100%"> <img class="mySlides"
					src="img/slide/login/rsz_slide-login2.jpg" style="width: 100%">
				<img class="mySlides" src="img/slide/login/rsz_slide-login3.jpg"
					style="width: 100%">
			</div>
			<div class="card-form" style="width: 30% !important;">
				<form class="user-login" action="jameshop" method="post">
					<div class="card-name">Welcome Back!</div>
					<input type="hidden" name="command" value="CHECKLOGINUSER" />
					<div class="text-error" style="display:<%=display%>;">Tài
						khoản bạn đã nhập không chính xác!</div>
					<div class="form-all">
						<input type="email" placeholder="Nhập email của bạn..."
							name="emailUser" style="width: 100%;" />
					</div>
					<div class="form-all">
						<input type="password" placeholder="Mật khẩu" name="passUser"
							style="width: 100%;" />
					</div>
					<div class="form-submit">
						<input type="submit" value="Đăng nhập" name="registerUser" />
					</div>
					<hr>
					<div class="back-return">
						<a href="login.html">Bạn chưa có tài khoản mới?</a> <br /> <a
							href="login.html" style="color: red;">Tạo tài khoản mới!</a>
					</div>
				</form>
			</div>
		</div>
	</div>
	<script>
		var myIndex = 0;
		carousel();
	</script>
</body>

</html>