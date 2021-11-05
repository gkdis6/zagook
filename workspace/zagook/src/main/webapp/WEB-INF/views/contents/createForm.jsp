<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html> 
<html> 
<head>
  <title>homepage</title>
  <meta charset="utf-8">
  <script type="text/JavaScript">
 function checkIn(f){
     if (f.contents.value == ""){
         alert("내용을 입력하세요");
         f.title.focus()
         return false;
 	}
}
 </script>
</head>
<body> 

<div class="container">
<h2 class="col-sm-offset-2 col-sm-10">새 게시글</h2>
<form class="form-horizontal" 
      action="/contents/create"
      method="post"
      enctype="multipart/form-data"
      onsubmit="return checkIn(this)">

  <div class="form-group">
    <div class="col-sm-offset-2 col-xs-6">
      <textarea name="contents" id="contents" class="form-control" style="height:100px;resize:none;" placeholder="내용"></textarea>
    </div>
  </div>
   <input type="hidden" name="id" value="${id}">
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
  	<div class="col-sm-offset-2 col-xs-6">
  	<select class="form-control" name="privacy" id="privacy">
    	<option value=0>나만 보기</option>
    	<option value=1>친구 공개</option>
    	<option value=2>모두 공개</option>
  	</select>
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