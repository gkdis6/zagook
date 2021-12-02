<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>친구페이지</title>
<meta charset="utf-8">
<style>
body{
	text-align: center;
}
.container{
	display: grid;
	grid-template-columns: 220px 220px 220px 220px 220px;
	grid-auto-rows: 312px;
	grid-gap: 10px;
	height: auto;
	padding-bottom: 100px;
}
.container::after, .container::before{ 
	display:none !important;
	}
.friend_container{
	border: solid;
	width: 220px;
	height: 312px;
	border-radius: 8px;
	text-align:center;
}
.friend_container span{
	font-size: 20px;
}
.friend_img_container{
	padding-top: 5px;
	padding-bottom: 5px;
}
.friend_img_container img{
	width: 200px;
	height: 200px;
	objec-fit: cover;
}
.container_title{
	display: flex;
	justify-content: center;
} 
.container_title div{
	text-align:left;
	width: 1140px;
	font-size: 40px;
	padding-top: 60px;
	padding-bottom: 10px;
}
.friend_container button{
	width: 200px;
	height: 35px;
}
.friend_container .accept_friend{
	background-color: skyblue;
	outline: none;
	border: none;
	border-radius: 5px;
	color: white;
}
.friend_container .friend_processing{
	background-color: #191A45;
	outline: none;
	border: none;
	border-radius: 5px;
	color: white;
	pointer-events: none;
	
}
.friend_container .already_friend{
	background-color: green;
	outline: none;
	border: none;
	border-radius: 5px;
	color: white;
	pointer-events: none;
}
.friend_container .delete_friend{
	margin-top: 3px;
	background-color: red;
	outline: none;
	border: none;
	border-radius: 5px;
	color: white;
	height: 25px;
}

</style>
<script src="/js/reply/reply.js">

</script>
</head>
<body>

	<div class="container_title"><div>친구 관리</div></div>
	<div class="container">
	<c:choose>   
		<c:when test="${empty list}">
		</c:when>
		<c:otherwise>
			<c:forEach var="dto" items="${list}">
			<div class="friend_container" id="${dto.id2 }">
				<div class="friend_img_container">
					<img src="/member/storage/${dto.fname }"></img>
				</div>
				<span>${dto.id2}</span><br>
				<c:if test="${dto.status == 3 }"> 
				<button type="button" class="already_friend">친구</button>
				</c:if>
				<c:if test="${dto.status == 2 }">
				<button type="button" class="friend_processing">친구 신청중</button>
				</c:if>
				<c:if test="${dto.status == 1 }">
				<button type="button" class="accept_friend" name="${dto.id2 }">수락</button>
				</c:if>
				<button type="button" class="delete_friend" name="${dto.id2 }">삭제</button>
			</div>
			</c:forEach>
		</c:otherwise>
	</c:choose>

	</div>
</body>
<script>
<c:if test="${!empty sessionScope.id }">
$(document).on("click","button[class='delete_friend']",function(){
	let name = $(this).attr("name");
	console.log(name);
	var ans = confirm("친구를 삭제하시겠습니까?");
    if(!ans) return false;
    
	$.ajax({
		url : "/friend_delete",
		type : "get",
		data : {
			id2 : name
		},
		contentType : "application/json; charset=utf-8;",
		dataType : 'json',
		success : function(data){
			let id = data.id2;
			$('#'+id).remove();
		},
		error : function(data) {
            alert("친구 삭제 중 오류가 발생하였습니다.");
        }
	})
})

$(document).on("click","button.accept_friend",function(){
	let name = $(this).attr("name");
	console.log($(this));
	var ans = confirm("친구를 수락하시겠습니까?");
    if(!ans) return false;
	$.ajax({
		url : "/friend_accept",
		type : "get",
		data : {
			id2 : name
		},
		contentType : "application/json; charset=utf-8;",
		dataType : 'json',
		success : function(data){
		},
		error: function(data) {
           alert("친구 수락 중 오류가 발생하였습니다.")
        }
	})
	$(this).removeClass();
	$(this).addClass('already_friend');
	$(this).text('친구');
})
</c:if>
</script>
</html>