<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<title>피드 페이지</title>
<meta charset="utf-8">

<link rel="stylesheet" href="/css/feed/container.css" type="text/css">
<link rel="stylesheet" href="/css/feed/feed_container.css" type="text/css">
<link rel="stylesheet" href="/css/feed/sidenav.css" type="text/css">
<link rel="stylesheet" href="/css/feed/floating_button.css" type="text/css">

<style>
:root { 
	--side_bar_size: 25%; 
	--center_container_size: 800px; 
	--feed_container_size: 740px;
}

body {
	background: #f5f2b8;
	font-family: "Lato", sans-serif;
  	transition: background-color .5s;
}
.loader-wrapper {
  width: 100%;
  height: 100%;
  position: absolute;
  top: 0;
  left: 0;
  background-color: #242f3f;
  display:flex;
  justify-content: center;
  align-items: center;
}
.loader {
  display: inline-block;
  width: 30px;
  height: 30px;
  position: relative;
  border: 4px solid #Fff;
  animation: loader 2s infinite ease;
}
.loader-inner {
  vertical-align: top;
  display: inline-block;
  width: 100%;
  background-color: #fff;
  animation: loader-inner 2s infinite ease-in;
}
@keyframes loader {
  0% { transform: rotate(0deg);}
  25% { transform: rotate(180deg);}
  50% { transform: rotate(180deg);}
  75% { transform: rotate(360deg);}
  100% { transform: rotate(360deg);}
}
@keyframes loader-inner {
  0% { height: 0%;}
  25% { height: 0%;}
  50% { height: 100%;}
  75% { height: 100%;}
  100% { height: 0%;}
}
</style>
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
			  <a href="/search">Search</a>
			</div>
		</div>
		<div class="center_container" id="center_container" style="margin-left: 0px;">
		</div>
		<div class="right_container">right_container</div>
	</div>

<script src="/js/feed/top_nav.js"></script>
<script src="/js/utils/date_format_util.js"></script>
<script src="/js/utils/number_format_util.js"></script>
<script src="/js/feed/fetch_feed.js"></script>
<script src="/js/feed/scroll_feed_ajax.js"></script>
<script src="/js/feed/like_event.js"></script>
<script src="/js/feed/side_nav.js"></script>
<script src="/js/feed/loading_animation	.js"></script>

</body>
</html>