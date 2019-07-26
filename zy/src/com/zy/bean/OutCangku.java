package com.zy.bean;

public class OutCangku {
	private String id;
	private int cangkuid;
	private String ckname;
	private String outtime;
	private int doman;
	private String doname;
	private String info;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getCangkuid() {
		return cangkuid;
	}
	public void setCangkuid(int cangkuid) {
		this.cangkuid = cangkuid;
	}
	public String getCkname() {
		return ckname;
	}
	public void setCkname(String ckname) {
		this.ckname = ckname;
	}
	public String getOuttime() {
		return outtime;
	}
	public void setOuttime(String outtime) {
		this.outtime = outtime;
	}
	public int getDoman() {
		return doman;
	}
	public void setDoman(int doman) {
		this.doman = doman;
	}
	public String getDoname() {
		return doname;
	}
	public void setDoname(String doname) {
		this.doname = doname;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	
	public OutCangku(String id, int cangkuid, String ckname, String outtime,
			int doman, String doname, String info) {
		super();
		this.id = id;
		this.cangkuid = cangkuid;
		this.ckname = ckname;
		this.outtime = outtime;
		this.doman = doman;
		this.doname = doname;
		this.info = info;
	}
	public OutCangku() {
		super();
	}
	
	
}
