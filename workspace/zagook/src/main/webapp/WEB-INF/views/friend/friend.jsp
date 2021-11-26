<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>친구페이지</title>
<meta charset="utf-8">
<style>
.container{
	display: grid;
	grid-template-columns: 220px 220px 220px 220px;
	grid-auto-rows: 300px;
	grid-gap: 10px;
}
.friend_container{
	border: solid;
	width: 220px;
	height: 300px;
	border-radius: 8px;
	text-align:center;
}
.friend_container span{
	font-size: 20px;
}
.friend_img_container{
	padding-top: 5px;
	padding-bottom: 5px;
}
.friend_img_container img{
	width: 200px;
	height: 200px;
	objec-fit: cover;
}

</style>
</head>
<body>
	<span>친구 리스트</span>
	<div class="container">
	<c:choose>   
		<c:when test="${empty list}">
		</c:when>
		<c:otherwise>
			<c:forEach var="dto" items="${list}">
			<div class="friend_container">
				<div class="friend_img_container">
					<img src="/member/storage/profile/${dto.fname }"></img>
				</div>
				<span>${dto.id2}</span><br>
				<c:if test="${dto.status == 3 }"> 친구</c:if>
				<c:if test="${dto.status == 2 }"> 친구신청 받음</c:if>
				<c:if test="${dto.status == 1 }"> 친구신청 중</c:if>
			</div>
			</c:forEach>
		</c:otherwise>
	</c:choose>

	</div>
</body>
</html>