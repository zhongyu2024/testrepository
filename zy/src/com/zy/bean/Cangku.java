package com.zy.bean;
/**
 * ≤÷ø‚ µÃÂ¿‡
 * @author Administrator
 *
 */
public class Cangku {

	private int id;
	private String name;
	private String info;
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
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	public Cangku(int id, String name, String info) {
		super();
		this.id = id;
		this.name = name;
		this.info = info;
	}
	public Cangku() {
		super();
	}
	
}
