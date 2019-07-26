package com.zy.bean;

public class CangkucunSearch {
	private String type;
	private String text;
	
	private String time1;
	private String time2;
	
	private int page;
	
	private int ckid;
	
	
	public int getCkid() {
		return ckid;
	}
	public void setCkid(int ckid) {
		this.ckid = ckid;
	}
	public String getTime1() {
		return time1;
	}
	public void setTime1(String time1) {
		this.time1 = time1;
	}
	public String getTime2() {
		return time2;
	}
	public void setTime2(String time2) {
		this.time2 = time2;
	}
	
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	
	public CangkucunSearch(String type, String text, int page, int ckid) {
		super();
		this.type = type;
		this.text = text;
		this.page = page;
		this.ckid = ckid;
	}
	public CangkucunSearch(String type, String text, String time1,
			String time2, int page) {
		super();
		this.type = type;
		this.text = text;
		this.time1 = time1;
		this.time2 = time2;
		this.page = page;
	}
	public CangkucunSearch(String type, String text) {
		super();
		this.type = type;
		this.text = text;
	}
	public CangkucunSearch() {
		super();
	}
	
	
}
