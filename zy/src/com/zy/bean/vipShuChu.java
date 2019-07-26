package com.zy.bean;

public class vipShuChu {
	private String vipname;
	private String viplevel;
	private int vipid;
	private double earnmoney;
	private int xiaofei;
	private double mymoney;
	private String time;
	private String doman;
	private	String listid;
	public String getVipname() {
		return vipname;
	}
	public void setVipname(String vipname) {
		this.vipname = vipname;
	}
	public String getViplevel() {
		return viplevel;
	}
	public void setViplevel(String viplevel) {
		this.viplevel = viplevel;
	}
	public int getVipid() {
		return vipid;
	}
	public void setVipid(int vipid) {
		this.vipid = vipid;
	}
	public double getEarnmoney() {
		return earnmoney;
	}
	public void setEarnmoney(double earnmoney) {
		this.earnmoney = earnmoney;
	}
	public int getXiaofei() {
		return xiaofei;
	}
	public void setXiaofei(int xiaofei) {
		this.xiaofei = xiaofei;
	}
	public double getMymoney() {
		return mymoney;
	}
	public void setMymoney(double mymoney) {
		this.mymoney = mymoney;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getDoman() {
		return doman;
	}
	public void setDoman(String doman) {
		this.doman = doman;
	}
	public String getListid() {
		return listid;
	}
	public void setListid(String listid) {
		this.listid = listid;
	}
	public vipShuChu(String vipname, String viplevel, int vipid,
			double earnmoney, int xiaofei, double mymoney, String time,
			String doman, String listid) {
		super();
		this.vipname = vipname;
		this.viplevel = viplevel;
		this.vipid = vipid;
		this.earnmoney = earnmoney;
		this.xiaofei = xiaofei;
		this.mymoney = mymoney;
		this.time = time;
		this.doman = doman;
		this.listid = listid;
	}
	public vipShuChu() {
		super();
	}
	
}
