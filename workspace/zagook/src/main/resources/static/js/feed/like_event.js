// if default = 0, like_click = 1, 
let event_flag = 0;

function like_click(event) {
	event_flag = 1;
	console.log(event_flag);
}

function tag_click(event) {
	event_flag = 2;
}

function container_click(event) {
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
	} else if (event_flag == 2) {
		onclickTag(event);
	} else if(event_flag == 0){
		let filename = event.currentTarget.getAttribute("filename");
		let posi = new kakao.maps.LatLng(event.currentTarget.getAttribute("x_site"), event.currentTarget.getAttribute("y_site"));
		let infowindow = new kakao.maps.InfoWindow({
			map: map_main,
			position: posi,
			content: '<img style="padding:20px 5px 5px 5px; width:150px; height:auto;"src="/contents/storage/'+filename+'">',
			removable: true
		});
		map_main.setCenter(posi);
	}
	
	
	// after processing, should be change flag to default(0)
	event_flag = 0;
}

			