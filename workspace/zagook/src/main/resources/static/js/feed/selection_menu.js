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
        $(this).parents('.selection_box').find('input').attr('value', "Range : " + $(this).attr('id'));
 //       search_by_select();
    });
});

/*function search_by_select() {
	init_fetch_feed() {
		
	}
}*/