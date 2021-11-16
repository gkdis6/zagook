<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>homepage</title>
<meta charset="utf-8">
<script type="text/JavaScript">
	function checkIn(f) {
		if (f.content.value == "") {
			alert("내용을 입력하세요");
			f.content.focus()
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
				<label class="control-label col-sm-2" for="title">제목</label>
				<div class="col-sm-8">
					<input type="text" name="title" id="title" class="form-control"
						value="${dto.title}">
				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-sm-2" for="content">내용</label>
			   <div class="col-sm-offset-2 col-xs-6">
			      <textarea name="content" id="content" class="form-control" style="height:100px;resize:none;">${dto.content}</textarea>
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
