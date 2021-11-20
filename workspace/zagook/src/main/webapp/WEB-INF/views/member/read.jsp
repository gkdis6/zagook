<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="/ELFunctions"%>
<c:set var="root" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<style>

.container {
	margin-left: 20px;
	padding-top: 20px;
}

table.mypage-type {
	border-collapse: collapse;
	text-align: left;
	line-height: 1.5;
	border-top: 1px solid #ccc;
	border-left: 3px solid #191A45;
	margin: 20px 10px;
	background-color:white;
}

table.mypage-type th {
	width: 147px;
	padding: 10px;
	font-weight: bold;
	vertical-align: top;
	color: #153d73;
	border-right: 1px solid #ccc;
	border-bottom: 1px solid #ccc;
}

table.mypage-type td {
	width: 349px;
	padding: 10px;
	font-weight: bold;
	vertical-align: top;
	border-right: 1px solid #ccc;
	border-bottom: 1px solid #ccc;
}

#update-btn {
	border-radius: 7px;
	margin-left:10px;
}

#delete-btn {
	border-radius: 7px;
}

#list-btn {
	border-radius: 7px;
}

#mypage-button button {
	border: 2px solid #191A45;
	background-color: white;
	font-weight: bold;
	color: #191A45;
	height: 30px;
}

#mypage-button button:hover {
	color: white;
	background: #191A45;
}

.update-image {
	display: block;
}

</style>
<title>회원정보</title>
<meta charset="utf-8">
<script type="text/javascript">
	function updateM() {
		var url = "update";
		url += "?email=${dto.email}${sdto.email}";

		location.href = url;
	}

	function deleteM() {
		var url = "delete";
		url += "?id=${dto.id}";
		url += "&oldfile=${dto.fname}";
		location.href = url;
	}
</script>
</head>
<body>
	<div class="container">
		<h2 style="padding-left: 10px; font-weight:bold; color:#191A45">${dto.id}의 회원정보</h2>
		<table class="mypage-type">
			<tr>
				<td colspan="2" style="text-align: center"><img
					src="/member/storage/${dto.fname}" width="250px" height="250px"
					style="border-radius: 130px"> <a class="update-image"
					href="#" style="text-align: right" data-toggle="modal"
					data-target="#updateimg">사진 수정</a>
					<div class="modal" id="updateimg">
						<div class="modal-dialog modal-sm">
							<div class="modal-content">
								<div class="modal-header">
									<h4>프로필 사진 수정</h4>
								</div>
								<div class="modal-body">
									<form class="form-horizontal" action="/member/updateFile" method="post"
										enctype="multipart/form-data">
										<input type="hidden" name="oldfile" value="${param.oldfile}">

										<div class="form-group">
											<label class="control-label col-sm-2" for="oldfile">원본파일</label>
											<div class="col-sm-6">
												<img src="/member/storage/${dto.fname}"
													class="img-rounded" width="200px" height="200px">
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-sm-2" for="fnameMF">변경파일</label>
											<div class="col-sm-6">
												<input type="file" class="form-control" id="fnameMF"
													name="fnameMF" accept=".jpg,.png,.gif" required="required">
											</div>
										</div>
										<div class="form-group">
											<div class="col-sm-offset-2 col-sm-8">
												<button type="submit" class="btn btn-default">수정</button>
												<button type="button" class="btn btn-default"
													onclick="history.back()">취소</button>
											</div>
										</div>
									</form>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary"
										data-dismiss="modal">취소</button>
								</div>
							</div>
						</div>
					</div></td>
			</tr>
			<tr>
				<th>닉네임</th>
				<td>${dto.id}</td>
			</tr>
			<tr>
				<th>이메일</th>
				<td>${dto.email}</td>
			</tr>
			<tr>
				<th>성명</th>
				<td>${dto.mname}</td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td>${dto.tel}</td>
			</tr>
			<tr>
				<th>직업</th>
				<td>${util:jobname(dto.job)}</td>
			</tr>
			<tr>
				<th>가입날짜</th>
				<td>${dto.mdate}</td>
			</tr>
		</table>

		<div id="mypage-button">
			<button id="update-btn" onclick="updateM()">정보수정</button> &nbsp;
			<button id="delete-btn" onclick="deleteM()">회원탈퇴</button>
			<%-- 	 <button id="list-btn" onclick="location.href='${root}/admin/list'">회원목록</button> <!-- read 페이지 사용자는 못보게 --> --%>
		</div>
		
	</div>
</body>
</html>