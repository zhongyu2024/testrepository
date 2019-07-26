package com.zy.bean;


public class VipRecord {
	private int id;
	private int vipid;
	private String time;
	private int type;
	private String listid;
	private double money;
	private int doman;
	public VipRecord(int id, int vipid, String time, int type, String listid,
			double money, int doman) {
		super();
		this.id = id;
		this.vipid = vipid;
		this.time = time;
		this.type = type;
		this.listid = listid;
		this.money = money;
		this.doman = doman;
	}
	public VipRecord() {
		super();
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getVipid() {
		return vipid;
	}
	public void setVipid(int vipid) {
		this.vipid = vipid;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public String getListid() {
		return listid;
	}
	public void setListid(String listid) {
		this.listid = listid;
	}
	public double getMoney() {
		return money;
	}
	public void setMoney(double money) {
		this.money = money;
	}
	public int getDoman() {
		return doman;
	}
	public void setDoman(int doman) {
		this.doman = doman;
	}
	
	
	
	
}
