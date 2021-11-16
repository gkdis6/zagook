
$(function () {
	//param is not allocated in navigator.geolocation.getCurrentPosition, so put the code repeatedly
	let param = null;
	if (navigator.geolocation) {
	    //위치 정보를 얻기
	    navigator.geolocation.getCurrentPosition (function(pos) {
		    param = {"x_site": String(pos.coords.latitude), "y_site": String(pos.coords.longitude)};
		    process_feed_list(param);
	    });
	} else {
		// 서울역 기준 위치 정보
	    param = {"x_site" : "37.5535462", "y_site" : "126.964296"};
	    process_feed_list(param);
	}
});

function scrollEventHandler(event){
	let param = null;
	if (navigator.geolocation) {
	    //위치 정보를 얻기
	    navigator.geolocation.getCurrentPosition (function(pos) {
		    param = {"x_site": pos.coords.latitude, "y_site": pos.coords.longitude};
		    let doc_height = this.document.scrollingElement.scrollHeight;
			let top_height = this.document.scrollingElement.scrollTop;
		    let client_height = this.document.scrollingElement.clientHeight;
			if (top_height + client_height >= doc_height) {
				process_feed_list(param);
			}
	    });
	} else {
		// 서울역 기준 위치 정보
	    param = {"x_site" : "37.5535462", "y_site" : "126.964296"};
	    let doc_height = this.document.scrollingElement.scrollHeight;
		let top_height = this.document.scrollingElement.scrollTop;
	    let client_height = this.document.scrollingElement.clientHeight;
		if (top_height + client_height >= doc_height) {
			process_feed_list(param);
		}
	}
}

$(document).ready(function () {
	window.addEventListener("scroll", scrollEventHandler);
});

const feedService = new getFeedService();
let center_box = document.getElementsByClassName("center_container")[0];

function process_feed_list(param) {
    feedService
        .get_feed_list(param)
        .then(obj => {
			const map = new Map(Object.entries(obj));
			let list = map.get("sub_list");
			let base_distance = map.get("base_distance");
			let end_flag = map.get("end_flag");
            let html_str = "";

            console.log("[map type] : " + typeof(map));
            console.log(map);
            console.log("[list.length] : " + list.length);

            for (let i = 0; i < list.length; i++) {
				console.log("[list.length] repeate : " + i);
				console.log("[list " + i + "] " + typeof(list[i]));
                html_str += '<div class="feed_container">';
                html_str += '<div class="profile_container feed_padding">';
                html_str += '<img src="../images/feed/profile/' + list[i].fname + '" class="profile_img" alt="profile_img">';
                html_str += '<h3 class="name feed_padding">' + list[i].id + '</h3>';
                html_str += '</div>';
                html_str += '<div class="img_box_container">';
                html_str += '<img src="../images/feed/img_box/' + list[i].filename + '" class="img_box" alt="img_box">';
                html_str += '</div>';
                //tag area
                if (list[i].tag_list != null) {
                    for (let j = 0; j < list[i].tag_list.length; j++) {
                        html_str += '<a class="title feed_padding">';
                        html_str += '#' + list[i].tag_list[j];
                        html_str += '</a>';
                    }
                }
                html_str += '<p class="content feed_padding">' + list[i].contents + '</p>';
                html_str += '<div class="date feed_padding">' + toStringByFormatting(new Date(list[i].rdate), '.') +'</div>';
                html_str += '<div class="accessory feed_padding">';
                html_str += '<img src="../images/feed/';
                if (list[i].like_clicked > 0) {
					html_str += 'like_fill.png"';
				} else {
					html_str += 'like_outline.png"';
				}
				html_str += ' alt="like_img" width="28px"> <span class="feed_widget_text">';
				html_str += numberFormatting(list[i].likecnt) + '</span>';
                html_str += '<img src="../images/feed/comment.png" alt="comments_img" width="28px"> <span class="feed_widget_text">Comments</span>';
                html_str += '</div>';
                html_str += '</div>';
            }
            if (end_flag == true) {
				html_str += '<span><strong>Page End: 반경 ';
				html_str += base_distance * 100 * 2 + 'km 안에 게시물이 더 이상 없습니다.';
				html_str += '</strong></span>';
				window.removeEventListener("scroll", scrollEventHandler);
			}
            center_box.innerHTML += html_str;
        })
        .catch(err => {
            console.log("Error Msg: " + err);
        });
}