function scroll_to_top() {
	$('html, body').stop().animate( { scrollTop : 0 }, 500);
}

function wait_loading() {
	setTimeout(() => $("input[name=page_flag]").val("0"), 300);
}