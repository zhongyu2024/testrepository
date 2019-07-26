package com.zy.bean;

public class VTJtable {
	private String vname;
	private String vtype;
	private int vcardid;
	private int xfnum;
	private float xfmoney;
	private float czmoney;
	private float money;
	public String getVname() {
		return vname;
	}
	public void setVname(String vname) {
		this.vname = vname;
	}
	public String getVtype() {
		return vtype;
	}
	public void setVtype(String vtype) {
		this.vtype = vtype;
	}
	public int getVcardid() {
		return vcardid;
	}
	public void setVcardid(int vcardid) {
		this.vcardid = vcardid;
	}
	public int getXfnum() {
		return xfnum;
	}
	public void setXfnum(int xfnum) {
		this.xfnum = xfnum;
	}
	public float getXfmoney() {
		return xfmoney;
	}
	public void setXfmoney(float xfmoney) {
		this.xfmoney = xfmoney;
	}
	public float getCzmoney() {
		return czmoney;
	}
	public void setCzmoney(float czmoney) {
		this.czmoney = czmoney;
	}
	public float getMoney() {
		return money;
	}
	public void setMoney(float money) {
		this.money = money;
	}
	public VTJtable(String vname, String vtype, int vcardid, int xfnum,
			float xfmoney, float czmoney, float money) {
		super();
		this.vname = vname;
		this.vtype = vtype;
		this.vcardid = vcardid;
		this.xfnum = xfnum;
		this.xfmoney = xfmoney;
		this.czmoney = czmoney;
		this.money = money;
	}
	public VTJtable() {
		super();
	}
	
	
}
