function scroll_to_top() {
	window.scrollTo(0, 0);
}

function wait_loading() {
	setTimeout(() => $("input[name=page_flag]").val("0"), 300);
}