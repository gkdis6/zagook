<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<title>피드 페이지</title>
<meta charset="utf-8">

<link rel="stylesheet" href="/css/feed/constant.css" type="text/css">
<link rel="stylesheet" href="/css/feed/body.css" type="text/css">
<link rel="stylesheet" href="/css/feed/container.css" type="text/css">
<link rel="stylesheet" href="/css/feed/sidenav.css" type="text/css">
<link rel="stylesheet" href="/css/feed/nav_mouse_click.css"
	type="text/css">
<link rel="stylesheet" href="/css/feed/scrollbar.css" type="text/css">
<link rel="stylesheet" href="/css/feed/selection_menu.css"
	type="text/css">
<link rel="stylesheet" href="/css/feed/time_button.css" type="text/css">
<link rel="stylesheet" href="/css/feed/loading_animation.css"
	type="text/css">
<link rel="stylesheet" href="/css/feed/overlay.css" type="text/css">
<link rel="stylesheet" href="/css/create.css" type="text/css">
<link rel="stylesheet" href="/css/chat/chat.css" type="text/css">

<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.2.0/css/all.css">
<link rel="stylesheet" href="/css/feed/feed_container.css"
	type="text/css">

<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=801160086c0950000271359e983c8bf2"></script>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/exif-js"></script>
<!-- 챗봇 -->
<script src="../js/sockjs.min.js"></script>
<script src="../js/stomp.min.js"></script>
<script type="text/JavaScript" src="../js/app.js"></script>
<!-- 챗봇 -->
<script>let session_id = '<%=(String) session.getAttribute("id")%>';</script>
</head>
<body>
	<div class="loader-wrapper" id="loader-wrapper">
		<span class="loader"><span class="loader-inner"></span></span>
	</div>
	<div class="body_container">
		<div class="left_container">
			<div id="left_nav" class="sidenav" style="width: 50px;"
				onclick="openNav()">
				<div id="nav_click_img_container">
					<img id="mose_click_img" src="../images/feed/mouse_click_v2.png"
						alt="mouse_click" style="width: 30px;">
				</div>
				<c:choose>
				<c:when test="${not empty sessionScope.id }">
				  	<a href="/feed/myread" class="tip">My Feed<span>내 게시물 확인하기</span></a>
				  	<a href="/feed/read" class="tip">Main Feed<span>나와 내 친구의 게시물을 확인하기</span></a>
				  	<a href="/searching" class="tip">Searching Map<span>전국 지도 위에서 게시물 찾기</span></a>
			  	</c:when>
			  	<c:otherwise>
				  	<a href="javascript:void(0)" onclick="onclick_login_open()" class="tip">My Feed<span>내 게시물을 확인할 수 있습니다</span></a>
				  	<a href="javascript:void(0)" onclick="onclick_login_open()" class="tip">Main Feed<span>나와 내 친구의 게시물을 확인할 수 있습니다</span></a>
				  	<a href="javascript:void(0)" onclick="onclick_login_open()" class="tip">Searching Map<span>지도 위에서 자유롭게 위치를 변경하며 게시물을 찾을 수 있습니다</span></a>
			  	</c:otherwise>
			  	</c:choose>
			</div>
		</div>
		<div class="center_container" id="center_container"
			style="margin-left: 0px;">
			<input type="hidden" name="order_type" value="distance"> <input
				type="hidden" name="page_flag" value="0"> <input
				type="hidden" name="search_type" value=""> <input
				type="hidden" id="hidden_selected_id" name="selected_id"
				value="${param.selected_id}">
		</div>
		<div class="map_container">
			<div id="map" style="width: 140vw; height: 100vh; z-index: -1;">
			</div>
		</div>
		<div class="selection_container">
			<div class="selection_box">
				<div class="select">
					<span>Select Range</span> <i class="fa fa-chevron-left"></i>
				</div>
				<input type="hidden" name="distance_type">
				<ul class="selection_box_menu">
					<li id="0.1km">0.1km</li>
					<li id="1km">1km</li>
					<li id="5km">5km</li>
					<li id="10km">10km</li>
					<li id="20km">20km</li>
					<li id="30km">30km</li>
					<li id="50km">50km</li>
					<li id="80km">80km</li>
					<li id="100km">100km</li>
				</ul>
			</div>
		</div>
	</div>
	<div class="modal_img">
		<button>&times;</button>
		<div class="modal_imgBox">
			<img src="">
		</div>
	</div>
	<!-- 챗봇  --------------------------------------------------------------------------- -->
	<div id="chatBtn"
		style="position: fixed; right:20px; bottom: 153px; z-index: 8"
		onclick="if(chat.style.display=='none'){chat.style.display=''}else{chat.style.display='none'}">
		<img src="/images/chat2.png" id="chat-dis-img" style="width:64px; height:95px; opacity:0.8;">
		<img src="/images/chat3.png" id="chat-act-img" style="width:66px; height:90px; opacity:0.8; display:none">
	</div>
	<div id="chat" style="display: none">
		<div class="modal-content">
			<div class="modal-header" id="chatheader">
				<H4 style="padding-bottom: 10px; font-weight: bold;">ZAGOOK 문의</H4>

				<form class="form-inline">
					<div class="form-group" id="chatform">
						<label for="connect"
							style="width: 60%; text-align: center; font-size: 13px;">
							문의 챗봇 연결하기 </label> <input type="checkbox" id="chatcheckbox"> <label
							id="chatlabel" for="chatcheckbox"><span></span></label>
					</div>
				</form>
			</div>
			<div id="chatcontent">
				<div class="modal-body" id="chatbody">
					<div class="chat_main">
						<div id="main-content" class="container" style="width: 100%;">
							<div class="row">
								<div>
									<table id="conversation" class="table table-striped">
										<tbody id="communicate" style="margin-left: 0px;">
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="form-group" id="chatform">
					<input type="text" id="msg" class="form1-control"
						placeholder="문의사항을 입력하세요." style="width: 80%;">
					<button id="send" class="btn btn-default" disabled type="submit">전송</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 챗봇 --------------------------------------------------------------------------- -->
	<div id="createBtn"
		style="position: fixed; right: 20px; bottom: 20px; z-index: 8"
		onclick="if(create.style.display=='none'){create.style.display=''}else{create.style.display='none'}">
		<img src="/images/261370-200.png" width="70" height="70">
	</div>

	<!-- 게시글 등록 팝업 -->
	<div
		style="position: fixed; right: 20px; bottom: 100px; z-index: 8; background: white; display: none;"
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
							<div id="feedmodal" style="margin-left:-15px">
							<div class="form-group">
								<label for="email" align="left">이메일 </label> <input type="text"
									class="form-control" style="width: 250px; height: 40px;"
									id="userEmail" placeholder="Enter Email" name="email"
									required="required" value='${c_email_val}'>
							</div>
							<div class="form-group">
								<label for="userPw">비밀번호 </label> <input type="password"
									class="form-control" style="width: 250px; height: 40px;"
									id="userPw" placeholder="Enter Password" name="password"
									required="required">
							</div>
							</div>
							<div class="form=group">
								<button type="submit"
									style="width: 250px; height: 40px; background-color: black; color: white; padding-top: 10px; margin-left: 7px">
									로 그 인</button>
								<div class="hr-sect">O R</div>
								<a
									href="https://kauth.kakao.com/oauth/authorize?client_id=8b0badea65f50a87408b62085e369711&redirect_uri=http://localhost:8005/kakaologin&response_type=code">
									<img src="../images/kakao_login.png"
									style="width: 250px; height: 47px; padding-top: 5px; margin-left: 7px">
								</a> <a
									href="https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=ixM36J7baPEJLD3Q1N43&state=STATE_STRING&redirect_uri=http://localhost:8005/naverlogin">
									<img src="../images/naver_login.png"
									style="width: 250px; height: 53px; padding-top: 10px; margin-left: 7px">
								</a>
								<div class="join">
									회원이 아니신가요? <a href="${root}/member/agree">회원가입</a>
									<!--<button type="button" class="btn btn-secondary">회원가입</button> -->
								</div>
							</div>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" id="modalclose" class="btn btn-secondary"
							data-dismiss="modal" onclick="close_modal();">취소</button>
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
							<input name="tag" type="text" id="tag" class="form-control" placeholder="태그"
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
	<!-- update modal -->
	<div class="modal_update" style="display: none">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h3 class="modal-title" id="updateModalLabel">게시물 수정</h3>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" action="/contents/update"
						method="post" onsubmit="return checkIn(this)"
						enctype="multipart/form-data">
						<input type="hidden" name="oldfile" value=""> <input
							type="hidden" id="contentsno" name="contentsno" value="">
						<div class="form-group">
							<div class="oldImg_box_container">
								<img id="oldImg" src="/contents/storage/${oldfile }"
									class="oldImg_box">
							</div>
						</div>
						<div class="form-group">
							<input type="button" class="btn" id="updatefilebtn" value="사진수정">
							<div id="selectimg" style="display: none">
								<input type="file" class="form-control" id="filenameMF_modal"
									name="filenameMF" accept=".jpg,.jpeg">
							</div>
						</div>
						<div class="form-group">
							<textarea name="contents" id="contents" class="form-control"
								style="height: 100px; resize: none;" placeholder="내용"></textarea>
						</div>
						<input type="hidden" name="x_site" id="x_site_update"> <input
							type="hidden" name="y_site" id="y_site_update">
						<div class="form-group">
							<input type="text" name="tag" id="tag" class="form-control"
								value="" placeholder="#태그">
						</div>
						<div class="form-group">
							<select class="form-control" name="privacy" id="privacy">
								<option value=0 <c:if test= "${privacy==0}">selected</c:if>>나만
									보기</option>
								<option value=1 <c:if test= "${privacy==1}">selected</c:if>>친구
									공개</option>
								<option value=2 <c:if test= "${privacy==2}">selected</c:if>>모두
									공개</option>
							</select>
						</div>
						<div class="form-group" style="margin-left: auto;">
							<button type="submit" class="btn btn-primary"
								id="updateBtn_modal">수정</button>
							<button type="reset" class="btn" id="closeModal">취소</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
