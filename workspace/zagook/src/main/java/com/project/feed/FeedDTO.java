package com.project.feed;

import java.util.List;

public class FeedDTO {
//	minimum user info
	private int contentsno;
	private String id;
	private String filename;
	private String contents;
	private String rdate;
	private int likecnt;
	private int privacy;
	private double x_site;
	private double y_site;
	
	private String mname;
	private String fname;
	
	private int like_clicked;
	private List<String> tag_list;
	
	private double base_distance;
	
	public FeedDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public FeedDTO(int contentsno, String id, String filename, String contents, String rdate, int likecnt, int privacy,
			double x_site, double y_site, String mname, String fname, int like_clicked, List<String> tag_list,
			double base_distance) {
		super();
		this.contentsno = contentsno;
		this.id = id;
		this.filename = filename;
		this.contents = contents;
		this.rdate = rdate;
		this.likecnt = likecnt;
		this.privacy = privacy;
		this.x_site = x_site;
		this.y_site = y_site;
		this.mname = mname;
		this.fname = fname;
		this.like_clicked = like_clicked;
		this.tag_list = tag_list;
		this.base_distance = base_distance;
	}
	
	@Override
	public String toString() {
		return "FeedDTO [contentsno=" + contentsno + ", id=" + id + ", filename=" + filename + ", contents=" + contents
				+ ", rdate=" + rdate + ", likecnt=" + likecnt + ", privacy=" + privacy + ", x_site=" + x_site
				+ ", y_site=" + y_site + ", mname=" + mname + ", fname=" + fname + ", like_clicked=" + like_clicked
				+ ", tag_list=" + tag_list + ", base_distance=" + base_distance + "]";
	}


	public int getContentsno() {
		return contentsno;
	}
	public void setContentsno(int contentsno) {
		this.contentsno = contentsno;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getRdate() {
		return rdate;
	}
	public void setRdate(String rdate) {
		this.rdate = rdate;
	}
	public int getPrivacy() {
		return privacy;
	}
	public void setPrivacy(int privacy) {
		this.privacy = privacy;
	}
	public double getX_site() {
		return x_site;
	}
	public void setX_site(double x_site) {
		this.x_site = x_site;
	}
	public double getY_site() {
		return y_site;
	}
	public void setY_site(double y_site) {
		this.y_site = y_site;
	}
	public int getLike_clicked() {
		return like_clicked;
	}
	public void setLike_clicked(int like_clicked) {
		this.like_clicked = like_clicked;
	}
	public List<String> getTag_list() {
		return tag_list;
	}
	public void setTag_list(List<String> tag_list) {
		this.tag_list = tag_list;
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public double getBase_distance() {
		return base_distance;
	}
	public void setBase_distance(double base_distance) {
		this.base_distance = base_distance;
	}
	public int getLikecnt() {
		return likecnt;
	}
	public void setLikecnt(int likecnt) {
		this.likecnt = likecnt;
	}
}
