// if default = 0, like_click = 1, 
let event_flag = 0;
let time_order_event_flag = 0;
let overlay_pre= new kakao.maps.CustomOverlay({
	xAnchor: 0.5,
	yAnchor: 1
});

function like_click(event) {
	event_flag = 1;
	console.log(event_flag);
}

function tag_click(event) {
	event_flag = 2;
	console.log(event_flag);
}

function id_click(event) {
	event_flag = 3;
	console.log(event_flag);
}

function img_click(event) {
	event_flag = 4;
	$(".modal_img").show();
	var imgSrc = event.target.getAttribute("src");
	
	$(".modal_imgBox img").attr("src", imgSrc);
}

function reply_click(event) {
	event_flag = 5;
	console.log(event_flag);
}
function reply_delete(event){
	event_flag = 6;
}
function update_click(event){
	event_flag = 7;
}

function container_click(event) {
	console.log(event_flag);
	console.log(event.currentTarget);
	if (event_flag == 1) {
		console.log(event.currentTarget.id);
		let param = {"contentsno": event.currentTarget.id};
		let result = 0;
		$.ajax({
			url : "/feed/like",
			type : "POST",
			data : JSON.stringify(param),
			dataType : 'json',
			contentType : "application/json; charset=utf-8;",
			success : function(data, status, xhr){
				if (data.like == "like")
					event.target.src = "../images/feed/like_fill.png";
				else if (data.like == "unlike")
					event.target.src = "../images/feed/like_outline.png";
				event.target.nextElementSibling.innerText = data.like_cnt;
			},
			error: function (xhr, status, err) {
                console.log(err);
            }
		});
	} else if (event_flag == 2) {
		onclickTag(event);
	} else if (event_flag == 3) {
		onclickId(event);
	} else if (event_flag == 5)	{
		console.log(event.currentTarget);
		let param = event.currentTarget.id;
		var target = document.getElementById("reply-list"+param);
		$.ajax({
	        url : '/call_replyList',
	        type : 'get',
	        data : {
	            contentsno : param
	        },
	        contentType : "application/json; charset=utf-8;",
	        dataType : 'json',
	        success : function(data) {
	
	            console.log("댓글 리스트 가져오기 성공");
	            if(session_id != 'null'){
		            let write_html="";
					write_html+='<div class="input_reply_div">';
					write_html+='	<input class="w-100 form-control input_reply" id="input_reply'+param+'" type="text" placeholder="댓글입력...">';
					write_html+='	<button type="button" class="btn btn-success mb-1 write_reply" name="'+param+'">댓글&nbsp;달기</button>';
					write_html+='</div>';
					let div_1 = document.createElement('div');
					div_1.className = "row reply_wirte";
					div_1.innerHTML = write_html;
		            
					target.appendChild(div_1);
				}
				// 댓글 목록을 html로 담기
	            let listHtml = "";
	            for(const i in data){
	                let rnum = data[i].rnum;
	                let contentsno = data[i].contentsno;
	                let id = data[i].id;
	                let content = data[i].content;
	                let regdate = data[i].regdate;
	                let fname = data[i].fname;
					console.log(rnum);
					console.log(contentsno);
					console.log(id);
					console.log(content);
					console.log(regdate);
					console.log(fname);
	
	                listHtml += "<div class='row replyrow reply" + rnum + "'>";
	
                    listHtml += "	<div class='col-1'>";
                    listHtml += "			<img class='reply_list_profileImage' src='/member/storage/profile/"+ fname +"'/>";
                    listHtml += "	</div>";
                    listHtml += "	<div class='rereply-content col-8'>";
                    listHtml += "		<div>";
                    listHtml += "			<span>";
                    listHtml += "				<b>"+ id +"</b>";
                    listHtml += "			</span>";
                    listHtml += "			<span>";
                    listHtml += 				content;
                    listHtml += "			</span>";
                    listHtml += "		</div>";
                    listHtml += "	</div>";

                  	

                    listHtml += "	<div class='col-3 reply-right'>";
                    listHtml += "		<div>";
                    listHtml += 			regdate.substring(2,16);
                    listHtml += "		</div>";
                    // 책갈피
                    // 현재 로그인 상태이고..
                    console.log(session_id);
                    if(session_id != "null"){

                        if(session_id == id){
                            listHtml += "		<div>";
                            listHtml += "			<button href='javascript:' rnum='"+ rnum  + "' contentsno='"+ contentsno +"' class='reply_delete' onclick='reply_delete(event)'>삭제</button>";
                            listHtml += "		</div>";
                        }
                    }

                    listHtml += "	</div>";
                //}

                	listHtml += "</div>";
                	}
                	let newElement = document.createElement('div');
                	newElement.className = "reply_down_container"+param;
					newElement.innerHTML = listHtml;
		            
					target.appendChild(newElement);
				
	        },
	        error: function() {
	            alert('서버 에러');
	        }
    	})
    	document.getElementById('reply_btn'+param).onclick = null;
	}else if(event_flag == 0){
		let filename = event.currentTarget.getAttribute("filename");
		let posi = new kakao.maps.LatLng(event.currentTarget.getAttribute("x_site"), event.currentTarget.getAttribute("y_site"));
		overlay_pre.setMap(null);
		var div1 = document.createElement('div');
		div1.className = 'wrap';
		var div2 = document.createElement('div');
		div2.className = 'info';
		var div3 = document.createElement('div');
		div3.className = 'title';
		var closeBtn = document.createElement('button');
		closeBtn.className = 'close';
		closeBtn.onclick = function () {
			overlay_pre.setMap(null);
		};
		div3.appendChild(closeBtn);
		div2.appendChild(div3);
		div1.appendChild(div2);
		var div4 = document.createElement('div');
		div4.className = 'body';
		var div5 = document.createElement('div');
		div5.className = 'img';
		div5.innerHTML = '<img style="width:150px; height:auto;"src="/contents/storage/'+filename+'">';
		div4.appendChild(div5);
		div1.appendChild(div4);
		overlay_pre.setContent(div1);
		overlay_pre.setPosition(posi);
		overlay_pre.setMap(map_main);
		overlays.push(overlay_pre);
	}else if(event_flag==7){
		console.log(event.currentTarget);
		let param = event.currentTarget.id;
		var oldfile = document.getElementById("imgsrc"+param).getAttribute("name");
		var tag = document.getElementById("tag_container"+param).getAttribute("name");
		var contents = document.getElementById("contents"+param).innerText;
		var privacy = document.getElementById("privacy"+param).getAttribute("value");
		let modal = $(".modal_update");
		let mcontents=modal.find("textarea[name='contents']");
		let moldfile=modal.find("input[name='oldfile']");
		let mcontentsno=modal.find("input[name='contentsno']");
		let mtag=modal.find("input[name='tag']");
		let mprivacy=modal.find("select[name='privacy']");
		let moldImg = modal.find("img[id='oldImg']");
		mcontents.val(contents);
		moldfile.val(oldfile);
		mcontentsno.val(param);
		mtag.val(tag);
		mprivacy.val(privacy);
		moldImg.attr('src','/contents/storage/'+oldfile);
		$(".modal_update").show();
	}
	
	// after processing, should be change flag to default(0)
	event_flag = 0;
}

