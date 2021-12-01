$(function () {
	let order = $("input[name=order_type]").val();
	onload_draw_map();
	init_fetch_feed(null, order);
});

function onload_draw_map() {
	if (navigator.geolocation) {
		navigator.geolocation.getCurrentPosition(function (pos) {
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
			overlays.push(marker);
		});
	}
}

function init_fetch_feed(range, order) {
	window.addEventListener("scroll", scrollEventHandler);
	let param = null;
	let hidden_selected_id = $("#hidden_selected_id").val();
	if (hidden_selected_id[0] == "#")
		hidden_selected_id = hidden_selected_id.substr(1, hidden_selected_id.length - 1);
	if (navigator.geolocation) {
		navigator.geolocation.getCurrentPosition(function (pos) {
			let url = window.location.href;
			if (ajax_url_check_home(url))
				param = is_set_feed_range(range, pos, "home", order, null);
			else if (ajax_url_check_myread(url))
				param = is_set_feed_range(range, pos, "myread", order, null);
			else if (ajax_url_check_read(url))
				param = is_set_feed_range(range, pos, "read", order, null);
			else if (ajax_url_check_tag(url))
				param = is_set_feed_range(range, pos, "tag", order, hidden_selected_id);
			else if (ajax_url_check_friend(url))
				param = is_set_feed_range(range, pos, "friend", order, hidden_selected_id);
			process_feed_list(param);
			onload_draw_map();
		}, init_reject);
	}
}

function init_reject() {
	let param = null;
	let url = window.location.href;
	let str = $("input[name=distance_type]").val().trim();
	let range = (str == "Select Range" || str.length == 0)? null : str;
	let order = $("input[name=order_type]").val();
	let hidden_selected_id = $("#hidden_selected_id").val();
	if (hidden_selected_id[0] == "#")
		hidden_selected_id = hidden_selected_id.substr(1, hidden_selected_id.length - 1);
	if (ajax_url_check_home(url))
		param = is_set_feed_range_reject(range, "home", order, null);
	else if (ajax_url_check_myread(url))
		param = is_set_feed_range_reject(range, "myread", order, null);
	else if (ajax_url_check_read(url))
		param = is_set_feed_range_reject(range, "read", order, null);
	else if (ajax_url_check_tag(url))
		param = is_set_feed_range_reject(range, "tag", order, hidden_selected_id);
	else if (ajax_url_check_friend(url))
		param = is_set_feed_range_reject(range, "friend", order, hidden_selected_id);
	process_feed_list(param);
	onload_draw_map();
}

function scrollEventHandler(event){
	let param = null;
	let flow_control_flag = false;
	if (navigator.geolocation) {
		navigator.geolocation.getCurrentPosition(function (pos) {
			let url = window.location.href;
			let range = $("input[name=distance_type]").val();
			if (ajax_url_check_home(url))
				flow_control_flag = true;
			else if (ajax_url_check_myread(url))
				param = is_set_feed_range_scroll(range, pos, "myread");	
			else if (ajax_url_check_read(url))
				param = is_set_feed_range_scroll(range, pos, "read");		
			else if (ajax_url_check_tag(url))
				param = is_set_feed_range_scroll(range, pos, "tag");		
			else if (ajax_url_check_friend(url))
				param = is_set_feed_range_scroll(range, pos, "friend");		
			let doc_height = this.document.scrollingElement.scrollHeight;
			let top_height = this.document.scrollingElement.scrollTop;
			if (((doc_height / 2) <= top_height) && $("input[name=page_flag]").val() == "0") {
				if (flow_control_flag) {
					window.removeEventListener("scroll", scrollEventHandler);
					onclick_login_open();
					return false;
				}
				$("input[name=page_flag]").val("1");
				process_feed_list(param);
			}
		}, scroll_reject);
	}
}

function scroll_reject() {
	let url = window.location.href;
	let range = $("input[name=distance_type]").val();
	let flow_control_flag = false;
	if (ajax_url_check_home(url))
		flow_control_flag = true;
	else if (ajax_url_check_myread(url))
		param = is_set_feed_range_scroll_reject(range, "myread");	
	else if (ajax_url_check_read(url))
		param = is_set_feed_range_scroll_reject(range, "read");
	else if (ajax_url_check_tag(url))
		param = is_set_feed_range_scroll_reject(range, "tag");
	else if (ajax_url_check_friend(url))
		param = is_set_feed_range_scroll_reject(range, "friend");
	let doc_height = this.document.scrollingElement.scrollHeight;
	let top_height = this.document.scrollingElement.scrollTop;
	if (((doc_height / 2) <= top_height) && $("input[name=page_flag]").val() == "0") {
		if (flow_control_flag) {
			window.removeEventListener("scroll", scrollEventHandler);
			onclick_login_open();
			return false;
		}
		$("input[name=page_flag]").val("1");
		process_feed_list(param);
	}
}

const feedService = new getFeedService();
let center_box = document.getElementsByClassName("center_container")[0];