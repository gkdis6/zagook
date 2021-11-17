<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 댓글 -->
	<div class='row'>

		<div class="col-lg-12">

			<!-- panel start-->
			<div class="panel panel-default">

				<div class="panel-heading">
					<i class="fa fa-comments fa-fw"></i> Comments
					<button id='addReplyBtn' class='btn btn-primary btn-xs pull-right'>New
						Reply</button>
				</div>


				<div class="panel-body">

					<ul class="chat list-group">
						<li class="left clearfix" data-rno="12">
							<div>
								<div class="header">
									<strong class="primary-font">user1</strong> <small
										class="pull-right text-muted">2021-11-16</small>
								</div>
								<p>Good!</p>

							</div>
						</li>
					</ul>
					<!-- ul end  -->
				</div>

				<div class="panel-footer"></div>

			</div>
			<!-- panel end-->
		</div>
		<!--  col-lg-12 end -->
	</div>
	<!-- row end -->

	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">REPLY MODAL</h4>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<label>내용</label>
						<textarea cols="10" rows="3" class="form-control" name='content'>New Reply!!!!</textarea>
					</div>
				</div>
				<div class="modal-footer">
					<button id='modalModBtn' type="button" class="btn btn-warning">수정</button>
					<button id='modalRemoveBtn' type="button" class="btn btn-danger">삭제</button>
					<button id='modalRegisterBtn' type="button" class="btn btn-primary">등록</button>
					<button id='modalCloseBtn' type="button" class="btn btn-default">닫기</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->


	<!-- 댓글처리 관련 Javascript 파일 추가-->
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/js/breply.js"></script>

	<!-- 페이지 로딩시 댓글 목록 처리-->
	<!-- jstl는 internal javascript에서 사용가능 -->
	<script type="text/javascript">
  var contentsno = "${dto.contentsno}"; 
  var sno = "${sno}";
  var eno = "${eno}";
 <!-- 댓글용 paging, 게시판 검색 -->
  var nPage = "${nPage}";
  var nowPage = "${param.nowPage}";
  var colx = "${param.col}";
  var wordx = "${param.word}";
  </script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/js/replyprocess.js"></script>
</body>
</html>