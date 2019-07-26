package com.zy.bean;

import java.util.List;

/**
 * 清单详细信息实体类
 * @author Administrator
 *
 */
public class Listinfo {

	private int id;
	private String listid;
	private String cainame;
	private int num;
	private double price;
	private double money;
	private String info;
	
	private int caitype;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getListid() {
		return listid;
	}
	public void setListid(String listid) {
		this.listid = listid;
	}
	public String getCainame() {
		return cainame;
	}
	public void setCainame(String cainame) {
		this.cainame = cainame;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public double getMoney() {
		return money;
	}
	public void setMoney(double money) {
		this.money = money;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	public int getCaitype() {
		return caitype;
	}
	public void setCaitype(int caitype) {
		this.caitype = caitype;
	}
}
