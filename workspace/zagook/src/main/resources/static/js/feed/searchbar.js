function start_autocomplete(){
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
}

function start_autocomplete_friend() {
	$("#searchInput").autocomplete({  //오토 컴플릿트 시작
		source: function(request,response){
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
		},
		focus : function(event, ui) { // 방향키로 자동완성단어 선택 가능하게 만들어줌	
			return false;
		},
		minLength: 1,// 최소 글자수
		delay: 100,	//autocomplete 딜레이 시간(ms)
	})
	.autocomplete("instance")._renderItem = function( ul, item ) {
        return $( "<li><div style='text-align:justify;'><img style='width:40px; height:40px; border-radius:50%;' src='"+item.img+"'><span style='right:10px;position:absolute;top:13px;'>"+item.label+"</span></div></li>" ).appendTo( ul );
    };
}

function openSearchbar() {
	if (document.getElementById("searchInput") != null) {
		document.getElementById("searchInput").setAttribute("placeholder", "Search Tag");
		document.getElementById("searchInput").setAttribute("value", "");		
		return false;
	}
	document.getElementById("searchbar_container").innerHTML = '<input class="form ui-autocomplete-input" type="text" id="searchInput" name="searchInput" autocomplete="off" placeholder="Search Tag">';
	document.getElementById("searchbar_container").innerHTML += '<button type="submit"><i class="fa fa-search"></i></button>';
	get_tag_style();
	start_autocomplete();
}

function openSearchbarFriend() {
	if (document.getElementById("searchInput") != null) {
		document.getElementById("searchInput").setAttribute("placeholder", "Search Friend");
		document.getElementById("searchInput").setAttribute("value", "");
		return false;
	}
	document.getElementById("searchbar_container").innerHTML = '<input class="form ui-autocomplete-input" type="text" id="searchInput" name="searchInput" autocomplete="off" placeholder="Search Friend">';
	document.getElementById("searchbar_container").innerHTML += '<button type="submit"><i class="fa fa-search"></i></button>';
	get_tag_style();
	start_autocomplete_friend();
}

function get_tag_style() {
	var link = document.createElement("link");
	link.href = "/css/feed/searchbar.css";
	link.type = "text/css";
	link.rel = "stylesheet";
	link.media = "screen,print";
	
	document.getElementsByTagName("head")[0].appendChild(link);
}