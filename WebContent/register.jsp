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

<title>Register</title>

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
	background-image: linear-gradient(to right, #f78ca0 0%, #f9748f 19%, #fd868c 60%, #fe9a8b
		100%);
}
</style>

</head>

<body>
	<div class="background">
		<div class="card-body">
			<div class="card-img">
				<img class="mySlides" src="img/slide/register/slide-register1.jpg"
					style="width: 100%"> <img class="mySlides"
					src="img/slide/register/slide-register2.jpg" style="width: 100%">
				<img class="mySlides" src="img/slide/register/slide-register3.jpg"
					style="width: 100%">
			</div>
			<div class="card-form">
				<form class="user" action="jameshop" method="post">
					<div class="card-name">Tạo tài khoản mới!</div>
					<input type="hidden" name="command" value="CREATEUSER" />
					<div class="form-flex">
						<div class="flex-item">
							<input type="text" placeholder="Họ Tên" name="nameUser" />
						</div>
						<div class="flex-item">
							<input type="text" placeholder="Ngày sinh (dd/mm/yyyy)"
								name="dobUser" />
						</div>
					</div>
					<div class="form-flex">
						<div class="flex-item">
							<input type="text" placeholder="Số điện thoại" name="phoneUser" />
						</div>
						<div class="flex-item">
							<input type="text" placeholder="Giới tính (Nam/Nữ)"
								name="genderUser" />
						</div>
					</div>
					<div class="form-all">
						<input type="text" placeholder="Địa chỉ" name="addressUser" />
					</div>
					<div class="form-flex">
						<div class="flex-item">
							<input type="email" placeholder="Email" name="emailUser" />
						</div>
						<div class="flex-item">
							<input type="password" placeholder="Mật khẩu" name="passUser" />
						</div>
					</div>
					<div class="form-submit-register">
						<input type="submit" value="Đăng ký tài khoản" />
					</div>
					<hr>
					<div class="back-return">
						<a href="login.jsp">Bạn đã có tài khoản mới? Đăng nhập!</a>
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