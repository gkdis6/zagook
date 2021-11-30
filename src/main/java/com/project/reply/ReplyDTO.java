package com.project.reply;

import lombok.Data;

@Data
public class ReplyDTO {
	private int rnum;
	private int contentsno;	//	댓글이 속한 게시글 번호 (받아와야 하는 값)
	private String id;
	private String content;
	private String regdate;
	
	
	private String fname;
}
