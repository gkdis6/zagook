<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>삭제</title>
<meta charset="utf-8">
<link rel="stylesheet" href="/css/member/hl.css" type="text/css">
<link rel="stylesheet" href="/css/member/updatepass.css" type="text/css">

</head>
<body>
	<div class="con-uppass">
		<div id="uppass">
			<span id="span-uppass">본인 확인을 위해 </span><span class="hl">올바른
				비밀번호를</span><span id="span-uppass"> 입력하세요.</span>
		</div>
		<form class="form-horizontal" 
		      action="/member/uppass"
		      method="post"
		      >
<!-- 		<form class="form-horizontal" action="/member/update" method="post"> -->

			<input type="hidden" name="email" value="${param.email}">
			<div style="padding-left:100px;">
				<div class="form-group">
					<!--     <label class="control-label col-sm-2" for="password">비밀번호</label> -->
					<div class="col-sm-3">
						<input type="password" name="password" id="password"
							placeholder='비밀번호를 입력하세요.' class="form-control">
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-5">
<!-- 						<button class="btn">확인</button> -->
						<button class="btn" type="submit">확인</button>
						<button type="reset" class="btn"
							onclick="location.href='${root}/member/mypage'">취소</button>
					</div>
				</div>
			</div>
		</form>

	</div>
</body>
</html>