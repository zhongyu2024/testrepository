package com.zy.bean;

public class VTJSearch {
	private String time1;
	private String time2;
	private String vname;
	private String vctype;
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
	public String getVname() {
		return vname;
	}
	public void setVname(String vname) {
		this.vname = vname;
	}
	public String getVctype() {
		return vctype;
	}
	public void setVctype(String vctype) {
		this.vctype = vctype;
	}
	public VTJSearch(String time1, String time2, String vname, String vctype) {
		super();
		this.time1 = time1;
		this.time2 = time2;
		this.vname = vname;
		this.vctype = vctype;
	}
	public VTJSearch() {
		super();
	}
	
	
}
