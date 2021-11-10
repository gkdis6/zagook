<%@ page contentType="text/html; charset=UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
	<style>
		.wrap {
			position: absolute;
			left: 2;
			bottom: 51px;
			width: 500px;
			height: 500px;
			margin-left: -250px;
			text-align: left;
			font-size: 12px;
			font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;
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
			border-radius: 15px;
		}

		.wrap .info:nth-child(1) {
			border: 0;
			box-shadow: 0px 1px 1px #888;
		}

		.info .title {
			padding: 1px 0 0 0;
			height: 70px;
			background: #eee;
			border-bottom: 1px solid #ddd;
			font-size: 18px;
			font-weight: bold;
			border-radius: 15px 15px 0px 0px;
		}

		.info .close {
			position: absolute;
			top: 10px;
			right: 10px;
			color: #888;
			width: 17px;
			height: 17px;
			background:
				url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');
		}

		.info .close:hover {
			cursor: pointer;
		}

		.info .body {
			position: relative;
			overflow: hidden;
			width: 490px;
			height: 470px;
			margin: 5px;
		}

		.info .desc {
			position: relative;
			height: auto;
			overflow: auto;
		}

		.desc .ellipsis {
			overflow: hidden;
			height: auto;
		}

		.body .img {
			position: relative;
			width: 490px;
			height: auto;
			color: #888;
		}

		.body:after {
			content: '';
			position: absolute;
			margin-leÏft: -11px;
			left: 50%;
			bottom: -12;
			width: 24px;
			height: 12px;
			background:
				url('https://t1.d aumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')
		}

		.upload_imgbox {
			width: 300px;
			height: 300px;
			position: relative;
			overflow: hidden;
		}

		.upload_imgbox>#preview-image {
			position: absolute;
			left: 50%;
			top: 50%;
			transform: translate(-50%, -50%);
			width: 300px;
			height: 300px;
			background-image: url('https://dummyimage.com/500x500/ffffff/000000.png&text=preview+image');
			background-repeat: no-repeat;
			background-size: contain;
			background-position: center;
		}

		/* 게시글 등록 팝업 */


		select {
			-webkit-appearance: none;
			-moz-appearance: none;
			appearance: none;
		}

		.create {
			width: 300px;
			min-height: 300px;
			height: auto;
			border-radius: 20px;
			background-color: #fff;
		}

		.create > .modal-content{
			border-radius: 20px;
		}
		
		.form-group .btn_box{
			padding-bottom: 10px;
		}

		.form-horizontal {
			width: 89.33%;
			margin: auto;
			display: flex;
			flex-wrap: wrap;
		}

		input[type=file] {
			width: 100%;
			margin-bottom: 5px;
			margin-top: 5px;
		}

		.form-horizontal div {
			width: 100%;
			margin-bottom: 5px;
		}

		.form-horizontal div>input {
			width: 100%;
		}

		.control-label+div {
			margin-top: 5px;
		}

		.form-group .btn_box {
			display: flex;
			justify-content: space-evenly;
			width: 65%;
			margin: auto;
		}

		.form-group {
			width: 100%;
			display: flex;
			justify-content: flex-start;
			align-items: center;
		}

		.form-group>label {
			width: 28%;
		}

		.form-group>div>select {
			width: 100%;
		}

		.btn_box button {
			width: 70px;
			height: 50px;
			outline: none;
			border: none;
			background-color: #fff;
			color: gray;
			font-weight: 500;
			border: 2px solid #ccc;
			font-size: 13px;
			border-radius: 5px;
		}

		.btn_box button:hover {
			background-color: #666;
			color: #fff;
			font-weight: bold;
		}

		.form-horizontal .form-group {
			margin: 0;
		}

		#createBtn.rotate {
			transform: rotate(45deg);
			transition: all 0.4s;
		}

		/* 게시글팝업 end */

		.profile_img {
			width: 50px;
			height: 50px;
			border-radius: 50%;
		}

		.profile {
			margin: 10px;

		}

		.ellipsis {
			width: 490px;
		}
		
		#heading{
			margin-top: 10px;
		}
	</style>
</head>

