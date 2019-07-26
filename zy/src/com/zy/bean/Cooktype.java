package com.zy.bean;

public class Cooktype {
	private int id;
	private String name;
	public Cooktype(){}
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
	public Cooktype(int id, String name) {
		super();
		this.id = id;
		this.name = name;
	};
	
}
