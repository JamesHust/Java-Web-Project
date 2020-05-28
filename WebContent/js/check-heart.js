$(function() {
	$('.heart-item').click(function() {
		if ($(this).hasClass('heartactive')) {
			var command = "DELETEWISHLIST";
			$(this).removeClass('heartactive');
			$(this).addClass('heartnoactive');
			alert("Đã xóa khỏi danh sách sản phẩm yêu thích của bạn!");
		} else {
			var command = $(this).data("command");
			$(this).removeClass('heartnoactive');
			$(this).addClass('heartactive');
			alert("Đã thêm vào danh sách sản phẩm yêu thích của bạn!");
		}
		var idproduct = $(this).data("idproduct");
		var iduser = $('#inputIdUser').val();
		$.ajax({
			url : "jameshop",
			type : "post",
			dataType : "text",
			data : {
				number : $('#number').val(),
				command : command,
				idproduct : idproduct,
				iduser : iduser
			},
			success : function(result) {
				// $('#result').html(result);
			}
		});
	})
})

$(function() {
	var command = "GETIDLIST";
	var iduser = $('#inputIdUser').val();
	$.post({
		url : "jameshop",
		type : "post",
		dataType : "text",
		data : {
			command : command,
			iduser : iduser
		},
		success : function(result) {
			$.each( result.split(','), function( index, value ) {
                var id = "#" + "precheck-" + value;
                $(id).addClass('heartactive');
            });
		}
	});
})
