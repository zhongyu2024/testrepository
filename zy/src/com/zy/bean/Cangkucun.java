package com.zy.bean;

public class Cangkucun {
	private int id;
	private int cangkuid;
	private String ckname;
	private int materialsid;
	private String mname;
	private String mtype;
	private float num;
	private String dw;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	public String getCkname() {
		return ckname;
	}
	public void setCkname(String ckname) {
		this.ckname = ckname;
	}
	public int getMaterialsid() {
		return materialsid;
	}
	public void setMaterialsid(int materialsid) {
		this.materialsid = materialsid;
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public String getMtype() {
		return mtype;
	}
	public void setMtype(String mtype) {
		this.mtype = mtype;
	}
	public float getNum() {
		return num;
	}
	public void setNum(float num) {
		this.num = num;
	}
	public String getDw() {
		return dw;
	}
	public void setDw(String dw) {
		this.dw = dw;
	}
	
	public int getCangkuid() {
		return cangkuid;
	}
	public void setCangkuid(int cangkuid) {
		this.cangkuid = cangkuid;
	}
	
	
	public Cangkucun() {
		super();
	}
	public Cangkucun(int id, int cangkuid, String ckname, int materialsid,
			String mname, String mtype, float num, String dw) {
		super();
		this.id = id;
		this.cangkuid = cangkuid;
		this.ckname = ckname;
		this.materialsid = materialsid;
		this.mname = mname;
		this.mtype = mtype;
		this.num = num;
		this.dw = dw;
	}
	
	public Cangkucun(int cangkuid, int materialsid, float num) {
		super();
		this.cangkuid = cangkuid;
		this.materialsid = materialsid;
		this.num = num;
	}
	public Cangkucun(int id, int cangkuid, int materialsid, float num) {
		super();
		this.id = id;
		this.cangkuid = cangkuid;
		this.materialsid = materialsid;
		this.num = num;
	}
	
	
	
}
