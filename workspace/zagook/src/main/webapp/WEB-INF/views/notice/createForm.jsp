<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html> 
<html> 
<head>
  <title>homepage</title>
  <meta charset="utf-8">
  <script type="text/JavaScript">
 function checkIn(f){
     if (f.content.value == ""){
         alert("내용을 입력하세요");
         f.title.focus()
         return false;
 	}
}
 </script>
</head>
<body> 

<div class="container">
<h2 class="col-sm-offset-2 col-sm-10">새 공지사항</h2>
<form class="form-horizontal" 
      action="/notice/create"
      method="post"
      enctype="multipart/form-data"
      onsubmit="return checkIn(this)">
  <div class="form-group">
    <div class="col-sm-offset-2 col-sm-6">
      <input type="text" name="title" id="title" class="form-control" placeholder="제목">
    </div>
  </div>
  <div class="form-group">
    <div class="col-sm-offset-2 col-xs-6">
      <textarea name="contents" id="contents" class="form-control" style="height:100px;resize:none;" placeholder="내용"></textarea>
    </div>
  </div>
   <div class="form-group">
   <div class="col-sm-offset-2 col-sm-5">
    <button class="btn">등록</button>
    <button type="reset" class="btn" onclick="history.back()">취소</button>
   </div>
 </div>
 </form>
</div>
</body> 
</html> 