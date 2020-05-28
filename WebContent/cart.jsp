<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>My Cart</title>
<link
	href="https://fonts.googleapis.com/css2?family=Quicksand:wght@300;400;500;600;700&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.css">
<link rel="stylesheet" href="css/all.css">


<%
	String display = "none";
String displayEmpty = "block";
if (request.getAttribute("CART_EMPTY") == "false") {
	display = "block";
	displayEmpty = "none";
}
%>
</head>

<body>

	<!-- code header -->

	<jsp:include page="header.jsp" />

	<!-- code section -->

	<div class="section"
		style="display: <%=displayEmpty%>; margin-top: 5vw; font-family: 'Nunito', sans-serif;">
		<div class="cart-empty">
			<div class="img-cart">
				<img src="img/icon/shopping.png" alt="">
			</div>
			<div class="text-empty">Giỏ hàng trống !</div>
		</div>
		<div class="back-home">
			<c:url var="tempLinkIndex" value="jameshop">
				<c:param name="command" value="LOADPRODUCTBYCATE"></c:param>
			</c:url>
			<div class="icon-back">
				<a href="${tempLinkIndex}"><i class="fas fa-reply"></i></a>
			</div>
			<div class="text-back">
				<a href="${tempLinkIndex}">Tiếp tục mua sắm</a>
			</div>
		</div>
	</div>

	<div class="section" style="display: <%=display%>">
		<div class="layer-name">
			<span><i class="fas fa-shopping-bag"></i></span>Giỏ hàng
		</div>
		<form id="updateform" action="jameshop" method="post">
			<input type="hidden" value="<%=session.getAttribute("idUser")%>"
				name="userID">
			<div class="table-cart">
				<table>
					<tr>
						<th class="img">HÌNH ẢNH</th>
						<th class="name-product">SẢN PHẨM</th>
						<th class="id">MÃ</th>
						<th class="status">TRẠNG THÁI</th>
						<th class="color">MÀU SẮC</th>
						<th class="size">KÍCH THƯỚC</th>
						<th class="amount">SỐ LƯỢNG</th>
						<th class="price">GIÁ TIỀN</th>
						<th class="delete"></th>
					</tr>
					<c:set var="total" value="${0}" scope="session" />
					<c:set var="count" value="${0}" scope="session" />
					<c:forEach var="tempCart" items="${TEMP_CART}">
						<input type="hidden" name="productID" value="${tempCart.prod_id}">
						<input type="hidden" name="prodSize-${tempCart.cart_id}"
							value="${tempCart.prod_size}">
						<input type="hidden" name="prodId-${tempCart.cart_id}"
							value="${tempCart.prod_id}">
						<input type="hidden" name="billStatus-${tempCart.cart_id}"
							value="Đang xử lý">
						<input type="hidden" name="ID" value="${tempCart.cart_id}">
						<tr>
							<c:set var="priceProd"
								value="${fn:replace(tempCart.prod_price, ',', '')}" />
							<td class="img"><img src="${tempCart.prod_img1}" alt="img1"></td>
							<td class="name-product">${tempCart.prod_name}</td>
							<td class="id">${tempCart.prod_id}</td>
							<td class="status">${tempCart.prod_condition}</td>
							<td class="color">${tempCart.prod_color}</td>
							<td class="size">${tempCart.prod_size}</td>
							<td class="amount"><input type="number"
								name="prodAmount-${tempCart.cart_id}" min="1"
								value="${tempCart.prod_total}"></td>
							<td class="price">${tempCart.prod_price}₫</td>
							<c:url var="tempLinkDelete" value="jameshop">
								<c:param name="command" value="DELETECART"></c:param>
								<c:param name="cartID" value="${tempCart.cart_id}"></c:param>
								<c:param name="userID" value="${tempCart.user_id}"></c:param>
							</c:url>
							<td class="delete"><a href="${tempLinkDelete}"
								onclick="if(!(confirm('Bạn có chắc chắn muốn xóa sản phẩm khỏi giỏ hàng?'))) return false">Xóa</a></td>
							<c:set var="total"
								value="${total + priceProd*tempCart.prod_total}" scope="session" />
						</tr>
					</c:forEach>
				</table>
			</div>
			<div class="cart-total">
				Tổng tiền tạm tính: <span><fmt:formatNumber type="number"
						maxFractionDigits="3" value="${total}" />₫</span>
			</div>
			<input type="hidden" name="billTotal" value="${total}" />
			<div class="underline-total"></div>
			<div class="button-cart">
				<input type="hidden" id="command" name="command" value="ORDERCART">
				<div class="button-update">
					<input type="button" value="Cập nhật Giỏ hàng" id="buttonUpdate">
				</div>
				<div class="button-buy">
					<input type="button" value="Tiến hành đặt hàng" id="buttonBuy">
				</div>
			</div>
		</form>
	</div>

	<!-- code footer -->

	<jsp:include page="footer.jsp" />
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script type="text/javascript" src="js/order.js"></script>
</body>

</html>