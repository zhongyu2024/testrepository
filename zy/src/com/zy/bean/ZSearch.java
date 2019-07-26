package com.zy.bean;

public class ZSearch {
private String time1;
private String time2;
private String chose;
private String zhi;
public ZSearch(String time1, String time2, String chose, String zhi) {
	super();
	this.time1 = time1;
	this.time2 = time2;
	this.chose = chose;
	this.zhi = zhi;
}
public ZSearch() {
	super();
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
public String getChose() {
	return chose;
}
public void setChose(String chose) {
	this.chose = chose;
}
public String getZhi() {
	return zhi;
}
public void setZhi(String zhi) {
	this.zhi = zhi;
}

}
