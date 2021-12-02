<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>회원수정</title>
<meta charset="utf-8">
<link rel="stylesheet" href="/css/feed/searchbar.css" type="text/css">
<link rel="stylesheet" href="/css/member/hl.css" type="text/css">
<link rel="stylesheet" href="/css/member/update.css" type="text/css">
<style type="text/css">
</style>
<script src="https://code.jquery.com/jquery-3.5.1.js"
	integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
	crossorigin="anonymous"></script>
<script type="text/javascript">
	function idCheck(id) {
		if (id == '') {
			alert("닉네임을 입력하세요");
			document.frm.id.focus();
		} else {
			var url = "idcheck";
			var param = "id=" + id;
			$.get(url, param, function(data, textStatus) {
				$("#idcheck").text(data.str);
			})
		}
	}
	function inCheck(f) {

		if (f.id.value.length == 0) {
			alert("닉네임을 입력하세요");
			f.id.focus();
			return false;
		}
		if (f.mname.value.length == 0) {
			alert("이름을 입력하세요");
			f.mname.focus();
			return false;
		}
	}
</script>
</head>
<body>
	<div id="div-update-con">
		<form class="form-horizontal" action="update" method="post" name='frm'
			onsubmit="return inCheck(this)" id="update-form">
			<!-- <h2 class="col-sm-offset-2 col-sm-10" style="margin-left:15px;font-weight:bold">회원수정</h2> -->
			<div id="updateform-header">
				<span class="hl">회원정보 수정</span> <label style="margin-top: 15px">(<span
					id="need">*</span> 필수입력사항)
				</label>
				<hr class="update-part" align="left">
			</div>
			<div id="update-group">
				<input type="hidden" name="email" value="${dto.email}">
				<div class="update-group">
					<label class="control-label col-sm-2" for="email">이메일</label>
					<div class="col-sm-3" id="email">${dto.email}</div>
				</div>
				<div class="update-group">
					<label class="control-label col-sm-2" for="id"><span
						id="need">*</span>닉네임</label>
					<div class="col-sm-3">
						<input type="text" class="update-input" id="id" value="${dto.id}"
							name="id">
					</div>
					<button type="button" class="btn btn-default" id="check-btn"
				      onclick="idCheck(document.frm.id.value)">중복확인</button>
				      <div id="idcheck"></div>
				</div>
				<div class="update-group" style="margin-top:-30px;">
					<label class="control-label col-sm-2" for="mname"><span
						id="need">*</span>성명</label>
					<div class="col-sm-3">
						<input type="text" class="update-input" id="mname"
							value="${dto.mname}" name="mname">
					</div>
				</div>
				<div id="update-add-info">
					<span class="hl">추가 정보 수정</span>
					<!--     <h3 style="padding-left:120px; font-weight:bold;">추가 정보</h3> -->
					<hr class="update-part" align="left">
				</div>
				<div class="update-group">
					<label class="control-label col-sm-2" for="tel">전화번호</label>
					<div class="col-sm-4">
						<input type="text" class="update-input" id="tel"
							value="${dto.tel}" name="tel" maxlength='13'>
					</div>
				</div>
				<div class="update-group">
					<label class="control-label col-sm-2" for="job">직업</label>
					<div class="col-sm-2">
						<select name="job" class="update-input">
							<option value="0">선택하세요</option>
							<option value="A01">회사원</option>
							<option value="A02">전산관련직</option>
							<option value="A03">연구전문직</option>
							<option value="A04">각종학교학생</option>
							<option value="A05">일반자영업</option>
							<option value="A06">공무원</option>
							<option value="A07">의료인</option>
							<option value="A08">법조인</option>
							<option value="A09">종교/언론/예술인</option>
							<option value="A10">기타</option>

						</select>
						<script type="text/javascript">
							document.frm.job.value = '${dto.job}';
						</script>

					</div>
				</div>
				<div class="update-group">
					<label class="control-label col-sm-2" for="intro">소개말</label>
					<div class="col-sm-4">
						<textarea id="introduction" name="introduction" cols="50" rows="5">${dto.introduction}</textarea>
						<div id="intro_cnt">(0 / 100)</div>
					</div>
				</div>
				<div class="update-group">
					<div class="update-btn">
						<button id="update-btn" type="submit" class="btn btn-default">수정</button>
						<button id="back-btn" type="reset" class="btn btn-default"
							onclick="location.href='${root}/member/mypage'">취소</button>
					</div>
				</div>
			</div>
		</form>
	</div>
	<div id="infozagook">
		<div id="info-header">
			<span class="hl">회원정보 수정 유의사항</span><br>
		</div>
		<div id="div-info-zagook">
			<div style="padding: 10px 0px 10px 30px;">
				<div class="faq-content">
					<button class="question" id="que-1">
						<span id="que-1-toggle">∧</span><span class="nr">
						소셜로그인 사용자 이메일 수정 및 탈퇴</span>
					</button>
					<div class="answer" id="ans-1">
						<span class="gl">소셜로그인 사용자</span><br><br>
						 <span>이메일 수정은 해당 소셜에서 진행해주시기 바랍니다.<br><br>
						 회원 탈퇴는 해당 소셜에서 탈퇴 혹은 연결 해제하시기 바랍니다.</span>
					</div>
				</div>
				<div class="faq-content">
					<button class="question" id="que-2">
						<span id="que-2-toggle">∧</span><span class="nr">필수 정보 수정</span>
					</button>
					<div class="answer" id="ans-2">
						<span class="gl">이메일</span><br><br> 이메일은 수정이 어렵습니다. 탈퇴 후 재가입 부탁드립니다.<br><br>
						<span class="gl">닉네임, 성명</span><br><br>닉네임, 성명은 중복이 불가하니 이점 참고하시기 바랍니다.
					</div>
				</div>
				<div class="faq-content">
					<button class="question" id="que-3">
						<span id="que-3-toggle">∧</span><span class="nr">소개말</span>
					</button>
					<div class="answer" id="ans-3">
						<span class="gl">소개말</span>은 100자 제한이며 피드 프로필에 출력됩니다. 
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- <script src="/js/feed/top_nav.js"></script> -->
	<script src="/js/feed/searchbar.js"></script>
	<script src="/js/member/update.js"></script>
	<script src="/js/member/intro.js"></script>
</body>
</html>