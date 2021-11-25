function onclickTag(event) {
	if (document.getElementById("searchInput") == null)
		openSearchbar();
	let tag_name = event.target.innerText;
	console.log(tag_name);
	$("#searchInput").val(tag_name.substr(1, tag_name.length));
	$("#searchInput").focus();
}

function onclickId(event) {
	// 1) 현재 페이지에서 선택된 id 값을 post 파라미터로 전달
	let params = {'selected_id' : event.target.innerText};
	// 2) /feed/friend url로 이동
	url = "http://localhost:8005/feed/friend";
	send_post(url, params);
}

function onclick_search_id(event) {
	console.log(event.target);
}