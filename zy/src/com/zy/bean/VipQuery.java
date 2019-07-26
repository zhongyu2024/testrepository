package com.zy.bean;

public class VipQuery {
	private int id;
	private double min;
	private double max;
	private int state;
	private int pageno;
	public VipQuery(int id, double min, double max, int state, int pageno) {
		super();
		this.id = id;
		this.min = min;
		this.max = max;
		this.state = state;
		this.pageno = pageno;
	}
	public VipQuery() {
		super();
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public double getMin() {
		return min;
	}
	public void setMin(double min) {
		this.min = min;
	}
	public double getMax() {
		return max;
	}
	public void setMax(double max) {
		this.max = max;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public int getPageno() {
		return pageno;
	}
	public void setPageno(int pageno) {
		this.pageno = pageno;
	}
	
}
