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
		<h2>상세내용</h2>
		<div style="width: 50%; float: left;">
			<img src="/images/${dto.filename}" style="width: 100%;">
			<div style="float: right; margin-right: 3px;">
				<c:if test="${not empty sessionScope.id}">
					<button type="button" class="btn"
						onclick="location.href='/notice/update/${noticeno}'">
						수정</button>
					<button type="button" class="btn"
						onclick="location.href='/notice/delete/${noticeno}'">
						삭제</button>
				</c:if>
				<button type="button" class="btn" onclick="history.back()">돌아가기</button>
			</div>
		</div>
		<div class="panel panel-default" style="width: 50%; float: left;">
			<div class="panel-heading">작성자</div>
			<div class="panel-body">${dto.wname}</div>
	
			<div class="panel-heading">제목</div>
			<div class="panel-body">${dto.title}</div>

			<div class="panel-heading">내용</div>
			<div class="panel-body">${dto.content}</div>
			
			<div class="panel-heading">등록일</div>
			<div class="panel-body">${dto.rdate}</div>
		</div>
	</div>
</body>
</html>
