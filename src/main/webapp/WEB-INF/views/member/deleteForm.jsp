<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html> 
<html> 
<head>
  <title>삭제</title>
  <meta charset="utf-8">
  <style type="text/css">
  #red{
    color:red;
  }
  </style>
</head>
<body> 
<div class="container">
 
<h2 class="col-sm-offset-2 col-sm-10">탈퇴</h2>
<form class="form-horizontal" 
      action="/member/update"
      method="post"
      >
  <input type="hidden" name="email" value="${param.email}">
  <div class="form-group">
    <label class="control-label col-sm-2" for="password">비밀번호</label>
    <div class="col-sm-6">
      <input type="password" name="password" id="password"  placeholder='비밀번호를 입력하세요.' class="form-control">
    </div>
  </div>
  
  <p id="red" class="col-sm-offset-2 col-sm-6">탈퇴하면 복구할 수 없습니다.</p>
  
   <div class="form-group">
   <div class="col-sm-offset-2 col-sm-5">
    <button class="btn">삭제</button>
    <button type="reset" class="btn" onclick="location.href='${root}/member/mypage'">취소</button>
   </div>
 </div>
</form>
 
</div>
</body> 
</html>