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
        remove_front_display();
      	$("input[name=distance_type]").val($(this).text().split("k")[0]);
        search_by_select($("input[name=distance_type]").val());
    });
});

function search_by_select(range) {
	init_fetch_feed(range, "distance");
}