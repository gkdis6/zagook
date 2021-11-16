<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>공지 상세내용</title>
<meta charset="utf-8" />
</head>
<body>
	<div class="container">

		<h2>조회</h2>
		<div class="panel panel-default">
		
			<div class="panel-heading">제목</div>
			<div class="panel-body">${dto.title}</div>

			<div class="panel-heading">내용</div>
			<div class="panel-body">${dto.content}</div>

			<div class="panel-heading">조회수</div>
			<div class="panel-body">${dto.cnt}</div>

			<div class="panel-heading">등록일</div>
			<div class="panel-body">${dto.rdate}</div>

		</div>
		<div>
			<c:if test="${not empty sessionScope.id && sessionScope.grade == 'A'}">
			<button type="button" class="btn" onclick="location.href='/notice/create'">등록</button>
			<button type="button" class="btn" onclick="location.href='/notice/update'">수정</button>
			<button type="button" class="btn" onclick="location.href='/notice/delete'">삭제</button>
			</c:if>
			<button type="button" class="btn" onclick="location.href='/notice/list'">목록</button>
		</div>
	</div>
</body>
</html>
