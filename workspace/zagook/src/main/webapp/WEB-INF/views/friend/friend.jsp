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
</head>
<body>
	<body2> 
	 	<!-- 댓글 -->
			<div class='row'>

				<div class="col-lg-12">

					<!-- panel start-->
					<div class="panel panel-default">

						<div class="panel-heading">
							<i class="fa fa-comments fa-fw"></i> Comments
							<button id='addReplyBtn'
								class='btn btn-primary btn-xs pull-right'>New Reply</button>
						</div>


						<div class="panel-body">

							<ul class="chat list-group">
								<li class="left clearfix" data-rno="12">
									<div>
										<div class="header">
											<strong class="primary-font" style="color: black">user1</strong>
											<small class="pull-right text-muted" style="color: black">2021-11-16</small>
										</div>
										<p style="color: black">Good!</p>

									</div>
								</li>
							</ul>
							<!-- ul end  -->
						</div>

						<div class="panel-footer"></div>

					</div>
					<!-- panel end-->
				</div>
				<!--  col-lg-12 end -->
			</div>
			<!-- row end -->
		

			<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">&times;</button>
							<h4 class="modal-title" id="myModalLabel" style="color: black">REPLY MODAL</h4>
						</div>
						<div class="modal-body">
							<div class="form-group">
								<label style="color: black">내용</label>
								<input class="form-control" name='content' style="color: black">New Reply!!!!
								<!--  
								이 부분에 지금 콘텐츠만 데이터가 올라가 있는데 컨텐츠 넘버 받으셔야 하고 
								컨트롤러에서 세션에서 아이디 받고 리플라이 넘버랑 데이트는 마이바티스에서 처리를 해야 저 오류가 안뜰겁니다
								이 부분 인풋으로 바꿔주시고 테스트용이니까 콘텐츠넘버는 현재있는 
								게시물번호 아무거나 가져와서 테스트 해보세요-->
			
							</div>
						</div>
						<div class="modal-footer">
							<button id='modalModBtn' type="button" class="btn btn-warning" style="color: black">수정</button>
							<button id='modalRemoveBtn' type="button" class="btn btn-danger" style="color: black">삭제</button>
							<button id='modalRegisterBtn' type="button" class="btn btn-primary" style="color: black">등록</button>
							<button id='modalCloseBtn' type="button" class="btn btn-default" style="color: black">닫기</button>
						</div>
					</div>
					<!-- /.modal-content -->
				</div>
				<!-- /.modal-dialog -->
			</div>
			<!-- /.modal -->


			<!-- 댓글처리 관련 Javascript 파일 추가-->
			<script type="text/javascript"
				src="${pageContext.request.contextPath}/js/breply.js"></script>

			<!-- 페이지 로딩시 댓글 목록 처리-->
			<!-- jstl는 internal javascript에서 사용가능 -->
			<script type="text/javascript">
		/* 	  var contentsno = "${dto.contentsno}"; 
			  var sno = "${sno}";
			  var eno = "${eno}"; */
			  var contentsno = "11"; 
			  var sno = "1";
			  var eno = "3"; 
			//  댓글용 paging, 게시판 검색
			  var nPage = "${nPage}";
			  var nowPage = "${param.nowPage}";
			  var colx = "${param.col}";
			  var wordx = "${param.word}";
			  </script>
			<script type="text/javascript"
				src="${pageContext.request.contextPath}/js/replyprocess.js"></script>
	
		<summary>
		친구신청
		<form action="action_page.php">
			<fieldset>
				<img
					src="https://blog.yena.io/assets/post-img/171123-nachoi-300.jpg"
					width="200px;" height="200px;" alt="My Image"> <br> User
				ID:<br> <input type="text" name="username" value="Mickey"
					style="color: black"> <br>
				<br> <input type="submit" value="거절"
					style="background-color: #EB4E4E"> <input type="submit"
					value="수락" style="background-color: #30BA87">
			</fieldset>
	</summary> <summary>
		친구신청
		<form action="action_page.php">
			<fieldset>
				<img
					src="https://magazineb-ckeditor-upload.s3.ap-northeast-2.amazonaws.com/upload/sim.jpg"
					width="200px;" height="200px;" alt="My Image"> <br> User
				ID:<br> <input type="text" name="username" value="John"
					style="color: black"> <br>
				<br> <input type="submit" value="거절"
					style="background-color: #EB4E4E"> <input type="submit"
					value="수락" style="background-color: #30BA87">
			</fieldset>
	</summary> <summary>
		친구신청
		<form action="action_page.php">
			<fieldset>
				<img
					src="https://img.favpng.com/23/12/18/donuts-homer-simpson-food-bread-image-png-favpng-y1f2UZmqc31qUHPYM7raS8uRK.jpg"
					width="200px;" height="200px;" alt="My Img"> <br> User
				ID:<br> <input type="text" name="username" value="Son"
					style="color: black"> <br>
				<br> <input type="submit" value="거절"
					style="background-color: #EB4E4E"> <input type="submit"
					value="수락" style="background-color: #30BA87">
			</fieldset>
	</summary> <summary>
		친구신청
		<form action="action_page.php">
			<fieldset>
				<img
					src="https://mblogthumb-phinf.pstatic.net/20130130_91/k_homer_k_1359473362889Iy7AY_GIF/MargeSimpson31.gif?type=w2"
					width="200px;" height="200px;" alt="My Img"> <br> User
				ID:<br> <input type="text" name="username" value="Messi"
					style="color: black"> <br>
				<br> <input type="submit" value="거절"
					style="background-color: #EB4E4E"> <input type="submit"
					value="수락" style="background-color: #30BA87">
			</fieldset>
	</summary> <summary>
		친구신청
		<form action="action_page.php">
			<fieldset>
				<img
					src="https://mblogthumb-phinf.pstatic.net/20140126_164/ahn3607_1390723993086MhbS8_JPEG/%28The_Simpsons%29S19E15.Smoke_on_the_Daughter.avi_000826283.jpg?type=w2"
					width="200px;" height="200px;" alt="My Img"> <br> User
				ID:<br> <input type="text" name="username" value="Ramos"
					style="color: black"> <br>
				<br> <input type="submit" value="거절"
					style="background-color: #EB4E4E"> <input type="submit"
					value="수락" style="background-color: #30BA87">
			</fieldset>
	</summary> <summary>
		My Friend
		<fieldset>
			<img
				src="https://mblogthumb-phinf.pstatic.net/20151117_52/ysb0509270_1447771663198llOux_PNG/ldd4_%281%29.png?type=w2"
				width="200px;" height="200px;" alt="My Img"> <br> User
			ID:<br> <input type="text" name="username" value="SayHo"
				style="color: black"> <br>
			<br>
		</fieldset>
	</summary> </body2>
</body>
</html>