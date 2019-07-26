package com.zy.bean;
/**
 * 
 * @author Administrator
 *
 */
public class Materials {
	private int id;
	private String name;
	private int materialstypeid;
	private int unitid;
	private String clob;
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
	public int getMaterialstypeid() {
		return materialstypeid;
	}
	public void setMaterialstypeid(int materialstypeid) {
		this.materialstypeid = materialstypeid;
	}
	public int getUnitid() {
		return unitid;
	}
	public void setUnitid(int unitid) {
		this.unitid = unitid;
	}
	public String getClob() {
		return clob;
	}
	public void setClob(String clob) {
		this.clob = clob;
	}
}
