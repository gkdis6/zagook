<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="util" uri="/ELFunctions" %>
 
<!DOCTYPE html> 
<html> 
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
   <script type="text/javascript">
     function detail(noticeno){
       var url = "detail";
       url += "?noticeno="+noticeno;
       url += "&col=${col}";
       url += "&word=${word}";
       url += "&nowPage=${nowPage}";
       location.href=url;
     }  
  </script>
  <script>
  $.ajax({ // 컨트롤러와 통신
	  type: 'POST',
	  url: "/notice/create",
	  data: JSON.stringify(data),
	  //contentType: "application/json; charset=UTF-8",
	  dataType:"json",
	  success: function(data) {
		  if(data=="1"){
		  alert("공지 등록 성공");
	  }else{
		  alert("등록 오류");
	  }
	  },
	  error: function(request, status, error) {
	  alert(("code = " + request.status + " message = "
				+ request.responseText + " error = " + error);
	  }
	  });
  </script>
 
</head>
<body>
<div class="container">
 
   <h2>공지 사항</h2>
  <form class="form-inline" action="./list">
    <div class="form-group">
      <select class="form-control" name="col">
        <option value="title"
        <c:if test= "${col=='title'}"> selected </c:if>
        >제목</option>
        <option value="content"
        <c:if test= "${col=='content'}"> selected </c:if>
        >내용</option>
        <option value="title_content"
        <c:if test= "${col=='title_content'}"> selected</c:if>
        >제목+내용</option>
        <option value="total"
        <c:if test= "${col=='total'}"> selected </c:if>
        >전체출력</option>       
     </select>
    </div>
    <div class="form-group">
      <input type="text" class="form-control" placeholder="Enter 검색어" 
      name="word" value="${word}">
    </div>
    <button type="submit" class="btn btn-default" >검색</button>
    <c:if test="${not empty sessionScope.id && sessionScope.grade == 'A'}">
    <button type="button" class="btn btn-default"
    onclick="location.href='/notice/create'">등록</button>
    </c:if>
  </form>
  
  <table class="table table-striped">
   <thead>
    <tr>
    <th>번호</th>
    <th>제목</th>
    <th>등록날짜</th>
    <th>조회수</th>
    </tr>
   </thead>
   <tbody>
 
<c:choose>   
<c:when test="${empty list}">
   <tr><td colspan="6">등록된 글이 없습니다.</td>
</c:when>
<c:otherwise>
   <c:forEach var="dto" items="${list}"> 
   <tr>
    <td>${dto.noticeno}</td>
    <td>
    <a href="javascript:detail('${dto.noticeno}')">${dto.title}</a>
	<c:if test="${util:newImg(fn:substring(dto.rdate,0,10)) }">
         <img src="/images/new.gif"> 
    </c:if> 
    </td>
    <td>${dto.rdate}</td>
    <td>${dto.cnt}</td>
   </tr>
   </c:forEach>
   </c:otherwise>
   </c:choose>
 
   </tbody>
  
  </table>
  <div>
      ${paging}
  </div>
</div>
</body> 
</html>