<body>

	<div class="container" id="map" style="width: 100vw; height: 100vh;">

		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=801160086c0950000271359e983c8bf2"></script>
		<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/exif-js"></script>
		
		<script>
			window.onload = function () {
				var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
					mapOption = {
						center: new kakao.maps.LatLng(37.52423, 127.06319), // 지도의 중심좌표
						level: 10
						// 지도의 확대 레벨
					};

				var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

				var positions = [{
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

				if (navigator.geolocation) {
					navigator.geolocation.getCurrentPosition(function (position) {
						alert(position.coords.latitude + ' ' + position.coords.longitude);
						var marker = new kakao.maps.Marker({
							map: map,
							position: new kakao.maps.LatLng(position.coords.latitude, position.coords
								.longitude)
						});
						var infowindow = new kakao.maps.InfoWindow({
							content: '<div style="padding :5px">내 위치</div>'
						});

						var markerImage = new kakao.maps.MarkerImage(
							'./images/736653.png',
							new kakao.maps.Size(50, 53));
						marker.setImage(markerImage);

						kakao.maps.event.addListener(marker, 'mouseover', makeOverListener2(map, marker,
						infowindow));
						kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
					});
				}

				for (var i = 0; i < positions.length; i++) {
					var data = positions[i];
					displayMarker(data);
				}

				function displayMarker(data) {
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
						clickable: true,
						position: marker.getPosition(),
						xAnchor: 1
					});

					var div1 = document.createElement('div');
					div1.className = 'wrap';
					var div2 = document.createElement('div');
					div2.className = 'info';
					var div3 = document.createElement('div');
					div3.className = 'title';
					var div_profile = document.createElement('div');
					div_profile.className = 'profile';
					div_profile.innerHTML = `<img src="./images/feed/profile/profile_example.jpeg" class="profile_img" alt="profile_img">
		            <a class="name feed_padding">leewoo</a>`;
					div3.appendChild(div_profile);
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
						</div
			            <div class="desc">
		
							<div class="ellipsis">날짜${dto.rdate}</div>
							
							<div class="ellipsis" style="color: blue;">태그</div>
							
							<div class="ellipsis">내용</div>
							<div class="ellipsis">${dto.contents}</div>
		
							<div class="ellipsis">${dto.likecnt}</div>
							<img src="../images/feed/like_outline.png" alt="like_img" width="28px"> <span class="feed_widget_text">Like</span>
							
		
							<div class="ellipsis">댓글</div> 
			                <c:if test="${not empty sessionScope.id}">
							<button type="button" class="btn" onclick="location.href='/contents/update/${contentsno}'">수정</button>
							<button type="button" class="btn" onclick="location.href='/contents/delete/${contentsno}'">삭제</button>
							</c:if>
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
					return function () {
						if (overlay.getMap() == null) {
							infowindow.open(map, marker);
						}
					};
				}

				function makeOverListener2(map, marker, infowindow) {
					return function () {
						infowindow.open(map, marker);
					};
				}

				// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
				function makeOutListener(infowindow) {
					return function () {
						infowindow.close();
					};
				}

				function makeClickListener(map, marker, infowindow, overlay) {
					return function () {
						infowindow.close();
						overlay.setMap(map);
					}
				}


			}
		</script>



	</div>
	<div id="createBtn" style="position: fixed; right: 20px; bottom: 20px; z-index: 8"
		onclick="if(create.style.display=='none'){create.style.display=''}else{create.style.display='none'}">
		<img src="./images/261370-200.png" width="70" height="70">
	</div>

	<!-- 게시글 등록 팝업 -->
	<div style="position: fixed; right: 20px; bottom: 100px; z-index: 8; background: white;" id="create" class="create">
		
		<c:choose>
			<c:when test="${empty sessionScope.id }">
				<div class="modal-content">
					<div class="modal-header">
						<img src="../images/zagook_logo.jpg"
							style="width:60px; height:60px; padding-bottom:10px">
						<h4 class="modal-title">발자국 로그인</h4>
					</div>
					<div class="modal-body">
						<form action="/member/login" class="was-validated" method="post">
							<div class="form-group">
								<label for="id" align="left">아이디 </label> <input type="text"
									class="form-control" style="width:250px;height:40px;"
									id="userId" placeholder="Enter ID" name="id"
									required="required" value='${c_id_val}'>
							</div>
							<div class="form-group">
								<label for="userPw">비밀번호 </label> <input type="password"
									class="form-control" style="width:250px;height:40px;"
									id="userPw" placeholder="Enter Password" name="password"
									required="required">
							</div>
							<div class="form=group">
								<button type="submit"
									style="width:250px; background-color:black; color:white; padding-top:10px">
									로 그 인</button>
								<div class="join">
									회원이 아니신가요? <a href="${root}/member/agree">회원가입</a>
									<!-- 													<button type="button" class="btn btn-secondary">회원가입</button> -->
								</div>
							</div>
						</form>
					</div>
				</div>
	
			</c:when>
			<c:otherwise>
				<h2 id="heading" style="font-size:20px; text-align:center; line-height:2;">게시물 등록</h2>
		
				<!-- file Upload시 이미지 preview -->
				<figure class="upload_imgbox">
					<a id="preview-image"></a>
				</figure>
				<!-- //file Upload시 이미지 preview END -->
		
				<!-- form태그 부분 -->
				<form class="form-horizontal" action="/contents/create" method="post" enctype="multipart/form-data"
					onsubmit="return checkIn(this)">
		
					<div class="form-group">
						<div>
							<input style="display: block; cursor:pointer;" type="file" id="filenameMF" name="filenameMF"
								class="form-control">
						</div>
					</div>
		
					<div>
						<div>
							<textarea name="contents" id="contents" class="form-control"
								style="min-height:100px; height: auto; resize: none; width: 100%;" placeholder="내용"></textarea>
						</div>
					</div>
		
					<input type="hidden" name="id" id="id" value="${id}">
					<input type="hidden" name="x_site" id="x_site">
					<input type="hidden" name="y_site" id="y_site">
		
					<div>
						<div>
							<input type="text" id="tag" class="form-control" placeholder="태그" style="margin-bottom:5px;">
						</div>
					</div>
		
					<div class="form-group">
						<label class="control-label" for="privacy" style="text-align:left;">공개설정</label>
						<div>
							<select class="form-control" name="privacy" id="privacy">
								<option value=0>나만 보기</option>
								<option value=1>친구 공개</option>
								<option value=2>모두 공개</option>
							</select>
						</div>
					</div>
		
					<div class="form-group">
						<div class="btn_box">
							<button class="btn" id="ok" disabled>등록</button>
							<button type="reset" class="btn" id="reset">취소</button>
						</div>
					</div>
		
				</form>
				<!-- //폼태그부분 END -->
			</c:otherwise>
		</c:choose>
	</div>
	
	<!-- //게시글 등록 팝업 END -->
	<script>
		$(document).on("click", "#reset", function() {
			$('#preview-image').css('background-image', "url('https://dummyimage.com/500x500/ffffff/000000.png&text=preview+image')");
		});
		
		$(document).ready(function () {
			$("#create").hide();
		});
		
		$("#createBtn").on("click", function (e) {
			if (e.target != 0) {
				$("#createBtn").toggleClass("rotate");
			}
		});
		
		function readImage(input) {
			// 인풋 태그에 파일이 있는 경우
			if (input.files && input.files[0]) {
				// 이미지 파일인지 검사 (생략)
				// FileReader 인스턴스 생성
				
				const reader = new FileReader();
				// 이미지가 로드가 된 경우
				reader.onload = e => {
					$("#preview-image").css('background-image', 'url(\"' + e.target.result + '\")');
				}
				// reader가 이미지 읽도록 하기
				reader.readAsDataURL(input.files[0])
			}
		}
		// input file에 change 이벤트 부여
		const inputImage = document.getElementById("filenameMF")
		inputImage.addEventListener("change", e => {
			readImage(e.target)
			
			inputImage.files[0].exifdata = null;
			EXIF.getData(inputImage.files[0], function() {
				var latitude = EXIF.getTag(this, "GPSLatitude");
			    var longitude = EXIF.getTag(this, "GPSLongitude");
			    
			    if(longitude === undefined || latitude === undefined){
					   document.getElementById("ok").disabled = true;
				   }else{
					   document.getElementById("ok").disabled = false;
				   }
			    
			    latitude = latitude[0]+latitude[1]/60+latitude[2]/3600;
			    longitude = longitude[0]+longitude[1]/60+longitude[2]/3600;
				document.getElementById("x_site").value=latitude;
			   	document.getElementById("y_site").value=longitude;
			   	console.log(latitude);
			   	console.log(longitude);
			   	
			   
			});
		})
		
		
	</script>
</body>

</html>