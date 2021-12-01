function create_banner(dto_member, tag, tagcnt, friend_status, base_distance) {
	let html_str = "";
	console.log(dto_member);
	if(window.location.pathname == '/' || window.location.pathname == '/feed/read'){
	} else if(window.location.pathname == '/feed/myread'||(dto_member && session_id == dto_member.id)){
		html_str += '<div class="banner">';
		html_str += '<div class="banner_area">';
		html_str += '<div class="banner_profile_img"><img src="/member/storage/profile/'+dto_member.fname+'" alt="profile_img"></div>';
		html_str += '<div class="banner_inner">';
		html_str += '<div class="banner_inner_first">';
		html_str += '<span>'+dto_member.id+'</span>';
		html_str += '<button type="button" class="setting"><!-- <span class="glyphicon glyphicon-cog"></span> -->프로필 편집</button>';
		html_str += '</div>';
		html_str += '<div class="banner_inner_sec">';
		html_str +=	'<span>친구'+dto_member.friendcnt+'</span>';
		html_str +=	'<span>게시글'+dto_member.feedcnt+'</span>';
		html_str += '</div>';
		html_str += '<div class="banner_inner_second">';
		if(dto_member.introduction !== null){
			html_str += '<span>'+dto_member.introduction+'</span>';
		}
		html_str += '</div>';
		html_str += '</div>';
		html_str += '</div>';
	}else if(window.location.pathname == '/feed/tag'){
		html_str += '<div class="banner">';
		html_str += '<div class="banner_tag">';
		html_str += '<span>#'+tag+' '+tagcnt+'개</span>';
		html_str += '</div>';
	}else if(!dto_member){
		html_str += '<div class="banner">';
		html_str += '<div class="banner_empty">';
		html_str += '<span>존재하지 않는 사용자입니다.</span>';
		html_str += '</div>';
	}else if(window.location.pathname == '/feed/friend'){
		html_str += '<div class="banner">';
		html_str += '<div class="banner_area">';
		html_str += '<div class="banner_profile_img"><img src="/member/storage/profile/'+dto_member.fname+'" alt="profile_img"></div>';
		html_str += '<div class="banner_inner">';
		html_str += '<div class="banner_inner_first">';
		html_str += '<span>'+dto_member.id+'</span>';
		if(friend_status == 1){
			html_str += '<button type="button" class="friend_btn_3">친구신청받음</button>';
		}else if(friend_status == 2){
			html_str += '<button type="button" class="friend_btn_2">친구신청중</button>';
		}else if(friend_status == 3){
			html_str += '<button type="button" class="friend_btn_4">친구</button>';
		}else{
			html_str += '<button type="button" class="friend_btn_1" name="'+dto_member.id+'">친구신청</button>';
		}
//		html_str += '<button type="button" class="setting"><!-- <span class="glyphicon glyphicon-cog"></span> -->프로필 편집</button>';
		html_str += '</div>';
		html_str += '<div class="banner_inner_sec">';
		html_str +=	'<span>친구 '+dto_member.friendcnt+'</span>';
		html_str +=	'<span>게시물 '+dto_member.feedcnt+'</span>';
		html_str += '</div>';
		html_str += '<div class="banner_inner_second">';
		if(dto_member.introduction !== null){
			html_str += '<span>'+dto_member.introduction+'</span>';
		}
		html_str += '</div>';
		html_str += '</div>';
		html_str += '</div>';
	}
	// order_by_time
	html_str += '<div class="time_and_condition_container">';
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
	// show_search_condition
	html_str += '<div class="show_search_condition_container">';
	html_str += '<span>반경 <strong>' + base_distance * 100 * 2 + 'km</strong>';
	if ($("input[name=order_type]").val() == "recent") {
		html_str += " 내 <strong>최근순</strong> 게시물 검색 결과입니다"
	} else if ($("input[name=order_type]").val() == "old") {
		html_str += " 내 <strong>오래된순</strong> 게시물 검색 결과입니다"
	} else {
		html_str += " 내 게시물 검색 결과입니다"
	}
	html_str += '</span>';
	html_str += '</div>';
	html_str += '</div>';
	if(window.location.pathname == '/feed/friend'||window.location.pathname == '/feed/myread'||window.location.pathname == '/feed/tag'){
		html_str += '</div>';
	}
	return html_str;
}