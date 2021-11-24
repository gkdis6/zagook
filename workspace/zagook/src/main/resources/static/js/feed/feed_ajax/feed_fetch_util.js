const base_x_site = "37.5535462";
const base_y_site = "126.964296";

//pos 객체가 제대로 넘어오는지 확인하기

function is_set_feed_range(range, pos, url_id, order) {
	if (range == null) {
		return {"x_site": String(pos.coords.latitude), "y_site": String(pos.coords.longitude), "url_id": String(url_id), "load_type": "reload", "range" : "null", "order_type" : order};	
	} else {
		return {"x_site": String(pos.coords.latitude), "y_site": String(pos.coords.longitude), "url_id": String(url_id), "load_type": "reload", "range" : String(range), "order_type" : order};
	}
}

function is_set_feed_range_reject(range, url_id, order) {
	if (range == null) {
		return {"x_site": base_x_site, "y_site": base_y_site, "url_id": String(url_id), "load_type": "reload", "range" : "null", "order_type" : order};	
	} else {
		return {"x_site": base_x_site, "y_site": base_y_site, "url_id": String(url_id), "load_type": "reload", "range" : String(range), "order_type" : order};
	}
}

function is_set_feed_range_scroll(range, pos, url_id) {
	if (range == null) {
		return {"x_site": String(pos.coords.latitude), "y_site": String(pos.coords.longitude), "url_id": String(url_id), "load_type": "scroll", "range" : "null", "order_type" : "empty"};	
	} else {
		return {"x_site": String(pos.coords.latitude), "y_site": String(pos.coords.longitude), "url_id": String(url_id), "load_type": "scroll", "range" : String(range), "order_type" : "empty"};
	}
}

function is_set_feed_range_scroll_reject(range, url_id) {
	if (range == null) {
		return {"x_site": base_x_site, "y_site": base_y_site, "url_id": String(url_id), "load_type": "scroll", "range" : "null", "order_type" : "empty"};	
	} else {
		return {"x_site": base_x_site, "y_site": base_y_site, "url_id": String(url_id), "load_type": "scroll", "range" : String(range), "order_type" : "empty"};
	}
}