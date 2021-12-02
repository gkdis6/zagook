<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>공지 조회</title>
<meta charset="utf-8" />
</head>
<body>
	<div class="container" style="margin-left:150px;padding-right:150px;">
		<h2 style="margin-top:50px;"><b>공지 사항</b></h2>
		<hr>
		<div style="font-size:18px">
		<b>${dto.title }</b>
		</div>
		<div style="font-size:15px; color:gray;">
		조회수 ${dto.cnt} &nbsp;|&nbsp; 등록일 ${dto.rdate }
		</div>
		<hr size='10px'>
		<p style="font-size:18px;">
		${dto.content }
		</p>
		<hr size='10px'>
		<div>
			<c:if test="${not empty sessionScope.id && sessionScope.grade == 'A'}">
			<button type="button" class="btn" onclick="location.href='/admin/notice/create'">등록</button>
			<button type="button" class="btn" onclick="location.href='/admin/notice/update/${dto.noticeno}'">수정</button>
			<button type="button" class="btn" onclick="location.href='/admin/notice/delete/${dto.noticeno}'">삭제</button>
			</c:if>
			<button type="button" class="btn" onclick="location.href='/notice/list'">목록</button>
		</div>
	</div>
</body>
</html>
