<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }" />
<c:choose>
	<c:when test="${not empty sessionScope.id && sessionScope.grade == 'A'}">
		<c:set var="str">관리자 페이지 입니다.</c:set>
	</c:when>
	<c:when test="${not empty sessionScope.id && sessionScope.grade != 'A'}">
		<c:set var='str'>안녕하세요 ${sessionScope.id } 님!</c:set>
	</c:when>
	<c:otherwise>
		<c:set var="str">기본 페이지 입니다.</c:set>
	</c:otherwise>
</c:choose>
<!DOCTYPE html>
<html>

<head>
	<title>memo</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
	<style type="text/css">
		#grade {
			color: white;
		}

		.modal-header {
			text-align: center;
		}

		.form-group {
			align: center;
		}

		.join {
			margin: 15px 0px 0px 0px;
		}
		.container-fluid{
			background-color: #191a45;
		}
		.navbar-inverse .navbar-brand:hover {
			cursor: pointer;
			color: #f5f2b8;
		}
		.navbar-inverse .navbar-brand{
			color: #ffffff;
			font-size: 25px; 
			padding: 12px;
			font-weight: bold;
		}
	</style>
</head>

<body>
	<!--상단메뉴-->
	<div class="container-fluid" style="height: 52px; padding: 0;">
		<nav class="navbar navbar-inverse" style="border-radius: 0;">
			<div class="container-fluid">
				<div class="navbar-header">
					<a class="navbar-brand" href="${root}/">Zagook</a>
				</div>
				<ul class="nav navbar-nav">
					<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">community <span
								class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="${root}/member/mypage">Mypage</a></li>
							<li><a href="${root}/review/list">Review</a></li>
							<li><a href="${root}/notice/list">Notice</a></li>
							<li><a href="${root}/chat">문의하기</a></li>
						</ul>
					</li>
					<li><a id="feed" href="${root}/feed/read">내 주변</a>
					</li>
					<li><a id="grade"><span class="glyphicon glyphicon-grain"></span>${str}</a>
					</li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<c:choose>
						<c:when test="${empty sessionScope.id }">
							<li><a class="nav-link" href="#" data-toggle="modal" data-target="#login">로그인</a>
								<div class="modal" id="login">
									<div class="modal-dialog modal-sm">
										<div class="modal-content">
											<div class="modal-header">
												<img src="../images/zagook_logo.jpg"
													style="width:60px; height:60px; padding-bottom:10px">
												<h4 class="modal-title">발자국 로그인</h4>
											</div>
											<div class="modal-body">
												<form action="/member/login" class="was-validated" method="post">
													<div class="form-group">
														<label for="id" align="left">닉네임 </label> <input type="text"
															class="form-control" style="width:250px;height:40px;"
															id="userId" placeholder="Enter Nickname" name="id"
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
															style="width:250px; background-color:black; color:white; 
															padding-top:10px; margin-left:7px">
															로 그 인</button>
														<a href="https://kauth.kakao.com/oauth/authorize?client_id=8b0badea65f50a87408b62085e369711&redirect_uri=http://localhost:8005/kakaologin&response_type=code">
														<img src="../images/kakao_login.png" style="width:250px; height:45px;padding-top:10px; margin-left:7px ">
														</a>
														<div class="join">
															회원이 아니신가요? <a href="${root}/member/agree">회원가입</a>
															<!--<button type="button" class="btn btn-secondary">회원가입</button> -->
														</div>
													</div>
												</form>
											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-secondary"
													data-dismiss="modal">취소</button>
											</div>
										</div>
									</div>
								</div>
							</li>
							<li><a href="${root}/member/agree"><span
										class="glyphicon glyphicon-user"></span>&nbsp;회원가입</a></li>

						</c:when>
						<c:when test="${not empty sessionScope.id && sessionScope.grade == 'A'}">
							<li><a href="${root}/admin/create"><span class="glyphicon glyphicon-plus-sign"></span>
									상품등록</a></li>
							<li><a href="${root}/contents/list"><span class="glyphicon glyphicon-list"></span> 상품목록</a>
							</li>
							<li><a href="${root}/admin/list"><span class="glyphicon glyphicon-list"></span> 회원목록</a>
							</li>
							<li><a href="${root}/member/logout"><span class="glyphicon glyphicon-log-out"></span>
									로그아웃</a></li>
						</c:when>
						<c:otherwise>
								<li id="searchbar_container"></li>
								<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">🙄 <span class="caret"></span></a>
									<ul class="dropdown-menu">
										<li><a href="${root}/friend">친구신청</a></li>
									</ul>
								</li>
								<li><a href="${root}/member/mypage"><span class="glyphicon glyphicon-edit"></span> 마이페이지
									</a></li>
								<li><a href="${root}/member/logout"><span class="glyphicon glyphicon-log-out"></span>
										로그아웃</a></li>
						</c:otherwise>
					</c:choose>

				</ul>
			</div>
		</nav>

	</div>
</body>

</html>