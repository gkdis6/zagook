$(function () {
    let param = { "id": "user_1", "x_site": "37.5535462", "y_site": "126.964296"};
    process_feed_list(param);
});

$(document).ready(function () {
	window.addEventListener("scroll", function(event){
        let doc_height = this.document.scrollingElement.scrollHeight;
		let top_height = this.document.scrollingElement.scrollTop;
        let client_height = this.document.scrollingElement.clientHeight;
		console.log(top_height);
        console.log(doc_height);
        // let param = {"id": $(id), "x_site" : $(x_site), "y_site" : $(y_site)};
        let param = {"id": "user_1", "x_site" : "37.5535462", "y_site" : "126.964296"};
		if (top_height + client_height >= doc_height) {
			process_feed_list(param);
		}
    });
});

const feedService = new getFeedService();
//let center_box = $(".center_container");
let center_box = document.getElementsByClassName("center_container")[0];

function process_feed_list(param) {
    feedService
        .get_feed_list(param)
        .then(list => {
            let html_str = "";

            console.log("[list.length] : " + list.length);

            for (let i = 0; i < list.length; i++) {
				console.log("[list.length] repeate : " + i);
				console.log("[list " + i + "] " + typeof(list[i]));
                html_str += '<div class="feed_container">';
                html_str += '<div class="profile_container feed_padding">';
                html_str += '<img src="../images/feed/profile/' + list[i].fname + '" class="profile_img" alt="profile_img">';
                html_str += '<h3 class="name feed_padding">' + list[i].mname + '</h3>';
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
				html_str += ' alt="like_img" width="28px"> <span class="feed_widget_text">Like</span>';
                html_str += '<img src="../images/feed/comment.png" alt="comments_img" width="28px"> <span class="feed_widget_text">Comments</span>';
                html_str += '</div>';
                html_str += '</div>';
            }
            center_box.innerHTML += html_str;
            console.log(html_str);
        })
        .catch(err => {
            console.log("Error Msg: " + err);
        });
}