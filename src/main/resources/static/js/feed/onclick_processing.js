function onclickTag(event) {
	// 1) 현재 페이지에서 선택된 tag 값을 post 파라미터로 전달
	let tag_name = event.target.innerText;
	let params = {'selected_id' : tag_name.substr(1, tag_name.length)};
	// 2) /feed/friend url로 이동
	url = "http://localhost:8005/feed/tag";
	send_post(url, params);
}

function onclickId(event) {
	// 1) 현재 페이지에서 선택된 id 값을 post 파라미터로 전달
	let params = {'selected_id' : event.target.innerText};
	// 2) /feed/friend url로 이동
	
	if(params.selected_id == session_id){
		url = "http://localhost:8005/feed/myread";
		location.href = url;
	}else{
		url = "http://localhost:8005/feed/friend";
		send_post(url, params);
	}
}

function onclick_search_id(event) {
	console.log(event.target);
}

function onclick_time(event) {
	console.log(event.currentTarget);
	console.log($(event.currentTarget).find('#time_checkbox').is(':checked'));
	let time_flag = $(event.currentTarget).find('#time_checkbox').is(':checked')
	let str = $("input[name=distance_type]").val().trim();
	let range = (str == "Select Range" || str.length == 0)? null : str;
	remove_front_display();
	if (time_flag == false) {
		// 최신순 정렬
		$("input[name=order_type]").val("recent");
		init_fetch_feed(range, "recent");
	} else {
		// 오래된순 정렬
		$("input[name=order_type]").val("old");
		init_fetch_feed(range, "old");
	}
}