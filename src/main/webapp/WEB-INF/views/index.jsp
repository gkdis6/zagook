<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<style>
body {
	overflow: hidden;
}

.wrap {
	position: absolute;
	left: 2;
	bottom: 51px;
	width: 500px;
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
	/* background-color: #191a45; */
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
	width: 500px;
	min-height: 182px;
	max-height: 450px;
	overflow: auto;
}

.info .body::-webkit-scrollbar {
	display: none;
}

.info .desc {
	position: relative;
	height: auto;
	overflow: auto;
}

.desc>.ellipsis {
	overflow: hidden;
	height: auto;
	margin-left: 5px;
	width: 490px;
}

.desc a {
	margin-left: 5px;
}

.body .img {
	position: relative;
	width: 490px;
	height: auto;
	color: #888;
	margin: 5px;
}

.body .img:hover {
	cursor: -webkit-zoom-in;
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
	background-image:
		url('https://dummyimage.com/500x500/ffffff/000000.png&text=preview+image');
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

.create>.modal-content {
	border-radius: 20px;
}

.form-group .btn_box {
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
	width: 45%;
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

.btn_box1 button {
	outline: none;
	border: none;
	background-color: #fff;
	color: gray;
	font-weight: 500;
	border: 2px solid #ccc;
	font-size: 13px;
	border-radius: 5px;
	float: right;
	margin-right: 5px;
}

.btn_box1 button:hover {
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

#heading {
	margin-top: 10px;
}

.infowindow {
	width: 150px;
	height: auto;
}

.modal_img {
	display: none;
	z-index: 500;
	width: 100vw;
	height: 100vh;
	position: fixed;
	top: 0;
	left: 0;
	background-color: rgba(0, 0, 0, 0.8);
}

.modal_img button {
	position: absolute;
	top: 3rem;
	right: 3rem;
	background: transparent;
	border: 0;
	color: #ffffff;
	font-size: 3rem;
}

.modal_imgBox {
	max-height: 80vh;
	max-width: 80vw;
	position: fixed;
	top: 50%;
	left: 50%;
	-webkit-transform: translate(-50%, -50%);
	-moz-transform: translate(-50%, -50%);
	-ms-transform: translate(-50%, -50%);
	-o-transform: translate(-50%, -50%);
	transform: translate(-50%, -50%);
	overflow: auto;
}

.modal_imgBox img {
	max-width: 100%;
	max-height: 100%;
}

/*chat*/
  .chat>.modal-content {   
 	border-radius: 20px;  
   }  

 .chat {  
  	width: 350px;  
  	height: auto;  
  	border-radius: 20px;  
  	background-color: #fff;  
  }  

  #connect_btn {  
  	color: #fff;  
  	background: blue;  
  	border-radius: 0.5em;  
  }  

  #disconnect_btn {  
  	color: #fff;  
  	background: red; 
  	border-radius: 0.5em;  
  }  

 .communicate {  
  	width: 100%;  
  }  
  .conversation:ntn-child(odd){  
 	text-align:right;  
  	color:black;  
  }  
/*chat-end*/
</style>

<meta charset="UTF-8">
<meta name="viewport"
	content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" />
<link href="../css/style.css" rel="Stylesheet" type="text/css">
<script src="../js/sockjs.min.js"></script>
<script src="../js/stomp.min.js"></script>
<script type="text/JavaScript" src="../js/app.js"></script>
<!-- <script src="../js/login/modal.js"></script> -->
<!-- <script src="../js/utils/login_modal.js"></script> -->

<script>
	$(function(){
		$('.btn-modal-open').bind('click', load_login_modal);
	});
</script>
</head>

