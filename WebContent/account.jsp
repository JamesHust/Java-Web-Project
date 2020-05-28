<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Tài khoản của tôi</title>
<link
	href="https://fonts.googleapis.com/css2?family=Quicksand:wght@300;400;500;600;700&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.css">
<link rel="stylesheet" href="css/all.css">
<script type="text/javascript" src="js/all.js"></script>
</head>
<body>
	<!-- code header -->

	<jsp:include page="header.jsp" />

	<!-- code section -->

	<div class="section" style="background-color: rgb(239, 239, 239);">
		<div class="user-detail">
			<div class="toolbar-user">
				<div class="user-top">
					<div class="icon-avatar">
						<img src="img/icon/social.png" alt="">
					</div>
					<div class="name-user">
						<h5>Tài khoản của</h5>
						<h3>Mai Thế Hưng</h3>
					</div>
				</div>
				<div class="menu">
					<div class="account" onclick="openMenu(event, 'account')"
						id="openMenuDefault">
						<span><i class="fas fa-user-edit"></i></span>Thông tin tài khoản
					</div>
					<div class="account" onclick="openMenu(event, 'favourite')">
						<span><i class="fas fa-heart"></i></span>Sản phẩm yêu thích
					</div>
					<div class="account" onclick="openMenu(event, 'history')">
						<span><i class="fas fa-clock"></i></span>Lịch sử đặt hàng
					</div>
				</div>
			</div>
			<div class="info-user">
				<div class="account-detail" style="display: none;" id="account">
					<h2>Thông tin tài khoản</h2>
					<div class="table-detail">
						<div class="col-left">
							<h4>Họ Tên :</h4>
							<h4>Số điện thoại :</h4>
							<h4>Ngày sinh :</h4>
							<h4>Giới tính :</h4>
							<h4>Địa chỉ :</h4>
							<h4>Email :</h4>
							<h4>Mật khẩu :</h4>
						</div>
						<div class="col-right">
							<form action="jameshop" method="post">
								<input type="hidden" name="command" value="UPDATEMYACCOUNT">
								<input type="hidden" name="userID"
									value="<%=session.getAttribute("idUser")%>"> <input
									type="hidden" name="idUser" value="${TEMP_USER.user_id}">
								<div class="name">
									<input type="text" name="nameUser"
										value="${TEMP_USER.user_name}" class="input">
								</div>
								<div class="phone">
									<input type="text" name="phoneUser"
										value="${TEMP_USER.user_phone}" class="input">
								</div>
								<div class="dob">
									<input type="text" name="dobUser" value="${TEMP_USER.user_dob}"
										class="input">
								</div>
								<div class="gender">
									<input type="text" name="genderUser"
										value="${TEMP_USER.user_gender}" class="input">
								</div>
								<div class="address">
									<input type="text" name="addressUser"
										value="${TEMP_USER.user_address}" class="input">
								</div>
								<div class="email">
									<input type="text" name="emailUser"
										value="${TEMP_USER.user_email}" class="input">
								</div>
								<div class="pass">
									<input type="password" name="passUser"
										value="${TEMP_USER.user_pass}" class="input">
								</div>
								<div class="button">
									<input type="submit" value="Cập nhật">
								</div>
							</form>
						</div>
					</div>
				</div>
				<div class="account-detail" style="display: none;" id="favourite">
					<h2>Sản phẩm yêu thích</h2>
					<div class="table-detail">
						<div class="table-flex">
							<div class="favour-prod">
								<div class="temp-product">
									<img src="img/nau_cg09113_giay_grande.jpg" alt="">
									<div class="name">Giày cao gót mũi nhọn gót thanh</div>
									<div class="price">435,000₫</div>
									<div class="detail">
										<span><i class="far fa-eye"></i></span> Chi tiết
									</div>
								</div>
							</div>
							<div class="favour-prod">
								<div class="temp-product">
									<img src="img/nau_cg09113_giay_grande.jpg" alt="">
									<div class="name">Giày cao gót mũi nhọn gót thanh</div>
									<div class="price">435,000₫</div>
									<div class="detail">
										<span><i class="far fa-eye"></i></span> Chi tiết
									</div>
								</div>
							</div>
							<div class="favour-prod">
								<div class="temp-product">
									<img src="img/nau_cg09113_giay_grande.jpg" alt="">
									<div class="name">Giày cao gót mũi nhọn gót thanh</div>
									<div class="price">435,000₫</div>
									<div class="detail">
										<span><i class="far fa-eye"></i></span> Chi tiết
									</div>
								</div>
							</div>
							<div class="favour-prod">
								<div class="temp-product">
									<img src="img/nau_cg09113_giay_grande.jpg" alt="">
									<div class="name">Giày cao gót mũi nhọn gót thanh</div>
									<div class="price">435,000₫</div>
									<div class="detail">
										<span><i class="far fa-eye"></i></span> Chi tiết
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="account-detail" id="history">
					<h2>Lịch sử đơn hàng</h2>
					<div class="temp-bill">
						<c:forEach var="listOfListBill" items="${LIST_OF_LIST_BILL}">
							<div class="table-detail" style="padding: 3vw 2vw 0.7vw 2vw;">
								<table>
									<tr>
										<th>Mã đơn hàng</th>
										<th>Mã sản phẩm</th>
										<th>Ảnh minh họa</th>
										<th>Tên sản phẩm</th>
										<th>Màu sắc</th>
										<th>Cỡ</th>
										<th>Giá tiền</th>
										<th>Trạng thái đơn hàng</th>
										<th>Sản phẩm</th>
									</tr>
									<c:forEach var="tempBill" items="${listOfListBill.listBill}">
										<tr>
											<td>${tempBill.bill_id}</td>
											<td>${tempBill.prod_id}</</td>
											<td><img src="${tempBill.prod_img1}"
												alt="${tempBill.prod_id}"></td>
											<td>${tempBill.prod_name}</td>
											<td>${tempBill.prod_color}</td>
											<td>${tempBill.prod_size}</td>
											<td>${tempBill.prod_price}₫</td>
											<td>${tempBill.bill_status}</td>
											<td>Chi tiết</td>
											<c:set var="totalBill" value="${tempBill.bill_total}"
												scope="session" />
										</tr>
									</c:forEach>
									<tr>
										<th colspan="5">Tổng tiền hóa đơn :</th>
										<th colspan="4">${totalBill}₫</th>
									</tr>
								</table>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- code footer -->

	<jsp:include page="footer.jsp" />

	<script>
		document.getElementById("openMenuDefault").click();
	</script>

</body>
</html>