<%@ page contentType="text/html; charset=UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
  <head>
    <title>기본페이지</title>
    <meta charset="utf-8" />
    <style type="text/css">
      .wrap {
        position: absolute;
        left: 2;
        bottom: 51px;
        width: 500px;
        height: 500px;
        margin-left: -250px;
        text-align: left;
        font-size: 12px;
        font-family: "Malgun Gothic", dotum, "돋움", sans-serif;
        line-height: 1.5;
        white-space: normal;
        height: auto;
      }
      .wrap * {
        padding: 0;
        margin: 0;
        white-space: normal;
        height: auto;
      }
      .wrap .info {
        width: 500px;
        height: auto;
        border-radius: 5px;
        border-bottom: 2px solid #ccc;
        border-right: 1px solid #ccc;
        background: #fff;
      }
      .wrap .info:nth-child(1) {
        border: 0;
        box-shadow: 0px 1px 1px #888;
      }
      .info .title {
        padding: 5px 0 0 10px;
        height: 30px;
        background: #eee;
        border-bottom: 1px solid #ddd;
        font-size: 18px;
        font-weight: bold;
      }
      .info .close {
        position: absolute;
        top: 10px;
        right: 10px;
        color: #888;
        width: 17px;
        height: 17px;
        background: url("https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png");
      }
      .info .close:hover {
        cursor: pointer;
      }
      .info .body {
        position: relative;
        overflow: hidden;
        width: 500px;
        height: 500px;
      }
      .info .desc {
        position: relative;
        height: auto;
      }
      .desc .ellipsis {
        overflow: hidden;
        height: auto;
      }
      .info .img {
        position: absolute;
        margin: 5px;
        width: 490px;
        height: auto;
        color: #888;
      }
      .info:after {
        content: "";
        position: absolute;
        margin-left: -11px;
        left: 50%;
        bottom: -12;
        width: 24px;
        height: 12px;
        background: url("https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png");
      }
    </style>
  </head>
  <body>
    <div class="container" id="map" style="width: 100vw; height: 100vh">
      <script
        type="text/javascript"
        src="//dapi.kakao.com/v2/maps/sdk.js?appkey=801160086c0950000271359e983c8bf2"
      ></script>
      <script>
        window.onload = function(){
        	var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        	mapOption = {
        		center : new kakao.maps.LatLng(37.52423, 127.06319), // 지도의 중심좌표
        		level : 10
        	// 지도의 확대 레벨
        	};

        	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

        	var positions = [
        	    {
        	        iwcontent: '<div style="padding :5px" class="img"><img src="./images/IMG_5857.JPG" width="auto" height="150"></div>',
        	        latlng: new kakao.maps.LatLng(37.52423, 127.06319)
        	    },
        	    {
        	        iwcontent: '<div style="padding :5px" class="img"><img src="./images/IMG_6184.JPG" width="auto" height="150"></div>',
        	        latlng: new kakao.maps.LatLng(37.37128, 126.72612)
        	    },
        	    {
        	        iwcontent: '<div style="padding :5px" class="img"><img src="./images/IMG_4079.JPG" width="auto" height="150"></div>',
        	        latlng: new kakao.maps.LatLng(37.85255, 126.79097)
        	    },
        	    {
        	        iwcontent: '<div style="padding :5px" class="img"><img src="./images/IMG_5947.JPG" width="auto" height="150"></div>',
        	        latlng: new kakao.maps.LatLng(37.74449, 127.71479)
        	    }
        	];

        	if(navigator.geolocation){
        		navigator.geolocation.getCurrentPosition(function(position) {
        			alert(position.coords.latitude + ' ' + position.coords.longitude);
        			var marker = new kakao.maps.Marker({
        		        map: map,
        		        position: new kakao.maps.LatLng(position.coords.latitude, position.coords.longitude)
        		    });
        			var infowindow = new kakao.maps.InfoWindow({
        		        content: '<div style="padding :5px">내 위치</div>'
        		    });

        			var markerImage = new kakao.maps.MarkerImage(
        			    './images/736653.png',
        			    new kakao.maps.Size(50, 53));
        			marker.setImage(markerImage);

        			kakao.maps.event.addListener(marker, 'mouseover', makeOverListener2(map, marker, infowindow));
        		    kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
        		});
        	}

        	for (var i = 0; i < positions.length; i ++) {
        		var data = positions[i];
        		displayMarker(data);
        	}

        	function displayMarker(data){
        	    // 마커를 생성합니다
        	    var marker = new kakao.maps.Marker({
        	        map: map, // 마커를 표시할 지도
        	        position: data.latlng // 마커의 위치
        	    });

        	    // 마커에 표시할 인포윈도우를 생성합니다
        	    var infowindow = new kakao.maps.InfoWindow({
        	        content: data.iwcontent // 인포윈도우에 표시할 내용
        	    });

        	 	// 마커 위에 커스텀오버레이를 표시합니다
        		// 마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정했습니다
        		var overlay = new kakao.maps.CustomOverlay({
        			clickable : true,
        			position : marker.getPosition(),
        			xAnchor : 1
        		});

        		var div1 = document.createElement('div');
        		div1.className = 'wrap';
        		var div2 = document.createElement('div');
        		div2.className = 'info';
        		var div3 = document.createElement('div');
        		div3.className = 'title';
        		var closeBtn = document.createElement('button');
        		closeBtn.className = 'close';
        	    closeBtn.onclick = function () {
        	        overlay.setMap(null);
        	    };
        	    div3.appendChild(closeBtn);
        	    div2.appendChild(div3);
        		var div4 = document.createElement('div');
        		div4.className = 'body';
        		div4.innerHTML = `<div class="img">
        			<img src="./images/IMG_5947.JPG" style="width: 100%;">
        	            <div class="desc">
        		            <div class="ellipsis">작성자</div>
        					<div class="ellipsis">${dto.id}</div>

        					<div class="ellipsis">내용</div>
        					<div class="ellipsis">${dto.contents}</div>

        					<div class="ellipsis">태그</div>

        					<div class="ellipsis">등록일</div>
        					<div class="ellipsis">${dto.rdate}</div>

        					<div class="ellipsis">좋아요</div>
        					<div class="ellipsis">${dto.likecnt}</div>

        					<div class="ellipsis">댓글</div>
        	                <c:if test="${not empty sessionScope.id}">
        					<button type="button" class="btn"
        						onclick="location.href='/contents/update/${contentsno}'">
        						수정</button>
        					<button type="button" class="btn"
        						onclick="location.href='/contents/delete/${contentsno}'">
        						삭제</button>
        					</c:if>
        	            </div>
        	        </div>`;

                div2.appendChild(div4);
                div1.appendChild(div2);


                overlay.setContent(div1);


        	    // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
        	    // 이벤트 리스너로는 클로저를 만들어 등록합니다
        	    // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
        	    kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow, overlay));
        	    kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
        	    kakao.maps.event.addListener(marker, 'click', makeClickListener(map, marker, infowindow, overlay));

        	}

        	function makeOverListener(map, marker, infowindow, overlay) {
        	    return function() {
        	    	if(overlay.getMap() == null){
        	        	infowindow.open(map, marker);
        	    	}
        	    };
        	}

        	function makeOverListener2(map, marker, infowindow){
        		return function() {
        	        infowindow.open(map, marker);
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


        }
      </script>
    </div>
    <div
      style="position: fixed; right: 20px; bottom: 20px; z-index: 8"
      onclick="if(create.style.display=='none'){create.style.display=''}else{create.style.display='none'}"
    >
      <img src="./images/261370-200.png" width="73" height="70" />
    </div>

    <div
      style="
        position: fixed;
        right: 20px;
        bottom: 100px;
        z-index: 8;
        display: none;
      "
      id="create"
      class="create"
    >
      createform
    </div>
  </body>
</html>
