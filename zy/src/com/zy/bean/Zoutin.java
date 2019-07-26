package com.zy.bean;
//½ø³öÏêÏ¸±í
public class Zoutin {
 private String  time;
 private String ckname;
 private int id;
 private String clname;
 private String lxname;
 private int counttsl;
 private String dangweib;
 private String caozuoleixing;
public Zoutin() {
	super();
}
public Zoutin(String time, String ckname, int id, String clname, String lxname,
		int counttsl, String dangweib, String caozuoleixing) {
	super();
	this.time = time;
	this.ckname = ckname;
	this.id = id;
	this.clname = clname;
	this.lxname = lxname;
	this.counttsl = counttsl;
	this.dangweib = dangweib;
	this.caozuoleixing = caozuoleixing;
}
public String getTime() {
	return time;
}
public void setTime(String time) {
	this.time = time;
}
public String getCkname() {
	return ckname;
}
public void setCkname(String ckname) {
	this.ckname = ckname;
}
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public String getClname() {
	return clname;
}
public void setClname(String clname) {
	this.clname = clname;
}
public String getLxname() {
	return lxname;
}
public void setLxname(String lxname) {
	this.lxname = lxname;
}
public int getCounttsl() {
	return counttsl;
}
public void setCounttsl(int counttsl) {
	this.counttsl = counttsl;
}
public String getDangweib() {
	return dangweib;
}
public void setDangweib(String dangweib) {
	this.dangweib = dangweib;
}
public String getCaozuoleixing() {
	return caozuoleixing;
}
public void setCaozuoleixing(String caozuoleixing) {
	this.caozuoleixing = caozuoleixing;
}
 
}
