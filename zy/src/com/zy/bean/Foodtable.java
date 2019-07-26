package com.zy.bean;
/**
 * 餐位实体类
 * @author Administrator
 *
 */
public class Foodtable {

	private int id;
	private String name;
	private int area;
	private int seatsize;
	private double minpay;
	private int state;
	private int hetai;
	private ZList zlist;
	private Yuding yuding;
	private double htmoney;
	private String yutime;

	private String futableid;
	


	public String getFutableid() {
		return futableid;
	}
	public void setFutableid(String futableid) {
		this.futableid = futableid;
	}
	public String getYutime() {
		return yutime;
	}
	public void setYutime(String yutime) {
		this.yutime = yutime;
	}
	public double getHtmoney() {
		return htmoney;
	}
	public void setHtmoney(double htmoney) {
		this.htmoney = htmoney;
	}
	public int getHetai() {
		return hetai;
	}
	public void setHetai(int hetai) {
		this.hetai = hetai;
	}
	public Yuding getYuding() {
		return yuding;
	}
	public void setYuding(Yuding yuding) {
		this.yuding = yuding;
	}
	public ZList getZlist() {
		return zlist;
	}
	public void setZlist(ZList zlist) {
		this.zlist = zlist;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getArea() {
		return area;
	}
	public void setArea(int area) {
		this.area = area;
	}
	public int getSeatsize() {
		return seatsize;
	}
	public void setSeatsize(int seatsize) {
		this.seatsize = seatsize;
	}
	public double getMinpay() {
		return minpay;
	}
	public void setMinpay(double minpay) {
		this.minpay = minpay;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
}
