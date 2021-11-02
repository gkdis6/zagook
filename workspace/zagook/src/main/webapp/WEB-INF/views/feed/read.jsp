<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<title>피드 페이지</title>
<meta charset="utf-8">
<style>
body {
	background: #cccccc;

}
.body_container {
	display: flex;
	flex-direction: row;
	flex-basis: auto;
}
.left_container {
	background: #cccccc;
	position: fixed;
	left: 0;
	width: 25%;
}
.center-container {
	display: flex;
	position: relative;
	left: 25%;
	flex-direction: column;
	justice-content: center;
	flex-basis: 740px;
	overflow: auto;
}
.right-container {
	background: #cccccc;
	position: fixed;
	right: 0;
	width: 25%;
}
.feed_container {
	border-top-left-radius: 3% 10%;
	border-top-right-radius: 3% 10%;
	border-bottom-left-radius: 3% 10%;
	border-bottom-right-radius: 3% 10%;
	background: #ffffff;
	padding: 20px;
	margin-bottom: 20px;
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
</style>
</head>
<body>
	<div class="body_container">
		<div class="left_container">
			left_container
		</div>
		<div class="center-container">
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