<script src="/js/feed/top_nav.js"></script>
<script src="/js/feed/selection_menu.js"></script>
<script src="/js/utils/date_format_util.js"></script>
<script src="/js/utils/number_format_util.js"></script>
<script src="/js/utils/remove_display_util.js"></script>
<script src="/js/utils/scroll_util.js"></script>
<script src="/js/utils/send_post_util.js"></script>
<script src="/js/utils/login_modal_open.js"></script>
<script src="/js/feed/url_pattern/url_regex.js"></script>
<script src="/js/feed/create_click_event.js"></script>
<script src="/js/feed/map/feed_map.js"></script>
<script src="/js/feed/feed_ajax/feed_start_end_util.js"></script>
<script src="/js/feed/feed_ajax/feed_ajax.js"></script>
<script src="/js/feed/feed_ajax/feed_fetch_util.js"></script>
<script src="/js/feed/feed_ajax/feed_create_banner.js"></script>
<script src="/js/feed/feed_ajax/feed_box_processing.js"></script>
<script src="/js/feed/feed_ajax/feed_scroll_event.js"></script>
<script src="/js/feed/container_click_event.js"></script>
<script src="/js/feed/side_nav.js"></script>
<script src="/js/feed/onclick_processing.js"></script>
<script src="/js/feed/searchbar.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="/js/data.js"></script>
<script src="/js/feed/loading_animation.js"></script>
<script src="/js/feed/feed_ajax/feed_img_click.js"></script>
<script src="/js/crud/updatemodal.js"></script>
<script src="/js/chat/chatimg.js"></script>

