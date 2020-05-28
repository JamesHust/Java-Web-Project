<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>header</title>
<link
	href="https://fonts.googleapis.com/css2?family=Quicksand:wght@300;400;500;600;700&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.css">
<link rel="stylesheet" href="css/all.css">

<%
	String display = "block";
String displayUser = "none";
if (session.getAttribute("idUser") != null) {
	display = "none";
	displayUser = "block";
}
%>
</head>
<body>
	<div class="header">
		<div class="header-detail">
			<c:url var="tempLinkIndex" value="jameshop">
				<c:param name="command" value="LOADPRODUCTBYCATE"></c:param>
			</c:url>
			<div class="header-logo">
				<a href="${tempLinkIndex}"><img src="logo/logo3.png" alt="logo"></a>
			</div>
			<div class="header-list">
				<div class="item">
					<div class="layer">
						<a href="${tempLinkIndex}">Trang chủ</a>
					</div>
				</div>
				<div class="item">
					<div class="layer">
						<c:url var="tempLinkViewByItem" value="jameshop">
							<c:param name="command" value="VIEWBYITEM"></c:param>
							<c:param name="itemId" value="IT1"></c:param>
							<c:param name="itemName" value="Giày"></c:param>
						</c:url>
						<a href="${tempLinkViewByItem}">Giày</a>
					</div>
					<div class="item-detail">
						<ul>
							<c:forEach var="categoryShoe" items="${CATEGORY_SHOE}">
								<c:url var="tempLinkViewByCate" value="jameshop">
									<c:param name="command" value="VIEWBYCATE"></c:param>
									<c:param name="cateName" value="${categoryShoe.cate_name}"></c:param>
									<c:param name="cateID" value="${categoryShoe.cate_id}"></c:param>
								</c:url>
								<li><a href="${tempLinkViewByCate}">
										${categoryShoe.cate_name}</a></li>
							</c:forEach>
						</ul>
					</div>
				</div>
				<div class="item">
					<div class="layer">
						<c:url var="tempLinkViewByItem" value="jameshop">
							<c:param name="command" value="VIEWBYITEM"></c:param>
							<c:param name="itemId" value="IT2"></c:param>
							<c:param name="itemName" value="Túi"></c:param>
						</c:url>
						<a href="${tempLinkViewByItem}">Túi</a>
					</div>
					<div class="item-detail">
						<ul>
							<c:forEach var="categoryBag" items="${CATEGORY_BAG}">
								<c:url var="tempLinkViewByCate" value="jameshop">
									<c:param name="command" value="VIEWBYCATE"></c:param>
									<c:param name="cateName" value="${categoryBag.cate_name}"></c:param>
									<c:param name="cateID" value="${categoryBag.cate_id}"></c:param>
								</c:url>
								<li><a href="${tempLinkViewByCate}">
										${categoryBag.cate_name}</a></li>
							</c:forEach>
						</ul>
					</div>
				</div>
				<div class="item">
					<div class="layer">
						<c:url var="tempLinkViewByItem" value="jameshop">
							<c:param name="command" value="VIEWBYITEM"></c:param>
							<c:param name="itemId" value="IT3"></c:param>
							<c:param name="itemName" value="Phụ kiện"></c:param>
						</c:url>
						<a href="${tempLinkViewByItem}">Phụ kiện</a>
					</div>
					<div class="item-detail">
						<ul>
							<c:forEach var="categoryJewelry" items="${CATEGORY_JEWELRY}">
								<c:url var="tempLinkViewByCate" value="jameshop">
									<c:param name="command" value="VIEWBYCATE"></c:param>
									<c:param name="cateName" value="${categoryJewelry.cate_name}"></c:param>
									<c:param name="cateID" value="${categoryJewelry.cate_id}"></c:param>
								</c:url>
								<li><a href="${tempLinkViewByCate}">
										${categoryJewelry.cate_name}</a></li>
							</c:forEach>
						</ul>
					</div>
				</div>
				<div class="item">
					<div class="layer">
						<c:url var="tempLinkCollection" value="jameshop">
							<c:param name="command" value="VIEWCOLLECTION"></c:param>
						</c:url>
						<a href="${tempLinkCollection}">Bộ sưu tập</a>
					</div>
				</div>
				<div class="item">
					<div class="layer">
						<c:url var="tempLinkMembership" value="jameshop">
							<c:param name="command" value="VIEWMEMBERSHIP"></c:param>
						</c:url>
						<a href="${tempLinkMembership}">Membership</a>
					</div>
				</div>
			</div>
			<div class="header-search">
				<form action="jameshop" method="get">
					<input type="hidden" name="command" value="SEARCHPRODUCT">
					<div class="search-box">
						<div class="text-search">
							<input type="text" name="inputSearch"
								placeholder="Tìm kiếm theo tên sản phẩm...">
						</div>
						<button type="submit">
							<i class="fas fa-search"></i>
						</button>
					</div>
				</form>
			</div>
			<div class="header-icon">
				<div class="profile-icon">
					<div class="user-icon">
						<i class="fas fa-user"></i>
					</div>
					<div class="profile-list">
						<c:url var="tempLink" value="jameshop">
							<c:param name="command" value="LOGOUTUSER" />
						</c:url>
						<ul style="display:<%=display%>;">
							<li><a href="login.jsp">Đăng nhập</a></li>
							<li><a href="register.jsp">Đăng ký</a></li>
						</ul>
						<ul style="display:<%=displayUser%>;">
							<c:set var="userId" value='<%=session.getAttribute("idUser")%>'></c:set>
							<c:url var="tempLinkMyAccount" value="jameshop">
								<c:param name="command" value="VIEWMYACCOUNT"></c:param>
								<c:param name="userID" value="${userId}"></c:param>
							</c:url>
							<li><a href="${tempLinkMyAccount}">Tài khoản</a></li>
							<li><a href="${tempLink}">Đăng xuất</a></li>
						</ul>
					</div>
				</div>
				<div class="map-icon">
					<i class="fas fa-map-marker-alt"></i>
				</div>
				<div class="cart-icon" style="display:<%=displayUser%>;">
					<c:set var="userId" value='<%=session.getAttribute("idUser")%>'></c:set>
					<c:url var="tempLinkMyCart" value="jameshop">
						<c:param name="command" value="VIEWMYCART"></c:param>
						<c:param name="userID" value="${userId}"></c:param>
					</c:url>
					<a href="${tempLinkMyCart}"><i class="fas fa-shopping-cart"></i></a>
				</div>
			</div>
		</div>
	</div>

</body>
</html>