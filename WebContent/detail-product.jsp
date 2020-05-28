<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Detail Product</title>
<link
	href="https://fonts.googleapis.com/css2?family=Quicksand:wght@300;400;500;600;700&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.css">
<link rel="stylesheet" href="css/all.css">
<script type="text/javascript" src="js/all.js"></script>
<%
	String check;
if (session.getAttribute("idUser") != null) {
	check = "jameshop";
} else {
	check = "login.jsp";
}
%>
</head>

<body>

	<!-- code header -->

	<jsp:include page="header.jsp" />

	<!-- code section -->

	<div class="section">
		<div class="layer-name">Chi tiết sản phẩm >></div>
		<div class="info-detail-product">
			<div class="detail-product-col-left">
				<div class="flex-col-top">
					<div class="detail-product-col1">
						<div class="img-demo">
							<img src="${TEMP_PRODUCT.prod_img1}" alt="img-demo1"
								onclick="currentDiv(1)">
						</div>
						<div class="img-demo ">
							<img src="${TEMP_PRODUCT.prod_img2}" alt="img-demo1"
								onclick="currentDiv(2)">
						</div>
						<div class="img-demo ">
							<img src="${TEMP_PRODUCT.prod_img3}" alt="img-demo2"
								onclick="currentDiv(3)">
						</div>
						<div class="img-demo ">
							<img src="${TEMP_PRODUCT.prod_img4}" alt="img-demo3"
								onclick="currentDiv(4)">
						</div>
					</div>
					<div class="detail-product-col2">
						<img class="mySlides" src="${TEMP_PRODUCT.prod_img1}"
							alt="img-product">
					</div>
					<div class="detail-product-col2">
						<img class="mySlides" src="${TEMP_PRODUCT.prod_img2}"
							alt="img-product" style="display: none">
					</div>
					<div class="detail-product-col2">
						<img class="mySlides" src="${TEMP_PRODUCT.prod_img3}"
							alt="img-product" style="display: none">
					</div>
					<div class="detail-product-col2">
						<img class="mySlides" src="${TEMP_PRODUCT.prod_img4}"
							alt="img-product" style="display: none">
					</div>
				</div>
				<div class="suggestion-list">
					<div class="name-list">Có thể nàng sẽ thích</div>
					<div class="list-item">
						<c:forEach var="productSuggestion" items="${TEMP_PRODUCT_BY_CATE}">
							<c:url var="tempLinkProduct" value="jameshop">
								<c:param name="command" value="LOADDETAILPRODUCT"></c:param>
								<c:param name="productId" value="${productSuggestion.prod_id}"></c:param>
								<c:param name="cateId" value="${productSuggestion.cate_id}"></c:param>
							</c:url>
							<div class="item">
								<a href="${tempLinkProduct}">
									<div class="img-item">
										<img src="${productSuggestion.prod_img1}" alt="">
									</div>
									<div class="name-item">${productSuggestion.prod_name}</div>
									<div class="price-item">${productSuggestion.prod_price}₫</div>
								</a>
							</div>
						</c:forEach>
					</div>
				</div>
				<div class="list-img">
					<img src="${TEMP_PRODUCT.prod_img5}" alt=""> <img
						src="${TEMP_PRODUCT.prod_img6}" alt=""> <img
						src="${TEMP_PRODUCT.prod_img7}" alt="">
				</div>
			</div>
			<div class="detail-product-col-right">
				<form action="<%=check%>" method="POST">
					<input type="hidden" name="command" value="ADDTOCART" /> 
					<input type="hidden" name="userID" value='<%=session.getAttribute("idUser")%>' /> 
					<input type="hidden" name="productID" value="${TEMP_PRODUCT.prod_id}">
					<input type="hidden" name="productPrice" value="${TEMP_PRODUCT.prod_price}">
					<div class="name">${TEMP_PRODUCT.prod_name}</div>
					<div class="id">
						Mã : <span>${TEMP_PRODUCT.prod_id}</span>
					</div>
					<div class="status">
						Trạng thái : <span>${TEMP_PRODUCT.prod_condition}</span>
					</div>
					<div class="price">${TEMP_PRODUCT.prod_price}₫</div>
					<div class="color">
						Màu sắc <span>${TEMP_PRODUCT.prod_color}</span>
					</div>
					<div class="size">
						<h3>Kích thước</h3>
						<ul>
							<li>
								<p>
									<input type="radio" name="productSize" value="${TEMP_PRODUCT.prod_size1}" checked> <label>${TEMP_PRODUCT.prod_size1}</label>
								</p>
							</li>
							<li>
								<p>
									<input type="radio" name="productSize" value="${TEMP_PRODUCT.prod_size2}" > <label>${TEMP_PRODUCT.prod_size2}</label>
								</p>
							</li>
							<li>
								<p>
									<input type="radio" name="productSize" value="${TEMP_PRODUCT.prod_size3}" > <label>${TEMP_PRODUCT.prod_size3}</label>
								</p>
							</li>
						</ul>
					</div>
					<div class="buy">
						<input type="submit" value="MUA NGAY">
					</div>
				</form>
				<div class="policy">
					<div class="img-policy">
						<img src="img/truck (1).png" alt="img-policy1">
					</div>
					<div class="info-policy">
						<div class="name">MIỄN PHÍ GIAO HÀNG TOÀN QUỐC</div>
						<div class="info">(Sản phẩm trên 300,000đ)</div>
					</div>
				</div>
				<div class="policy">
					<div class="img-policy">
						<img src="img/loan.png" alt="img-policy2">
					</div>
					<div class="info-policy">
						<div class="name">ĐỔI TRẢ DỄ DÀNG</div>
						<div class="info">(Đổi trả 90 ngày cho Giày; 30 ngày cho
							Túi; 7 ngày cho Phụ kiện nếu lỗi nhà sản xuất)</div>
					</div>
				</div>
				<div class="policy">
					<div class="img-policy">
						<img src="img/customer-service.png" alt="img-policy3">
					</div>
					<div class="info-policy">
						<div class="name">TỔNG ĐÀI BÁN HÀNG 0966 073 028</div>
						<div class="info">(Miễn phí từ 8h00 - 21:00 mỗi ngày)</div>
					</div>
				</div>
				<div class="description">
					<div class="description-row1">
						<div class="name">THÔNG SỐ SẢN PHẨM</div>
						<ul>
							<li>Mã sản phẩm: ${TEMP_PRODUCT.prod_id}</li>
							<li>Kiểu dáng: ${TEMP_PRODUCT.prod_name}</li>
							<li>Chất liệu:</li>
							<li>Độ cao: Tùy chọn</li>
							<li>Màu sắc: ${TEMP_PRODUCT.prod_color}</li>
							<li>Kích cỡ: ${TEMP_PRODUCT.prod_size1} -
								${TEMP_PRODUCT.prod_size2} - ${TEMP_PRODUCT.prod_size3}</li>
						</ul>
					</div>
					<div class="description-row1">
						<div class="name">MÔ TẢ SẢN PHẨM</div>
						<div class="info">
							${TEMP_PRODUCT.prod_description1} <br /> <br />
							${TEMP_PRODUCT.prod_description2} <br /> <br />
							${TEMP_PRODUCT.prod_description3}
						</div>
					</div>
					<div class="description-row1">
						<div class="name">CHÍNH SÁCH ĐỔI TRẢ</div>
						<h4>JAME'S hiện đang áp dụng chính sách Đổi/Trả cho các sản
							phẩm như sau:</h4>
						<br />
						<div class="info">
							- Trong vòng 90 ngày kể từ ngày nhận sản phẩm Giày <br /> <br />
							- Trong vòng 30 ngày kể từ ngày nhận sản phẩm Túi, Ví <br /> <br />
							- Trong vòng 7 ngày đối với sản phẩm Khuyến mãi, Giảm giá (có giá
							trị thanh toán dưới 250,000 đồng <br /> <br /> - Phụ kiện (chỉ
							áp dụng với mắt kính, trang sức) và túi canvas được đổi/trả trong
							7 ngày trong trường hợp có lỗi sản xuất <br /> <br /> - Không
							áp dụng đổi trả Online với đơn hàng tại hệ thống Cửa hàng Đại lý
							và Cửa hàng Juno tại TTTM Sense City Phạm Văn Đồng
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