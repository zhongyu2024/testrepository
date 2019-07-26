package com.zy.bean;

public class Cailiao {
	private int id;
	private String name;
	private int mtypeid;
	private String mtypename;
	private int unitid;
	private String unitname;
	private int num;
	
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
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
	public int getMtypeid() {
		return mtypeid;
	}
	public void setMtypeid(int mtypeid) {
		this.mtypeid = mtypeid;
	}
	public String getMtypename() {
		return mtypename;
	}
	public void setMtypename(String mtypename) {
		this.mtypename = mtypename;
	}
	public int getUnitid() {
		return unitid;
	}
	public void setUnitid(int unitid) {
		this.unitid = unitid;
	}
	public String getUnitname() {
		return unitname;
	}
	public void setUnitname(String unitname) {
		this.unitname = unitname;
	}
	public Cailiao(int id, String name, int mtypeid, String mtypename,
			int unitid, String unitname) {
		super();
		this.id = id;
		this.name = name;
		this.mtypeid = mtypeid;
		this.mtypename = mtypename;
		this.unitid = unitid;
		this.unitname = unitname;
	}
	public Cailiao() {
		super();
	}
	public Cailiao(int id, String name, int mtypeid, String mtypename,
			int unitid, String unitname, int num) {
		super();
		this.id = id;
		this.name = name;
		this.mtypeid = mtypeid;
		this.mtypename = mtypename;
		this.unitid = unitid;
		this.unitname = unitname;
		this.num = num;
	}
	
	
}
