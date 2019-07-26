package com.zy.bean;

public class ZOutinfo {
private String ckname;
private String timeall;
private String clname;
private int clid;
private String lxname;
private double count;
private String dwname;

public ZOutinfo() {
	super();
}

public ZOutinfo(String ckname, String timeall, String clname, int clid,
		String lxname, double count, String dwname) {
	super();
	this.ckname = ckname;
	this.timeall = timeall;
	this.clname = clname;
	this.clid = clid;
	this.lxname = lxname;
	this.count = count;
	this.dwname = dwname;
}

public String getCkname() {
	return ckname;
}

public void setCkname(String ckname) {
	this.ckname = ckname;
}

public String getTimeall() {
	return timeall;
}

public void setTimeall(String timeall) {
	this.timeall = timeall;
}

public String getClname() {
	return clname;
}

public void setClname(String clname) {
	this.clname = clname;
}

public int getClid() {
	return clid;
}

public void setClid(int clid) {
	this.clid = clid;
}

public String getLxname() {
	return lxname;
}

public void setLxname(String lxname) {
	this.lxname = lxname;
}

public double getCount() {
	return count;
}

public void setCount(double count) {
	this.count = count;
}

public String getDwname() {
	return dwname;
}

public void setDwname(String dwname) {
	this.dwname = dwname;
}

 
 
}
