package com.zy.bean;

public class ZcaiLiaoDetail {
 private int clid;
 private String lxname;
 private String cpname;
 private String danweiname;
 private String cailinfo;
 
public ZcaiLiaoDetail() {
	super();
}


 

public ZcaiLiaoDetail(int clid, String lxname, String cpname,
		String danweiname, String cailinfo) {
	super();
	this.clid = clid;
	this.lxname = lxname;
	this.cpname = cpname;
	this.danweiname = danweiname;
	this.cailinfo = cailinfo;
}

public int getClid() {
	return clid;
}

public void setClid(int clid) {
	this.clid = clid;
}

public String getLxname() {
	return lxname;
}

public void setLxname(String lxname) {
	this.lxname = lxname;
}

public String getCpname() {
	return cpname;
}

public void setCpname(String cpname) {
	this.cpname = cpname;
}

public String getDanweiname() {
	return danweiname;
}

public void setDanweiname(String danweiname) {
	this.danweiname = danweiname;
}

public String getCailinfo() {
	return cailinfo;
}

public void setCailinfo(String cailinfo) {
	this.cailinfo = cailinfo;
}
 
 

}
