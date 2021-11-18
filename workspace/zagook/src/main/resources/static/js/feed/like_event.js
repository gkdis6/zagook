// if default = 0, like_click = 1, 
let event_flag = 0;

function like_click(event) {
	event_flag = 1;
	console.log(event_flag);
}

function container_clicK(event) {
	console.log(event_flag);
	if (event_flag == 1) {
		console.log(event.currentTarget.id);
		let param = {"contentsno": event.currentTarget.id};
		let result = 0;
		$.ajax({
			url : "/feed/like",
			type : "POST",
			data : JSON.stringify(param),
			dataType : 'json',
			contentType : "application/json; charset=utf-8;",
			success : function(data, status, xhr){
				if (data.like == "like")
					event.target.src = "../images/feed/like_fill.png";
				else if (data.like == "unlike")
					event.target.src = "../images/feed/like_outline.png";
				event.target.nextElementSibling.innerText = data.like_cnt;
			},
			error: function (xhr, status, err) {
                console.log(err);
            }
		});
	}
	
	// after processing, should be change flag to default(0)
	event_flag = 0;
}