package com.project.notice;

import lombok.Data;

@Data
public class NoticeDTO {
	  private int noticeno;
	  private String title;
	  private String content;
	  private String passwd;
	  private String rdate;
	  private int cnt;
}
