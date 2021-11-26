package com.project.reply;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.contents.ContentsDTO;

@Repository
public class ReplyDAO {

	@Autowired
	private SqlSession sqlSession;
	
	// 댓글 작성
	public ContentsDTO pictureWriteReply(ReplyTO to) {
		// p_board 테이블에 해당 게시물의 reply수를 +1 하기위한 to세팅
		ContentsDTO pto = new ContentsDTO();
		pto.setRnum(to.getContentsno());
		
		// 해당 게시물의 reply를 +1 한다.
		sqlSession.update("picture_reply_up", pto);
		
		// 현재 p_reply 테이블의 가장 큰 no값을 가져온다.
		int grp = sqlSession.selectOne("p_reply_max_no");
		
		// grp 세팅
		to.setGrp(grp+1);
		
		
		int result = sqlSession.insert("picture_reply_write", to);
		
		int check = sqlSession.selectOne("p_reply_max_no");
		// grp를 현재 가장 큰 no 즉 방금 넣은 데이터의 no값로 세팅함
		to.setGrp(check);
		
		// no 와 grp가 다르면 grp를 no로 없데이트
		int check_update = sqlSession.update("picture_reply_check", to);
		
		if (result == 1) {	// p_reply 테이블에 새로운 댓글 추가가 성공한다면..
			// 갱신된 댓글 갯수를 가져옴
			pto = sqlSession.selectOne("picture_reply_count", pto);
		}
		return pto;
	}
	
	// 답글 작성
	public ContentsDTO pictureWriteReReply(ReplyTO to) {
		// p_board 테이블에 해당 게시물의 reply수를 +1 하기위한 to세팅
		ContentsDTO pto = new ContentsDTO();
		pto.setRnum(to.getContentsno());
		
		// 해당 게시물의 reply를 +1 한다.
		sqlSession.update("picture_reply_up", pto);
		
		// p_reply 테이블에 추가 (댓글 작성과 동일)
		int result = sqlSession.insert("picture_rereply_write", to);
		
		if (result == 1) {	// p_reply 테이블에 새로운 댓글 추가가 성공한다면..
			// 갱신된 댓글 갯수를 가져옴
			pto = sqlSession.selectOne("picture_reply_count", pto);
		}
		return pto;
	}
	
	// 댓글 리스트
	public ArrayList<ReplyTO> replyList(ReplyTO to){
		
		ArrayList<ReplyTO> replyList = new ArrayList();
		
		replyList = (ArrayList)sqlSession.selectList("picture_replyList", to);
		
		return replyList;
	}
	
	// 모댓글 삭제
	public ContentsDTO pictureDeleteReply(ReplyTO to) {
		// p_board 테이블에 해당 게시물의 reply수를 -1 하기위한 to세팅
		ContentsDTO pto = new ContentsDTO();
		pto.setRnum(to.getContentsno());
		
		// grp가 reply의 no와 일치하는 댓글이 몇갠지 카운트한다. 모댓글에 딸린 답글이 몇갠지 카운트하기 위함
		int count_rereply = sqlSession.selectOne("picture_count_rereply", to);
		
		int result = 0;
		
		// 해당 게시물의 reply를 -1 한다.
		sqlSession.update("picture_reply_down", pto);
		
		if(count_rereply==0) {	// 답글이 없을 때 - 그냥 삭제
			// p_reply 테이블에서 삭제
			result = sqlSession.delete("picture_reply_delete", to);
		}else {					// 답글이 있을 때 - content에 공백을 넣음 ("삭제된 게시물입니다" 라고 표기하기 위함)
			// p_reply 테이블에서 삭제하지 않고 content에 공백을 넣음 
			result = sqlSession.update("picture_reply_not_delete", to);
		}
		
		if (result == 1) {	// p_reply 테이블에서 댓글삭제가 성공한다면..
			// 갱신된 댓글 갯수를 가져옴
			pto = sqlSession.selectOne("picture_reply_count", pto);
		}
		return pto;
	}
	
	// 답글 삭제
	public ContentsDTO pictureDeleteReReply(ReplyTO to) {
		// p_board 테이블에 해당 게시물의 reply수를 -1 하기위한 to세팅
		ContentsDTO pto = new ContentsDTO();
		pto.setRnum(to.getContentsno());
			
		// 해당 게시물의 reply를 -1 한다.
		sqlSession.update("picture_reply_down", pto);
				
		// p_reply 테이블에서 삭제
		int result = sqlSession.delete("picture_reply_delete", to);
		
		// grp가  일치하는 답글이 몇갠지 카운트 한다. 없고 모댓글의 content가 ""이면 모댓글을 삭제하기 위함.
		int count_rereply = sqlSession.selectOne("picture_count_rereply_fromrereply", to);
		
		
		System.out.println("count_rereply = " + count_rereply);
		if(count_rereply == 0) {
			sqlSession.delete("picture_reply_delete_after_rereply_delete", to);
		}
		
		if (result == 1) {	// p_reply 테이블에서 댓글삭제가 성공한다면..
			// 갱신된 댓글 갯수를 가져옴
			pto = sqlSession.selectOne("picture_reply_count", pto);
		}
		return pto;
	}
	
	
	// 댓글 작성
	public ContentsDTO profile_pictureWriteReply(ReplyTO to) {
		// p_board 테이블에 해당 게시물의 reply수를 +1 하기위한 to세팅
		ContentsDTO pto = new ContentsDTO();
		pto.setRnum(to.getContentsno());
		
		// 해당 게시물의 reply를 +1 한다.
		sqlSession.update("picture_reply_up", pto);
		
		// 현재 p_reply 테이블의 가장 큰 no값을 가져온다.
		int grp = sqlSession.selectOne("p_reply_max_no");
		
		// grp 세팅
		to.setGrp(grp+1);
		
		
		int result = sqlSession.insert("picture_reply_write", to);
		
		int check = sqlSession.selectOne("p_reply_max_no");
		// grp를 현재 가장 큰 no 즉 방금 넣은 데이터의 no값로 세팅함
		to.setGrp(check);
		
		// no 와 grp가 다르면 grp를 no로 없데이트
		//int check_update = sqlSession.update("picture_reply_check", to);
		
		if (result == 1) {	// p_reply 테이블에 새로운 댓글 추가가 성공한다면..
			// 갱신된 댓글 갯수를 가져옴
			pto = sqlSession.selectOne("picture_reply_count", pto);
		}
		return pto;
	}
	
	
}

