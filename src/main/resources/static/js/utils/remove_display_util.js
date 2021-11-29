function remove_front_display() {
	$(".loader-wrapper").fadeIn("slow");
  	remove_feed();
    //kakao.maps.event.trigger(marker, 'custom_action');
    removeOverlays();
}

function remove_feed() {
	$(".order_by_time_container").remove();
  	$(".feed_container").remove();
  	$(".page_end_container").remove();
	$(".banner").remove();
}

function removeOverlays() {
    var len = overlays.length, i = 0;

    for (; i < len; i++) {
        overlays[i].setMap(null);
    }

    overlays = [];
}

