<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>homepage</title>
<meta charset="utf-8">
<script type="text/JavaScript">
	function checkIn(f) {
		if (f.contents.value == "") {
			alert("내용을 입력하세요");
			f.contents.focus()
			return false;
		}
	}
	contents = $("textarea#contents").val();
	function updatefile(filename){
    	$('#updatebtn').hide(); 
		$('#selectimg').show();
      }
</script>
</head>
<body>
	<div class="container">
		<h2 class="col-sm-offset-2 col-sm-10">게시글 수정</h2>
		<form class="form-horizontal" action="/contents/update" method="post"
			onsubmit="return checkIn(this)">
			<div class="form-group">
			 <label class="control-label col-sm-2">사진</label>
			  <div class="col-sm-6">
			   <input type="hidden" name="oldfile" value="${oldfile}">    
			   <img src="/images/${dto.filename}" style="width:500px"><br><br>
				<button type="button" class="btn btn-default" id="updatebtn"
					onclick="javascript:updatefile('${dto.filename}')">수정</button>
			      <div class="col-sm-14" id="selectimg" style="display:none">          
			        <input type="file" class="form-control" id="filenameMF" 
			        name="filenameMF" accept=".jpg,.png,.gif" required="required">
			      </div>
			  </div>
			</div>
			<input type="hidden" name="contentsno" value="${contentsno}">
			<div class="form-group">
			   <div class="col-sm-offset-2 col-xs-6">
			      <textarea name="contents" id="contents" class="form-control" style="height:100px;resize:none;">${dto.contents}</textarea>
			   </div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="tag">태그</label>
				<div class="col-sm-6">
					<input type="text" name="tag" id="tag" class="form-control"
						value="${dto.tag}">
				</div>
			</div>
			<div class="form-group">
			  <div class="col-sm-offset-2 col-xs-6">
			  	<select class="form-control" name="privacy" id="privacy">
			    	<option value=0 <c:if test= "${dto.privacy==0}">selected</c:if> >나만 보기</option>
			    	<option value=1 <c:if test= "${dto.privacy==1}">selected</c:if> >친구 공개</option>
			    	<option value=2 <c:if test= "${dto.privacy==2}">selected</c:if> >모두 공개</option>
			  	</select>
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
