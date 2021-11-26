$(".modal_img button").click(function(){
	$(".modal_img").hide();
});
	
$(".modal_img").click(function (e) {
    if (e.target.className != "modal_img") {
      return false;
    } else {
      $(".modal_img").hide();
    }
});