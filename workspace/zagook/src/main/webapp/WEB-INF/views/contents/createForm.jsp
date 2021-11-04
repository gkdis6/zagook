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
<h2 class="col-sm-offset-2 col-sm-10">글 등록</h2>
<form class="form-horizontal" 
      action="/contents/create"
      method="post"
      enctype="multipart/form-data"
      onsubmit="return checkIn(this)">

  <div class="form-group">
    <div class="col-sm-offset-2 col-xs-6">
      <textarea name="content" id="content" class="form-control" style="height:300px;resize:none;" placeholder="내용"></textarea>
    </div>
  </div>
  <div class="form-group">
    <label class="control-label col-sm-2" for="tag">태그</label>
    <div class="col-sm-6">
      <input type="text" name="tag" id="tag" class="form-control">
    </div>
  </div>
  <div class="form-group">
    <label class="control-label col-sm-2" for="filenameMF">이미지</label>
    <div class="col-sm-6">
      <input type="file" name="filenameMF" id="filenameMF" class="form-control">
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