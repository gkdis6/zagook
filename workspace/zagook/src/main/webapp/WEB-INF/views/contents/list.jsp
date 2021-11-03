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
     function detail(contentsno){
       var url = "detail";
       url += "?contentsno="+contentsno;
       url += "&col=${col}";
       url += "&word=${word}";
       url += "&nowPage=${nowPage}";
       location.href=url;
 
     }
     
     function fileDown(filename){
         var url = "fileDown";
         url += "?filename="+filename;
         location.href=url;
        }
  
  </script>
 
</head>
<body>
<div class="container">
 
  <h2>글 목록</h2>
  <form class="form-inline" action="/list">
    <div class="form-group">
      <select class="form-control" name="col">
        <option value="tag"
        <c:if test= "${col=='tag'}"> selected </c:if>
        >태그</option>   
     </select>
    </div>
    <div class="form-group">
      <input type="text" class="form-control" placeholder="Enter 검색어" 
      name="word" value="${word}">
    </div>
    <button type="submit" class="btn btn-default" >검색</button>
    <button type="button" class="btn btn-default" onclick="location.href='/create'">등록</button>
  </form>
  
  <table class="table table-striped">
   <thead>
    <tr>
    <th>번호</th>
    <th>이미지</th>
    <th>태그</th>
    <th>등록날짜</th>
    <th>수정/삭제/이미지수정</th>
    </tr>
   </thead>
   <tbody>
 
<c:choose>   
<c:when test="${empty list}">
   <tr><td colspan="6">등록된 상품이 없습니다.</td>
</c:when>
<c:otherwise>
  
   <c:forEach var="dto" items="${list}"> 
   
   <tr>
    <td>
    <a href="javascript:detail('${dto.contentsno}')">${dto.contentsno}</a>
    <c:if test="${util:newImg(fn:substring(dto.rdate,0,10)) }">
         <img src="/images/new.gif"> 
    </c:if>
    </td>
    <td>
    <img src="/images/${dto.filename}"  class="img-rounded" width="100px" height="100px">
    </td>
	<td>${dto.tag}</td>
    <td>${dto.rdate}</td>
    <td> <a href="/update/${dto.contentsno }">
          <span class="glyphicon glyphicon-edit"></span>
        </a>
        /
        <a href="/delete/${dto.contentsno }">
          <span class="glyphicon glyphicon-trash"></span>
        </a>
        /
        <a href="/updateFile/${dto.contentsno }/${dto.filename}">
          <span class="glyphicon glyphicon-picture"></span>
        </a>     
    </td>
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
