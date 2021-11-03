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
		<c:set var='str'>안녕하세요  ${sessionScope.id } 님!</c:set>
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
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
	
<style type="text/css">
#grade {
	color: white;
}
</style>
</head>
<body>
	<!--상단메뉴-->
	<div class="container-fluid" style="height:52px; padding:0;">
		<nav class="navbar navbar-inverse" style="border-radius:0;">
			<div class="container-fluid">
				<div class="navbar-header">
					<a class="navbar-brand" href="${root}/">Shop</a>
				</div>
				<ul class="nav navbar-nav">
					<li class="active"><a href="${root}/">Home</a></li>
					<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" href="#">Product <span class="caret"></span></a>
						<ul class="dropdown-menu" id="pmenu">
						</ul></li>
					<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" href="#">community <span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="${root}/member/mypage">Mypage</a></li>
							<li><a href="${root}/review/list">Review</a></li>
							<li><a href="${root}/notice/list">Notice</a></li>
							<li><a href="${root}/chat">문의하기</a></li>
						</ul></li>
					<li><a id="grade"><span class="glyphicon glyphicon-grain"></span>
							${str}</a></li>
							<li><a onclick="getLocation()">위치정보 가져오기</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<c:choose>
						<c:when test="${empty sessionScope.id }">
							<li><a href="${root}/member/agree"><span
									class="glyphicon glyphicon-user"></span> Sign Up</a></li>
							<li><a href="${root}/member/login"><span
									class="glyphicon glyphicon-log-in"></span> Login</a></li>
						</c:when>
						<c:when
							test="${not empty sessionScope.id && sessionScope.grade == 'A'}">
							<li><a href="${root}/admin/create"><span class="glyphicon glyphicon-plus-sign"></span> 상품등록</a></li>
							<li><a href="${root}/contents/list"><span class="glyphicon glyphicon-list"></span> 상품목록</a></li>
							<li><a href="${root}/admin/list"><span class="glyphicon glyphicon-list"></span> 회원목록</a></li>
							<li><a href="${root}/member/logout"><span class="glyphicon glyphicon-log-out"></span> 로그아웃</a></li>
						</c:when>
						<c:otherwise>
							<li><a href="${root }/cartlist"><span class="glyphicon glyphicon-shopping-cart"></span> Cart</a></li>
							<li><a href="${root}/member/update"><span class="glyphicon glyphicon-edit"></span> 회원수정</a></li>
							<li><a href="${root}/member/logout"><span class="glyphicon glyphicon-log-out"></span> 로그아웃</a></li>
						</c:otherwise>
					</c:choose>

				</ul>
			</div>
		</nav>

	</div>
	<script>
	function getLocation() {
		if (navigator.geolocation) { // GPS를 지원하면
	    	navigator.geolocation.getCurrentPosition(function(position) {
	      		alert(position.coords.latitude + ' ' + position.coords.longitude);
	    	}, function(error) {
	      		console.error(error);
	    	}, {
	      		enableHighAccuracy: false,
	      		maximumAge: 0,
	      		timeout: Infinity
	    	});
	  	} else {
	    	alert('GPS를 지원하지 않습니다');
	  	}
	}
	</script>
</body>
</html>