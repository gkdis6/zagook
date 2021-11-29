$("#cmtCnt-btn").click(function(){
	<%
		if(id==null){}
	%>
	alert("로그인이 필요합니다.");
	location.href='/login.do';
	<%
	}else{
	%>
	$.ajax({
		url:"/commetIn.do",
		type:"POST",
		data:{
			num : '<%vo.getB'
		}
	})
	}
}