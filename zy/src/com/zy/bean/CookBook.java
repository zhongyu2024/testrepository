package com.zy.bean;
/**
 * ²ËÆ×ÊµÌåÀà
 * @author Administrator
 *
 */
public class CookBook {

	private int id;
	private int foodid;
	private int materialsid;
	private double num;
	
	public CookBook(int id, int foodid, int materialsid, double num) {
		super();
		this.id = id;
		this.foodid = foodid;
		this.materialsid = materialsid;
		this.num = num;
	}
	 
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getFoodid() {
		return foodid;
	}
	public void setFoodid(int foodid) {
		this.foodid = foodid;
	}
	public int getMaterialsid() {
		return materialsid;
	}
	public void setMaterialsid(int materialsid) {
		this.materialsid = materialsid;
	}
	public double getNum() {
		return num;
	}
	public void setNum(double num) {
		this.num = num;
	}
	public CookBook() {
		super();
	}
}
