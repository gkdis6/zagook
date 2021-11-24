// if default = 0, like_click = 1, 
let event_flag = 0;
let overlay_pre= new kakao.maps.CustomOverlay({
	xAnchor: 0.5,
	yAnchor: 1
});

function like_click(event) {
	event_flag = 1;
	console.log(event_flag);
}

function tag_click(event) {
	event_flag = 2;
	console.log(event_flag);
}

function id_click(event) {
	event_flag = 3;
	console.log(event_flag);
}

function img_click(event) {
	event_flag = 3;
	$(".modal_img").show();
	var imgSrc = event.target.getAttribute("src");
	
	$(".modal_imgBox img").attr("src", imgSrc);
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
	} else if (event_flag == 3) {
		onclickId(event);
	} else if(event_flag == 0){
		let filename = event.currentTarget.getAttribute("filename");
		let posi = new kakao.maps.LatLng(event.currentTarget.getAttribute("x_site"), event.currentTarget.getAttribute("y_site"));
		overlay_pre.setMap(null);
		var div1 = document.createElement('div');
		div1.className = 'wrap';
		var div2 = document.createElement('div');
		div2.className = 'info';
		var div3 = document.createElement('div');
		div3.className = 'title';
		var closeBtn = document.createElement('button');
		closeBtn.className = 'close';
		closeBtn.onclick = function () {
			overlay_pre.setMap(null);
		};
		div3.appendChild(closeBtn);
		div2.appendChild(div3);
		div1.appendChild(div2);
		var div4 = document.createElement('div');
		div4.className = 'body';
		var div5 = document.createElement('div');
		div5.className = 'img';
		div5.innerHTML = '<img style="width:150px; height:auto;"src="/contents/storage/'+filename+'">';
		div4.appendChild(div5);
		div1.appendChild(div4);
		overlay_pre.setContent(div1);
		overlay_pre.setPosition(posi);
		overlay_pre.setMap(map_main);
		overlays.push(overlay_pre);
	}
	// after processing, should be change flag to default(0)
	event_flag = 0;
}

			