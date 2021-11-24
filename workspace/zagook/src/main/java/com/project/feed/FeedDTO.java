package com.project.feed;

import java.util.List;
import java.util.Objects;

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
	
	private String url_id;
	private String load_type;
	private String range;
	private String order_type;
	private String selected_id;
	
	public FeedDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public FeedDTO(int contentsno, String id, String filename, String contents, String rdate, int likecnt, int privacy,
			double x_site, double y_site, String mname, String fname, int like_clicked, List<String> tag_list,
			double base_distance, String url_id, String load_type, String range, String order_type,
			String selected_id) {
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
		this.url_id = url_id;
		this.load_type = load_type;
		this.range = range;
		this.order_type = order_type;
		this.selected_id = selected_id;
	}
	
	@Override
	public int hashCode() {
		return Objects.hash(base_distance, contents, contentsno, filename, fname, id, like_clicked, likecnt, load_type,
				mname, order_type, privacy, range, rdate, selected_id, tag_list, url_id, x_site, y_site);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		FeedDTO other = (FeedDTO) obj;
		return Double.doubleToLongBits(base_distance) == Double.doubleToLongBits(other.base_distance)
				&& Objects.equals(contents, other.contents) && contentsno == other.contentsno
				&& Objects.equals(filename, other.filename) && Objects.equals(fname, other.fname)
				&& Objects.equals(id, other.id) && like_clicked == other.like_clicked && likecnt == other.likecnt
				&& Objects.equals(load_type, other.load_type) && Objects.equals(mname, other.mname)
				&& Objects.equals(order_type, other.order_type) && privacy == other.privacy
				&& Objects.equals(range, other.range) && Objects.equals(rdate, other.rdate)
				&& Objects.equals(selected_id, other.selected_id) && Objects.equals(tag_list, other.tag_list)
				&& Objects.equals(url_id, other.url_id)
				&& Double.doubleToLongBits(x_site) == Double.doubleToLongBits(other.x_site)
				&& Double.doubleToLongBits(y_site) == Double.doubleToLongBits(other.y_site);
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
	public String getUrl_id() {
		return url_id;
	}
	public void setUrl_id(String url_id) {
		this.url_id = url_id;
	}
	public String getLoad_type() {
		return load_type;
	}
	public void setLoad_type(String load_type) {
		this.load_type = load_type;
	}
	public String getRange() {
		return range;
	}
	public void setRange(String range) {
		this.range = range;
	}
	public String getOrder_type() {
		return order_type;
	}
	public void setOrder_type(String order_type) {
		this.order_type = order_type;
	}
	public String getSelected_id() {
		return selected_id;
	}
	public void setSelected_id(String selected_id) {
		this.selected_id = selected_id;
	}
}
