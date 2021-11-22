$(function () {
	//param is not allocated in navigator.geolocation.getCurrentPosition, so put the code repeatedly
	let order = $("input[name=order_type]").val();
	init_fetch_feed(null, order);
});

function init_fetch_feed(range, order) {
	window.addEventListener("scroll", scrollEventHandler);
	
	let param = null;
	if (navigator.geolocation) {
		navigator.geolocation.getCurrentPosition(function (pos) {
			let url = window.location.href;
			if (ajax_url_check_myread(url))
				param = is_set_feed_range(range, pos, "myread", order);
			else if (ajax_url_check_read(url))
				param = is_set_feed_range(range, pos, "read", order);
			process_feed_list(param);
		}, init_reject);
	}
}

function init_reject() {
	let param = null;
	let url = window.location.href;
	let str = $("input[name=distance_type]").val();
	let range = str == "Select Range" ? null : str;
	let order = $("input[name=order_type]").val();
	if (ajax_url_check_myread(url))
		param = is_set_feed_range_reject(range, "myread", order);
	else if (ajax_url_check_read(url))
		param = is_set_feed_range_reject(range, "read", order);
	process_feed_list(param);
}

function scrollEventHandler(event){
	let param = null;
	if (navigator.geolocation) {
		navigator.geolocation.getCurrentPosition(function (pos) {
			let url = window.location.href;
			let range = $("input[name=distance_type]").val();
			if (ajax_url_check_myread(url))
				param = is_set_feed_range_scroll(range, pos, "myread");	
			else if (ajax_url_check_read(url))
				param = is_set_feed_range_scroll(range, pos, "read");		
			let doc_height = this.document.scrollingElement.scrollHeight;
			let top_height = this.document.scrollingElement.scrollTop;
			let client_height = this.document.scrollingElement.clientHeight;
			if (top_height + client_height >= doc_height) {
				process_feed_list(param);
			}
		}, scroll_reject);
	}
}

function scroll_reject() {
	let url = window.location.href;
	let range = $("input[name=distance_type]").val();
	if (ajax_url_check_myread(url))
		param = is_set_feed_range_scroll_reject(range, "myread");	
	else if (ajax_url_check_read(url))
		param = is_set_feed_range_scroll_reject(range, "read");	
	let doc_height = this.document.scrollingElement.scrollHeight;
	let top_height = this.document.scrollingElement.scrollTop;
	let client_height = this.document.scrollingElement.clientHeight;
	if (top_height + client_height >= doc_height) {
		process_feed_list(param);
	}
}

const feedService = new getFeedService();
let center_box = document.getElementsByClassName("center_container")[0];