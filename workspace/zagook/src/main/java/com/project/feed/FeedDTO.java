package com.project.feed;

import lombok.Data;

@Data
public class FeedDTO {
//	minimum user info
	private int contentsno;
	private String id;
	private String filename;
	private String contents;
	private String rdate;
	private int privacy;
	private int x_site;
	private int y_site;
}
