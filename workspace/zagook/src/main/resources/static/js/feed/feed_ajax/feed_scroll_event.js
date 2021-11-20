$(function () {
	//param is not allocated in navigator.geolocation.getCurrentPosition, so put the code repeatedly
	let param = null;
	if (navigator.geolocation) {
		navigator.geolocation.getCurrentPosition(function (pos) {
			let url = window.location.href;
			if (ajax_url_check_myread(url)) {
				param = {"x_site": String(pos.coords.latitude), "y_site": String(pos.coords.longitude), "url_id": "myread", "load_type": "reload"};	
			} else if (ajax_url_check_read(url)){
				param = {"x_site": String(pos.coords.latitude), "y_site": String(pos.coords.longitude), "url_id": "read", "load_type": "reload"};	
			}
			process_feed_list(param);
		},reject);
	}
});

function reject() {
	if (ajax_url_check_myread(url)) {
		param = {"x_site": "37.5535462", "y_site": "126.964296", "url_id": "myread", "load_type": "reload"};	
	} else if (ajax_url_check_read(url)){
		param = {"x_site": "37.5535462", "y_site": "126.964296", "url_id": "read", "load_type": "reload"};	
	}
	process_feed_list(param);
}

function reject_scroll_event() {
	if (ajax_url_check_myread(url)) {
		param = {"x_site": "37.5535462", "y_site": "126.964296", "url_id": "myread", "load_type": "scroll"};	
	} else if (ajax_url_check_read(url)){
		param = {"x_site": "37.5535462", "y_site": "126.964296", "url_id": "read", "load_type": "scroll"};	
	}
	let doc_height = this.document.scrollingElement.scrollHeight;
	let top_height = this.document.scrollingElement.scrollTop;
	let client_height = this.document.scrollingElement.clientHeight;
	if (top_height + client_height >= doc_height) {
		process_feed_list(param);
	}
}	
function scrollEventHandler(event){
	let param = null;
	if (navigator.geolocation) {
		navigator.geolocation.getCurrentPosition(function (pos) {
			let url = window.location.href;
			if (ajax_url_check_myread(url)) {
				param = {"x_site": String(pos.coords.latitude), "y_site": String(pos.coords.longitude), "url_id": "myread", "load_type": "scroll"};	
			} else if (ajax_url_check_read(url)){
				param = {"x_site": String(pos.coords.latitude), "y_site": String(pos.coords.longitude), "url_id": "read", "load_type": "scroll"};	
			}
			let doc_height = this.document.scrollingElement.scrollHeight;
			let top_height = this.document.scrollingElement.scrollTop;
			let client_height = this.document.scrollingElement.clientHeight;
			if (top_height + client_height >= doc_height) {
				process_feed_list(param);
			}
		},reject_scroll_event);
	}
}

$(document).ready(function () {
	window.addEventListener("scroll", scrollEventHandler);
});

const feedService = new getFeedService();
let center_box = document.getElementsByClassName("center_container")[0];