package com.zy.bean;
/**
 * 食物
 * @author Administrator
 *
 */
public class Food {

	private int id;
	private String name;
	private int cooktypeid;
	private double price;
	private int state;
	private int isguqing;//是否卖完0-不是，1-是
	public int getIsguqing() {
		return isguqing;
	}
	public void setIsguqing(int isguqing) {
		this.isguqing = isguqing;
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
	public int getCooktypeid() {
		return cooktypeid;
	}
	public void setCooktypeid(int cooktypeid) {
		this.cooktypeid = cooktypeid;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
}
