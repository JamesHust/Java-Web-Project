<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Home</title>
<link
	href="https://fonts.googleapis.com/css2?family=Quicksand:wght@300;400;500;600;700&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="js/all.js"></script>
<script type="text/javascript" src="js/check-heart.js"></script>
<link rel="stylesheet" href="css/all.css">

<%
	String display = "none";
if (session.getAttribute("idUser") != null) {
	display = "block";
}
%>
</head>

<body>
	<!-- code header -->

	<jsp:include page="header.jsp" />

	<!-- code section -->

	<div class="section">
		<div class="banner">
			<img src="img/banner.jpg" alt="banner">
		</div>
		<div class="sub-banner">
			<div class="layer-banner">
				<img src="img/sub_banner1.jpg" alt="">
				<div class="intro-banner">Dép quai ngang mũi vuông</div>
				<div class="detail-button">Xem chi tiết</div>
			</div>
			<div class="layer-banner">
				<img src="img/sub_banner2.jpg" alt="">
				<div class="intro-banner">Balo nắp gập teenage-like</div>
				<div class="detail-button">Xem chi tiết</div>
			</div>
			<div class="layer-banner">
				<img src="img/sub_banner3.jpg" alt="">
				<div class="intro-banner">Giày xăng đan quai ngang đế thể thao
				</div>
				<div class="detail-button">Xem chi tiết</div>
			</div>
		</div>
		<div class="content-detail">
			<div class="content-layer-top">
				<div class="content-title">Giày</div>
				<div class="list-title">
					<ul>
						<c:set var="count" value="${1}" scope="session" />
						<c:set var="first" value="true" scope="session" />
						<c:forEach var="categoryShoe" items="${CATEGORY_SHOE}">
							<c:choose>
								<c:when test="${first == true}">
									<li class="tablinks1" id="defaultOne"
										onclick="openTab1(event, '${categoryShoe.cate_id}')">${categoryShoe.cate_name}</li>
									<c:set var="first" value="false" scope="session" />
									<c:set var="count" value="${count + 1}" scope="session" />
								</c:when>
								<c:otherwise>
									<li class="tablinks1"
										onclick="openTab1(event, '${categoryShoe.cate_id}')">${categoryShoe.cate_name}</li>
									<c:set var="count" value="${count + 1}" scope="session" />
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</ul>
				</div>
			</div>
			<c:set var="count" value="${1}" scope="session" />
			<c:forEach var="listOfListProduct" items="${PRODUCTS_BY_CATE}">
				<c:choose>
					<c:when test="${count <= 6}">
						<div class="tabcontent1" id="${listOfListProduct.cate_id}">
							<div class="list-product">
								<c:forEach var="tempProduct"
									items="${listOfListProduct.productList}">

									<c:url var="tempLinkProduct" value="jameshop">
										<c:param name="command" value="LOADDETAILPRODUCT"></c:param>
										<c:param name="productId" value="${tempProduct.prod_id}"></c:param>
										<c:param name="cateId" value="${tempProduct.cate_id}"></c:param>
									</c:url>

									<div class="detail-product">
										<div class="img-product">
											<img src="${tempProduct.prod_img1}"
												alt="${tempProduct.prod_id}">
										</div>
										<div class="name-product">${tempProduct.prod_name}</div>
										<div class="price-product">${tempProduct.prod_price}₫</div>
										<div class="show-product">
											<div class="flex-container" style="display:<%=display%>">
												<div class="heart-item" id="precheck-${tempProduct.prod_id}"
													data-command="ADDWISHLIST"
													data-idproduct="${tempProduct.prod_id}">
													<input type="hidden"
														value="<%=session.getAttribute("idUser")%>"
														id="inputIdUser">
													<div class="icon-show">
														<i class="fas fa-heart"></i>
													</div>
													<div id="text-wish" class="text">Giỏ yêu thích</div>
												</div>
											</div>
											<div class="show-item">
												<div class="icon-show">
													<i class="far fa-eye"></i>
												</div>
												<a href="${tempLinkProduct}">Xem chi tiết</a>
											</div>
										</div>
									</div>
								</c:forEach>
							</div>
						</div>

						<c:set var="count" value="${count + 1}" scope="session" />
					</c:when>
				</c:choose>
			</c:forEach>
		</div>
		<!-- Thêm banner -->
		<div class="banner-collection">
			<div class="banner-image">
				<img src="img/banner/sub-banner/collection1/banner1.jpg" alt="3">
			</div>
			<div class="banner-information">
				<div class="text-information">
					<div class="text-name">PASTEL - YOUNG HEART</div>
					<div class="des1">Sự cuồng nhiệt của tuổi trẻ có thể biến mọi
						vấp ngã trở thành dấu ấn đáng nhớ, nàng được quyền "sai cứ sai" và
						làm mọi thứ theo cách riêng của mình. Tháng 8 này, Juno mang tới
						nguồn cảm hứng mới từ những gam màu ngọt ngào và đầy ấn tượng.</div>
					<div class="des2">Juno với bộ sưu tập "Pastel - Young Heart"
						trong các gam màu dịu nhẹ đầy cuốn hút, gây ấn tượng không phải sự
						sắc sảo mà là những dãy màu ngọt ngào. Pastel chưa bao giờ nhàm
						chán bởi nó khắc họa tinh thần trẻ trung, nhiệt huyết và được
						quyền nổi loạn qua những sắc màu của sự nữ tính.</div>
				</div>
				<div class="banner-prod">
					<div class="prod-demo">
						<div class="prod-image">
							<img src="img/banner/sub-banner/collection1/banner-1.2.jpg"
								alt="1">
						</div>
						<div class="prod-name">Giày cao gót mũi nhọn gót thanh</div>
						<div class="prod-price">390,000₫</div>
					</div>
					<div class="prod-demo">
						<div class="prod-image">
							<img src="img/banner/sub-banner/collection1/banner-1.1.jpg"
								alt="2 ">
						</div>
						<div class="prod-name">Túi xách lớn trang trí viền 2 màu</div>
						<div class="prod-price">750,000₫</div>
					</div>
				</div>
			</div>
		</div>
		<div class="content-detail">
			<div class="content-layer-top">
				<div class="content-title">Túi</div>
				<div class="list-title">
					<ul>
						<c:set var="count" value="${1}" scope="session" />
						<c:set var="first" value="true" scope="session" />
						<c:forEach var="categoryBag" items="${CATEGORY_BAG}">
							<c:choose>
								<c:when test="${first == true}">
									<li class="tablinks2" id="defaultTwo"
										onclick="openTab2(event, '${categoryBag.cate_id}')">${categoryBag.cate_name}</li>
									<c:set var="first" value="false" scope="session" />
									<c:set var="count" value="${count + 1}" scope="session" />
								</c:when>
								<c:otherwise>
									<li class="tablinks2"
										onclick="openTab2(event, '${categoryBag.cate_id}')">${categoryBag.cate_name}</li>
									<c:set var="count" value="${count + 1}" scope="session" />
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</ul>
				</div>
			</div>
			<c:set var="count" value="${1}" scope="session" />
			<c:forEach var="listOfListProduct" items="${PRODUCTS_BY_CATE}">
				<c:if test="${(count >= 7) && (count<=11)}">
					<div class="tabcontent2" id="${listOfListProduct.cate_id}">
						<div class="list-product">
							<c:forEach var="tempProduct"
								items="${listOfListProduct.productList}">

								<c:url var="tempLinkProduct" value="jameshop">
									<c:param name="command" value="LOADDETAILPRODUCT"></c:param>
									<c:param name="productId" value="${tempProduct.prod_id}"></c:param>
									<c:param name="cateId" value="${tempProduct.cate_id}"></c:param>
								</c:url>

								<div class="detail-product">
									<div class="img-product">
										<img src="${tempProduct.prod_img1}"
											alt="${tempProduct.prod_id}">
									</div>
									<div class="name-product">${tempProduct.prod_name}</div>
									<div class="price-product">${tempProduct.prod_price}₫</div>
									<div class="show-product">
										<div class="flex-container" style="display:<%=display%>">
											<div class="heart-item" data-command="ADDWISHLIST"
												data-idproduct="${tempProduct.prod_id}">
												<input type="hidden"
													value="<%=session.getAttribute("idUser")%>"
													id="inputIdUser">
												<div class="icon-show">
													<i class="fas fa-heart"></i>
												</div>
												<div id="text-wish" class="text">Giỏ yêu thích</div>
											</div>
										</div>
										<div class="show-item">
											<div class="icon-show">
												<i class="far fa-eye"></i>
											</div>
											<a href="${tempLinkProduct}">Xem chi tiết</a>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
				</c:if>
				<c:set var="count" value="${count + 1}" scope="session" />
			</c:forEach>
		</div>
		<div class="title-product-demo">
			<span>WE'RE YOUNG</span>
		</div>
		<div class="text-index">
			<div class="text1-index">Tuổi trẻ chưa hẳn được quyết định bởi
				bạn bao nhiêu tuổi, mà đến từ sự lựa chọn của mỗi người.</div>
			<div class="text1-index">Trẻ là khi bạn làm mọi thứ bằng sự dấn
				thân, nhiệt huyết, dám làm điều chúng ta muốn như cách chúng ta đã
				từng.</div>
		</div>
		<div class="slide-banner-bottom">
			<img class="slidetype2"
				src="img/banner/banner-bottom-index/banner1.jpg"> <img
				class="slidetype2" src="img/banner/banner-bottom-index/banner2.jpg">
			<img class="slidetype2"
				src="img/banner/banner-bottom-index/banner3.jpg"> <img
				class="slidetype2" src="img/banner/banner-bottom-index/banner4.jpg">
			<img class="slidetype2"
				src="img/banner/banner-bottom-index/banner5.jpg"> <img
				class="slidetype2" src="img/banner/banner-bottom-index/banner6.jpg">
			<div class="button-next">
				<div class="arrow-left" onclick="plusDivs(-1)">
					<i class="fas fa-angle-left"></i>
				</div>
				<div class="arrow-right" onclick="plusDivs(1)">
					<i class="fas fa-angle-right"></i>
				</div>
			</div>
		</div>
		<div class="content-detail">
			<div class="content-layer-top">
				<div class="content-title">Phụ kiện</div>
				<div class="list-title">
					<ul>
						<c:set var="count" value="${1}" scope="session" />
						<c:set var="first" value="true" scope="session" />
						<c:forEach var="categoryJewelry" items="${CATEGORY_JEWELRY}">
							<c:choose>
								<c:when test="${first == true}">
									<li class="tablinks3" id="defaultThree"
										onclick="openTab3(event, '${categoryJewelry.cate_id}')">${categoryJewelry.cate_name}</li>
									<c:set var="first" value="false" scope="session" />
									<c:set var="count" value="${count + 1}" scope="session" />
								</c:when>
								<c:otherwise>
									<li class="tablinks3"
										onclick="openTab3(event, '${categoryJewelry.cate_id}')">${categoryJewelry.cate_name}</li>
									<c:set var="count" value="${count + 1}" scope="session" />
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</ul>
				</div>
			</div>
			<c:set var="count" value="${1}" scope="session" />
			<c:forEach var="listOfListProduct" items="${PRODUCTS_BY_CATE}">
				<c:if test="${(count >= 12) && (count <= 14)}">
					<div class="tabcontent3" id="${listOfListProduct.cate_id}">
						<div class="list-product">
							<c:forEach var="tempProduct"
								items="${listOfListProduct.productList}">

								<c:url var="tempLinkProduct" value="jameshop">
									<c:param name="command" value="LOADDETAILPRODUCT"></c:param>
									<c:param name="productId" value="${tempProduct.prod_id}"></c:param>
									<c:param name="cateId" value="${tempProduct.cate_id}"></c:param>
								</c:url>

								<div class="detail-product">
									<div class="img-product">
										<img src="${tempProduct.prod_img1}"
											alt="${tempProduct.prod_id}">
									</div>
									<div class="name-product">${tempProduct.prod_name}</div>
									<div class="price-product">${tempProduct.prod_price}₫</div>
									<div class="show-product">
										<div class="flex-container" style="display:<%=display%>">
											<div class="heart-item" data-command="ADDWISHLIST"
												data-idproduct="${tempProduct.prod_id}">
												<input type="hidden"
													value="<%=session.getAttribute("idUser")%>"
													id="inputIdUser">
												<div class="icon-show">
													<i class="fas fa-heart"></i>
												</div>
												<div id="text-wish" class="text">Giỏ yêu thích</div>
											</div>
										</div>
										<div class="show-item">
											<div class="icon-show">
												<i class="far fa-eye"></i>
											</div>
											<a href="${tempLinkProduct}">Xem chi tiết</a>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
				</c:if>
				<c:set var="count" value="${count + 1}" scope="session" />
			</c:forEach>
		</div>
	</div>

	<!-- code footer -->

	<jsp:include page="footer.jsp" />

	<script>
		var k = 1;
		showDivSlide(k);
		document.getElementById("defaultOne").click();
		document.getElementById("defaultTwo").click();
		document.getElementById("defaultThree").click();
	</script>

</body>

</html>