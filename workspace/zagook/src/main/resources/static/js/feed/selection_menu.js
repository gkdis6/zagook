$(function(){
	$('.selection_box').click(function () {
        $(this).toggleClass('active');
        $(this).find('.selection_box_menu').slideToggle(500);
    });
    $('.selection_box').focusout(function () {
        $(this).removeClass('active');
        $(this).find('.selection_box_menu').slideUp(500);
    });
    $('.selection_box .selection_box_menu li').click(function () {
        $(this).parents('.selection_box').find('span').text("Range : " + $(this).text());
        /*$(this).parents('.selection_box').find('input').attr('value', "Range : " + $(this).attr('id'));*/
        $(".loader-wrapper").fadeIn("slow");
      	remove_feed();
        //kakao.maps.event.trigger(marker, 'custom_action');
        removeOverlays();
      	$("input[name=distance_type]").val($(this).text().split("k")[0]);
        search_by_select($("input[name=distance_type]").val());
    });
});

function search_by_select(range) {
	init_fetch_feed(range, "distance");
}

function removeOverlays() {
    var len = overlays.length, i = 0;

    for (; i < len; i++) {
        overlays[i].setMap(null);
    }

    overlays = [];
}