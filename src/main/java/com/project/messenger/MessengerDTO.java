package com.project.messenger;

import lombok.Data;

@Data
public class MessengerDTO {
	private String no; 
	private int room;
	private String send_id;
	private String recv_id;
	private String send_time;
	private String read_time;
	private String content;
	private String read_chk;
	
	// 현재 사용자의 메세지 상대 nick을 담는다.
	private String other_id;
	
	// 현재 사용자의 메세지 상대 profile img를 담는다.
	private String fname;
	
	// 현재 사용자 id
	private String id;
	
	// 안읽은 메세지 갯수 
	private int unread;
}
