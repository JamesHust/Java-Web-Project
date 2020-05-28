<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Error 404</title>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.css">
<link rel="stylesheet" href="css/all.css">
<link href="css/lib.login.css" rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">
<link href="css/lib.login.2.css" rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Quicksand:wght@300;400;500;600;700&display=swap"
	rel="stylesheet">

</head>

<body >
	<!-- code header -->

	<jsp:include page="header.jsp" />

	<!-- code section -->

	<div class="section">
		<div class="container-fluid" style="margin-top: 60px;">

			<!-- 404 Error Text -->
			<div class="text-center">
				<div class="error mx-auto" data-text="404">404</div>
				<p class="lead text-gray-800 mb-5">Không tìm thấy trang</p>
				<p class="text-gray-500 mb-0">Thông tin bạn tìm kiếm không có
					trên Website</p>
				<a href="index.html" style="text-decoration: none;">&larr; Quay
					về Trang chủ</a>
			</div>

		</div>
	</div>

</body>

</html>