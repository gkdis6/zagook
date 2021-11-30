<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="/ELFunctions"%>
<c:set var="root" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>

<style>

.update-image {
	display: block;
}

</style>
<title>회원정보</title>
<meta charset="utf-8">
<link rel="stylesheet" href="/css/feed/searchbar.css" type="text/css">
<link rel="stylesheet" href="/css/member/mypage.css" type="text/css">

<script type="text/javascript">
	function updateM() {
		var url = "update";
		url += "?email=${dto.email}";

		location.href = url;
	}

	function deleteM() {
		var url = "delete";
		url += "?email=${dto.email}";
		url += "&oldfile=${dto.fname}";
		location.href = url;
	}
</script>
</head>
<body>
<div id=div-mypage style="padding-top: 80px;">
	<div class="container" id="mypage">
		<c:choose>
		<c:when test="${dto.id.length() gt 10}">
		<h3 style="padding-left: 10px; font-weight:bold; color:#191A45">${dto.id.substring(0, 10)}의 회원정보</h3>
		</c:when>
		<c:otherwise>
		<h3 style="padding-left: 10px; font-weight:bold; color:#191A45">${dto.id}의 회원정보</h3>
		</c:otherwise>
	</c:choose>
		<table class="mypage-type" id="mypagetable">
			<tr>
				<td id="td-img" colspan="2" style="text-align: center">
				<img src="/member/storage/${dto.fname}" id="mypage-profile-img"> 
					<a class="update-image" href="#" style="text-align: right" data-toggle="modal"
					data-target="#updateimg">사진 수정</a>
					<div class="modal" id="updateimg">
						<div class="modal-dialog modal-sm">
							<div class="modal-content">
								<div class="modal-header">
									<h4 style="font-weight:bold; color:#191A45">프로필 사진 수정</h4>
								</div>
								<div class="modal-body">
									<form class="form-horizontal" action="/member/updateFile" method="post"
										enctype="multipart/form-data">
										<input type="hidden" name="oldfile" value="${param.oldfile}">

										<div class="form-group">
											<label class="control-label col-sm-4" style="font-size:17px;" for="oldfile">원본파일</label>
											<div class="col-sm-6">
												<img src="/member/storage/${dto.fname}"
													id="mypage-old-img" class="img-rounded" width="100px" height="100px">
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-sm-4" for="fnameMF" style="font-size:17px;">변경파일</label>
											<div class="col-sm-6">
												<input type="file" class="form-control" id="fnameMF"
													name="fnameMF" accept=".jpg,.png,.gif" required="required">
											</div>
										</div>
										<div class="modal-footer">
											<div id="img-btn" class="col-sm-offset-2 col-sm-8">
												<button id= "img-update-btn" type="submit" class="btn btn-default">수정</button>
												<button type="button" class="btn btn-default"
												data-dismiss="modal">취소</button>												
											</div>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div></td>
			</tr>
			<tr>
				<th colspan="2">이메일</th>
			</tr>
			<tr>
				<td colspan="2">${dto.email}</td>
			</tr>
			<tr>
				<th colspan="2">닉네임</th>
			</tr>
			<tr>
			<c:choose>
			<c:when test="${dto.id.length() gt 10}">	
				<td colspan="2">${dto.id.substring(0, 10)}</td>
				</c:when>
			<c:otherwise>
				<td colspan="2">${dto.id}</td>
			</c:otherwise>
			</c:choose>			
			
			</tr>
			<tr>
				<th colspan="2">성명</th>
			</tr>
			<tr>
				<td colspan="2" style="border-bottom:1px solid #ccc;">${dto.mname}</td>
			</tr>
			
		</table>
		<div id="mypage-button">
			<button id="update-btn" onclick="updateM()">정보수정</button> &nbsp;
			<button id="delete-btn" onclick="deleteM()">회원탈퇴</button>
		</div>
	</div>
	<div id="intro">
	<span class=hl>프로필 소개</span>
		<div id="div-intro">
		<table id="intro-table">
			<tr>
			<c:choose>
			<c:when test="${empty dto.introduction}">
				<td>프로필 소개를 등록하세요.</td>
			</c:when>
			<c:otherwise>
				<td>${dto.introduction}</td>
			</c:otherwise>
			</c:choose>
			</tr>
		</table>
		</div>
	</div>
	<hr>
	<div id="div-add-info">
	<span class=hl>추가정보</span>
		<div class="div-tel-job">
		<table id="tel-info">
			<tr>
				<th>전화번호</th>
			</tr>	
			<tr>
			<c:choose>
			<c:when test="${empty dto.tel}">
				<td>미등록</td>
			</c:when>
			<c:otherwise>
				<td>${dto.tel}</td>
			</c:otherwise>
			</c:choose>
			</tr>
		</table>
		<table id="job-info">
			<tr>
				<th>직업</th>
			</tr>
			<tr>
			<c:choose>
			<c:when test="${empty util:jobname(dto.job)}">
				<td>미등록</td>
			</c:when>
			<c:otherwise>
				<td>${util:jobname(dto.job)}</td>
			</c:otherwise>
			</c:choose>
			</tr>
		</table>
		</div>
		<table id="date-info">
			<tr>
				<th colspan="2">가입날짜</th>
			</tr>
			<tr>				
				<td colspan="2" style="border-bottom:1px solid #ccc;">${dto.mdate}</td>
			</tr>
		</table>
	</div>
</div>
<script src="/js/feed/top_nav.js"></script>
<script src="/js/feed/searchbar.js"></script>
</body>
</html>