function onclickTag(event) {
	openSearchbar();
	let tag_name = event.target.innerText;
	document.getElementById("searchInput").setAttribute("value", tag_name.substr(1, tag_name.length));
	document.getElementById("searchInput").focus();
}

function onclickId(event) {
	// 1) 현재 페이지에서 선택된 id 값을 저장
	let params = {'selected_id' : event.target.innerText};
	// 2) /feed/friend url로 이동
	url = "http://localhost:8005/feed/friend";
	send_post(url, params);
	// 3) 이동된 페이지의 input hidden의 value를 선택된 id로 변경
	// 이러한 구현 방식을 이용한 이유는 init_reject 시 선택된 id 값을 parameter로 넘겨줄 수 없기 때문 + input hidden 값을 get/post 방식을 사용하지 않고 넘겨주기 위함
	/*console.log("??");
	$("input[name=selected_id]").val(id);
	// 4) init_fetch_feed 실행
	let order = $("input[name=order_type]").val();
	init_fetch_feed(null, order);
	console.log("val : " + $("input[name=selected_id]").val());
*/}