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
            let html_str = "";
            let end_flag_2 = 0;
			
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
				
                // order by timeline
                if (end_flag == -1||end_flag == -2) {
					if(window.location.pathname == '/feed/read'){
					}else if(window.location.pathname == '/feed/myread'||session_id == dto_member.id){
						html_str += '<div class="banner">';
						html_str += '<div class="banner_area">';
						html_str += '<div class="banner_profile_img"><img src="/member/storage/profile/'+dto_member.fname+'" alt="profile_img"></div>';
						html_str += '<div class="banner_inner">';
						html_str += '<div class="banner_inner_first">';
						html_str += '<span>'+dto_member.id+'</span>';
						html_str += '<button type="button" class="setting"><!-- <span class="glyphicon glyphicon-cog"></span> -->프로필 편집</button>';
						html_str += '</div>';
						html_str += '<div class="banner_inner_second">';
						if(dto_member.introduction !== undefined){
							html_str += '<span>'+dto_member.introduction+'</span>';
						}
						html_str += '</div>';
						html_str += '</div>';
						html_str += '</div>';
					}else if(window.location.pathname == '/feed/friend'){
						html_str += '<div class="banner">';
						html_str += '<div class="banner_area">';
						html_str += '<div class="banner_profile_img"><img src="/member/storage/profile/'+dto_member.fname+'" alt="profile_img"></div>';
						html_str += '<div class="banner_inner">';
						html_str += '<div class="banner_inner_first">';
						html_str += '<span>'+dto_member.id+'</span>';
						if(friend_status == 1){
							html_str += '<button type="button" class="friend_btn_2"disabled>친구신청중</button>';
						}else if(friend_status == 2){
							html_str += '<button type="button" class="friend_btn_3"disabled>친구신청받음</button>';
						}else if(friend_status == 3){
							html_str += '<button type="button" class="friend_btn_4"disabled>친구</button>';
						}else{
							html_str += '<button type="button" class="friend_btn_1">친구신청</button>';
						}
//						html_str += '<button type="button" class="setting"><!-- <span class="glyphicon glyphicon-cog"></span> -->프로필 편집</button>';
						html_str += '</div>';
						html_str += '<div class="banner_inner_second">';
						if(dto_member.introduction !== undefined){
							html_str += '<span>'+dto_member.introduction+'</span>';
						}
						html_str += '</div>';
						html_str += '</div>';
						html_str += '</div>';
					}
					//html_str += '<div class="order_by_time_container" onclick="order_by_time();">게시물을'
					html_str += '<div class="order_by_time_container" onclick="time_container_click(event);"><div>게시물을</div>'
					html_str += '<div class="time_button_cover">\
							        <div class="time_button r" id="time_button_9">';
					if ($("input[name=order_type]").val() == "old") {
						html_str +=      '<input type="checkbox" class="time_checkbox" id="time_checkbox" checked>';
					} else {
						html_str +=      '<input type="checkbox" class="time_checkbox" id="time_checkbox">';
					}
					html_str +=		     '<div class="time_knobs">\
							            <span></span>\
							          </div>\
							          <div class="time_layer"></div>\
							        </div>\
							    </div>';
					html_str += '<div class="time_click_container">으로 정렬하려면<div class="time_click" onclick="time_click();">클릭</div>해주세요</div></div>';
					if(window.location.pathname == '/feed/friend'||window.location.pathname == '/feed/myread'){
						html_str += '</div>';
					}
					end_flag = 0;
					end_flag_2 = 1;
				}
                
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
                
                html_str += '</div>';
                
                // image area
                html_str += '<div class="img_box_container" onclick="img_click(event)">';
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
                html_str += '<img class="reply_icon" src="../images/feed/comment.png" alt="comments_img" loading="lazy"> <span class="feed_widget_text">Comments</span>';
                html_str += '</span>';
                
                
                html_str += '</div>';
                
                html_str += '</div>';
            }
            
			// insert searched range into selection box
			$(".select").find("span").text("Range : " + String(base_distance * 100 * 2) + "km");
			$("input[name=distance_type]").val(String(base_distance * 100 * 2));
            
            if (end_flag == 1 || end_flag == -2) {
				// if(end_flag_2 != 1){
					if(window.location.pathname == '/feed/friend'){
						html_str += '<div class="banner">';
						html_str += '<div class="banner_area">';
						html_str += '<div class="banner_profile_img"><img src="/member/storage/profile/'+dto_member.fname+'" alt="profile_img"></div>';
						html_str += '<div class="banner_inner">';
						html_str += '<div class="banner_inner_first">';
						html_str += '<span>'+dto_member.id+'</span>';
						if(friend_status == 1){
							html_str += '<button type="button" class="friend_btn_2"disabled>친구신청중</button>';
						}else if(friend_status == 2){
							html_str += '<button type="button" class="friend_btn_3"disabled>친구신청받음</button>';
						}else if(friend_status == 3){
							html_str += '<button type="button" class="friend_btn_4"disabled>친구</button>';
						}else{
							html_str += '<button type="button" class="friend_btn_1">친구신청</button>';
						}
//						html_str += '<button type="button" class="setting"><!-- <span class="glyphicon glyphicon-cog"></span> -->프로필 편집</button>';
						html_str += '</div>';
						html_str += '<div class="banner_inner_second">';
						if(dto_member.introduction !== undefined){
							html_str += '<span>'+dto_member.introduction+'</span>';
						}
						html_str += '</div>';
						html_str += '</div>';
						html_str += '</div>';
						html_str += '</div>'
					}
				// }
				end_flag_2 = 0;
				html_str += '<div class="page_end_container" onclick="scroll_to_top();">Page End : ';
				if (base_distance == "no distance") {
					html_str += '게시물을 모두 찾았습니다.';
				} else {				
					html_str += '반경 ' + base_distance * 100 * 2 + 'km 내 게시물을 모두 찾았습니다.';
				}
				html_str += '</div>';
				
				// add mouseenter, and mouseleave
				window.removeEventListener("scroll", scrollEventHandler);
			}
            let newElement = document.createElement('div');
			newElement.innerHTML = html_str;
            document.getElementById("center_container").appendChild(newElement);
            wait_loading();
			feed_end();
        })
        
}