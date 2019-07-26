package com.zy.bean;

public class XdBean {
private int danshu;
private double discount;
private int personcount;
private double realcount;
public XdBean() {
	super();
}
public XdBean(int danshu, double discount, int personcount, double realcount) {
	super();
	this.danshu = danshu;
	this.discount = discount;
	this.personcount = personcount;
	this.realcount = realcount;
}
public int getDanshu() {
	return danshu;
}
public void setDanshu(int danshu) {
	this.danshu = danshu;
}
public double getDiscount() {
	return discount;
}
public void setDiscount(double discount) {
	this.discount = discount;
}
public int getPersoncount() {
	return personcount;
}
public void setPersoncount(int personcount) {
	this.personcount = personcount;
}
public double getRealcount() {
	return realcount;
}
public void setRealcount(double realcount) {
	this.realcount = realcount;
}
 
 
 
}
