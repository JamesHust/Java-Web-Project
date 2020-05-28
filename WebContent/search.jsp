<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Search</title>
<link
	href="https://fonts.googleapis.com/css2?family=Quicksand:wght@300;400;500;600;700&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.css">
<link rel="stylesheet" href="css/all.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="js/check-heart.js"></script>
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
		<div class="content-detail">
			<div class="content-layer-top">
				<div class="content-title">Tìm kiếm</div>
				<div class="text-search">
					Kết quả tìm kiếm cho <span>"<%=request.getAttribute("inputSearch")%>"
					</span>
				</div>
				<div class="underline"></div>
			</div>
			<div class="list-product">
				<c:forEach items="${TEMP_PRODUCT}" var="tempProduct">
					<c:url var="tempLinkProduct" value="jameshop">
						<c:param name="command" value="LOADDETAILPRODUCT"></c:param>
						<c:param name="productId" value="${tempProduct.prod_id}"></c:param>
						<c:param name="cateId" value="${tempProduct.cate_id}"></c:param>
					</c:url>
					<div class="detail-product">
						<div class="img-product">
							<img src="${tempProduct.prod_img1}" alt="${tempProduct.prod_id}">
						</div>
						<div class="name-product">${tempProduct.prod_name}</div>
						<div class="price-product">${tempProduct.prod_price}₫</div>
						<div class="show-product">
							<div class="flex-container" style="display:<%=display%>">
								<div class="heart-item" id="precheck-${tempProduct.prod_id}"
									data-command="ADDWISHLIST"
									data-idproduct="${tempProduct.prod_id}">
									<input type="hidden"
										value="<%=session.getAttribute("idUser")%>" id="inputIdUser">
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
	</div>

	<!-- code footer -->

	<jsp:include page="footer.jsp" />


</body>

</html>