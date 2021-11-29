function delete_click(event) {
	//console.log(event.currentTarget.id);
	let param=document.getElementById("contentsno").value;
	//let param = {"contentsno": event.currentTarget.id};
	console.log(param);
	$(".modal_delete").show();
	
	$("#deleteBtn").click(function(e) {
    e.preventDefault();
    $.ajax({
        type: "POST",
        url: "/contents/delete",
        data: JSON.stringify(param),
        dataType: 'json',
        success: function(data) {
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

