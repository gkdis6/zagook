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
			map_main.setCenter(new kakao.maps.LatLng(pos.coords.latitude, pos.coords.longitude));
			var marker = new kakao.maps.Marker({
				map: map_main,
				position: new kakao.maps.LatLng(pos.coords.latitude, pos.coords.longitude)
			});
			var infowindow = new kakao.maps.InfoWindow({
				content: '<div class="infowindow" id="myloca" style="text-align: center; width:150px;">내 위치</div>'
			});
			var markerImage = new kakao.maps.MarkerImage('/images/736653.png', new kakao.maps.Size(50, 53));
			marker.setImage(markerImage);
			kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map_main, marker, infowindow));
			kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
		}, init_reject);
	}
}

function init_reject() {
	let param = null;
	let url = window.location.href;
	let str = $("input[name=distance_type]").val().trim();
	let range = (str == "Select Range" || str.length == 0)? null : str;
	let order = $("input[name=order_type]").val();
	console.log(range);
	console.log(order);
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
<<<<<<< HEAD
			if (((doc_height / 2) <= top_height) && $("input[name=page_flag]").val() == "0") {
				$("input[name=page_flag]").val("1");
=======
			let client_height = this.document.scrollingElement.clientHeight;
			if (top_height + client_height>= doc_height) {
>>>>>>> 2adc7f45316150b1d26d06b3b0d80048376beaae
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
	if (((doc_height / 2) <= top_height) && $("input[name=page_flag]").val() == "0") {
		$("input[name=page_flag]").val("1");
		process_feed_list(param);
	}
}

const feedService = new getFeedService();
let center_box = document.getElementsByClassName("center_container")[0];