<%@ page contentType="text/html; charset=UTF-8" %> 
<!DOCTYPE html>
<html>
<head>
  <title>회원수정</title>
  <meta charset="utf-8">
 <link rel="stylesheet" href="/css/feed/searchbar.css" type="text/css">
  <style type="text/css">
  	#need,#emailcheck{
  		color:red;
  	}
/*   	.container { */
/* 	margin-left: 0px;  */
/* 	padding: 50px 0px 0px; */
/* 	} */
/* 	.form-horizontal{ */
/* 	margin-left: -90px; */
/* 	font-size:20px; */
/* 	padding-top:90px; */
/* 	} */
	#email{ 
		font-size:20px;
		font-weight:bold;
		padding-top:4px;
		
 	}
  </style>
  <script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
  <script type="text/javascript">
  
  function emailCheck(email){
	  if(email==''){
		  alert("email를 입력하세요");
		  document.frm.email.focus();
	  }else{
		  var url = "emailcheck";
		  url += "?email="+email;
		  
		  $.get(url, function(data, textStatus) {
			  
			  $("#emailcheck").text(data.str);
		  	
		  })
	  }
  }
function inCheck(f){
	
	if(f.id.value.length==0){
		alert("닉네임을 입력하세요");
		f.id.focus();
		return false;
	}
	if(f.mname.value.length==0){
		alert("이름을 입력하세요");
		f.mname.focus();
		return false;
	}
}
</script>
</head>
<body>
<div id="div-update-con">

  <form class="form-horizontal" 
        action="update"
        method="post"
        name = 'frm'
        onsubmit="return inCheck(this)"
        id="update-form"
        >
<h2 class="col-sm-offset-2 col-sm-10" style="margin-left:15px;font-weight:bold">회원수정</h2>
<label class="col-sm-offset-2 col-sm-10"style="margin-left:15px">(<span id="need">*</span> 필수입력사항)</label>
    <input type="hidden" name="email" value="${dto.email}">
	<hr width="50%" align="left">
	<div class="form-group">
		<label class="control-label col-sm-2" for="email">이메일</label>
		<div class="col-sm-3" id="email">${dto.email}</div>
	</div>
	<div class="form-group">
      <label class="control-label col-sm-2" for="id"><span id="need">*</span>닉네임</label>
      <div class="col-sm-3">          
      <input type="text" class="form-control" id="id" 
         value="${dto.id}"  name="id">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="mname"><span id="need">*</span>성명</label>
      <div class="col-sm-3">          
        <input type="text" class="form-control" id="mname" 
         value="${dto.mname}"  name="mname">
      </div>
    </div>
    <h3 style="padding-left:120px; font-weight:bold;">추가 정보</h3>
    <hr width="50%" align="left" style="padding-bottom:10px;">
    <div class="form-group">
      <label class="control-label col-sm-2" for="tel">전화번호</label>
      <div class="col-sm-4">          
        <input type="text" class="form-control" id="tel" 
         value="${dto.tel}"  name="tel">
      </div>
    </div>
    <div class="form-group">
    <label class="control-label col-sm-2" for="job">직업</label>
    <div class="col-sm-2">
    	<select name="job" class="form-control">
    		<option value="0">선택하세요</option>
			<option value="A01">회사원</option>
			<option value="A02">전산관련직</option>
			<option value="A03">연구전문직</option>
			<option value="A04">각종학교학생</option>
			<option value="A05">일반자영업</option>
			<option value="A06">공무원</option>
			<option value="A07">의료인</option>
			<option value="A08">법조인</option>
			<option value="A09">종교/언론/예술인</option>
			<option value="A10">기타</option>
    	
    	</select>
    	<script type="text/javascript">
    		document.frm.job.value='${dto.job}';
    	</script>
    
    </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="intro">소개말</label>
      <div class="col-sm-4">          
        <textarea id="introduction" name="introduction" cols="50" rows="5" style="border-color:grey;">${dto.introduction}</textarea>
        <div id="intro_cnt" >(0 / 100)</div>
      </div>
    </div>   
    <div class="form-group">        
      <div class="col-sm-offset-2 col-sm-5">
        <button type="submit" class="btn btn-default">수정</button>
        <button type="reset" class="btn btn-default" onclick="location.href='${root}/member/mypage'">취소</button>
      </div>
    </div>
  </form>

<br><br>
</div>
<script>
$(document).ready(function() {
    $('#introduction').on('keyup', function() {
        $('#intro_cnt').html("("+$(this).val().length+" / 100)");

        if($(this).val().length > 100) {
            $(this).val($(this).val().substring(0, 100));
            $('#intro_cnt').html("(100 / 100)");
        }
    });
});
</script>
<!-- <script src="/js/feed/top_nav.js"></script> -->
<script src="/js/feed/searchbar.js"></script>
</body>
</html>