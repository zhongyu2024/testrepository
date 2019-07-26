package com.zy.bean;

public class Caipin {
	private int id;
	private String name;
	private int cooktypeid;
	private double price;
	private int state;
	private Mode mode;
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
	public Mode getMode() {
		return mode;
	}
	public void setMode(Mode mode) {
		this.mode = mode;
	}
	public Caipin(int id, String name, int cooktypeid, double price, int state,
			Mode mode) {
		super();
		this.id = id;
		this.name = name;
		this.cooktypeid = cooktypeid;
		this.price = price;
		this.state = state;
		this.mode = mode;
	}
	public Caipin() {
		super();
	}
	
}
