<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }" />
<c:choose>
	<c:when
		test="${not empty sessionScope.id && sessionScope.grade == 'A'}">
		<c:set var="str">관리자 페이지 입니다.</c:set>
	</c:when>
	<c:when
		test="${not empty sessionScope.id && sessionScope.grade != 'A'}">
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
	<link rel="stylesheet" href="/css/feed/searchbar.css" type="text/css">
	<link rel="stylesheet"
		href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
	<script src="../js/login/modal.js"></script>
	<script src="../js/utils/login_modal.js"></script>
		
	<script>
		$(function(){
			$('.btn-modal-open').bind('click', load_login_modal);
		});
	</script>
	
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
		
		.container-fluid {
			background-color: #191a45;
		}
		
		.navbar-inverse .navbar-brand:hover {
			cursor: pointer;
			color: #f5f2b8;
		}
		
		.navbar-inverse .navbar-brand {
			color: #ffffff;
			font-size: 25px;
			padding: 12px;
			font-weight: bold;
		}
		
		.hr-sect {
			display: flex;
			flex-basis: 100%;
			align-items: center;
			color: rgba(0, 0, 0, 0.35);
			font-size: 12px;
			margin: 8px 0px;
		}
		
		.hr-sect::before, .hr-sect::after {
			content: "";
			flex-grow: 1;
			background: rgba(0, 0, 0, 0.35);
			height: 1px;
			font-size: 0px;
			line-height: 0px;
			margin: 0px 16px;
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
					<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" href="#">community <span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="${root}/member/mypage">Mypage</a></li>
							<li><a href="${root}/review/list">Review</a></li>
							<li><a href="${root}/notice/list">Notice</a></li>
							<li><a href="${root}/chat">문의하기</a></li>
						</ul></li>
					<c:choose>
						<c:when test="${not empty sessionScope.id }">
							<li><a id="feed" href="${root}/feed/read">내 주변</a></li>
						</c:when>
						<c:otherwise>
							<li><a id="feed" href="javascript:void(0);" onclick="onclick_login_open()">내 주변</a></li>
						</c:otherwise>
					</c:choose>
					<li><a id="grade"><span class="glyphicon glyphicon-grain"></span>${str}</a>
					</li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<c:choose>
						<c:when test="${empty sessionScope.id }">
						<!-- 모달 시작-->
							<li id="searchbar_container">
								<form action="http://localhost:8005/" method="post" id="searchbar_form" onsubmit="return onsearchbar_login_valid();">
									<input class="form ui-autocomplete-input" type="text" id="searchInput"
									name="selected_id" autocomplete="off" placeholder="Search Tag or Friend: 태그 검색 시에는 '#'을 붙여주세요">
									<button type="submit"><i class="fa fa-search"></i></button>
								</form>
							</li>
							<li>
							<a class="btn-modal-open" href="javascript:" data-url="/modallogin">로그인</a> 
							</li>
						<!-- 모달 끝 -->
							<li><a href="${root}/member/agree"><span
									class="glyphicon glyphicon-user"></span>&nbsp;회원가입</a></li>
						</c:when>
						<c:when
							test="${not empty sessionScope.id && sessionScope.grade == 'A'}">
							<li><a href="${root}/admin/create"><span
									class="glyphicon glyphicon-plus-sign"></span> 상품등록</a></li>
							<li><a href="${root}/contents/list"><span
									class="glyphicon glyphicon-list"></span> 상품목록</a></li>
							<li><a href="${root}/admin/list"><span
									class="glyphicon glyphicon-list"></span> 회원목록</a></li>
							<li><a href="${root}/member/logout"><span
									class="glyphicon glyphicon-log-out"></span> 로그아웃</a></li>
						</c:when>
						<c:otherwise>
							<li id="searchbar_container">
								<form action="http://localhost:8005/" method="post"  id="searchbar_form">
									<input class="form ui-autocomplete-input" type="text" id="searchInput" 
									name="selected_id" autocomplete="off" placeholder="Search Tag or Friend: 태그 검색 시에는 '#'을 붙여주세요">
									<button type="submit"><i class="fa fa-search"></i></button>
								</form>
							</li>
							<li><a href="${root}/member/mypage"><span
									class="glyphicon glyphicon-edit"></span> 마이페이지 </a></li>
							<li><a href="${root}/member/logout"><span
									class="glyphicon glyphicon-log-out"></span> 로그아웃</a></li>
						</c:otherwise>
					</c:choose>

				</ul>
			</div>
		</nav>

	</div>
</body>
<script type="text/javascript">
	function close_modal(){
		$(".modal").hide();
	}
</script>
</html>