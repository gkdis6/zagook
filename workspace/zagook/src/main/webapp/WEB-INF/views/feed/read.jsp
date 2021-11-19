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
<link rel="stylesheet" href="/css/feed/feed_container.css" type="text/css">
<link rel="stylesheet" href="/css/feed/sidenav.css" type="text/css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/css/feed/loading_animation.css" type="text/css">
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=801160086c0950000271359e983c8bf2"></script>
</head>
<body>
	<div class="loader-wrapper">
      <span class="loader"><span class="loader-inner"></span></span>
    </div>
	<div class="body_container">
		<div class="left_container">
			<div id="left_nav" class="sidenav" style="width: 50px;" onclick="openNav()">
			  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
			  <a href="/feed/myread">My Feed</a>
			  <a href="/feed/read">Friends Feed</a>
			  <a href="/friend">Friends List</a>
			  <a href="javascript:void(0)" onclick="openSearchbar()">Search Tag</a>
			  <a href="javascript:void(0)" onclick="openSearchbarFriend()">Search Friend</a>
			</div>
		</div>
		<div class="center_container" id="center_container" style="margin-left: 0px;">
		</div>
		<div class="right_container" id="map" style="width: 100vw; height: 100vh; position: fixed; z-index:-1;"></div>
	</div>

<script src="/js/feed/top_nav.js"></script>
<script src="/js/utils/date_format_util.js"></script>
<script src="/js/utils/number_format_util.js"></script>
<script src="/js/feed/fetch_feed.js"></script>
<script src="/js/feed/scroll_feed_ajax.js"></script>
<script src="/js/feed/like_event.js"></script>
<script src="/js/feed/side_nav.js"></script>
<script src="/js/feed/onclick_tag.js"></script>
<script src="/js/feed/searchbar.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="/js/data.js"></script>
<script src="/js/feed/loading_animation.js"></script>


</body>
</html>