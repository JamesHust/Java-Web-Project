<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>footer</title>
<link
	href="https://fonts.googleapis.com/css2?family=Quicksand:wght@300;400;500;600;700&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.css">
<link rel="stylesheet" href="css/all.css">
</head>
<body>
	<div class="footer">
		<div class="shop-service">
			<div class="service-item">
				<div class="icon-service">
					<img src="img/money.png" alt="service1">
				</div>
				<div class="info-detail">
					<c:url var="tempLinkMembership" value="jameshop">
						<c:param name="command" value="VIEWMEMBERSHIP"></c:param>
					</c:url>

					<div class="service-name">
						<a href="${tempLinkMembership}">QUY ĐỊNH ĐỔI TRẢ</a>
					</div>
					<div class="service-detail">
						<a href="${tempLinkMembership}">JAME'S sẵn sàng hỗ trợ đổi sản
							phẩm cho bạn trong vòng 15 ngày trên toàn hệ thống.</a>
					</div>
				</div>
			</div>
			<div class="service-item">
				<div class="icon-service">
					<img src="img/recruitment.png" alt="">
				</div>
				<div class="info-detail">
					<div class="service-name">
						<a href="">TUYỂN DỤNG TẠI JAME'S</a>
					</div>
					<div class="service-detail">
						<a href="">JAME'S đang cần tuyển hơn 40 vị trí nhân viên bán
							hàng tại Hà Nội, Hải Phòng, Vĩnh Yên, Nghệ An, Thái Nguyên; TX.
							Sơn Tây, Hưng Yên (Sắp khai trương)</a>
					</div>
				</div>
			</div>
			<div class="service-item">

				<div class="icon-service">
					<img src="img/technical-support.png" alt="">
				</div>
				<div class="info-detail">
					<div class="service-name">
						<a href="${tempLinkMembership}">KHÁCH HÀNG THÂN THIẾT</a>
					</div>
					<div class="service-detail">
						<a href="${tempLinkMembership}">Chính sách khách hàng thân
							thiết của JAME'S: khi mua đơn hàng trị giá 5.000.000Đ, quý khách
							sẽ được cấp ngay thẻ VIP có ưu đãi 10% và 20% khi sinh nhật.</a>
					</div>
				</div>
			</div>
		</div>
		<div class="footer-info-show">
			<div class="footer-img">
				<div class="detail-img">
					<div class="img-empty"></div>
					<div class="col">
						<div class="name-col1">
							<div class="icon-home"></div>
							<div class="home">
								<c:url var="tempLinkIndex" value="jameshop">
									<c:param name="command" value="LOADPRODUCTBYCATE"></c:param>
								</c:url>
								<i class="fas fa-home"></i> <a href="${tempLinkIndex}">TRANG
									CHỦ</a>
							</div>
						</div>
						<br />
						<ul>
							<c:url var="tempLinkViewByItem" value="jameshop">
								<c:param name="command" value="VIEWBYITEM"></c:param>
								<c:param name="itemId" value="IT1"></c:param>
								<c:param name="itemName" value="Giày"></c:param>
							</c:url>
							<li><a href="${tempLinkViewByItem}">GIÀY</a></li>
							<c:url var="tempLinkViewByItem" value="jameshop">
								<c:param name="command" value="VIEWBYITEM"></c:param>
								<c:param name="itemId" value="IT2"></c:param>
								<c:param name="itemName" value="Túi"></c:param>
							</c:url>
							<li><a href="${tempLinkViewByItem}">TÚI</a></li>
							<c:url var="tempLinkViewByItem" value="jameshop">
								<c:param name="command" value="VIEWBYITEM"></c:param>
								<c:param name="itemId" value="IT3"></c:param>
								<c:param name="itemName" value="Phụ kiện"></c:param>
							</c:url>
							<li><a href="${tempLinkViewByItem}">PHỤ KIỆN</a></li>
							<c:url var="tempLinkCollection" value="jameshop">
								<c:param name="command" value="VIEWCOLLECTION"></c:param>
							</c:url>
							<li><a href="${tempLinkCollection}">BỘ SƯU TẦM</a></li>
							<c:url var="tempLinkMembership" value="jameshop">
								<c:param name="command" value="VIEWMEMBERSHIP"></c:param>
							</c:url>
							<li><a href="${tempLinkMembership}">MEMBERSHIP</a></li>
						</ul>
					</div>
					<div class="col">
						<div class="name-col2-row">
							<h4>GỌI MUA HÀNG ( 08:00 - 21:00 )</h4>
							<h2 class="icon-phone">
								<i class="fas fa-phone-alt"></i>0966 073 028
							</h2>
							<h5>Tất cả các ngày trong tuần</h5>
						</div>
						<br />
						<div class="name-col2-row">
							<h4>GÓP Ý, KHIẾU NẠI ( 08:30 - 20:30 )</h4>
							<h2 class="icon-phone">
								<i class="fas fa-phone-alt"></i>1800 1160
							</h2>
							<h5>Các ngày trong tuần ( trừ ngày lễ )</h5>
						</div>
					</div>
					<div class="col">
						<div class="name-col3-row">
							<h4>ĐĂNG KÝ NHẬN TIN</h4>
							<div class="button-send">
								<input type="text" class="text"
									placeholder="Nhập email của bạn..."> <input
									type="submit" class="submit">
							</div>
						</div>
						<br />
						<div class="name-col3-row">
							<h4>KẾT NỐI</h4>
							<div class="brand-icon-page">
								<a href="https://www.linkedin.com/in/james-hust-2b8915192/"><img
									src="img/linkedin.png" alt="brand1"></a> <a
									href="https://myaccount.google.com/u/1/profile?pageId=none"><img
									src="img/google-plus.png" alt="brand2"></a> <a
									href="https://www.facebook.com/osphiuchus99"><img
									src="img/facebook.png" alt="brand3"></a> <a
									href="https://www.instagram.com/ophiuchus99/?hl=vi"><img
									src="img/instagram.png" alt="brand4"></a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>