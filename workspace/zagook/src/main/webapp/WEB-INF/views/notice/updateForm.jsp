<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>homepage</title>
<meta charset="utf-8">
<script type="text/JavaScript">
	function checkIn(f) {
		if (f.title.value == "") {
			alert("제목을 입력하세요");
			f.title.focus()
			return false;
		}
		if (f.content.value == "") {
			alert("내용을 입력하세요");
			f.content.focus()
			return false;
		}
		if (f.passwd.value == "") {
			alert("비밀번호를 입력하세요");
			f.passwd.focus()
			return false;
		}
	}
</script>
</head>
<body>
	<div class="container">
		<h1 class="col-sm-offset-2 col-sm-10">공지 수정</h1>
		<form class="form-horizontal" action="/notice/update" method="post"
			enctype="multipart/form-data" onsubmit="return checkIn(this)">
			<input type="hidden" name="noticeno" value="${noticeno}">
			<div class="form-group">
				<div class="col-sm-offset-2 col-xs-6">
					<input type="text" name="title" id="title" class="form-control" value="${dto.title }" placeholder="제목">
				</div>
			</div>

			<div class="form-group">
				<div class="col-sm-offset-2 col-xs-6">
					<textarea name="content" id="content" class="form-control"
						style="height: 100px; resize: none;" placeholder="내용">${dto.content}</textarea>
				</div>
			</div>
			<div class="form-group">
			<div class="col-sm-offset-2 col-xs-6">
				<input type="password" name="passwd" id="passwd" placeholder="비밀번호">
			</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-5">
					<button class="btn">수정</button>
					<button type="reset" class="btn" onclick="location.href='/'">취소</button>
				</div>
			</div>
		</form>
	</div>
</body>
</html>
