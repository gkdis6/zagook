function feed_end() {
	let str = $(".page_end_container").text();
	$(".page_end_container").hover(function() {
		$( this ).text( "클릭 시 페이지 상단으로 이동합니다.");
	}, function() { 
		$( this ).text(str);
	});
}

function remove_feed() {
	$(".order_by_time_container").remove();
  	$(".feed_container").remove();
  	$(".page_end_container").remove();
	$(".banner").remove();
}

function order_by_time() {
	$("input[name=order_type]").val("time");
	$(".loader-wrapper").fadeIn("slow");
	remove_feed();
	let str = $("input[name=distance_type]").val();
	let range = str == "Select Range" ? null : str;
	init_fetch_feed(range, $("input[name=order_type]").val());
}