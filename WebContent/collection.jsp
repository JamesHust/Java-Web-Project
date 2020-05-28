<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Bộ Sưu Tập</title>
<link
	href="https://fonts.googleapis.com/css2?family=Quicksand:wght@300;400;500;600;700&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.css">
<link rel="stylesheet" href="css/all.css">
</head>
<body>
	<!-- code header -->

	<jsp:include page="header.jsp" />

	<!-- code section -->

	<div class="section">
		<div class="collection-banner">
			<img src="img/banner/sub-banner/collection2/banner.jpg" alt="">
		</div>
		<div class="collection-flex">
			<div class="col">
				<img src="img/banner/sub-banner/collection2/sub-banner1.1.jpg"
					alt="">
			</div>
			<div class="col">
				<img src="img/banner/sub-banner/collection2/sub-banner1.2.jpg"
					alt="">
			</div>
		</div>
		<div class="collection-flex">
			<div class="col">
				<img src="img/banner//sub-banner/collection2/sub-banner2.1.jpg"
					alt="">
			</div>
			<div class="col">
				<img src="img/banner//sub-banner/collection2/sub-banner2.2.jpg"
					alt="">
			</div>
		</div>
		<div class="collection-flex">
			<div class="col">
				<img src="img/banner/sub-banner/collection2/sub-banner3.1.jpg"
					alt="">
			</div>
			<div class="col">
				<img src="img/banner/sub-banner/collection2/sub-banner3.2.jpg"
					alt="">
			</div>
		</div>
		<div class="title-product-demo">
			<span>TẤT CẢ SẢN PHẨM TRONG BỘ</span>
		</div>
		<div class="content-detail">
			<div class="list-product">
				<div class="detail-product">
					<div class="img-product">
						<img src="img/banner/sub-banner/collection2/giay-den.jpg"
							alt="product1">
					</div>
					<div class="name-product">Juno active started 4 - Đen</div>
					<div class="price-product">695,000₫</div>
					<div class="show-product">
						<div class="show-item">
							<div class="icon-show">
								<i class="fas fa-shopping-bag"></i>
							</div>
							<a href="">Thêm vào giỏ</a>
						</div>
						<div class="show-item">
							<div class="icon-show">
								<i class="far fa-eye"></i>
							</div>
							<a href="${tempLinkProduct}">Xem chi tiết</a>
						</div>
					</div>
				</div>
				<div class="detail-product">
					<div class="img-product">
						<img src="img/banner/sub-banner/collection2/giay-trang.jpg"
							alt="product1">
					</div>
					<div class="name-product">Juno active started 4 - Trắng</div>
					<div class="price-product">695,000₫</div>
					<div class="show-product">
						<div class="show-item">
							<div class="icon-show">
								<i class="fas fa-shopping-bag"></i>
							</div>
							<a href="">Thêm vào giỏ</a>
						</div>
						<div class="show-item">
							<div class="icon-show">
								<i class="far fa-eye"></i>
							</div>
							<a href="${tempLinkProduct}">Xem chi tiết</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- code footer -->

	<jsp:include page="footer.jsp" />

</body>
</html>