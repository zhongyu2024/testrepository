package com.zy.bean;

public class YudingQuery {
	private String yutime;
	private int state;
	private int createtime;
	private int opentimeid;
	private String seatsize;
	private int pageno;
	public YudingQuery(String yutime,int opentimeid,String seatsize){
		super();
		this.yutime=yutime;
		this.opentimeid=opentimeid;
		this.seatsize=seatsize;
	}
	
	public int getPageno() {
		return pageno;
	}

	public void setPageno(int pageno) {
		this.pageno = pageno;
	}

	public int getOpentimeid() {
		return opentimeid;
	}
	public void setOpentimeid(int opentimeid) {
		this.opentimeid = opentimeid;
	}
	public String getSeatsize() {
		return seatsize;
	}
	public void setSeatsize(String seatsize) {
		this.seatsize = seatsize;
	}
	public String getYutime() {
		return yutime;
	}
	public void setYutime(String yutime) {
		this.yutime = yutime;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public int getCreatetime() {
		return createtime;
	}
	public void setCreatetime(int createtime) {
		this.createtime = createtime;
	}
	public YudingQuery(String yutime, int state, int createtime,int pageno) {
		super();
		this.yutime = yutime;
		this.state = state;
		this.createtime = createtime;
		this.pageno=pageno;

	}
	
}
