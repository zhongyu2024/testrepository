package com.zy.bean;

public class YudingFoodtable {
	private int id;
	private String name;
	private int seatsize;
	private int state;
	private String yutime;
	private float baotime;
	private int tableid;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getSeatsize() {
		return seatsize;
	}
	public void setSeatsize(int seatsize) {
		this.seatsize = seatsize;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public String getYutime() {
		return yutime;
	}
	public void setYutime(String yutime) {
		this.yutime = yutime;
	}
	public float getBaotime() {
		return baotime;
	}
	public void setBaotime(float baotime) {
		this.baotime = baotime;
	}
	public int getTableid() {
		return tableid;
	}
	public void setTableid(int tableid) {
		this.tableid = tableid;
	}
	public YudingFoodtable(int id, String name, int seatsize, int state,
			String yutime, float baotime, int tableid) {
		super();
		this.id = id;
		this.name = name;
		this.seatsize = seatsize;
		this.state = state;
		this.yutime = yutime;
		this.baotime = baotime;
		this.tableid = tableid;
	}
	public YudingFoodtable(){};
}
