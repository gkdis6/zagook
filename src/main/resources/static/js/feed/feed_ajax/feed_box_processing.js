function process_feed_list(param) {
    feedService
        .get_feed_list(param)
        .then(obj => {
			const map = new Map(Object.entries(obj));
			let list = map.get("sub_list");
			let dto_member = map.get("dto_member");
			let friend_status = map.get("friend_status");
			let base_distance = map.get("base_distance");
			let end_flag = map.get("end_flag");
			let tagcnt = map.get("tagcnt");
			let tag = map.get("tag");
            let html_str = "";
			
            console.log("[map type] : " + typeof(map));
            console.log(map);
            console.log("[list.length] : " + list.length);
            
            // banner
			if (end_flag == -1||end_flag == -2) {
				html_str += create_banner(dto_member, tag, tagcnt, friend_status, base_distance);
			}
			
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
                html_str += '<div class="feed_container" onclick="container_click(event)" id="' + list[i].contentsno + '" x_site="'+list[i].x_site+'" y_site="'+list[i].y_site+'" filename="'+list[i].filename+'">';
                
            // profile container
                html_str += '<div class="profile_container feed_padding">';
                
                // profile image area
                html_str += '<span class="profile_image_container">';
                html_str += '<img src="../images/feed/profile/' + list[i].fname + '" class="profile_img" alt="profile_img" loading="lazy">';
                html_str += '</span>';
                
                // user id area
                html_str += '<span class="user_id_container">';
                html_str += '<a href="javascript:void(0);" class="user_id" onclick="id_click(event);return false;">' + list[i].id + '</a>';
                html_str += '</span>';
                
                //update, delete dropdown area
                html_str += '<li class="dropdown" style="margin-left: auto; margin-right:20px; list-style:none;"><a class="dropdown-toggle" data-toggle="dropdown" href="#"><span class="glyphicon glyphicon-option-vertical"></span></a>';
                html_str += '<ul class="dropdown-menu"><li><a onclick="update_click(event)" id="' + list[i].contentsno + '" class="drop_update">수정';     
 				html_str += '<input type="hidden" id="privacy'+list[i].contentsno+'" value="'+list[i].privacy+'"></a></li>';  
                html_str += '<li><a class="delete__feed" name="'+list[i].contentsno+'">삭제</a></li>';
     
          
				html_str += '</ul></li>';
                
                html_str += '</div>';
                
                // image area
                html_str += '<div class="img_box_container" onclick="img_click(event)">';
                html_str += '<img src="../images/feed/img_box/' + list[i].filename + '" class="img_box" alt="img_box" id="imgsrc'+list[i].contentsno+'" name="'+list[i].filename+'">';
                html_str += '</div>';
                
                // tag area
                html_str += '<div id="tag_container'+list[i].contentsno+'" class="tag_container" name="'+list[i].tag_list+'">';
                if (list[i].tag_list != null) {
                    for (let j = 0; j < list[i].tag_list.length; j++) {
                        html_str += '<a href="javascript:void(0);" onclick="tag_click();return false;">';
                        html_str += '#' + list[i].tag_list[j];
                        html_str += '</a>';
                    }
                }
                html_str += '</div>';
                
                // contents area
                html_str += '<p class="content feed_padding" id="contents'+list[i].contentsno+'">' + list[i].contents + '</p>';
                
                // date area
                html_str += '<div class="date feed_padding">' + String(list[i].rdate).slice(0, -3) +'</div>';
                
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
				html_str += ' alt="like_img" onclick="like_click(event)" loading="lazy"> <span class="feed_widget_text">';
				html_str += numberFormatting(list[i].likecnt) + '</span>';
				html_str + '</span>';
				
				//reply area
				html_str += '<span class="reply_container">';
                html_str += '<img class="reply_icon" src="../images/feed/comment.png" alt="comments_img" loading="lazy" onclick="reply_click(event)" id="reply_btn'+list[i].contentsno+'"> <span class="feed_widget_text">'+list[i].reply+'</span>';
                html_str += '</span>';
                
                html_str += '</div>';
                html_str += '<div class="reply_box_container" id="reply-list'+list[i].contentsno+'">';
                html_str += '</div>';
                html_str += '</div>';
            }
            
			// insert searched range into selection box
			$(".select").find("span").text("Range : " + String(base_distance * 100 * 2) + "km");
			$("input[name=distance_type]").val(String(base_distance * 100 * 2));
            
            console.log(end_flag);
            if (end_flag == 1 || end_flag == -2) {
				html_str += '<div class="page_end_container" onclick="scroll_to_top();">Page End : ';
				if (base_distance == "no distance") {
					html_str += '게시물을 모두 찾았습니다.';
				} else {				
					html_str += '반경 ' + base_distance * 100 * 2 + 'km 내 게시물을 모두 찾았습니다.';
				}
				html_str += '</div>';
				
				if (window.location.pathname != '/')
					window.removeEventListener("scroll", scrollEventHandler);
			}
            let newElement = document.createElement('div');
			newElement.innerHTML = html_str;
            document.getElementById("center_container").appendChild(newElement);
            wait_loading();
			feed_end();
        })
        
}