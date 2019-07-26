package com.zy.bean;

public class InCailiao {
	private int id;
	private int materialsid;
	private int num;
	private float price;
	private String incangkuid;
	
	private String mname;
	private String typename;
	
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public String getTypename() {
		return typename;
	}
	public void setTypename(String typename) {
		this.typename = typename;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getMaterialsid() {
		return materialsid;
	}
	public void setMaterialsid(int materialsid) {
		this.materialsid = materialsid;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public float getPrice() {
		return price;
	}
	public void setPrice(float price) {
		this.price = price;
	}
	
	public String getIncangkuid() {
		return incangkuid;
	}
	public void setIncangkuid(String incangkuid) {
		this.incangkuid = incangkuid;
	}

	public InCailiao(int id, int materialsid, int num, float price,
			String incangkuid) {
		super();
		this.id = id;
		this.materialsid = materialsid;
		this.num = num;
		this.price = price;
		this.incangkuid = incangkuid;
	}
	
	
	public InCailiao(int id, int materialsid, int num, float price,
			String incangkuid, String mname, String typename) {
		super();
		this.id = id;
		this.materialsid = materialsid;
		this.num = num;
		this.price = price;
		this.incangkuid = incangkuid;
		this.mname = mname;
		this.typename = typename;
	}
	public InCailiao() {
		super();
	}
	
}
