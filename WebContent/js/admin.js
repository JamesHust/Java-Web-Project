function openToolbar(evt, cityName) {
	var i, content, prodtype;
	content = document.getElementsByClassName("content");
	for (i = 0; i < content.length; i++) {
		content[i].style.display = "none";
	}
	prodtype = document.getElementsByClassName("prodtype");
	for (i = 0; i < prodtype.length; i++) {
		prodtype[i].className = prodtype[i].className.replace(" active", "");
	}
	document.getElementById(cityName).style.display = "block";
	evt.currentTarget.className += " active";
}

function openTab(evt, cityName) {
	var i, detailcontent, tablink;
	detailcontent = document.getElementsByClassName("detail-content");
	for (i = 0; i < detailcontent.length; i++) {
		detailcontent[i].style.display = "none";
	}
	tablink = document.getElementsByClassName("tablink");
	for (i = 0; i < tablink.length; i++) {
		tablink[i].className = tablink[i].className.replace(" active", "");
	}
	document.getElementById(cityName).style.display = "block";
	evt.currentTarget.className += " active";
}

function openTab1(evt, cityName) {
	var i, detailcontenta, tablink1;
	detailcontenta = document.getElementsByClassName("detail-content-a");
	for (i = 0; i < detailcontenta.length; i++) {
		detailcontenta[i].style.display = "none";
	}
	tablink1 = document.getElementsByClassName("tablink1");
	for (i = 0; i < tablink1.length; i++) {
		tablink1[i].className = tablink1[i].className.replace(" active", "");
	}
	document.getElementById(cityName).style.display = "block";
	evt.currentTarget.className += " active";
}

function openTab2(evt, cityName) {
	var i, detailcontentb, tablink2;
	detailcontentb = document.getElementsByClassName("detail-content-b");
	for (i = 0; i < detailcontentb.length; i++) {
		detailcontentb[i].style.display = "none";
	}
	tablink2 = document.getElementsByClassName("tablink2");
	for (i = 0; i < tablink2.length; i++) {
		tablink2[i].className = tablink2[i].className.replace(" active", "");
	}
	document.getElementById(cityName).style.display = "block";
	evt.currentTarget.className += " active";
}

function openUpdate(evt, cityName) {
	var i, cardblur, edit1;
	cardblur = document.getElementsByClassName("card-blur");
	for (i = 0; i < cardblur.length; i++) {
		cardblur[i].style.display = "none";
	}
	edit1 = document.getElementsByClassName("edit1");
	for (i = 0; i < edit1.length; i++) {
		edit1[i].className = edit1[i].className.replace(" active", "");
	}
	document.getElementById(cityName).style.display = "block";
	evt.currentTarget.className += " active";
}

function openUpdate2(evt, cityName) {
	var i, cardblurr, edit;
	cardblurr = document.getElementsByClassName("card-blur-r");
	for (i = 0; i < cardblurr.length; i++) {
		cardblurr[i].style.display = "none";
	}
	edit = document.getElementsByClassName("edit");
	for (i = 0; i < edit.length; i++) {
		edit[i].className = edit[i].className.replace(" active", "");
	}
	document.getElementById(cityName).style.display = "block";
	evt.currentTarget.className += " active";
}

function openCreate2(evt, cityName) {
	var i, addaccountb, createb;
	addaccountb = document.getElementsByClassName("add-account-b");
	for (i = 0; i < addaccountb.length; i++) {
		addaccountb[i].style.display = "none";
	}
	createb = document.getElementsByClassName("createb");
	for (i = 0; i < createb.length; i++) {
		createb[i].className = createb[i].className.replace(" active", "");
	}
	document.getElementById(cityName).style.display = "block";
	evt.currentTarget.className += " active";
}

function openCreate1(evt, cityName) {
	var i, addaccount, createa;
	addaccount = document.getElementsByClassName("add-account-b");
	for (i = 0; i < addaccount.length; i++) {
		addaccount[i].style.display = "none";
	}
	createa = document.getElementsByClassName("createa");
	for (i = 0; i < createa.length; i++) {
		createa[i].className = createa[i].className.replace(" active", "");
	}
	document.getElementById(cityName).style.display = "block";
	evt.currentTarget.className += " active";
}

function readURL(input) {
	if (input.files && input.files[0]) {
		var reader = new FileReader();

		reader.onload = function(e) {
			$('#blah').attr('src', e.target.result).width(150).height(200);
		};

		reader.readAsDataURL(input.files[0]);
	}
}

// hàm hiển thị ảnh khi dùng input type file
$(function() {
	$('.input-img').change(function() {
		var imageId = "#" + $(this).data('img');
		readURL(this, imageId);
	});

})

function readURL(input, imageId) {

	if (input.files && input.files[0]) {
		var reader = new FileReader();

		reader.onload = function(e) {
			$(imageId).attr('src', e.target.result);
		};

		reader.readAsDataURL(input.files[0]);
	}
};