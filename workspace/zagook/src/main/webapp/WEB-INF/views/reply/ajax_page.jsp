<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script>
	<c:forEach var="tmp" items="${list }">
		<!-- 댓글 수 -->
		<span> <a idx="${tmp.no}" href="javascript:"
			class="open_reply_list" data-bs-toggle="collapse"
			data-bs-target="#reply_card${tmp.no }" aria-expanded="false"
			aria-controls="collapseExample"> <svg
					xmlns="http://www.w3.org/2000/svg" width="16" height="16"
					fill="currentColor" class="bi bi-chat-dots" viewBox="0 0 16 16">
													<path
						d="M5 8a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm4 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm3 1a1 1 0 1 0 0-2 1 1 0 0 0 0 2z" />
													<path
						d="M2.165 15.803l.02-.004c1.83-.363 2.948-.842 3.468-1.105A9.06 9.06 0 0 0 8 15c4.418 0 8-3.134 8-7s-3.582-7-8-7-8 3.134-8 7c0 1.76.743 3.37 1.97 4.6a10.437 10.437 0 0 1-.524 2.318l-.003.011a10.722 10.722 0 0 1-.244.637c-.079.186.074.394.273.362a21.673 21.673 0 0 0 .693-.125zm.8-3.108a1 1 0 0 0-.287-.801C1.618 10.83 1 9.468 1 8c0-3.192 3.004-6 7-6s7 2.808 7 6c0 3.193-3.004 6-7 6a8.06 8.06 0 0 1-2.088-.272 1 1 0 0 0-.711.074c-.387.196-1.24.57-2.634.893a10.97 10.97 0 0 0 .398-2z" />
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
						</div>
					</c:if>
				</div>
			</section>
		</div>
	</c:forEach>
	</script>
	<script></script>
</body>
</html>