<script>
<c:if test="${!empty sessionScope.id }">
$(document).on("click","button.friend_btn_1",function(){
	let name = $(this).attr("name");
	var element = $(this);
	var ans = confirm("친구를 신청하시겠습니까?");
    if(!ans) return false;
    
	$.ajax({
		url : "/submit_friend",
		type : "get",
		data : {
			id2 : name
		},
		contentType : "application/json; charset=utf-8;",
		dataType : 'json',
		success : function(data){
			element.removeClass();
			element.addClass('friend_btn_2');
			element.text('친구신청중');
		},
		error : function(data) {
            alert("친구 신청 중 오류가 발생하였습니다.");
        }
	})
})
</c:if>
$(document).on("click","a.delete__feed",function(){
	let name = $(this).attr("name");
	console.log(name);
	var ans = confirm("게시글을 삭제하시겠습니까?");
    if(!ans) return false;
    
	$.ajax({
		url : "/feed_delete",
		type : "get",
		data : {
			contentsno : name
		},
		contentType : "application/json; charset=utf-8;",
		dataType : 'json',
		success : function(data){
			$('#'+name).remove();
		},
		error : function(data) {
            alert("게시글 삭제 중 오류가 발생하였습니다.");
        }
	})
})
	
	
	
</script>
</body>
</html>