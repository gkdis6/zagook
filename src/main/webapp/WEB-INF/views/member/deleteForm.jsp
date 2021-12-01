<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html> 
<html> 
<head>
<title>삭제</title>
<meta charset="utf-8">
<link rel="stylesheet" href="/css/member/hl.css" type="text/css">
<link rel="stylesheet" href="/css/member/delete.css" type="text/css">
</head>
<body> 

<div class="con-delete">
 	<div id="header-delete">
	<span class="hl">회원 탈퇴</span><br><br>
	<span id="span-delete">Zagook에 저장된 모든 데이터가 삭제됩니다.</span><br><br>
	<span id="span-delete">탈퇴를 원하시면 비밀번호를 입력해주세요.</span><br><br>
 	</div>
	<form class="form-horizontal" 
      action="/member/delete"
      method="post"
      >
      <div id="delete-form">
  <input type="hidden" name="email" value="${param.email}">
  <div class="form-group">
    <div class="col-sm-3">
      <input type="password" name="password" id="password"  placeholder='비밀번호를 입력하세요.' class="form-control">
    </div>
  </div>
  
   <div class="form-group" style="margin-left:-210px;">
  <p id="red" class="col-sm-offset-2 col-sm-6">탈퇴후 데이터를 복구할 수 없습니다.</p>
   <div class="col-sm-offset-2 col-sm-5">
    <button class="btn">탈퇴</button>
    <button type="reset" class="btn" onclick="location.href='${root}/member/mypage'">취소</button>
   </div>
 </div>
    </div>
</form>
 
</div>
</body> 
</html>