<body>

	<div class="container" id="map" style="width: 100vw; height: 100vh;">

		<script type="text/javascript"
			src="//dapi.kakao.com/v2/maps/sdk.js?appkey=801160086c0950000271359e983c8bf2">
		</script>
		<script type="text/javascript"
			src="https://cdn.jsdelivr.net/npm/exif-js"></script>

		<script>
			window.onload = function () {
				var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
					mapOption = {
						center: new kakao.maps.LatLng(37.52423, 127.06319), // 지도의 중심좌표
						level: 10
						// 지도의 확대 레벨
					};
				var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
				  
				var positions = [
					<c:choose>   
					<c:when test="${empty list}">
					</c:when>
					<c:otherwise>
						<c:forEach var="dto" items="${list}" varStatus="i"> 
							{
								iwcontent: '<div class="infowindow" style="width: 140px; height: auto; padding: 5px;" class="img"><img src="/contents/storage/${dto.filename}" width="138px" height="auto"></div>',
								latlng: new kakao.maps.LatLng('${dto.x_site}', '${dto.y_site}'),
								content: "${dto.contents}",
								likecnt: "${dto.likecnt}",
								rdate: "${dto.rdate}",
								filename: "${dto.filename}",
								privacy: "${dto.privacy}",
								id: "${dto.id}",
								contentsno: "${dto.contentsno}",
								fname: "${dto.fname}",
								tag_list: "${dto.tag_list}",
								like_clicked: "${dto.like_clicked}"
								
							}
							<c:if test="${!i.last}">,</c:if>
						</c:forEach>
					</c:otherwise>
					</c:choose>
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
							content: '<div class="infowindow" id="myloca" style="text-align: center; width:150px;">내 위치</div>'
						});
						var markerImage = new kakao.maps.MarkerImage(
							'./images/736653.png',
							new kakao.maps.Size(50, 53));
						marker.setImage(markerImage);
						kakao.maps.event.addListener(marker, 'mouseover', makeOverListener2(map, marker,
							infowindow));
						kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
					}, error);
				}
				function error(){
					console.warn('param = {"x_site": "37.5535462", "y_site": "126.964296"};	');
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
						xAnchor: 1,
						yAnchor: 30
					});
					var div1 = document.createElement('div');
					div1.className = 'wrap';
					var div2 = document.createElement('div');
					div2.className = 'info';
					var div3 = document.createElement('div');
					div3.className = 'title';
					var div_profile = document.createElement('div');
					div_profile.className = 'profile';
					div_profile.innerHTML = `<img src="/member/storage/profile/`+data.fname+`" class="profile_img" alt="profile_img">
		            <a class="name feed_padding">`+data.id+`</a>`;
					div3.appendChild(div_profile);
					var closeBtn = document.createElement('button');
					closeBtn.className = 'close';
					closeBtn.onclick = function (){
						overlay.setMap(null);
					};
					div3.appendChild(closeBtn);
					div2.appendChild(div3);
					
					var div4 = document.createElement('div');
					div4.className = 'body';
					var tag_list = data.tag_list.substring(1,data.tag_list.length-1);
					var list = tag_list.split(", ");
					
					var div5 = document.createElement('div');
					div5.className = 'img';
					div5.innerHTML = `<img src="/contents/storage/`+data.filename+`" style="width: 100%;">`;
					
					var div6 = document.createElement('div');
					div6.className = 'desc';
					div6.innerHTML = `<div class="ellipsis">`+data.rdate.substring(0,16)+`</div>`;
					
					for(var item of list){
						if(item){
							div6.innerHTML += '<a href="javascript:" class="tag" style="color: blue;">'+"  #"+item+'</div>';
						}
					}
					
					div6.innerHTML += `<div class="ellipsis">`+data.content+`</div>`;
					
					if(data.like_clicked>0){
						div6.innerHTML += '<a href="javascript:" class="like" style="width:28px;height:28px;" idx="'+data.contentsno+'" ><img src="./images/feed/like_fill.png" style="width:28px;" id="like"></a>';
					}else{
						div6.innerHTML += '<a href="javascript:" class="like" style="width:28px;height:28px;" idx="'+data.contentsno+'" ><img src="./images/feed/like_outline.png" style="width:28px;" id="unlike"></a>';
					}
					div6.innerHTML += ` <span class="feed_widget_text" id="like_cnt`+data.contentsno+`">`+numberFormatting(data.likecnt)+`</span>
					
					<%-- 댓글 수 --%>
					<span> 
						<a idx="${tmp.rnum}" class="open_reply_list" data-toggle="collapse" href="#reply_card${tmp.rnum }" aria-expanded="false" aria-controls="collapseExample"> 
							<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-chat-dots" viewBox="0 0 16 16">
								<path d="M5 8a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm4 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm3 1a1 1 0 1 0 0-2 1 1 0 0 0 0 2z" />
								<path d="M2.165 15.803l.02-.004c1.83-.363 2.948-.842 3.468-1.105A9.06 9.06 0 0 0 8 15c4.418 0 8-3.134 8-7s-3.582-7-8-7-8 3.134-8 7c0 1.76.743 3.37 1.97 4.6a10.437 10.437 0 0 1-.524 2.318l-.003.011a10.722 10.722 0 0 1-.244.637c-.079.186.074.394.273.362a21.673 21.673 0 0 0 .693-.125zm.8-3.108a1 1 0 0 0-.287-.801C1.618 10.83 1 9.468 1 8c0-3.192 3.004-6 7-6s7 2.808 7 6c0 3.193-3.004 6-7 6a8.06 8.06 0 0 1-2.088-.272 1 1 0 0 0-.711.074c-.387.196-1.24.57-2.634.893a10.97 10.97 0 0 0 .398-2z" />
							</svg>
						</a>
					</span> 
					<span id="m_reply${tmp.rnum }">${tmp.reply }</span>
					<!-- 댓글  -->
					<div class="collapse" id="reply_card${tmp.rnum }">
						<section class="modal-section">
							<div class="card card-body">
								<!-- 댓글 목록 -->
								<div class="reply-list reply-list${tmp.rnum }">
									<!-- 댓글이 목록이 들어가는 곳 -->
								</div>
								<!-- 댓글 작성 => 로그인한 상태여야만 댓글작성 칸이 나온다. -->
								<c:if test="${not empty sessionScope.id }">
									<div class="row reply_write">
										<div class="col-1">
												<a href="other_profile.do?other_nick=${tmp.id }"> <img
													id="write_reply_profileImage"
													src="../images/feed/profile/${sessionScope.profile }" />
												</a>
										</div>
								<div class="col-8" class="input_reply_div">
									<input class="w-100 form-control" id="input_reply${tmp.rnum}"
										type="text" placeholder="댓글입력...">
								</div>
								<div class="col-3 ">
									<button type="button" idx="${tmp.rnum }"
										class="btn btn-success mb-1 write_reply">댓글&nbsp;달기</button>
								</div>
					
					</c:if>
					</div>		
					
	                <c:if test="${not empty sessionScope.id}">
		            <div class="btn_box1">
						<button type="button" class="btn" onclick="location.href='/contents/update/`+data.contentsno+`'">수정</button>
						<button type="button" class="btn" onclick="location.href='/contents/delete/`+data.contentsno+`'">삭제</button>
					</div>
					</c:if>					
					
					
	            	</div>`;
					div4.appendChild(div5);
					div4.appendChild(div6);
					div2.appendChild(div4);
					div1.appendChild(div2);
					overlay.setContent(div1);
					
					// 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
					// 이벤트 리스너로는 클로저를 만들어 등록합니다 
					// for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
					kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow, overlay));
					kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
					kakao.maps.event.addListener(marker, 'click', makeClickListener(map, marker, infowindow, overlay));
					
					div1.addEventListener('mouseenter', function(){
						map.setZoomable(false);
					});
					div1.addEventListener('mouseleave', function(){
						map.setZoomable(true);
					});
					
					div5.addEventListener('click', function(){
						$(".modal_img").show();
						var imgSrc = $(this).children("img").attr("src");
						$(".modal_imgBox img").attr("src", imgSrc);
					});
					
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
				<c:if test="${!empty sessionScope.id }">
				$(document).on("click","a[class='like']",function(){
					let no = $(this).attr('idx');
					if($(this).children('img').attr('id') == "like"){
						$.ajax({
							url : "/unlike",
							type : "get",
							data : {
								contentsno : no
							},
							contentType : "application/json; charset=utf-8;",
							dataType : 'json',
							success : function(data){
								let like_cnt = data;
								$('#like_cnt'+no).text(like_cnt);
							}
						})
						$(this).html('<img src="./images/feed/like_outline.png" style="width:28px;" id="unlike" class="like">');
					}else if($(this).children('img').attr('id') == "unlike"){
						$.ajax({
							url : "/like",
							type : "get",
							data : {
								contentsno : no
							},
							contentType : "application/json; charset=utf-8;",
							dataType : 'json',
							success : function(data){
								let like_cnt = data;
								$('#like_cnt'+no).text(like_cnt);
							}
						})
						$(this).html('<img src="./images/feed/like_fill.png" style="width:28px;" id="like" class="like">');
					}
				})
			
				</c:if>
			}
			
			
		</script>
		<script src="/js/reply/reply.js"></script>


	</div>
	<!-- 챗봇@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
	<div id="chatBtn"
		style="position: fixed; padding-bottom: 400px; right: 20px; bottom: 20px; z-index: 8"
		onclick="if(chat.style.display=='none'){chat.style.display=''}else{chat.style.display='none'}">
		<img src="./images/chat1.png" width="70" height="70">
	</div>
	<div
		style="position: fixed; right: 20px; top: auto; 
	bottom: 90px; z-index: 8; background: white; border: 1px solid #191a45" 
		id="chat" class="chat">
		<div class="modal-content">
			<div class="modal-header" style="padding:0px; color:#191a45;">
				<H4>ZAGOOK 문의</H4>
				<form class="form-inline">
					<div class="form-group" id="chatform">
						<label for="connect" style="text-align:left;font-size: 14px;">무엇을 도와드릴까요?</label>

						<button id="connect_btn" class="btn btn-default" type="submit">시작</button>
						<button id="disconnect_btn" class="btn btn-default" type="submit" disabled="disabled">종료</button>

					</div>
				</form>
			</div>
			<div id="chatcontent">
				<div class="modal-body" style="background-color:#191a45; min-height:300px;">
					<div class="chat_main">
						<div id="main-content" class="container" style="width: 100%;">

							<div class="row">
								<div>
									<table id="conversation" class="table table-striped">
										<tbody id="communicate" style="margin-left:0px;">
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
					<div class="form-group" id="chatform" style="width: 100%;margin-bottom:2.3px;padding-left:10px;padding-top:3px;">
						<input type="text" id="msg" class="form1-control"
							placeholder="문의사항을 입력하세요." style="width: 80%;">
						<button id="send" class="btn btn-default" disabled type="submit">전송</button>
					</div>
			</div>
		</div>
	</div>
	<!-- 챗봇@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
	<div id="createBtn"
		style="position: fixed; right: 20px; bottom: 20px; z-index: 8"
		onclick="if(create.style.display=='none'){create.style.display=''}else{create.style.display='none'}">
		<img src="./images/261370-200.png" width="70" height="70">
	</div>

	<!-- 게시글 등록 팝업 -->
	<div
		style="position: fixed; right: 20px; bottom: 100px; z-index: 8; background: white;"
		id="create" class="create">

		<c:choose>
			<c:when test="${empty sessionScope.id }">
				<div class="modal-content">
					<div class="modal-header">
						<img src="../images/zagook_logo.jpg"
							style="width: 60px; height: 60px; padding-bottom: 10px">
						<h4 class="modal-title">발자국 로그인</h4>
					</div>
					<div class="modal-body">
						<form action="/member/login" class="was-validated" method="post">
							<div class="form-group">
								<label for="id" align="left">아이디 </label> <input type="text"
									class="form-control" style="width: 250px; height: 40px;"
									id="userId" placeholder="Enter ID" name="id"
									required="required" value='${c_id_val}'>
							</div>
							<div class="form-group">
								<label for="userPw">비밀번호 </label> <input type="password"
									class="form-control" style="width: 250px; height: 40px;"
									id="userPw" placeholder="Enter Password" name="password"
									required="required">
							</div>
							<div class="form=group">
								<button type="submit"
									style="width: 250px; background-color: black; color: white; padding-top: 10px">
									로 그 인</button>
								<div class="join">
									회원이 아니신가요? <a href="${root}/member/agree">회원가입</a>
									<!--<button type="button" class="btn btn-secondary">회원가입</button> -->
								</div>
							</div>
						</form>
					</div>
				</div>

			</c:when>
			<c:otherwise>
				<h2 id="heading"
					style="font-size: 20px; text-align: center; line-height: 2;">게시물
					등록</h2>

				<!-- file Upload시 이미지 preview -->
				<figure class="upload_imgbox">
					<a id="preview-image"></a>
				</figure>
				<!-- //file Upload시 이미지 preview END -->

				<!-- form태그 부분 -->
				<form class="form-horizontal" action="/contents/create"
					method="post" enctype="multipart/form-data"
					onsubmit="return checkIn(this)">

					<div class="form-group">
						<div>
							<input style="display: block; cursor: pointer;" type="file"
								id="filenameMF" name="filenameMF" class="form-control">
						</div>
					</div>

					<div>
						<div>
							<textarea name="contents" id="contents" class="form-control"
								style="min-height: 100px; height: auto; resize: none; width: 100%;"
								placeholder="내용"></textarea>
						</div>
					</div>

					<input type="hidden" name="id" id="id" value="${id}"> <input
						type="hidden" name="x_site" id="x_site"> <input
						type="hidden" name="y_site" id="y_site">

					<div>
						<div>
							<input type="text" id="tag" class="form-control" placeholder="태그"
								style="margin-bottom: 5px;">
						</div>
					</div>

					<div class="form-group">
						<label class="control-label" for="privacy"
							style="text-align: left;">공개설정</label>
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

	<div class="modal_img">
		<button>&times;</button>
		<div class="modal_imgBox">
			<img src="">
		</div>
	</div>

	<!-- //게시글 등록 팝업 END -->
	<script>
		$(document).on("click", "#reset", function () {
			$('#preview-image').css('background-image',
				"url('https://dummyimage.com/500x500/ffffff/000000.png&text=preview+image')");
			$('#ok').attr('disabled',true);
		});
		$(document).ready(function () {
			$("#create").hide();
			$("#chat").hide(); //Chatbot 모달 hide
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
			EXIF.getData(inputImage.files[0], function () {
				var latitude = EXIF.getTag(this, "GPSLatitude");
				var longitude = EXIF.getTag(this, "GPSLongitude");
				if (longitude === undefined || latitude === undefined) {
					document.getElementById("ok").disabled = true;
				} else {
					document.getElementById("ok").disabled = false;
				}
				latitude = latitude[0] + latitude[1] / 60 + latitude[2] / 3600;
				longitude = longitude[0] + longitude[1] / 60 + longitude[2] / 3600;
				document.getElementById("x_site").value = latitude;
				document.getElementById("y_site").value = longitude;
				console.log(latitude);
				console.log(longitude);
			});
		})
		
		$(".modal_img button").click(function(){
			$(".modal_img").hide();
		});
			
		$(".modal_img").click(function (e) {
		    if (e.target.className != "modal_img") {
		      return false;
		    } else {
		      $(".modal_img").hide();
		    }
		});
	</script>
	<script src="/js/utils/number_format_util.js"></script>
</body>

</html>
