<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<title>기본페이지</title>
<meta charset="utf-8">
<style type="text/css">
	.wrap {position: absolute;left: 0;bottom: 40px;width: 288px;height: 132px;margin-left: -144px;text-align: left;overflow: hidden;font-size: 12px;font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;line-height: 1.5;}
    .wrap * {padding: 0;margin: 0;}
    .wrap .info {width: 286px;height: 120px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
    .wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
    .info .title {padding: 5px 0 0 10px;height: 30px;background: #eee;border-bottom: 1px solid #ddd;font-size: 18px;font-weight: bold;}
    .info .close {position: absolute;top: 10px;right: 10px;color: #888;width: 17px;height: 17px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
    .info .close:hover {cursor: pointer;}
    .info .body {position: relative;overflow: hidden;}
    .info .desc {position: relative;margin: 13px 0 0 90px;height: 75px;}
    .desc .ellipsis {overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
    .desc .jibun {font-size: 11px;color: #888;margin-top: -2px;}
    .info .img {position: absolute;top: 6px;left: 5px;width: 73px;height: 71px;border: 1px solid #ddd;color: #888;overflow: hidden;}
    .info:after {content: '';position: absolute;margin-left: -12px;left: 50%;bottom: 0;width: 22px;height: 12px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
    .info .link {color: #5085BB;}
</style>
</head>
<body>

	<div class="container" id="map" style="width: 100vw; height: 100vh;">
		<div></div>
		<script type="text/javascript"
			src="//dapi.kakao.com/v2/maps/sdk.js?appkey=801160086c0950000271359e983c8bf2"></script>
		<script>
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			mapOption = {
				center : new kakao.maps.LatLng(37.52423, 127.06319), // 지도의 중심좌표
				level : 10
			// 지도의 확대 레벨
			};

			var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
			
			var positions = [
			    {
			        iwcontent: '<div style="padding :5px" class="img"><img src="./images/IMG_5857.JPG" width="200" height="150"></div>', 
			        latlng: new kakao.maps.LatLng(37.52423, 127.06319),
			        content: `<div class="wrap">
								<div class="info">
							        <div class="title">
						            7호선
						            <div class="close" title="닫기"></div>
						        </div>
						        <div class="body">
						            <div class="img">
						                <img src="./images/IMG_5857.JPG" width="73" height="70">
						            </div>
						            <div class="desc">
						                <div class="ellipsis">서울특별시 강남구 청담동 347</div>
						                <div class="jibun ellipsis">(우) 135-100 (지번) 청담동 347</div>
						                <div><a href="/update" target="_blank" class="link">수정</a></div>
						            </div> 
						        </div> 
						    </div>
						</div>`
						
			    },
			    {
			        iwcontent: '<div style="padding :5px" class="img"><img src="./images/IMG_6184.JPG" width="200" height="150"></div>', 
			        latlng: new kakao.maps.LatLng(37.37128, 126.72612),
			    	content: `<div class="wrap">
						    <div class="info">
						        <div class="title">
						            7호선
						            <div class="close" title="닫기"></div>
						        </div>
						        <div class="body">
						            <div class="img">
						                <img src="./images/IMG_6184.JPG" width="73" height="70">
						            </div>
						            <div class="desc">
						                <div class="ellipsis">서울특별시 강남구 청담동 347</div>
						                <div class="jibun ellipsis">(우) 135-100 (지번) 청담동 347</div>
						                <div><a href="/update" target="_blank" class="link">수정</a></div>
						            </div> 
						        </div> 
						    </div>
						</div>`
			    },
			    {
			        iwcontent: '<div style="padding :5px" class="img"><img src="./images/IMG_4079.JPG" width="200" height="150"></div>', 
			        latlng: new kakao.maps.LatLng(37.85255, 126.79097),
				    content: `<div class="wrap">
						    <div class="info">
						        <div class="title">
						            7호선
						            <div class="close" title="닫기"></div>
						        </div>
						        <div class="body">
						            <div class="img">
						                <img src="./images/IMG_4079.JPG" width="73" height="70">
						            </div>
						            <div class="desc">
						                <div class="ellipsis">서울특별시 강남구 청담동 347</div>
						                <div class="jibun ellipsis">(우) 135-100 (지번) 청담동 347</div>
						                <div><a href="/update" target="_blank" class="link">수정</a></div>
						            </div> 
						        </div> 
						    </div>
						</div>`
			    },
			    {
			        iwcontent: '<div style="padding :5px" class="img"><img src="./images/IMG_5947.JPG" width="200" height="150"></div',
			        latlng: new kakao.maps.LatLng(37.74449, 127.71479),
				    content: `<div class="wrap">
						    <div class="info">
						        <div class="title">
						            7호선
						            <div class="close" title="닫기"></div>
						        </div>
						        <div class="body">
						            <div class="img">
						                <img src="./images/IMG_5947.JPG" width="73" height="70">
						            </div>
						            <div class="desc">
						                <div class="ellipsis">서울특별시 강남구 청담동 347</div>
						                <div class="jibun ellipsis">(우) 135-100 (지번) 청담동 347</div>
						                <div><a href="/update" target="_blank" class="link">수정</a></div>
						            </div> 
						        </div> 
						    </div>
						</div>`
			    }
			];

			for (var i = 0; i < positions.length; i ++) {
			    // 마커를 생성합니다
			    var marker = new kakao.maps.Marker({
			        map: map, // 마커를 표시할 지도
			        position: positions[i].latlng // 마커의 위치
			    });

			    // 마커에 표시할 인포윈도우를 생성합니다 
			    var infowindow = new kakao.maps.InfoWindow({
			        content: positions[i].iwcontent // 인포윈도우에 표시할 내용
			    });
			    
			 	// 마커 위에 커스텀오버레이를 표시합니다
				// 마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정했습니다
				var overlay = new kakao.maps.CustomOverlay({
					clickable : true,
					content : positions[i].content,
					position : marker.getPosition()
				});
			 	
			    // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
			    // 이벤트 리스너로는 클로저를 만들어 등록합니다 
			    // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
			    kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
			    kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
			    kakao.maps.event.addListener(marker, 'click', makeClickListener(map, marker, infowindow, overlay));
			    
			}

			function makeOverListener(map, marker, infowindow) {
			    return function() {
			    	if(overlay.getMap() == null){
			        	infowindow.open(map, marker);
			    	}
			    };
			}

			// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
			function makeOutListener(infowindow) {
			    return function() {
			        infowindow.close();
			    };
			}
			
			function makeClickListener(map, marker, infowindow, overlay) {
				return function(){
					infowindow.close();
					overlay.setMap(map);
				}
			}

			// 커스텀 오버레이를 닫기 위해 호출되는 함수입니다 
			function closeOverlay() {
				return function(){
					this.overlay.setMap(null);
				}
			}
		</script>

	</div>
</body>
</html>