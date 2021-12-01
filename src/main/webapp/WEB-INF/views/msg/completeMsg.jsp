<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <script type="text/javascript"
    src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.js"></script>
    <script type="text/javascript"
    src="<%=request.getContextPath()%>/js/ajaxerror.js"></script>

  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  
  
<script type="text/javascript">
$(document).ready(function(){
 var modal = '${dflag}'; //Controller에서 가져온 데이터
 checkModal(); //modal생성
 
 //history back일때는 modal 안보여주는 코드 1
 //history.replaceState({},null,null);
 
 function checkModal(){ //modal 생성함수 선언
     if(history.state) return; //코드2
     if('${dflag}'==false){
         $(".modal-body").html('그동안 Zagook을 이용해주셔서 감사합니다.');
         $("#myModal").modal("show");
     }
   }
});
</script>
</head>
<body>
<div class="container">


<!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog modal-sm">
      <div class="modal-content" style="width:310px; border:2px solid #191a45; border-radius:10px">
        <div class="modal-header">
      
          <h4 class="modal-title" style="font-weight:bold;">회원 탈퇴 완료</h4>
        </div>
        <div class="modal-body">
          <p>This is a small modal.</p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal" onclick="location.href='${root}/'">Close</button>
        </div>
      </div>
    </div>
	</div>
</div>

</body>
</html>