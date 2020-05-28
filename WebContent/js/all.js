// Hiệu ứng chuyển Tab
function openTab1(evt, cityName) {
	var i, tabcontent1, tablinks1;
	tabcontent1 = document.getElementsByClassName("tabcontent1");
	for (i = 0; i < tabcontent1.length; i++) {
		tabcontent1[i].style.display = "none";
	}
	tablinks1 = document.getElementsByClassName("tablinks1");
	for (i = 0; i < tablinks1.length; i++) {
		tablinks1[i].className = tablinks1[i].className.replace(" active", "");
	}
	document.getElementById(cityName).style.display = "block";
	evt.currentTarget.className += " active";
}
function openTab2(evt, cityName) {
	var i, tabcontent2, tablinks2;
	tabcontent2 = document.getElementsByClassName("tabcontent2");
	for (i = 0; i < tabcontent2.length; i++) {
		tabcontent2[i].style.display = "none";
	}
	tablinks2 = document.getElementsByClassName("tablinks2");
	for (i = 0; i < tablinks2.length; i++) {
		tablinks2[i].className = tablinks2[i].className.replace(" active", "");
	}
	document.getElementById(cityName).style.display = "block";
	evt.currentTarget.className += " active";
}
function openTab3(evt, cityName) {
	var i, tabcontent3, tablinks3;
	tabcontent3 = document.getElementsByClassName("tabcontent3");
	for (i = 0; i < tabcontent3.length; i++) {
		tabcontent3[i].style.display = "none";
	}
	tablinks3 = document.getElementsByClassName("tablinks3");
	for (i = 0; i < tablinks3.length; i++) {
		tablinks3[i].className = tablinks3[i].className.replace(" active", "");
	}
	document.getElementById(cityName).style.display = "block";
	evt.currentTarget.className += " active";
}

// Hiệu Ứng Slideshow
function carousel() {
	var i;
	var x = document.getElementsByClassName("mySlides");
	for (i = 0; i < x.length; i++) {
		x[i].style.display = "none";
	}
	myIndex++;
	if (myIndex > x.length) {
		myIndex = 1
	}
	x[myIndex - 1].style.display = "block";
	setTimeout(carousel, 5000); // Change image every 2 seconds
}

// Hiệu ứng Slideshow Indicators

function currentDiv(n) {
	showDivs(slideIndex = n);
}

function showDivs(n) {
	var i;
	var x = document.getElementsByClassName("mySlides");

	if (n > x.length) {
		slideIndex = 1
	}
	if (n < 1) {
		slideIndex = x.length
	}
	for (i = 0; i < x.length; i++) {
		x[i].style.display = "none";
	}
	x[slideIndex - 1].style.display = "block";
}

// Hiệu ứng Slideshow Indicators Type 2

function plusDivs(n) {
	showDivSlide(k += n);
}

function showDivSlide(n) {
	var i;
	var x = document.getElementsByClassName("slidetype2");
	var dots = document.getElementsByClassName("demo");
	if (n > x.length) {
		k = 1
	}
	if (n < 1) {
		k = x.length
	}
	for (i = 0; i < x.length; i++) {
		x[i].style.display = "none";
	}
	x[k - 1].style.display = "block";
}

// Hiệu ứng chuyển menu cho user

function openMenu(evt, menuName) {
	var i, accountdetail, account;
	accountdetail = document.getElementsByClassName("account-detail");
	for (i = 0; i < accountdetail.length; i++) {
		accountdetail[i].style.display = "none";
	}
	account = document.getElementsByClassName("account");
	for (i = 0; i < account.length; i++) {
		account[i].className = account[i].className.replace(" active", "");
	}
	document.getElementById(menuName).style.display = "block";
	evt.currentTarget.className += " active";
}

