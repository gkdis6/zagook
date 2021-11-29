<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 
<!DOCTYPE html>
<html lang="ko">
<style>
.form-group{
	padding-bottom:10px
}
#connect_btn{
	color:#fff;
	background:blue;
	border-radius:0.5em;
}
#disconnect_btn{
	color:#fff;
	background:red;
	border-radius:0.5em;
}
.chat_main{
	padding-top:50px;
}
</style>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>문의사항</title>
<link href="../css/style.css" rel="Stylesheet" type="text/css">  <%--/static 폴더 기준 --%>





<%-- WebSocket 관련 설정 --%>
<script src="../js/sockjs.min.js"></script>  <%--/static 폴더 기준 --%>
<script src="../js/stomp.min.js"></script>  <%--/static 폴더 기준 --%>

<script type="text/JavaScript" src="../js/app.js"></script>  <%--/static 폴더 기준 --%>
          
</head>
<body>
<div class="chat_main">
<div id="main-content" class="container" style="margin-left:10px">
    <H3>무엇을 도와드릴까요?</H3>
            <form class="form-inline">
                <div class="form-group">
                    <label for="connect" style="font-size:15px">자동응답 챗봇</label>
                    <button id="connect_btn" class="btn btn-default" type="submit">시작하기</button>
                    <button id="disconnect_btn" class="btn btn-default" type="submit" disabled="disabled">종료</button>
                </div>
                
            </form>
            <form class="form-inline">
                <div class="form-group" style="width: 90%;">
                    <input type="text" id="msg" class="form-control" placeholder="문의사항을 입력하세요."  style="width:80%;">
 	                <button id="send" class="btn btn-default" disabled type="submit">문의하기</button>
                </div>
            </form>


    <div class="row">
        <div class="col-md-12">
            <table id="conversation" class="table table-striped">
                <thead>
                <tr>
                    <th>답변</th>
                </tr>
                </thead>
                <tbody id="communicate">
                </tbody>
            </table>
        </div>
    </div>
</div>
</div>
</body>
</html>
