<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>autocomplete 검색창 구현</title>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="./js/data.js"></script>
</head>
<script>
	
	$(function () {	//화면 로딩후 시작
		$("#searchInput").autocomplete({  //오토 컴플릿트 시작
			source: function(request,response){
				$.ajax({
					type: "get",
					url: "/searchInput",
					data: { type: "json", searchInput: request.term },
					contentType : "application/json; charset=utf-8;",
					dataType: "json",
		            success: function(data) {
		                response(
		                    $.map(data, function(item) {
		                        return {
		                            label: item.TAG,
		                            value: item.TAG,
		                            cnt: item.CNT
		                        };
		                    })
		                );
		            },
		            error : function(request, status, error){
		    			alert("code = "+request.status+" message = "+request.responseText+" error = "+error);
		    		}
				})
			},
			focus : function(event, ui) { // 방향키로 자동완성단어 선택 가능하게 만들어줌	
				return false;
			},
			minLength: 1,// 최소 글자수
			delay: 100,	//autocomplete 딜레이 시간(ms)
		})
		.autocomplete( "instance" )._renderItem = function( ul, item ) {
	        return $( "<li><div><span>"+item.label+"</span><span style='right:10px;position:absolute;'>"+item.cnt+"</span></div></li>" ).appendTo( ul );
	    };
	});
</script>

<body>
	<div>
		검색어<input class="form" type="text" id="searchInput" name="searchInput" style="margin-left: 20px; width: 400px;">
	</div>
</body>
</html>