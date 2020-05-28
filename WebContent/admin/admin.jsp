<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Admin</title>
<link rel="stylesheet" href="css/admin.css">
<link
	href="https://fonts.googleapis.com/css2?family=Nunito:ital,wght@0,200;0,300;0,400;0,600;0,700;0,800;0,900;1,200;1,300;1,400;1,600;1,700;1,800;1,900&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.css">
<link class="jsbin"
	href="http://ajax.googleapis.com/ajax/libs/jqueryui/1/themes/base/jquery-ui.css"
	rel="stylesheet" type="text/css" />

<%
	String display = "none";
if (session.getAttribute("idAdmin") != null) {
	display = "block";
}
%>
</head>

<body>

	<div class="admin">
		<div class="toolbar">
			<div class="name-page">
				<div class="icon-logo">
					<i class="fas fa-grin-wink"></i>
				</div>
				<div class="name">
					JAME'S
					<div class="name2">ADMIN</div>
				</div>

			</div>
			<div class="dashbroad">
				<span><i class="fas fa-tachometer-alt"></i></span> Bảng điều khiển
			</div>
			<div class="item-menu">
				<span><i class="fas fa-address-card"></i></span> Quản lý loại sản
				phẩm
			</div>
			<div class="customer">
				<div class="prodtype" onclick="openToolbar(event, 'menuA')"
					id="openAdmin" style="padding-left: 3px;">
					<span style="margin-right: 7px;"><i
						class="fas fa-align-justify"></i></span> Items - Loại sản phẩm
				</div>
			</div>
			<div class="underline"></div>
			<div class="item-menu">
				<span><i class="fas fa-shopping-cart"></i></span> Quản lý sản phẩm
			</div>
			<div class="customer">
				<div class="prodtype" onclick="openToolbar(event, 'menuB')">
					<span style="margin-right: 2px;"><i
						class="fas fa-shoe-prints"></i></span> Giày
				</div>
				<div class="prodtype" onclick="openToolbar(event, 'menuC')"
					style="padding-left: 2px;">
					<span style="margin-right: 6px;"><i
						class="fas fa-shopping-bag"></i></span> Túi
				</div>
				<div class="prodtype" onclick="openToolbar(event, 'menuD')"
					style="padding-left: 1px;">
					<span style="margin-right: 4px;"><i class="fas fa-gem"></i></span>
					Trang sức
				</div>
			</div>
			<div class="underline"></div>
			<div class="item-menu">
				<span><i class="fas fa-clipboard"></i></span> Quản lý khách hàng
			</div>
			<div class="customer">
				<div class="prodtype" onclick="openToolbar(event, 'menuE')"
					style="padding-left: 3px;">
					<span style="margin-right: 6px;"><i
						class="fas fa-file-invoice-dollar"></i></span> Hóa đơn
				</div>
				<div class="prodtype" onclick="openToolbar(event, 'menuF')">
					<span style="margin-right: 3px;"><i
						class="fas fa-user-friends"></i></span> Tài khoản khách hàng
				</div>
			</div>
			<div class="underline"></div>
			<div class="item-menu">
				<span><i class="far fa-clipboard"></i></span> Quản lý admin
			</div>
			<div class="customer">
				<div class="prodtype" onclick="openToolbar(event, 'menuG')"
					style="padding-left: 2px;">
					<span style="margin-right: 4px;"><i
						class="fas fa-user-circle"></i></span> Tài khoản Admin
				</div>
			</div>
			<div class="underline"></div>
		</div>
		<div class="info-detail">
			<div class="layer-top">
				<div class="search">
					<div class="input">
						<input type="text" name="search" placeholder="Tìm kiếm...">
					</div>
					<div class="button-search">
						<button class="icon-search">
							<i class="fas fa-search"></i>
						</button>
					</div>
				</div>
				<div class="empty"></div>
				<div class="admin-profile">
					<div class="name-admin">
						<div class="name1">${MY_ADMIN.admin_name}</div>
						<div class="name2">Admin</div>
					</div>
					<div class="avatar">
						<img src="${MY_ADMIN.admin_avatar}" alt="">
						<div class="profile-list">
							<c:url var="tempLinkLogOut" value="admin">
								<c:param name="command" value="LOGOUTADMIN"></c:param>
							</c:url>
							<ul>
								<li><a href="${tempLinkLogOut}">Đăng xuất</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<div class="content" id="menuA">
				<div class="flex-card"
					style="display: flex; justify-content: center;">
					<div class="card-content">
						<h5>Quản lý Items</h5>
						<div class="detail-card">
							<table>
								<tr>
									<th>ID</th>
									<th>Tên Item</th>
									<th>Sửa</th>
									<th>Xóa</th>
								</tr>
								<c:forEach var="tempItem" items="${TEMP_ITEM}">
									<tr>
										<td>${tempItem.item_id}</td>
										<td>${tempItem.item_name}</td>
										<c:set var="IDMyAdmin"
											value='<%=session.getAttribute("idAdmin")%>'></c:set>
										<c:url var="tempLinkDeleteItem" value="admin">
											<c:param name="command" value="DELETEITEM"></c:param>
											<c:param name="idMyAdmin" value="${IDMyAdmin}"></c:param>
											<c:param name="idItem" value="${tempItem.item_id}"></c:param>
										</c:url>
										<td class="edit1"
											onclick="openUpdate(event, '${tempItem.item_id}')"><span><i
												class="fas fa-edit"></i></span>Sửa</td>
										<td class="delete"><span><i class="fas fa-trash"></i></span><a
											onclick="if(!(confirm('Bạn có chắc chắn muốn xóa Item này?'))) return false"
											href="${tempLinkDeleteItem}">Xóa</a></td>
									</tr>
								</c:forEach>
							</table>
						</div>
						<div class="item-flex">
							<div class="input-item">
								<input type="text" placeholder="Nhập tên item mới...">
							</div>
							<div class="button-add">
								<button>Thêm</button>
							</div>
						</div>
						<c:forEach var="tempItem" items="${TEMP_ITEM}">
							<div class="card-blur" id="${tempItem.item_id}">
								<div class="icon-x"
									onclick="this.parentElement.style.display='none'">
									<i class="fas fa-plus-circle"></i>
								</div>
								<div class="div-flex">
									<div class="col-l">
										<div class="id">Id :</div>
										<div class="name">Tên Item :</div>
									</div>
									<div class="col-r">
										<form action="admin" method="post">
											<input type="hidden" name="command" value="UPDATEITEM">
											<input type="hidden" name="idMyAdmin"
												value="<%=session.getAttribute("idAdmin")%>"> <input
												type="hidden" name="idItem" value="${tempItem.item_id}">
											<div class="input">
												<input type="text" name="idItem" value="${tempItem.item_id}"
													disabled>
											</div>
											<div class="input">
												<input type="text" name="nameItem"
													value="${tempItem.item_name}">
											</div>
											<div class="button">
												<input type="submit" value="Cập nhật">
											</div>
										</form>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
					<div class="card-content2">

						<h5>Quản lý loại sản phẩm</h5>
						<div class="detail-card">
							<table>
								<tr>
									<th>ID</th>
									<th>Mã Item</th>
									<th>Loại sản phẩm</th>
									<th>Sửa</th>
									<th>Xóa</th>
								</tr>
								<c:forEach var="tempCate" items="${TEMP_CATE}">
									<tr>
										<td>${tempCate.cate_id}</td>
										<td>${tempCate.item_id}</td>
										<td>${tempCate.cate_name}</td>
										<c:set var="IDMyAdmin"
											value='<%=session.getAttribute("idAdmin")%>'></c:set>
										<c:url var="tempLinkDeleteCate" value="admin">
											<c:param name="command" value="DELETECATE"></c:param>
											<c:param name="idMyAdmin" value="${IDMyAdmin}"></c:param>
											<c:param name="idCate" value="${tempCate.cate_id}"></c:param>
										</c:url>
										<td class="edit"
											onclick="openUpdate2(event, '${tempCate.cate_id}')"><span><i
												class="fas fa-edit"></i></span>Sửa</td>
										<td class="delete"><span><i class="fas fa-trash"></i></span><a
											onclick="if(!(confirm('Bạn có chắc chắn muốn xóa loại sản phẩm này?'))) return false"
											href="${tempLinkDeleteCate}">Xóa</a></td>
									</tr>
								</c:forEach>
							</table>
						</div>
						<div class="card-blur-t">
							<div class="div-flex">
								<div class="col-l">
									<div class="id">Id :</div>
									<div class="name">Tên Item :</div>
									<div class="name-cate">Loại sản phẩm:</div>
								</div>
								<div class="col-r">
									<div class="input">
										<input type="text">
									</div>
									<div class="input">
										<input type="text">
									</div>
									<div class="input">
										<input type="text">
									</div>
									<button
										style="background-image: linear-gradient(-45deg, #FFC796 0%, #FF6B95 100%);">Thêm</button>
								</div>
							</div>
						</div>
						<c:forEach var="tempCate" items="${TEMP_CATE}">
							<div class="card-blur-r" id="${tempCate.cate_id}">
								<div class="icon-x"
									onclick="this.parentElement.style.display='none'">
									<i class="fas fa-plus-circle"></i>
								</div>
								<div class="div-flex">
									<div class="col-l">
										<div class="id">Id :</div>
										<div class="name">Mã Item :</div>
										<div class="name-cate">Loại sản phẩm:</div>
									</div>
									<div class="col-r">
										<form action="admin" method="post">
											<input type="hidden" name="command" value="UPDATECATE">
											<input type="hidden" name="idMyAdmin"
												value="<%=session.getAttribute("idAdmin")%>"> <input
												type="hidden" name="idCate" value="${tempCate.cate_id}">
											<input type="hidden" name="imgCate"
												value="${tempCate.cate_img}">
											<div class="input">
												<input type="text" value="${tempCate.cate_id}" disabled>
											</div>
											<div class="input">
												<input type="text" name="idItemByCate"
													value="${tempCate.item_id}">
											</div>
											<div class="input">
												<input type="text" name="nameCate"
													value="${tempCate.cate_name}">
											</div>
											<div class="button">
												<input type="submit" value="Cập nhật">
											</div>
										</form>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>

			</div>
			<div class="content" id="menuB">
				<h5>Quản lý chi tiết sản phẩm</h5>
				<div class="tab-title">
					<c:set var="count" value="${1}" scope="session" />
					<c:set var="first" value="true" scope="session" />
					<c:forEach var="categoryShoe" items="${CATEGORY_SHOE}">
						<c:choose>
							<c:when test="${first == true}">
								<div class="tablink"
									onclick="openTab(event, 'tab${categoryShoe.cate_id}')"
									id="defaultOpen">
									<button>${categoryShoe.cate_name}</button>
								</div>
								<c:set var="first" value="false" scope="session" />
								<c:set var="count" value="${count + 1}" scope="session" />
							</c:when>
							<c:otherwise>
								<div class="tablink"
									onclick="openTab(event, 'tab${categoryShoe.cate_id}')">
									<button>${categoryShoe.cate_name}</button>
								</div>
								<c:set var="count" value="${count + 1}" scope="session" />
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<div class="tablink" onclick="openTab(event, 'tabF')">
						<button>Thêm sản phẩm</button>
					</div>
				</div>
				<c:set var="count" value="${1}" scope="session" />
				<c:forEach var="listOfAllProduct" items="${ALL_PRODUCTS_BY_CATE}">
					<c:choose>
						<c:when test="${count <= 6}">
							<div class="detail-content" id="tab${listOfAllProduct.cate_id}">
								<table>
									<tr>
										<th>MÃ SẢN PHẨM</th>
										<th>ẢNH MINH HỌA</th>
										<th>TÊN SẢN PHẨM</th>
										<th>GIÁ TIỀN</th>
										<th>TRẠNG THÁI</th>
										<th>CẬP NHẬT</th>
										<th>XÓA</th>
									</tr>
									<c:forEach var="tempProduct"
										items="${listOfAllProduct.productList}">
										<tr>
											<c:set var="IDMyAdmin"
												value='<%=session.getAttribute("idAdmin")%>' />
											<c:url var="tempLinkDeleteProduct" value="admin">
												<c:param name="command" value="DELETEPRODUCT"></c:param>
												<c:param name="productId" value="${tempProduct.prod_id}"></c:param>
												<c:param name="idMyAdmin" value="${IDMyAdmin}"></c:param>
											</c:url>
											<td>${tempProduct.prod_id}</td>
											<td><img src="${tempProduct.prod_img1}" alt=""></td>
											<td>${tempProduct.prod_name}</td>
											<td>${tempProduct.prod_price}₫</td>
											<td>${tempProduct.prod_condition}</td>
											<td class="update"><span><i class="fas fa-edit"></i></span>Cập
												nhật</td>
											<td class="delete"><a href="${tempLinkDeleteProduct}"
												onclick="if(!(confirm('Bạn có chắc chắn muốn xóa sản phẩm này?'))) return false"><span><i
														class="fas fa-trash"></i></span>Xóa</a></td>
										</tr>
									</c:forEach>
								</table>
							</div>
							<c:set var="count" value="${count + 1}" scope="session" />
						</c:when>
					</c:choose>
				</c:forEach>
				<div class="detail-content" id="tabF">
					<div class="detail-product">
						<form action="admin" method="post"
							enctype='multipart/form-data'>
							<input type="hidden" id="conmandAdd" name="command"
								value="ADDPRODUCTBYADMIN1"> <input type="hidden"
								name="idMyAdmin" value="<%=session.getAttribute("idAdmin")%>">
							<input type="hidden" name="index" value="0">
							<h3>Chọn ảnh đại diện</h3>
							<div class="grid-container1">
								<div class="item">
									<img id="blah" src="img/admin/img.jpg" alt="your image" />
								</div>
								<input type="file" id="input1" name="input-1" class="input-img"
									data-img="blah" />
								<div class="text-choose">
									<label for="input1">Chọn ảnh</label>
								</div>
							</div>
							<div class="flex-box">
								<div class="info-flex">
									<div class="div-flex">
										<div class="col-l">
											<div class="idProd">Mã sản phẩm :</div>
											<div class="nameProd">Tên sản phẩm :</div>
											<div class="cateProd">Loại sản phẩm :</div>
											<div style="padding-top: 2px;" class="priceProd">Giá
												bán :</div>
											<div style="padding-top: 2px;" class="sizeProd1">Size 1
												:</div>
											<div style="padding-top: 2px;" class="sizeProd2">Size 2
												:</div>
											<div style="padding-top: 2px;" class="sizeProd3">Size
												33 :</div>
											<div style="padding-top: 2px;" class="colorProd">Màu
												sắc :</div>
											<div class="condProdAdmin">Tình trạng:</div>
											<div class="desProd1">Mô tả 1 :</div>
											<div class="desProd2">Mô tả 2 :</div>
											<div class="desProd3">Mô tả 3 :</div>
										</div>
										<div class="col-r">
											<div class="input">
												<input type="text" name="idProd" placeholder="VD: BB1010">
											</div>
											<div class="input">
												<input type="text" name="nameProd"
													placeholder="VD: Giày cao gót mũi nhọn">
											</div>
											<div class="input">
												<input type="text" name="idCate" placeholder="VD: 1">
											</div>
											<div class="input">
												<input type="text" name="priceProd"
													placeholder="VD: 435,000₫">
											</div>
											<div class="input">
												<input type="text" name="sizeProd1" placeholder="VD: 36">
											</div>
											<div class="input">
												<input type="text" name="sizeProd2" placeholder="VD: 37">
											</div>
											<div class="input">
												<input type="text" name="sizeProd3" placeholder="VD: 38">
											</div>
											<div class="input">
												<input type="text" name="colorProd" placeholder="VD: Trắng">
											</div>
											<div class="input">
												<input type="text" name="condProd"
													placeholder="VD: Còn hàng">
											</div>
											<div class="input">
												<input type="text" name="desProd1"
													placeholder="VD: Giày kitten heel cổ điển da bóng">
											</div>
											<div class="input">
												<input type="text" name="desProd2"
													placeholder="VD: Thiết kế đồng màu từ thân giày đến lót đế và gót tạo sự trang nhã, thanh lịch tuyệt đối. Gót chỉ cao 7cm cực kỳ dễ di chuyển">
											</div>
											<div class="input">
												<input type="text" name="desProd3"
													placeholder="VD: Chất liệu da tổng hợp phủ bóng cao cấp. Đây là sự lựa chọn hoàn hảo cho cô gái công sở hoặc nàng cũng có thể phối cùng trang phục đi chơi, dự tiệc nhẹ.">
											</div>
											<button type="submit">Tạo mới</button>
										</div>
									</div>
								</div>
								<div class="img-flex">
									<div class="grid-container">
										<div class="item">
											<img id="blah2" src="img/admin/img.jpg" alt="your image" />
										</div>
										<div class="item">
											<img id="blah3" src="img/admin/img.jpg" alt="your image" />
										</div>
										<div class="item">
											<img id="blah4" src="img/admin/img.jpg" alt="your image" />
										</div>
									</div>
									<div class="detail-flex">
										<div class="file-upload">
											<input type="file" id="input2" name="input-2"
												class="input-img" data-img="blah2" />
											<div class="text-choose">
												<label for="input2">Chọn ảnh</label>
											</div>
										</div>
										<div class="file-upload">
											<input type="file" id="input3" name="input-3"
												class="input-img" data-img="blah3" />
											<div class="text-choose">
												<label for="input3">Chọn ảnh</label>
											</div>
										</div>
										<div class="file-upload">
											<input type="file" id="input4" name="input-4"
												class="input-img" data-img="blah4" />
											<div class="text-choose">
												<label for="input4">Chọn ảnh</label>
											</div>
										</div>
									</div>
									<div class="grid-container">
										<div class="item">
											<img id="blah5" src="img/admin/img.jpg" alt="your image" />
										</div>
										<div class="item">
											<img id="blah6" src="img/admin/img.jpg" alt="your image" />
										</div>
										<div class="item">
											<img id="blah7" src="img/admin/img.jpg" alt="your image" />
										</div>
									</div>
									<div class="detail-flex">
										<div class="file-upload">
											<input type="file" id="input5" name="input-5"
												class="input-img" data-img="blah5" />
											<div class="text-choose">
												<label for="input5">Chọn ảnh</label>
											</div>
										</div>
										<div class="file-upload">
											<input type="file" id="input6" name="input-6"
												class="input-img" data-img="blah6" />
											<div class="text-choose">
												<label for="input6">Chọn ảnh</label>
											</div>
										</div>
										<div class="file-upload">
											<input type="file" id="input7" name="input-7"
												class="input-img" data-img="blah7" />
											<div class="text-choose">
												<label for="input7">Chọn ảnh</label>
											</div>
										</div>
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
			<div class="content" id="menuC">
				<h5>Quản lý chi tiết sản phẩm</h5>
				<div class="tab-title">
					<c:set var="count" value="${1}" scope="session" />
					<c:set var="first" value="true" scope="session" />
					<c:forEach var="categoryBag" items="${CATEGORY_BAG}">
						<c:choose>
							<c:when test="${first == true}">
								<div class="tablink2"
									onclick="openTab2(event, 'tab${categoryBag.cate_id}')"
									id="defaultOpen2">
									<button>${categoryBag.cate_name}</button>
								</div>
								<c:set var="first" value="false" scope="session" />
								<c:set var="count" value="${count + 1}" scope="session" />
							</c:when>
							<c:otherwise>
								<div class="tablink2"
									onclick="openTab2(event, 'tab${categoryBag.cate_id}')">
									<button>${categoryBag.cate_name}</button>
								</div>
								<c:set var="count" value="${count + 1}" scope="session" />
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<div class="tablink2" onclick="openTab2(event, 'tabs')">
						<button>Thêm sản phẩm</button>
					</div>
				</div>
				<c:set var="count" value="${1}" scope="session" />
				<c:forEach var="listOfAllProduct" items="${ALL_PRODUCTS_BY_CATE}">
					<c:if test="${(count >= 7) && (count<=11)}">
						<div class="detail-content-b" id="tab${listOfAllProduct.cate_id}">
							<table>
								<tr>
									<th>MÃ SẢN PHẨM</th>
									<th>ẢNH MINH HỌA</th>
									<th>TÊN SẢN PHẨM</th>
									<th>GIÁ TIỀN</th>
									<th>TRẠNG THÁI</th>
									<th>CẬP NHẬT</th>
									<th>XÓA</th>
								</tr>
								<c:forEach var="tempProduct"
									items="${listOfAllProduct.productList}">
									<tr>
										<c:set var="IDMyAdmin"
											value='<%=session.getAttribute("idAdmin")%>' />
										<c:url var="tempLinkDeleteProduct" value="admin">
											<c:param name="command" value="DELETEPRODUCT"></c:param>
											<c:param name="productId" value="${tempProduct.prod_id}"></c:param>
											<c:param name="idMyAdmin" value="${IDMyAdmin}"></c:param>
										</c:url>
										<td>${tempProduct.prod_id}</td>
										<td><img src="${tempProduct.prod_img1}" alt=""></td>
										<td>${tempProduct.prod_name}</td>
										<td>${tempProduct.prod_price}₫</td>
										<td>${tempProduct.prod_condition}</td>
										<td class="update"><span><i class="fas fa-edit"></i></span>Cập
											nhật</td>
										<td class="delete"><a href="${tempLinkDeleteProduct}"
											onclick="if(!(confirm('Bạn có chắc chắn muốn xóa sản phẩm này?'))) return false"><span><i
													class="fas fa-trash"></i></span>Xóa</a></td>
									</tr>
								</c:forEach>
							</table>
						</div>
					</c:if>
					<c:set var="count" value="${count + 1}" scope="session" />
				</c:forEach>
				<div class="detail-content-b" id="tabs">
					<div class="detail-product">
						<form action="admin" method="post"
							enctype='multipart/form-data'>
							<input type="hidden" name="index" value="7"> <input
								type="hidden" name="command" value="ADDPRODUCTBYADMIN2">
							<input type="hidden" name="idMyAdmin"
								value="<%=session.getAttribute("idAdmin")%>">
							<h3>Chọn ảnh đại diện</h3>
							<div class="grid-container1">
								<div class="item">
									<img id="blah8" src="img/admin/img.jpg" alt="your image" />
								</div>
								<input type="file" id="input8" name="input-8" class="input-img"
									data-img="blah8" />
								<div class="text-choose">
									<label for="input8">Chọn ảnh</label>
								</div>
							</div>
							<div class="flex-box">
								<div class="info-flex">
									<div class="div-flex">
										<div class="col-l">
											<div class="idProd">Mã sản phẩm :</div>
											<div class="nameProd">Tên sản phẩm :</div>
											<div class="cateProd">Loại sản phẩm :</div>
											<div style="padding-top: 2px;" class="priceProd">Giá
												bán :</div>
											<div style="padding-top: 2px;" class="sizeProd1">Size 1
												:</div>
											<div style="padding-top: 2px;" class="sizeProd2">Size 2
												:</div>
											<div style="padding-top: 2px;" class="sizeProd3">Size
												33 :</div>
											<div style="padding-top: 2px;" class="colorProd">Màu
												sắc :</div>
											<div class="condProdAdmin">Tình trạng:</div>
											<div class="desProd1">Mô tả 1 :</div>
											<div class="desProd2">Mô tả 2 :</div>
											<div class="desProd3">Mô tả 3 :</div>
										</div>
										<div class="col-r">
											<div class="input">
												<input type="text" name="idProd" placeholder="VD: BB1010">
											</div>
											<div class="input">
												<input type="text" name="nameProd"
													placeholder="VD: Giày cao gót mũi nhọn">
											</div>
											<div class="input">
												<input type="text" name="idCate" placeholder="VD: 1">
											</div>
											<div class="input">
												<input type="text" name="priceProd"
													placeholder="VD: 435,000₫">
											</div>
											<div class="input">
												<input type="text" name="sizeProd1" placeholder="VD: 36">
											</div>
											<div class="input">
												<input type="text" name="sizeProd2" placeholder="VD: 37">
											</div>
											<div class="input">
												<input type="text" name="sizeProd3" placeholder="VD: 38">
											</div>
											<div class="input">
												<input type="text" name="colorProd" placeholder="VD: Trắng">
											</div>
											<div class="input">
												<input type="text" name="condProd"
													placeholder="VD: Còn hàng">
											</div>
											<div class="input">
												<input type="text" name="desProd1"
													placeholder="VD: Giày kitten heel cổ điển da bóng">
											</div>
											<div class="input">
												<input type="text" name="desProd2"
													placeholder="VD: Thiết kế đồng màu từ thân giày đến lót đế và gót tạo sự trang nhã, thanh lịch tuyệt đối. Gót chỉ cao 7cm cực kỳ dễ di chuyển">
											</div>
											<div class="input">
												<input type="text" name="desProd3"
													placeholder="VD: Chất liệu da tổng hợp phủ bóng cao cấp. Đây là sự lựa chọn hoàn hảo cho cô gái công sở hoặc nàng cũng có thể phối cùng trang phục đi chơi, dự tiệc nhẹ.">
											</div>
											<button type="submit">Tạo mới</button>
										</div>
									</div>
								</div>
								<div class="img-flex">
									<div class="grid-container">
										<div class="item">
											<img id="blah9" src="img/admin/img.jpg" alt="your image" />
										</div>
										<div class="item">
											<img id="blah10" src="img/admin/img.jpg" alt="your image" />
										</div>
										<div class="item">
											<img id="blah11" src="img/admin/img.jpg" alt="your image" />
										</div>
									</div>
									<div class="detail-flex">
										<div class="file-upload">
											<input type="file" id="input9" name="input-9"
												class="input-img" data-img="blah9" />
											<div class="text-choose">
												<label for="input9">Chọn ảnh</label>
											</div>
										</div>
										<div class="file-upload">
											<input type="file" id="input10" name="input-10"
												class="input-img" data-img="blah10" />
											<div class="text-choose">
												<label for="input10">Chọn ảnh</label>
											</div>
										</div>
										<div class="file-upload">
											<input type="file" id="input11" name="input-11"
												class="input-img" data-img="blah11" />
											<div class="text-choose">
												<label for="input11">Chọn ảnh</label>
											</div>
										</div>
									</div>
									<div class="grid-container">
										<div class="item">
											<img id="blah12" src="img/admin/img.jpg" alt="your image" />
										</div>
										<div class="item">
											<img id="blah13" src="img/admin/img.jpg" alt="your image" />
										</div>
										<div class="item">
											<img id="blah14" src="img/admin/img.jpg" alt="your image" />
										</div>
									</div>
									<div class="detail-flex">
										<div class="file-upload">
											<input type="file" id="input12" name="input-12"
												class="input-img" data-img="blah12" />
											<div class="text-choose">
												<label for="input12">Chọn ảnh</label>
											</div>
										</div>
										<div class="file-upload">
											<input type="file" id="input13" name="input-13"
												class="input-img" data-img="blah13" />
											<div class="text-choose">
												<label for="input13">Chọn ảnh</label>
											</div>
										</div>
										<div class="file-upload">
											<input type="file" id="input14" name="input-14"
												class="input-img" data-img="blah14" />
											<div class="text-choose">
												<label for="input14">Chọn ảnh</label>
											</div>
										</div>
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
			<div class="content" id="menuD">
				<h5>Quản lý chi tiết sản phẩm</h5>
				<div class="tab-title">
					<c:set var="count" value="${1}" scope="session" />
					<c:set var="first" value="true" scope="session" />
					<c:forEach var="categoryJewelry" items="${CATEGORY_JEWELRY}">
						<c:choose>
							<c:when test="${first == true}">
								<div class="tablink1"
									onclick="openTab1(event, 'tab${categoryJewelry.cate_id}')"
									id="defaultOpen1">
									<button>${categoryJewelry.cate_name}</button>
								</div>
								<c:set var="first" value="false" scope="session" />
								<c:set var="count" value="${count + 1}" scope="session" />
							</c:when>
							<c:otherwise>
								<div class="tablink1"
									onclick="openTab1(event, 'tab${categoryJewelry.cate_id}')">
									<button>${categoryJewelry.cate_name}</button>
								</div>
								<c:set var="count" value="${count + 1}" scope="session" />
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<div class="tablink1" onclick="openTab1(event, 'tabe')">
						<button>Thêm sản phẩm</button>
					</div>
				</div>
				<c:set var="count" value="${1}" scope="session" />
				<c:forEach var="listOfAllProduct" items="${ALL_PRODUCTS_BY_CATE}">
					<c:if test="${(count >= 12) && (count <= 14)}">
						<div class="detail-content-a" id="tab${listOfAllProduct.cate_id}">
							<table>
								<tr>
									<th>MÃ SẢN PHẨM</th>
									<th>ẢNH MINH HỌA</th>
									<th>TÊN SẢN PHẨM</th>
									<th>GIÁ TIỀN</th>
									<th>TRẠNG THÁI</th>
									<th>CẬP NHẬT</th>
									<th>XÓA</th>
								</tr>
								<c:forEach var="tempProduct"
									items="${listOfAllProduct.productList}">
									<tr>
										<c:set var="IDMyAdmin"
											value='<%=session.getAttribute("idAdmin")%>' />
										<c:url var="tempLinkDeleteProduct" value="admin">
											<c:param name="command" value="DELETEPRODUCT"></c:param>
											<c:param name="productId" value="${tempProduct.prod_id}"></c:param>
											<c:param name="idMyAdmin" value="${IDMyAdmin}"></c:param>
										</c:url>
										<td>${tempProduct.prod_id}</td>
										<td><img src="${tempProduct.prod_img1}" alt=""></td>
										<td>${tempProduct.prod_name}</td>
										<td>${tempProduct.prod_price}₫</td>
										<td>${tempProduct.prod_condition}</td>
										<td class="update"><span><i class="fas fa-edit"></i></span>Cập
											nhật</td>
										<td class="delete"><a href="${tempLinkDeleteProduct}"
											onclick="if(!(confirm('Bạn có chắc chắn muốn xóa sản phẩm này?'))) return false"><span><i
													class="fas fa-trash"></i></span>Xóa</a></td>
									</tr>
								</c:forEach>
							</table>
						</div>
					</c:if>
					<c:set var="count" value="${count + 1}" scope="session" />
				</c:forEach>
				<div class="detail-content-a" id="tabe">
					<div class="detail-product">
						<form action="admin" method="post"
							enctype='multipart/form-data'>
							<input type="hidden" name="command" value="ADDPRODUCTBYADMIN3">
							<input type="hidden" name="idMyAdmin"
								value="<%=session.getAttribute("idAdmin")%>"> <input
								type="hidden" name="index" value="14">
							<h3>Chọn ảnh đại diện</h3>
							<div class="grid-container1">
								<div class="item">
									<img id="blah15" src="img/admin/img.jpg" alt="your image" />
								</div>
								<input type="file" id="input15" name="input-15"
									class="input-img" data-img="blah15" />
								<div class="text-choose">
									<label for="input15">Chọn ảnh</label>
								</div>
							</div>
							<div class="flex-box">
								<div class="info-flex">
									<div class="div-flex">
										<div class="col-l">
											<div class="idProd">Mã sản phẩm :</div>
											<div class="nameProd">Tên sản phẩm :</div>
											<div class="cateProd">Loại sản phẩm :</div>
											<div style="padding-top: 2px;" class="priceProd">Giá
												bán :</div>
											<div style="padding-top: 2px;" class="sizeProd1">Size 1
												:</div>
											<div style="padding-top: 2px;" class="sizeProd2">Size 2
												:</div>
											<div style="padding-top: 2px;" class="sizeProd3">Size
												33 :</div>
											<div style="padding-top: 2px;" class="colorProd">Màu
												sắc :</div>
											<div class="condProdAdmin">Tình trạng:</div>
											<div class="desProd1">Mô tả 1 :</div>
											<div class="desProd2">Mô tả 2 :</div>
											<div class="desProd3">Mô tả 3 :</div>
										</div>
										<div class="col-r">
											<div class="input">
												<input type="text" name="idProd" placeholder="VD: BB1010">
											</div>
											<div class="input">
												<input type="text" name="nameProd"
													placeholder="VD: Giày cao gót mũi nhọn">
											</div>
											<div class="input">
												<input type="text" name="idCate" placeholder="VD: 1">
											</div>
											<div class="input">
												<input type="text" name="priceProd"
													placeholder="VD: 435,000₫">
											</div>
											<div class="input">
												<input type="text" name="sizeProd1" placeholder="VD: 36">
											</div>
											<div class="input">
												<input type="text" name="sizeProd2" placeholder="VD: 37">
											</div>
											<div class="input">
												<input type="text" name="sizeProd3" placeholder="VD: 38">
											</div>
											<div class="input">
												<input type="text" name="colorProd" placeholder="VD: Trắng">
											</div>
											<div class="input">
												<input type="text" name="condProd"
													placeholder="VD: Còn hàng">
											</div>
											<div class="input">
												<input type="text" name="desProd1"
													placeholder="VD: Giày kitten heel cổ điển da bóng">
											</div>
											<div class="input">
												<input type="text" name="desProd2"
													placeholder="VD: Thiết kế đồng màu từ thân giày đến lót đế và gót tạo sự trang nhã, thanh lịch tuyệt đối. Gót chỉ cao 7cm cực kỳ dễ di chuyển">
											</div>
											<div class="input">
												<input type="text" name="desProd3"
													placeholder="VD: Chất liệu da tổng hợp phủ bóng cao cấp. Đây là sự lựa chọn hoàn hảo cho cô gái công sở hoặc nàng cũng có thể phối cùng trang phục đi chơi, dự tiệc nhẹ.">
											</div>
											<button type="submit">Tạo mới</button>
										</div>
									</div>
								</div>
								<div class="img-flex">
									<div class="grid-container">
										<div class="item">
											<img id="blah16" src="img/admin/img.jpg" alt="your image" />
										</div>
										<div class="item">
											<img id="blah17" src="img/admin/img.jpg" alt="your image" />
										</div>
										<div class="item">
											<img id="blah18" src="img/admin/img.jpg" alt="your image" />
										</div>
									</div>
									<div class="detail-flex">
										<div class="file-upload">
											<input type="file" id="input16" name="input-16"
												class="input-img" data-img="blah16" />
											<div class="text-choose">
												<label for="input16">Chọn ảnh</label>
											</div>
										</div>
										<div class="file-upload">
											<input type="file" id="input17" name="input-17"
												class="input-img" data-img="blah17" />
											<div class="text-choose">
												<label for="input17">Chọn ảnh</label>
											</div>
										</div>
										<div class="file-upload">
											<input type="file" id="input18" name="input-18"
												class="input-img" data-img="blah18" />
											<div class="text-choose">
												<label for="input18">Chọn ảnh</label>
											</div>
										</div>
									</div>
									<div class="grid-container">
										<div class="item">
											<img id="blah19" src="img/admin/img.jpg" alt="your image" />
										</div>
										<div class="item">
											<img id="blah20" src="img/admin/img.jpg" alt="your image" />
										</div>
										<div class="item">
											<img id="blah21" src="img/admin/img.jpg" alt="your image" />
										</div>
									</div>
									<div class="detail-flex">
										<div class="file-upload">
											<input type="file" id="input19" name="input-19"
												class="input-img" data-img="blah19" />
											<div class="text-choose">
												<label for="input19">Chọn ảnh</label>
											</div>
										</div>
										<div class="file-upload">
											<input type="file" id="input20" name="input-20"
												class="input-img" data-img="blah20" />
											<div class="text-choose">
												<label for="input20">Chọn ảnh</label>
											</div>
										</div>
										<div class="file-upload">
											<input type="file" id="input21" name="input-21"
												class="input-img" data-img="blah21" />
											<div class="text-choose">
												<label for="input21">Chọn ảnh</label>
											</div>
										</div>
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
			<div class="content" id="menuE">
				<h5>Tất cả đơn hàng</h5>
				<div class="card-bill">
					<div class="col">
						<table>
							<tr>
								<th>MÃ HÓA ĐƠN</th>
								<th>MÃ KHÁCH HÀNG</th>
								<th>TÊN KHÁCH HÀNG</th>
								<th>ĐỊA CHỈ</th>
								<th>LIÊN HỆ</th>
								<th>MÃ SẢN PHẨM</th>
								<th>TÊN SẢN PHẨM</th>
								<th>MÀU SẮC</th>
								<th>SỐ LƯỢNG</th>
								<th>SIZE</th>
								<th>GIÁ TIỀN</th>
								<th>TRẠNG THÁI</th>
								<th>CẬP NHẬT</th>
							</tr>
							<tr>
								<td>IT123</td>
								<td>43</td>
								<td>BB1010</td>
								<td><img src="../img/trang_sd05052_4_giay.jpg" alt=""></td>
								<td>Giày cao gót mũi nhọn giả da</td>
								<td>Trắng</td>
								<td>2</td>
								<td>36</td>
								<td>570,000₫</td>
								<td><input type="text" placeholder="Đang xử lý"></td>
								<td class="update"><span><i class="fas fa-edit"></i></span>Cập
									nhật</td>
							</tr>
							<tr>
								<td class="name-total">TỔNG TIỀN</td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td class="price-total">570,000₫</td>
								<td></td>
								<td></td>
							</tr>
						</table>
					</div>
				</div>
			</div>
			<div class="content" id="menuF">
				<h5 style="text-align: center; margin-bottom: 2px;">Tạo tài
					khoản mới</h5>
				<div class="underline"></div>
				<div class="button-create">
					<button class="createa" onclick="openCreate1(event, 'cr1')"
						style="width: 0 auto;">Tạo tài khoản</button>
				</div>
				<div class="add-account" id="cr1">
					<div class="icon-remove"
						onclick="this.parentElement.style.display='none'">
						<i class="fas fa-plus"></i>
					</div>
					<div class="div-flex">
						<div class="col-l">
							<div class="nameUser">Họ tên :</div>
							<div class="dobUser">Ngày sinh :</div>
							<div class="phoneUser">Số điện thoại :</div>
							<div class="genderUser">Giới tính :</div>
							<div class="addressUser">Địa chỉ :</div>
							<div class="emailUser">Email :</div>
							<div class="passUser">Mật khẩu :</div>
						</div>
						<div class="col-r">
							<div class="input">
								<input type="text" placeholder="VD: Nguyễn Văn A">
							</div>
							<div class="input">
								<input type="text" placeholder="VD: 23/11/2001">
							</div>
							<div class="input">
								<input type="text" placeholder="VD: 0123456789">
							</div>
							<div class="input">
								<input type="text" placeholder="VD: Nam">
							</div>
							<div class="input">
								<input type="text"
									placeholder="VD: huyện Như Thanh, tỉnh Thanh Hóa">
							</div>
							<div class="input">
								<input type="text" placeholder="VD: avannguyen@gmail.com">
							</div>
							<div class="input">
								<input type="password" placeholder="123456">
							</div>
							<button>Tạo mới</button>
						</div>
					</div>
				</div>
				<h5 style="text-align: center; margin-bottom: 2px;">Tài khoản
					khách hàng</h5>
				<div class="underline"></div>
				<div class="card-account">
					<c:forEach var="tempAccountUser" items="${TEMP_ACCOUNT_USER}">
						<div class="item-account">
							<div class="id-account" style="padding-top: 8vw !important;">
								<div class="icon">
									<i class="fas fa-user"></i>
								</div>
								<div class="id-detail">
									ID : <span>${tempAccountUser.user_id}</span>
								</div>
							</div>
							<div class="table-detail">
								<c:set var="IDMyAdmin"
									value='<%=session.getAttribute("idAdmin")%>' />
								<c:url var="tempLinkDeleteUser" value="admin">
									<c:param name="command" value="DELETEACCOUNTUSER"></c:param>
									<c:param name="userId" value="${tempAccountUser.user_id}"></c:param>
									<c:param name="idMyAdmin" value="${IDMyAdmin}"></c:param>
								</c:url>
								<div class="icon-delete" style="bottom: 3.9vw; left: 25vw;">
									<a href="${tempLinkDeleteUser}"
										onclick="if(!(confirm('Bạn có chắc chắn muốn xóa tài khoản này?'))) return false"><i
										class="fas fa-plus"></i></a>
								</div>
								<div class="col-left">
									<h4>Họ Tên :</h4>
									<h4>Điện thoại :</h4>
									<h4>Ngày sinh :</h4>
									<h4>Giới tính :</h4>
									<h4>Địa chỉ :</h4>
									<h4>Email :</h4>
									<h4>Mật khẩu :</h4>
								</div>
								<div class="col-right">
									<form action="admin" method="post">
										<input type="hidden" name="command" value="UPDATEACCOUNTUSER">
										<input type="hidden" name="idMyAdmin"
											value="<%=session.getAttribute("idAdmin")%>"> <input
											type="hidden" name="idUser"
											value="${tempAccountUser.user_id}">
										<div class="name">
											<input type="text" name="nameUser"
												value="${tempAccountUser.user_name}" class="input">
										</div>
										<div class="phone">
											<input type="text" name="phoneUser"
												value="${tempAccountUser.user_phone}" class="input">
										</div>
										<div class="dob">
											<input type="text" name="dobUser"
												value="${tempAccountUser.user_dob}" class="input">
										</div>
										<div class="gender">
											<input type="text" name="genderUser"
												value="${tempAccountUser.user_gender}" class="input">
										</div>
										<div class="address">
											<input type="text" name="addressUser"
												value="${tempAccountUser.user_address}" class="input">
										</div>
										<div class="email">
											<input type="text" name="emailUser"
												value="${tempAccountUser.user_email}" class="input">
										</div>
										<div class="pass">
											<input type="password" name="passUser"
												value="${tempAccountUser.user_pass}" class="input">
										</div>
										<div class="button">
											<input type="submit" value="Cập nhật">
										</div>
									</form>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
			<div class="content" id="menuG">
				<h5 style="text-align: center; margin-bottom: 2px;">Tạo tài
					khoản mới</h5>
				<div class="underline"></div>
				<div class="button-create">
					<button class="createb" onclick="openCreate2(event, 'cr2')"
						style="width: 0 auto;">Tạo tài khoản</button>
				</div>
				<div class="add-account-b" id="cr2">
					<div class="icon-remove"
						onclick="this.parentElement.style.display='none'">
						<i class="fas fa-plus"></i>
					</div>
					<div class="div-flex">
						<div class="col-l">
							<div class="nameAdmin">Họ tên :</div>
							<div class="avatarAdmin">Ảnh đại diện</div>
							<div class="emailAdmin">Email :</div>
							<div class="passAdmin">Mật khẩu :</div>
						</div>
						<div class="col-r">
							<div class="input">
								<input type="text" placeholder="VD: Nguyễn Văn A">
							</div>
							<div class="input">
								<input type="text" placeholder="VD: ../img/admin/avatartest.jpg">
							</div>
							<div class="input">
								<input type="text" placeholder="VD: avannguyen@gmail.com">
							</div>
							<div class="input">
								<input type="password" placeholder="123456">
							</div>
							<button>Tạo mới</button>
						</div>
					</div>
				</div>
				<h5 style="text-align: center; margin-bottom: 2px;">Tài khoản
					Admin</h5>
				<div class="underline"></div>
				<div class="card-account">
					<c:forEach var="tempAccountAdmin" items="${TEMP_ACCOUNT_ADMIN}">
						<div class="item-account">
							<div class="id-account" style="padding: 4vw 0 1vw 0;">
								<div class="avatar">
									<img src="${tempAccountAdmin.admin_avatar}" alt="">
								</div>
								<div class="name-admin">${tempAccountAdmin.admin_name}</div>
							</div>
							<div class="table-detail">
								<c:set var="IDMyAdmin"
									value='<%=session.getAttribute("idAdmin")%>' />
								<c:url var="tempLinkDeleteAdmin" value="admin">
									<c:param name="command" value="DELETEACCOUNTADMIN"></c:param>
									<c:param name="adminId" value="${tempAccountAdmin.admin_id}"></c:param>
									<c:param name="idMyAdmin" value="${IDMyAdmin}"></c:param>
								</c:url>
								<div class="icon-delete">
									<a href="${tempLinkDeleteAdmin}"
										onclick="if(!(confirm('Bạn có chắc chắn muốn xóa tài khoản này?'))) return false"><i
										class="fas fa-plus"></i></a>
								</div>
								<div class="col-left">
									<h4>ID :</h4>
									<h4>Ảnh :</h4>
									<h4>Tên :</h4>
									<h4>Email :</h4>
									<h4>Mật khẩu :</h4>
								</div>
								<div class="col-right">
									<form action="admin" method="post">
										<input type="hidden" name="command" value="UPDATEACCOUNTADMIN" />
										<input type="hidden" name="idMyAdmin"
											value="<%=session.getAttribute("idAdmin")%>"> <input
											type="hidden" name="idAdmin"
											value="${tempAccountAdmin.admin_id}" />
										<div class="id">
											<input type="text" value="${tempAccountAdmin.admin_id}"
												class="input" disabled>
										</div>
										<div class="avatar">
											<input type="text" name="avatarAdmin"
												value="${tempAccountAdmin.admin_avatar}" class="input">
										</div>
										<div class="name">
											<input type="text" name="nameAdmin"
												value="${tempAccountAdmin.admin_name}" class="input">
										</div>
										<div class="email">
											<input type="text" name="emailAdmin"
												value="${tempAccountAdmin.admin_email}" class="input">
										</div>
										<div class="pass">
											<input type="password" name="passAdmin"
												value="${tempAccountAdmin.admin_pass}" class="input">
										</div>
										<div class="button">
											<input type="submit" value="Cập nhật">
										</div>
									</form>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script type="text/javascript" src="js/admin.js"></script>
	<script>
		document.getElementById("openAdmin").click();
		document.getElementById("defaultOpen").click();
		document.getElementById("defaultOpen1").click();
		document.getElementById("defaultOpen2").click();
	</script>
	
</body>

</html>