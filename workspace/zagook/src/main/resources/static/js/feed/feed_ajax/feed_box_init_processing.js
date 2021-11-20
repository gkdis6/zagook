function init_process_feed_list(param) {
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
				var position = {
					iwcontent: '<div class="infowindow" style="width: 140px; height: auto; padding: 5px;" id="info'+list[i].contentsno+'"><img src="/contents/storage/'+list[i].filename+'" width="138px" height="auto"></div>',
					latlng: new kakao.maps.LatLng(list[i].x_site, list[i].y_site),
					filename: list[i].filename,
					//fname: list[i].fname,
					//content: list[i].contents,
					likecnt: list[i].likecnt,
					//rdate: list[i].rdate,
					//privacy: list[i].privacy,
					//id: list[i].id,
					contentsno: list[i].contentsno
					//tag_list: list[i].tag_list,
					//like_clicked: list[i].like_clicked
				};
				displayMarker(position);
				console.log(position);
				console.log("[list.length] repeate : " + i);
				console.log("[list " + i + "] " + typeof(list[i]));
				
                
 				//----- <Feed container> ------------------------------------
                html_str += '<div class="feed_container" onclick="container_click(event)" id="' + list[i].contentsno + '">';
                
            // profile container
                html_str += '<div class="profile_container feed_padding">';
                
                // profile image area
                html_str += '<span class="profile_image_container">';
                html_str += '<img src="../images/feed/profile/' + list[i].fname + '" class="profile_img" alt="profile_img">';
                html_str += '</span>';
                
                // user id area
                html_str += '<span class="user_id_container">';
                html_str += '<a href="javascript:void(0);" class="user_id">' + list[i].id + '</a>';
                html_str += '</span>';
                
                html_str += '</div>';
                
                // image area
                html_str += '<div class="img_box_container">';
                html_str += '<img src="../images/feed/img_box/' + list[i].filename + '" class="img_box" alt="img_box">';
                html_str += '</div>';
                
                // tag area
                html_str += '<div id="tag_container" class="tag_container">';
                if (list[i].tag_list != null) {
                    for (let j = 0; j < list[i].tag_list.length; j++) {
                        html_str += '<a href="javascript:void(0);" onclick="tag_click();return false;">';
                        html_str += '#' + list[i].tag_list[j];
                        html_str += '</a>';
                    }
                }
                html_str += '</div>';
                
                // contents area
                html_str += '<p class="content feed_padding">' + list[i].contents + '</p>';
                
                // date area
                html_str += '<div class="date feed_padding">' + toStringByFormatting(new Date(list[i].rdate), '.') +'</div>';
                
            // accessory container
                html_str += '<div class="accessory feed_padding">';
                
                // like area
                html_str += '<span class="like_container">';
                html_str += '<img class="like_icon" src="../images/feed/';
                if (list[i].like_clicked > 0) {
					html_str += 'like_fill.png"';
				} else {
					html_str += 'like_outline.png"';
				}
				html_str += ' alt="like_img" onclick="like_click(event)"> <span class="feed_widget_text">';
				html_str += numberFormatting(list[i].likecnt) + '</span>';
				html_str + '</span>';
				
				//reply area
				html_str += '<span class="reply_container">';
                html_str += '<img class="reply_icon" src="../images/feed/comment.png" alt="comments_img"> <span class="feed_widget_text">Comments</span>';
                html_str += '</span>';
                
                
                html_str += '</div>';
                
                html_str += '</div>';
            }
            if (end_flag == true) {
				html_str += '<span><strong>Page End: ';
				if (base_distance == "no distance") {
					html_str += '게시물이 더 이상 없습니다.';
				} else {				
					html_str += '반경 ' + base_distance * 100 * 2 + 'km 안에 게시물이 더 이상 없습니다.';
				}
				html_str += '</strong></span>';
				window.removeEventListener("scroll", scrollEventHandler);
			}
            center_box.innerHTML += html_str;
        })
        .catch(err => {
			console.log("Error Msg: " + err);
		});
}