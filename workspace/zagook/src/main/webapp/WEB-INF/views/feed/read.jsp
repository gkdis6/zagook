<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<title>피드 페이지</title>
<meta charset="utf-8">
<style>
:root {
	--side_bar_size: 25%;
	--center_container_size: 800px;
	--feed_container_size: 740px;
}
body {
	background: #f0f2f5;
}
.body_container {
	display: flex;
	flex-direction: row;
	flex-basis: auto;
}
.left_container {
	position: fixed;
	left: 0;
	width: var(--side_bar_size);
}
.center-container {
	display: flex;
	position: relative;
	left: calc(50% - (var(--center_container_size) / 2));
	flex-direction: column;
	justice-content: center;
	width: var(--center_container_size);
	overflow: auto;
	align-items: center;
}
.right-container {
	position: fixed;
	right: 0;
	width: var(--side_bar_size);
}
.feed_container {
	border-radius: 5%;
	background: #ffffff;
	margin-top: 10px;
	margin-bottom: 10px;
	max-width: var(--feed_container_size);
	min-width: var(--feed_container_size);
	box-shadow: 0px 0px 5px 2px rgba(0,0,0,0.4);
}
.feed_padding {
	padding-left: 20px;
}
.date {
    color: #999;
    margin-bottom: 10px;
}
.title {
    color: #6184dddd;
    font-weight: 600;
}
.content {
    margin-top: 5px;
}
.accessory {
    border-top: 1px solid #eee;
    padding-top:10px;
    margin-top:10px;
    color: #999;
    font-size: 14px;
}
.feed_widget_text {
	color: #000000;
}
.img_box_container {
	text-align: center;
	max-width: 740px;
	max-height: 740px;
}
.img_box {
	width: 100%;
	height: 100%;
}
.profile_container {
	display: flex;
	align-items: center;
	padding-top: 10px;
	padding-bottom: 10px;
}
.profile_img {
	width: 50px;
	height: 50px;
	border-radius: 50%;
}
.name {
}
</style>
</head>
<body>
	<div class="body_container">
		<div class="left_container">
			left_container
		</div>
		<div class="center-container">
			<div class="feed_container">
				<div class="profile_container feed_padding">
					<img src="../images/feed/profile/profile_example.jpg" class="profile_img" alt="profile_img">
					<h3 class="name feed_padding">leewoo</h3>
				</div>
				<div class="img_box_container">
					<img src="../images/feed/img_box/eiffel_tower.jpg" class="img_box" alt="img_box">
				</div>
				<a class="title feed_padding">#태그</a>
				<p class="content feed_padding">글 내용</p>
				<div class="date feed_padding">날짜</div>
				<div class="accessory feed_padding">
					<img src="../images/feed/like_outline.png" alt="like_img" width="28px"> <span class="feed_widget_text">Like</span>
					<img src="../images/feed/comment.png" alt="comments_img" width="28px"> <span class="feed_widget_text">Comments</span>
				</div>
			</div>
			<div class="feed_container">
				<h3 class="name">이름</h3>
				<div class="date">날짜</div>
				<a class="title">글 제목</a>
				<p class="content">글 내용</p>
				<div class="accessory">
					<img src="../images/feed/like_outline.png" alt="like_img" width="28px"> <span class="feed_widget_text">Like</span>
					<img src="../images/feed/comment.png" alt="comments_img" width="28px"> <span class="feed_widget_text">Comments</span>
				</div>
			</div>
			<div class="feed_container">
				<h3 class="name">이름</h3>
				<div class="date">날짜</div>
				<a class="title">글 제목</a>
				<p class="content">글 내용</p>
				<div class="accessory">
					<img src="../images/feed/like_outline.png" alt="like_img" width="28px"> <span class="feed_widget_text">Like</span>
					<img src="../images/feed/comment.png" alt="comments_img" width="28px"> <span class="feed_widget_text">Comments</span>
				</div>
			</div>
			<div class="feed_container">
				<h3 class="name">이름</h3>
				<div class="date">날짜</div>
				<a class="title">글 제목</a>
				<p class="content">글 내용</p>
				<div class="accessory">
					<img src="../images/feed/like_outline.png" alt="like_img" width="28px"> <span class="feed_widget_text">Like</span>
					<img src="../images/feed/comment.png" alt="comments_img" width="28px"> <span class="feed_widget_text">Comments</span>
				</div>
			</div>
			<div class="feed_container">
				<h3 class="name">이름</h3>
				<div class="date">날짜</div>
				<a class="title">글 제목</a>
				<p class="content">글 내용</p>
				<div class="accessory">
					<img src="../images/feed/like_outline.png" alt="like_img" width="28px"> <span class="feed_widget_text">Like</span>
					<img src="../images/feed/comment.png" alt="comments_img" width="28px"> <span class="feed_widget_text">Comments</span>
				</div>
			</div>
			<div class="feed_container">
				<h3 class="name">이름</h3>
				<div class="date">날짜</div>
				<a class="title">글 제목</a>
				<p class="content">글 내용</p>
				<div class="accessory">
					<img src="../images/feed/like_outline.png" alt="like_img" width="28px"> <span class="feed_widget_text">Like</span>
					<img src="../images/feed/comment.png" alt="comments_img" width="28px"> <span class="feed_widget_text">Comments</span>
				</div>
			</div>
			<div class="feed_container">
				<h3 class="name">이름</h3>
				<div class="date">날짜</div>
				<a class="title">글 제목</a>
				<p class="content">글 내용</p>
				<div class="accessory">
					<img src="../images/feed/like_outline.png" alt="like_img" width="28px"> <span class="feed_widget_text">Like</span>
					<img src="../images/feed/comment.png" alt="comments_img" width="28px"> <span class="feed_widget_text">Comments</span>
				</div>
			</div>
			<div class="feed_container">
				<h3 class="name">이름</h3>
				<div class="date">날짜</div>
				<a class="title">글 제목</a>
				<p class="content">글 내용</p>
				<div class="accessory">
					<img src="../images/feed/like_outline.png" alt="like_img" width="28px"> <span class="feed_widget_text">Like</span>
					<img src="../images/feed/comment.png" alt="comments_img" width="28px"> <span class="feed_widget_text">Comments</span>
				</div>
			</div>
			
		</div>
		<div class="right-container">
			right_container
		</div>
	</div>
</body>
</html>