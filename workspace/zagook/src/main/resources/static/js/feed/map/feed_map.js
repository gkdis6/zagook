var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = {
		center: new kakao.maps.LatLng(37.52423, 127.06319), // 지도의 중심좌표
		level: 8
		// 지도의 확대 레벨
	};
const map_main = new kakao.maps.Map(mapContainer, mapOption);
let overlays = [];

function displayMarker(data) {
	// 마커를 생성합니다
	var marker = new kakao.maps.Marker({
		map: map_main, // 마커를 표시할 지도
		position: data.latlng // 마커의 위치
	});
	overlays.push(marker);
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