$(function start_autocomplete(){
	$("#searchInput").autocomplete({  //오토 컴플릿트 시작
		source: function(request,response){
			if (request.term[0] == "#") {
 				$("#searchInput").css("color", "#337AB7");
 				$("#searchInput").css("text-decoration", "underline");
 				$("input[name=search_type]").val("tag");
 				$.ajax({
 					type: "get",
 					url: "/searchInput",
 					data: { type: "json", searchInput: request.term.substr(1, request.term.length - 1)},
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
 			} else {
 				$("#searchInput").css("color", "black");
 				$("#searchInput").css("text-decoration", "none");
 				$("input[name=search_type]").val("friend");
 				$.ajax({
 					type: "get",
 					url: "/searchInput_friend",
 					data: { type: "json", searchInput_friend: request.term },
 					contentType : "application/json; charset=utf-8;",
 					dataType: "json",
 		            success: function(data) {
 		                response(
 		                    $.map(data, function(item) {
 		                        return {
 		                            label: item.ID,
 		                            value: item.ID,
 		                            img: "/member/storage/profile/"+item.FNAME
 		                        };
 		                    })
 		                );
 		            },
 		            error : function(request, status, error){
 		    			alert("code = "+request.status+" message = "+request.responseText+" error = "+error);
 		    		}
 				})
 			}
		},
		focus : function(event, ui) { // 방향키로 자동완성단어 선택 가능하게 만들어줌	
			$(".searchbar_item").css("background-color", "#fff");
			$("#searchInput").val(ui.item.label);
			$("#" + ui.item.label).css("background-color", "#F5F2B8");
            return false;
		},
		minLength: 1,// 최소 글자수
		delay: 100,	//autocomplete 딜레이 시간(ms)
	})
	.autocomplete( "instance" )._renderItem = function( ul, item ) {
		ul.css("position", "fixed");
 		ul.css("padding-top", "10px");
 		ul.css("padding-left", "0px");
 		ul.css("max-width", "500px");
 		ul.css("max-height", "300px");
 		ul.css("overflow-y", "scroll");
 		ul.css("z-index", "5");
 		if (item.img == "undefined" || item.img == null || item.img == "")
         	return $( "<li class='searchbar_item' id='" + item.label + "'><div><span>"+item.label+"</span><span style='right:10px;position:absolute;'>"+item.cnt+"</span></div></li>" ).appendTo( ul );
         else
         	return $( "<li class='searchbar_item' id='" + item.label + "'><div style='text-align:justify;'><img style='width:40px; height:40px; border-radius:50%;' src='"+item.img+"'><span style='right:10px;position:absolute;top:13px;'>"+item.label+"</span></div></li>" ).appendTo( ul );
    };
});

$("#searchInput").change(function () {
 	console.log("search_type : ", $("input[name=search_type]").val());
 	if ($("#searchInput").val() == session_id) {
		$("#searchbar_form").attr("method", "post");
		$("#searchbar_form").attr("action", "http://localhost:8005/feed/myread");
	} else
 		$("#searchbar_form").attr("action", "http://localhost:8005/feed/" + $("input[name=search_type]").val());
 });
 
function onsearchbar_login_valid() {
 	onclick_login_open();
 	$("#searchInput").val("");
 	return false;
}