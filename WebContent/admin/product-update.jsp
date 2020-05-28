<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Update Product - Admin</title>
<link rel="stylesheet" href="../css/admin.css">
<link
	href="https://fonts.googleapis.com/css2?family=Nunito:ital,wght@0,200;0,300;0,400;0,600;0,700;0,800;0,900;1,200;1,300;1,400;1,600;1,700;1,800;1,900&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.css">
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
						<div class="name1">Thế Hưng</div>
						<div class="name2">Admin</div>
					</div>
					<div class="avatar">
						<img src="../img/admin/avatar1.jpg" alt="">
					</div>
				</div>
			</div>
			<div class="content" style="display: block;">
				<h5 style="text-align: center; margin-bottom: 2px;">Cập nhật
					thông tin sản phẩm</h5>
				<div class="underline"></div>
				<div class="detail-content">
					<div class="detail-product">
						<h3>Chọn ảnh đại diện</h3>
						<div class="grid-container1">
							<div class="item">1</div>
							<label class="file-upload" style="width: 36%; margin: 0 auto;">
								<input type="file" multiple="multiple" name="fileToUpload"
								id="fileToUpload"> Chọn ảnh
							</label>
						</div>
						<div class="flex-box">
							<div class="info-flex">
								<div class="div-flex">
									<div class="col-l">
										<div class="idProd">Mã sản phẩm :</div>
										<div class="nameProd">Tên sản phẩm</div>
										<div class="cateProd">Loại sản phẩm :</div>
										<!-- <div class="imgProd1">Ảnh 1 :</div>
                                        <div class="imgProd2">Ảnh 2 :</div>
                                        <div class="imgProd3">Ảnh 3 :</div>
                                        <div class="imgProd4">Ảnh 4 :</div>
                                        <div class="imgProd5">Ảnh 5 :</div>
                                        <div class="imgProd6">Ảnh 6 :</div>
                                        <div class="imgProd7">Ảnh 7 :</div> -->
										<div style="padding-top: 2px;" class="priceProd">Giá bán
											:</div>
										<div style="padding-top: 2px;" class="sizeProd1">Size 1
											:</div>
										<div style="padding-top: 2px;" class="sizeProd2">Size 2
											:</div>
										<div style="padding-top: 2px;" class="sizeProd3">Size 33
											:</div>
										<div style="padding-top: 2px;" class="colorProd">Màu sắc
											:</div>
										<div class="condProdAdmin">Tình trạng:</div>
										<div class="desProd1">Mô tả 1 :</div>
										<div class="desProd2">Mô tả 2 :</div>
										<div class="desProd3">Mô tả 3 :</div>
									</div>
									<div class="col-r">
										<div class="input">
											<input type="text" placeholder="VD: BB1010">
										</div>
										<div class="input">
											<input type="text" placeholder="VD: Giày cao gót mũi nhọn">
										</div>
										<div class="input">
											<input type="text" placeholder="VD: Giày">
										</div>
										<!-- <div class="input"><input type="text" placeholder="VD: ..img/giay/BB1010.jpg"></div>
                                        <div class="input"><input type="text" placeholder="VD: ..img/giay/BB1010.jpg"></div>
                                        <div class="input"><input type="text" placeholder="VD: ..img/giay/BB1010.jpg"></div>
                                        <div class="input"><input type="text" placeholder="VD: ..img/giay/BB1010.jpg"></div>
                                        <div class="input"><input type="text" placeholder="VD: ..img/giay/BB1010.jpg"></div>
                                        <div class="input"><input type="text" placeholder="VD: ..img/giay/BB1010.jpg"></div>
                                        <div class="input"><input type="text" placeholder="VD: ..img/giay/BB1010.jpg"></div> -->
										<div class="input">
											<input type="text" placeholder="VD: 435,000₫">
										</div>
										<div class="input">
											<input type="text" placeholder="VD: 36">
										</div>
										<div class="input">
											<input type="text" placeholder="VD: 37">
										</div>
										<div class="input">
											<input type="text" placeholder="VD: 38">
										</div>
										<div class="input">
											<input type="text" placeholder="VD: Trắng">
										</div>
										<div class="input">
											<input type="text" placeholder="VD: Còn hàng">
										</div>
										<div class="input">
											<input type="text"
												placeholder="VD: Giày kitten heel cổ điển da bóng">
										</div>
										<div class="input">
											<input type="text"
												placeholder="VD: Thiết kế đồng màu từ thân giày đến lót đế và gót tạo sự trang nhã, thanh lịch tuyệt đối. Gót chỉ cao 7cm cực kỳ dễ di chuyển">
										</div>
										<div class="input">
											<input type="text"
												placeholder="VD: Chất liệu da tổng hợp phủ bóng cao cấp. Đây là sự lựa chọn hoàn hảo cho cô gái công sở hoặc nàng cũng có thể phối cùng trang phục đi chơi, dự tiệc nhẹ.">
										</div>
										<button>Tạo mới</button>
									</div>
								</div>
							</div>
							<div class="img-flex">
								<div class="grid-container">
									<div class="item">1</div>
									<div class="item">1</div>
									<div class="item">1</div>
								</div>
								<div class="detail-flex">
									<label class="file-upload"> <input type="file"
										multiple="multiple" name="fileToUpload" id="fileToUpload">
										Chọn ảnh
									</label> <label class="file-upload"> <input type="file"
										multiple="multiple" name="fileToUpload" id="fileToUpload">
										Chọn ảnh
									</label> <label class="file-upload"> <input type="file"
										multiple="multiple" name="fileToUpload" id="fileToUpload">
										Chọn ảnh
									</label>
								</div>
								<div class="grid-container">
									<div class="item">1</div>
									<div class="item">1</div>
									<div class="item">1</div>
								</div>
								<div class="detail-flex">
									<label class="file-upload"> <input type="file"
										multiple="multiple" name="fileToUpload" id="fileToUpload">
										Chọn ảnh
									</label> <label class="file-upload"> <input type="file"
										multiple="multiple" name="fileToUpload" id="fileToUpload">
										Chọn ảnh
									</label> <label class="file-upload"> <input type="file"
										multiple="multiple" name="fileToUpload" id="fileToUpload">
										Chọn ảnh
									</label>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>