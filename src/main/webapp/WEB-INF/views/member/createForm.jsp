<%@ page contentType="text/html; charset=UTF-8" %> 
<!DOCTYPE html>
<html>
<head>
  <title>회원가입</title>
  <meta charset="utf-8">  
  <link rel="stylesheet" href="/css/member/create.css" type="text/css">
  <link rel="stylesheet" href="/css/member/hl.css" type="text/css">
  <script type="text/javascript">
  function idCheck(id){
	  if(id==''){
		  alert("닉네임을 입력하세요");
		  document.frm.id.focus();
	  }else{
		  var url = "idcheck";
		  var param = "id="+id;
		  $.get(url, param, function(data, textStatus) {
			  $("#idcheck").text(data.str);
		  })
	  }
  } 
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
  </script>
  <script type="text/javascript">
function inCheck(f){
	if(f.id.value.length==0){
		alert("닉네임을 입력하세요");
		f.id.focus();
		return false;
	}
	if(f.password.value.length==0){
		alert("비밀번호를 입력하세요");
		f.password.focus();
		return false;
	}
	if(f.repassword.value.length==0){
		alert("비밀번호를 확인하세요");
		f.repassword.focus();
		return false;
	}
	if(f.password.value != f.repassword.value){
		alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
		f.password.value="";
		f.repassword.value="";
		f.password.focus();
		return false;
	}
	if(f.mname.value.length==0){
		alert("이름을 입력하세요");
		f.mname.focus();
		return false;
	}
	if(f.email.value.length==0){
		alert("이메일을 입력하세요");
		f.email.focus();
		return false;
	}
}
</script>
</head>
<body>
<div id="div-create" style="float:left; padding-top:70px">
<div id="create-header">
<span class="hl">발자국 회원가입</span><br>
<h5>발자국의 회원이 되어, 주변사람들과 추억을 공유하세요.</h5>
<label>(<span id="need">*</span> 필수입력사항)</label>
</div>
<!-- <h2 class="col-sm-offset-2 col-sm-10">발자국 회원가입</h2> -->
<!-- <h5 class="col-sm-offset-2 col-sm-10">발자국의 회원이 되어,<br><br>주변사람들과 추억을 공유하세요.</h5> -->
  <div id="div-create-form">
  <form class="form-horizontal" 
        action="create"
        method="post"
        name = 'frm'
        enctype="multipart/form-data"
        onsubmit="return inCheck(this)"
        >
    <div class="create-group">
      <label class="control-label col-sm-2" for="fnameMF">프로필 사진</label>
      <div class="col-sm-4">
        <input type="file" class="form-control" id="fnameMF" 
        name="fnameMF" accept=".jpg,.gif,.png">
      </div>
    </div>
    <div class="create-group" style="margin-bottom:-15px;">
      <label class="control-label col-sm-2" for="email"><span id="need">*</span>이메일</label>
      <div class="col-sm-3">          
        <input type="email" class="form-control" id="email" 
        placeholder="Email은 로그인에 사용됩니다."  name="email">
      </div>
      
      <button type="button" class="btn btn-default"
      onclick="emailCheck(document.frm.email.value)">중복확인</button>
      <div id="emailcheck"></div>
    </div>
    <div class="create-group" style="margin-bottom:-15px;">
      <label class="control-label col-sm-2" for="id"><span id="need">*</span>닉네임</label>
      <div class="col-sm-3">          
        <input type="text" class="form-control" id="id" placeholder="Enter nickname" 
        name="id">
      </div>
      <button type="button" class="btn btn-default"
      onclick="idCheck(document.frm.id.value)">중복확인</button>
      <div id="idcheck"></div>
    </div>
    <div class="create-group">
      <label class="control-label col-sm-2" for="password"><span id="need">*</span>비밀번호</label>
      <div class="col-sm-4">          
        <input type="password" class="form-control" id="password" 
        placeholder="Enter password"  name="password">
      </div>
    </div>
    <div class="create-group">
      <label class="control-label col-sm-2" for="repassword"><span id="need">*</span>비밀번호 확인</label>
      <div class="col-sm-4">          
        <input type="password" class="form-control" id="repassword" 
        placeholder="Enter repasswd"  name="repassword">
      </div>
    </div>
    <div class="create-group">
      <label class="control-label col-sm-2" for="mname"><span id="need">*</span>이름</label>
      <div class="col-sm-4">          
        <input type="text" class="form-control" id="mname" 
        placeholder="Enter 이름"  name="mname">
      </div>
    </div>
    <div class="create-group">
      <label class="control-label col-sm-2" for="tel"><span id="need"></span>전화번호</label>
      <div class="col-sm-4">          
        <input type="text" class="form-control" id="tel" 
        placeholder="Enter 전화번호"  name="tel" maxlength='13'>
      </div>
    </div>
    
    <div class="create-group" style="width=500px">
    <label class="control-label col-sm-2" for="job"><span id="need"></span>직업</label>
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
    
    </div>
    </div>
       
    <div class="create-group">        
      <div class="create-btn">
        <button id="create-btn" type="submit" class="btn">가입하기</button>
        <button id="back-btn" type="reset" class="btn" onclick="history.back()">취소</button>
      </div>
    </div>
  </form>
  </div>
</div>
<div id="infozagook">
<div id="info-header">
<span class="hl">자국을 소개합니다.</span>
</div>
<table id="zagookintro">
	<tr>
		<td>자국을 소개합니다.</td>
	</tr>
</table>
</div>
<script src="/js/member/update.js"></script>
</body>
</html>