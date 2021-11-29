function delete_click(event) {
	let param = {"contentsno": event.currentTarget.id};
	console.log(param);
	$(".modal_delete").show();
	
	$("#deleteBtn").click(function(e) {
    e.preventDefault();
    $.ajax({
        type: "POST",
        url: "/contents/delete",
        data: param,
        success: function(result) {
            alert('ok');
        },
        error: function(result) {
            alert('error');
        }
    });
});
}

$("#closeModal").click(function (e) {
$(".modal_delete").hide();
});

