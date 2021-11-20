var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = {
		center: new kakao.maps.LatLng(37.52423, 127.06319), // 지도의 중심좌표
		level: 10
		// 지도의 확대 레벨
	};
const map_main = new kakao.maps.Map(mapContainer, mapOption);
$(function () {
	//param is not allocated in navigator.geolocation.getCurrentPosition, so put the code repeatedly
	let param = null;
	getCoords()
	.then(coords => {
		if (coords == null) {
			if (window.location.href == "http://localhost:8005/feed/myread") {
				param = {"x_site": "37.5535462", "y_site": "126.964296", "url_id": "myread"};	
			} else if (window.location.href == "http://localhost:8005/feed/read"){
				param = {"x_site": "37.5535462", "y_site": "126.964296", "url_id": "read"};	
			}
		    process_feed_list(param);
		} else {
			if (window.location.href == "http://localhost:8005/feed/myread") {
				param = {"x_site": String(coords.latitude), "y_site": String(coords.longitude), "url_id": "myread"};	
			} else if (window.location.href == "http://localhost:8005/feed/read"){
				param = {"x_site": String(coords.latitude), "y_site": String(coords.longitude), "url_id": "read"};	
			}
		    process_feed_list(param);
		}
	})
	.catch(err => {
		console.log("Error Msg: " + err);
	});
});

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = {
		center: new kakao.maps.LatLng(37.52423, 127.06319), // 지도의 중심좌표
		level: 10
		// 지도의 확대 레벨
	};
const map_main = new kakao.maps.Map(mapContainer, mapOption);
	
function scrollEventHandler(event){
	let param = null;
	getCoords()
	.then(coords => {
		if (coords == null) {
			if (window.location.href == "http://localhost:8005/feed/myread") {
				param = {"x_site": "37.5535462", "y_site": "126.964296", "url_id": "myread"};	
			} else if (window.location.href == "http://localhost:8005/feed/read"){
				param = {"x_site": "37.5535462", "y_site": "126.964296", "url_id": "read"};	
			}
		    let doc_height = this.document.scrollingElement.scrollHeight;
			let top_height = this.document.scrollingElement.scrollTop;
		    let client_height = this.document.scrollingElement.clientHeight;
			if (top_height + client_height >= doc_height) {
				process_feed_list(param);
			}
		} else {
			if (window.location.href == "http://localhost:8005/feed/myread") {
				param = {"x_site": String(coords.latitude), "y_site": String(coords.longitude), "url_id": "myread"};	
			} else if (window.location.href == "http://localhost:8005/feed/read"){
				param = {"x_site": String(coords.latitude), "y_site": String(coords.longitude), "url_id": "read"};	
			}
		    let doc_height = this.document.scrollingElement.scrollHeight;
			let top_height = this.document.scrollingElement.scrollTop;
		    let client_height = this.document.scrollingElement.clientHeight;
			if (top_height + client_height >= doc_height) {
				process_feed_list(param);
			}
		}
	})
	.catch(err => {
		console.log("Error Msg: " + err);
	});
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
                html_str += '<div class="feed_container" onclick="container_click(event)" id="' + list[i].contentsno + '">';
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
                        html_str += '<a class="feed_padding" href="javascript:void(0);" onclick="tag_click();return false;">';
                        html_str += '#' + list[i].tag_list[j];
                        html_str += '</a>';
                    }
                }
                html_str += '<p class="content feed_padding">' + list[i].contents + '</p>';
                html_str += '<div class="date feed_padding">' + toStringByFormatting(new Date(list[i].rdate), '.') +'</div>';
                html_str += '<div class="accessory feed_padding">';
                // like area
                html_str += '<img src="../images/feed/';
                if (list[i].like_clicked > 0) {
					html_str += 'like_fill.png"';
				} else {
					html_str += 'like_outline.png"';
				}
				html_str += ' alt="like_img" width="28px" onclick="like_click(event)"> <span class="feed_widget_text">';
				html_str += numberFormatting(list[i].likecnt) + '</span>';
                html_str += '<img src="../images/feed/comment.png" alt="comments_img" width="28px"> <span class="feed_widget_text">Comments</span>';
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

function displayMarker(data) {
	console.log("되는 중");
	// 마커를 생성합니다
	var marker = new kakao.maps.Marker({
		map: map_main, // 마커를 표시할 지도
		position: data.latlng // 마커의 위치
	});
	// 마커에 표시할 인포윈도우를 생성합니다 
	var infowindow = new kakao.maps.InfoWindow({
		content: data.iwcontent // 인포윈도우에 표시할 내용
	});
	kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map_main, marker, infowindow));
	kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
	kakao.maps.event.addListener(marker, 'click', hrefon(data.contentsno));
}
function makeOverListener(map, marker, infowindow) {
	return function () {
		infowindow.open(map, marker);
	};
}
function makeOutListener(infowindow) {
	return function () {
		infowindow.close();
	};
}
function hrefon(id){
	return function(){
		location.href = '#'+id;
	};
}