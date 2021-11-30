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

function container_click(event) {
	console.log(event_flag);
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
			// 댓글 목록을 html로 담기
            let listHtml = "";
            for(const i in data){
                let rnum = data[i].rnum;
                let contentsno = data[i].contentsno;
                let id = data[i].id;
                let content = data[i].content;
                let regdate = data[i].regdate;
                let fname = data[i].fname;


                listHtml += "<div class='row replyrow reply" + rnum + "'>";

                if(content == ""){		// 삭제된 댓글일때
                    listHtml += "	<div>";
                    listHtml += "		(삭제된 댓글입니다)";
                    listHtml += "	</div>";
                }else{	// 모댓글일때
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
                    listHtml += 			regdate;
                    listHtml += "		</div>";
                    // 책갈피
                    // 현재 로그인 상태이고..
                    if("${nick}" != ""){

                        if("${nick}" == id){
                            listHtml += "		<div>";
                            listHtml += "			<a href='javascript:' rnum='"+ rnum  + "' contentsno='"+ contentsno +"' class='reply_delete'>삭제</a>";
                            listHtml += "		</div>";
                        }
                    }

                    listHtml += "	</div>";
                }

                listHtml += "</div>";
			};
			 ///////////// 동적으로 넣어준 html에 대한 이벤트 처리는 같은 함수내에서 다 해줘야한다.
            ///////////// $(document).ready(function(){}); 안에 써주면 안된다.

            // 댓글 리스트 부분에 받아온 댓글 리스트를 넣기
            $(".reply-list"+rnum).html(listHtml);

            //답글을 작성한 후 답글달기 버튼을 눌렀을 때 그 click event를 아래처럼 jquery로 처리한다.
            $('button.btn.btn-success.mb-1.write_rereply').on( 'click', function() {
                console.log( 'rnum', $(this).attr('rnum') );
                console.log( 'contentsno', $(this).attr('contentsno') );

                // 답글을 DB에 저장하는 함수를 호출한다. bno와 no를 같이 넘겨주어야한다.
                WriteReReply($(this).attr('rnum'), $(this).attr('rnum') );
            });

            // 삭제버튼을 클릭했을 때
            $('.reply_delete').on('click', function(){
                DeleteReply($(this).attr('rnum'), $(this).attr('contentsno'));

            })


        },
        error : function() {
            alert('서버 에러');
        }
    });
}
	
		else if(event_flag == 0){
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

			