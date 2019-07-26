package com.zy.bean;

public class OutCailiao {
	private int id;
	private int materialsid;
	private String mname;
	private String mtype;
	private int num;
	private String outcangkuid;
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
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getOutcangkuid() {
		return outcangkuid;
	}
	public void setOutcangkuid(String outcangkuid) {
		this.outcangkuid = outcangkuid;
	}
	public OutCailiao(int id, int materialsid, String mname, String mtype,
			int num, String outcangkuid) {
		super();
		this.id = id;
		this.materialsid = materialsid;
		this.mname = mname;
		this.mtype = mtype;
		this.num = num;
		this.outcangkuid = outcangkuid;
	}
	
	public OutCailiao(int materialsid, int num, String outcangkuid) {
		super();
		this.materialsid = materialsid;
		this.num = num;
		this.outcangkuid = outcangkuid;
	}
	public OutCailiao() {
		super();
	}
	
	
}
