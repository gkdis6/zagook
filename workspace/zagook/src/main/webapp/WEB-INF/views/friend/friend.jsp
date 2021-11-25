<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>친구페이지</title>
<meta charset="utf-8">
<style>
input[type="submit"] {
	float: right;
	border-radius: 5px;
}

summary {
	width: 30%;
	margin: 0 auto;
	padding: 1rem;
	display: block;
	background: #5B92E3;
	padding-left: 2.2rem;
	position: relative;
	cursor: pointer;
}

summary:before {
	content: '';
	border-width: .4rem;
	border-style: solid;
	border-color: transparent transparent transparent #fff;
	position: absolute;
	top: 1.3rem;
	left: 1rem;
	transform: rotate(0);
	transform-origin: .2rem 50%;
	transition: .25s transform ease;
}

body {
	background: #222;
	height: 100vh;
	font-family: sans-serif;
	color: white;
	line-height: 1.5;
	letter-spacing: 1px;
}

body2 {
	width: 50%;
	background: #222;
	height: 100vh;
	font-family: sans-serif;
	color: black;
	line-height: 1.5;
	letter-spacing: 1px;
}

fieldset {
	padding: 6px;
	background: #5B92E3;
	border: 1px solid white;
}
</style>
<script src="/js/reply/reply.js">

</script>
</head>
<body>
	<body2> 
					<!-- 댓글 수 --> 
					<span>
					<a idx="${dto.rnum}" href="javascript:" class="open_reply_list"
					data-bs-toggle="collapse" data-bs-target="#reply_card${dto.rnum }"
					aria-expanded="false" aria-controls="collapseExample"> <svg y="20"
							xmlns="http://www.w3.org/2000/svg" width="25" height="25" 
							fill="currentColor" class="bi bi-chat-dots" viewBox="0 0 16 16">
																<path
								d="M5 8a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm4 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm3 1a1 1 0 1 0 0-2 1 1 0 0 0 0 2z" />
																<path
								d="M2.165 15.803l.02-.004c1.83-.363 2.948-.842 3.468-1.105A9.06 9.06 0 0 0 8 15c4.418 0 8-3.134 8-7s-3.582-7-8-7-8 3.134-8 7c0 1.76.743 3.37 1.97 4.6a10.437 10.437 0 0 1-.524 2.318l-.003.011a10.722 10.722 0 0 1-.244.637c-.079.186.074.394.273.362a21.673 21.673 0 0 0 .693-.125zm.8-3.108a1 1 0 0 0-.287-.801C1.618 10.83 1 9.468 1 8c0-3.192 3.004-6 7-6s7 2.808 7 6c0 3.193-3.004 6-7 6a8.06 8.06 0 0 1-2.088-.272 1 1 0 0 0-.711.074c-.387.196-1.24.57-2.634.893a10.97 10.97 0 0 0 .398-2z" />
															</svg>
					</a>
					</span> <span id="m_reply${dto.rnum }">${dto.reply }</span>
					<!-- 댓글  -->
					<div>
						<div class="collapse" id="reply_card${dto.rnum }">
							<section class="modal-section">
								<div class="card card-body">
									<!-- 댓글 목록 -->
									<div class="reply-list reply-list${dto.rnum }">
										<!-- 댓글이 목록이 들어가는 곳 -->
									</div>
									<!-- 댓글 작성 => 로그인한 상태여야만 댓글작성 칸이 나온다. -->
									<c:if test="${not empty sessionScope.id }">
										<div class="row reply_write">
											<div class="col-1">
												<a href="other_profile.do?other_nick=${dto.id }"> <img
													src="../images/feed/profile/' + list[i].fname + '"
													class="profile_img" alt="profile_img">
												</a>
											</div>
											<div class="col-8" class="input_reply_div">
												<input class="w-100 form-control" id="input_reply${dto.rnum}"
													type="text" placeholder="댓글입력...">
											</div>
											<div class="col-3 ">
												<button type="button" idx="${dto.rnum }"
													class="btn btn-success mb-1 write_reply">댓글&nbsp;달기</button>
											</div>
										</div>
									</c:if>
								</div>
							</section>
						</div>
					</div>
	<summary>
		친구신청
		<form action="action_page.php">
			<fieldset>
				<img
					src="https://blog.yena.io/assets/post-img/171123-nachoi-300.jpg"
					width="200px;" height="200px;" alt="My Image"> <br> User
				ID:<br> <input type="text" name="username" value="Mickey"
					style="color: black"> <br> <br> <input
					type="submit" value="거절" style="background-color: #EB4E4E">
				<input type="submit" value="수락" style="background-color: #30BA87">
			</fieldset>
	</summary> <summary>
		친구신청
		<form action="action_page.php">
			<fieldset>
				<img
					src="https://magazineb-ckeditor-upload.s3.ap-northeast-2.amazonaws.com/upload/sim.jpg"
					width="200px;" height="200px;" alt="My Image"> <br> User
				ID:<br> <input type="text" name="username" value="John"
					style="color: black"> <br> <br> <input
					type="submit" value="거절" style="background-color: #EB4E4E">
				<input type="submit" value="수락" style="background-color: #30BA87">
			</fieldset>
	</summary> <summary>
		친구신청
		<form action="action_page.php">
			<fieldset>
				<img
					src="https://img.favpng.com/23/12/18/donuts-homer-simpson-food-bread-image-png-favpng-y1f2UZmqc31qUHPYM7raS8uRK.jpg"
					width="200px;" height="200px;" alt="My Img"> <br> User
				ID:<br> <input type="text" name="username" value="Son"
					style="color: black"> <br> <br> <input
					type="submit" value="거절" style="background-color: #EB4E4E">
				<input type="submit" value="수락" style="background-color: #30BA87">
			</fieldset>
	</summary> <summary>
		친구신청
		<form action="action_page.php">
			<fieldset>
				<img
					src="https://mblogthumb-phinf.pstatic.net/20130130_91/k_homer_k_1359473362889Iy7AY_GIF/MargeSimpson31.gif?type=w2"
					width="200px;" height="200px;" alt="My Img"> <br> User
				ID:<br> <input type="text" name="username" value="Messi"
					style="color: black"> <br> <br> <input
					type="submit" value="거절" style="background-color: #EB4E4E">
				<input type="submit" value="수락" style="background-color: #30BA87">
			</fieldset>
	</summary> <summary>
		친구신청
		<form action="action_page.php">
			<fieldset>
				<img
					src="https://mblogthumb-phinf.pstatic.net/20140126_164/ahn3607_1390723993086MhbS8_JPEG/%28The_Simpsons%29S19E15.Smoke_on_the_Daughter.avi_000826283.jpg?type=w2"
					width="200px;" height="200px;" alt="My Img"> <br> User
				ID:<br> <input type="text" name="username" value="Ramos"
					style="color: black"> <br> <br> <input
					type="submit" value="거절" style="background-color: #EB4E4E">
				<input type="submit" value="수락" style="background-color: #30BA87">
			</fieldset>
	</summary> <summary>
		My Friend
		<fieldset>
			<img
				src="https://mblogthumb-phinf.pstatic.net/20151117_52/ysb0509270_1447771663198llOux_PNG/ldd4_%281%29.png?type=w2"
				width="200px;" height="200px;" alt="My Img"> <br> User
			ID:<br> <input type="text" name="username" value="SayHo"
				style="color: black"> <br> <br>
		</fieldset>
	</summary> </body2>
</body>
</html>