<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3> 네이버 로그인</h3>
<!-- 	<a href="https://nid.naver.com/oauth2.0/token?grant_type=authorization_code&client_id=ixM36J7baPEJLD3Q1N43&client_secret=cKNIY1gppY&code=code&state=STATE_STRING"> -->
	<a href="https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=ixM36J7baPEJLD3Q1N43&state=STATE_STRING&redirect_uri=http://localhost:8005/naverlogin">
	<img src="../images/naver_login.png" style="width:250px; height:45px;padding-top:10px; margin-left:7px ">
	</a>
</body>
</html>

