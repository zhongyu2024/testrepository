package com.zy.bean;

public class vipShuRu {
	private String levelname;
	private String doname;
	private String time1;
	private String time2;
	private int xiaofei;
	public String getLevelname() {
		return levelname;
	}
	public void setLevelname(String levelname) {
		this.levelname = levelname;
	}
	public String getDoname() {
		return doname;
	}
	public void setDoname(String doname) {
		this.doname = doname;
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
	public int getXiaofei() {
		return xiaofei;
	}
	public void setXiaofei(int xiaofei) {
		this.xiaofei = xiaofei;
	}
	public vipShuRu(String levelname, String doname, String time1,
			String time2, int xiaofei) {
		super();
		this.levelname = levelname;
		this.doname = doname;
		this.time1 = time1;
		this.time2 = time2;
		this.xiaofei = xiaofei;
	}
	public vipShuRu() {
		super();
	}
	
	
}
