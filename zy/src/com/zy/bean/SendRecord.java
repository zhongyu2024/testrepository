package com.zy.bean;

public class SendRecord {

	private String listid;
	private String manname;
	private int state;
	public String getListid() {
		return listid;
	}
	public void setListid(String listid) {
		this.listid = listid;
	}
	public String getManname() {
		return manname;
	}
	public void setManname(String manname) {
		this.manname = manname;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public SendRecord(String listid, String manname, int state) {
		super();
		this.listid = listid;
		this.manname = manname;
		this.state = state;
	}
	public SendRecord() {
		super();
	}
	
}