function time_click() {
	time_order_event_flag = 1;
}

function time_container_click(event) {
	console.log(time_order_event_flag);
	if (time_order_event_flag == 1) {
		onclick_time(event);
	}
	time_order_event_flag = 0;
}


$(document).on('click',"button.reply_delete", function(){
	let name = $(this).attr("rnum");
	console.log(name);
	var ans = confirm("댓글을 삭제하시겠습니까?");
    if(!ans) return false;
    
	$.ajax({
		url : "/delete_reply",
		type : "get",
		data : {
			rnum : name
		},
		contentType : "application/json; charset=utf-8;",
		dataType : 'json',
		success : function(data){
			$(".reply"+name).remove();
		},
		error : function(data) {
            alert("댓글 삭제 중 오류가 발생하였습니다.");
        }
	})
});	

$(document).on('click',"button.write_reply", function(){
	let name = $(this).attr("name");
	let content = $('#input_reply'+name).val();
	if(name == ""){
		alert("내용을 입력해주세요");
		return false;
	}
	console.log(name);
	var ans = confirm("댓글을 등록하시겠습니까?");
    if(!ans) return false;
    $('#input_reply'+name).val("");
	$.ajax({
		url : "/write_reply",
		type : "get",
		data : {
			contentsno : name,
			content: content
		},
		contentType : "application/json; charset=utf-8;",
		dataType : 'json',
		success : function(data){
			$(".reply_down_container"+name).children().remove();
			let listHtml = "";
            for(const i in data){
                let rnum = data[i].rnum;
                let contentsno = data[i].contentsno;
                let id = data[i].id;
                let content = data[i].content;
                let regdate = data[i].regdate;
                let fname = data[i].fname;
				console.log(rnum);
				console.log(contentsno);
				console.log(id);
				console.log(content);
				console.log(regdate);
				console.log(fname);

                listHtml += "<div class='row replyrow reply" + rnum + "'>";

                listHtml += "	<div class='col-1'>";
                listHtml += "			<img class='reply_list_profileImage' src='/member/storage/profile/"+ fname +"'/>";
                listHtml += "	</div>";
                listHtml += "	<div class='rereply-content col-8'>";
                listHtml += "		<div>";
                listHtml += "			<span>";
                listHtml += "				<b>"+ id +"</b>";
                listHtml += "			</span>";
                listHtml += "			<span>";
                listHtml += 				content;
                listHtml += "			</span>";
                listHtml += "		</div>";
                listHtml += "	</div>";

              	

                listHtml += "	<div class='col-3 reply-right'>";
                listHtml += "		<div>";
                listHtml += 			regdate.substring(2,16);
                listHtml += "		</div>";
                // 책갈피
                // 현재 로그인 상태이고..
                console.log(session_id);
                if(session_id != "null"){

                    if(session_id == id){
                        listHtml += "		<div>";
                        listHtml += "			<button href='javascript:' rnum='"+ rnum  + "' contentsno='"+ contentsno +"' class='reply_delete' onclick='reply_delete(event)'>삭제</button>";
                        listHtml += "		</div>";
                    }
                }

                listHtml += "	</div>";
            //}

            	listHtml += "</div>";
        	}
			$(".reply_down_container"+name).append(listHtml);
		},
		error : function(data) {
            alert("댓글 등록 중 오류가 발생하였습니다.");
        }
	})
});	