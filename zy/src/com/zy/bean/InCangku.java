package com.zy.bean;

public class InCangku {
	private String id;
	private int cangkuid;
	private String ckname;
	private String intime;
	private int giverid;
	private String givername;
	private int byid;
	private String byman;
	private int inid;
	private String inman;
	private String info;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getCkname() {
		return ckname;
	}
	public void setCkname(String ckname) {
		this.ckname = ckname;
	}
	public String getIntime() {
		return intime;
	}
	public void setIntime(String intime) {
		this.intime = intime;
	}
	public String getGivername() {
		return givername;
	}
	public String getByman() {
		return byman;
	}
	public void setByman(String byman) {
		this.byman = byman;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	public void setGivername(String givername) {
		this.givername = givername;
	}
	
	public String getInman() {
		return inman;
	}
	public void setInman(String inman) {
		this.inman = inman;
	}
	
	
	public int getCangkuid() {
		return cangkuid;
	}
	public void setCangkuid(int cangkuid) {
		this.cangkuid = cangkuid;
	}
	public int getGiverid() {
		return giverid;
	}
	public void setGiverid(int giverid) {
		this.giverid = giverid;
	}
	public int getByid() {
		return byid;
	}
	public void setByid(int byid) {
		this.byid = byid;
	}
	public int getInid() {
		return inid;
	}
	public void setInid(int inid) {
		this.inid = inid;
	}
	
	
	
	public InCangku(String id, int cangkuid, String intime, int giverid,
			int byid, int inid, String info) {
		super();
		this.id = id;
		this.cangkuid = cangkuid;
		this.intime = intime;
		this.giverid = giverid;
		this.byid = byid;
		this.inid = inid;
		this.info = info;
	}
	public InCangku(String id, int cangkuid, String ckname, String intime,
			int giverid, String givername, int byid, String byman, int inid,
			String inman, String info) {
		super();
		this.id = id;
		this.cangkuid = cangkuid;
		this.ckname = ckname;
		this.intime = intime;
		this.giverid = giverid;
		this.givername = givername;
		this.byid = byid;
		this.byman = byman;
		this.inid = inid;
		this.inman = inman;
		this.info = info;
	}
	public InCangku() {
		super();
	}
	
	
}
