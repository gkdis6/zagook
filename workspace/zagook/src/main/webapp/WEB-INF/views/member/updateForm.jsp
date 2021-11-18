<%@ page contentType="text/html; charset=UTF-8" %> 
<!DOCTYPE html>
<html>
<head>
  <title>회원수정</title>
  <meta charset="utf-8">
  <style type="text/css">
  	#need,#emailcheck{
  		color:red;
  	}
  </style>
  <script type="text/javascript">
  function emailCheck(email){
	  //alert(email);
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
	
	if(f.tel.value.length==0){
		alert("전화번호를 입력하세요");
		f.tel.focus();
		return false;
	}
	if(f.email.value.length==0){
		alert("이메일을 입력하세요");
		f.email.focus();
		return false;
	}
	if(f.job.selectedIndex == 0){
		alert("직업을 선택하세요");
		f.job.focus();
		return false;
	}
}

</script>
</head>
<body>
<div class="container">

<h2 class="col-sm-offset-2 col-sm-10">회원수정</h2>
<label class="col-sm-offset-2 col-sm-10">(<span id="need">*</span> 필수입력사항)</label>
  <form class="form-horizontal" 
        action="update"
        method="post"
        name = 'frm'
        onsubmit="return inCheck(this)"
        >
     
    <input type="hidden" name="social" value="${dto.social}">
<%--     <input type="hidden" name="id" value="${dto.id}"> --%>
    <div class="form-group">
      <label class="control-label col-sm-2" for="id">닉네임</label>
      <div class="col-sm-3">          
      <input type="text" class="form-control" id="id" 
         value="${dto.id}"  name="id">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="mname">이름</label>
      <div class="col-sm-3">          
        <input type="text" class="form-control" id="mname" 
         value="${dto.mname}"  name="mname">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="tel">전화번호</label>
      <div class="col-sm-4">          
        <input type="text" class="form-control" id="tel" 
         value="${dto.tel}"  name="tel">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="email"><span id="need">*</span>이메일</label>
      <div class="col-sm-3">          
        <input type="email" class="form-control" id="email" 
        value="${dto.email}" name="email">
      </div>
      
      <button type="button" class="btn btn-default col-sm-2"
      onclick="emailCheck(document.frm.email.value)">Email 변경</button>
      <div id="emailcheck"></div>
      
    </div>
    
    <div class="form-group">
    <label class="control-label col-sm-2" for="job"><span id="need">*</span>직업</label>
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
      <div class="col-sm-offset-2 col-sm-5">
        <button type="submit" class="btn btn-default">수정</button>
        <button type="reset" class="btn btn-default">취소</button>
      </div>
    </div>
  </form>

<br><br>
</div>
</body>
</html>