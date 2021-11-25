function feed_end() {
	let str = $(".page_end_container").text();
	$(".page_end_container").hover(function() {
		$( this ).text( "클릭 시 페이지 상단으로 이동합니다.");
	}, function() { 
		$( this ).text(str);
	});
}