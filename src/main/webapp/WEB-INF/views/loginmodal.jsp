<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="modal" id="login">
	<div class="modal-dialog modal-sm">
		<div class="modal-content">
			<div class="modal-header">
				<img src="../images/zagook_logo.jpg"
					style="width: 60px; height: 60px; padding-bottom: 10px">
				<h4 class="modal-title">발자국 로그인</h4>
			</div>
			<div class="modal-body">
				<form action="/member/login" class="was-validated" method="post">
					<div class="form-group">
						<label for="email" align="left">이메일 </label> <input type="text"
							class="form-control" style="width: 250px; height: 40px;"
							id="userEmail" placeholder="Enter Email" name="email"
							required="required" value='${c_email_val}'>
					</div>
					<div class="form-group">
						<label for="userPw">비밀번호 </label> <input type="password"
							class="form-control" style="width: 250px; height: 40px;"
							id="userPw" placeholder="Enter Password" name="password"
							required="required">
					</div>
					<div class="form=group">
						<button type="submit"
							style="width: 250px; height:40px; background-color: black; color: white; padding-top: 10px; margin-left: 7px">
							로 그 인</button>
						<div class="hr-sect">O R</div>
						<a
							href="https://kauth.kakao.com/oauth/authorize?client_id=8b0badea65f50a87408b62085e369711&redirect_uri=http://localhost:8005/kakaologin&response_type=code">
							<img src="../images/kakao_login.png"
							style="width: 250px; height: 50px; padding-top: 5px; margin-left: 7px">
						</a> <a
							href="https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=ixM36J7baPEJLD3Q1N43&state=STATE_STRING&redirect_uri=http://localhost:8005/naverlogin">
							<img src="../images/naver_login.png"
							style="width: 250px; height: 55px; padding-top: 10px; margin-left: 7px">
						</a>
						<div class="join">
							회원이 아니신가요? <a href="${root}/member/agree">회원가입</a>
							<!--<button type="button" class="btn btn-secondary">회원가입</button> -->
						</div>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" id="modalclose" class="btn btn-secondary" data-dismiss="modal" onclick="close_modal();">취소</button>
			</div>
		</div>
	</div>
</div>