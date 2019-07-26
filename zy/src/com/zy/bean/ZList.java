package com.zy.bean;

public class ZList {
	private String id;
	private String ordertime;
	private int type;
	private int state;
	private int tableid;
	private double paymoney;
	private int eatnum;
	private double dazhemoney;
	private double realpay;
	private int waiterid;
	private int cashierid;
	private String paytime;
	private int vip;
	private int sendman;
	private String sendtime;
	private String sendmsg;


	private String sendname;
	private String typename;
	private String statename;
	private String tablename;
	private String waitername;
	private String cashiername;
	private String vipname;
	private int opentime;
	private String aid;
	
	public String getAid() {
		return aid;
	}
	public void setAid(String aid) {
		this.aid = aid;
	}
	public int getOpentime() {
		return opentime;
	}
	public void setOpentime(int opentime) {
		this.opentime = opentime;
	}
	public String getVipname() {
		return vipname;
	}
	public void setVipname(String vipname) {
		this.vipname = vipname;
	}
	public String getTypename() {
		return typename;
	}
	public void setTypename(String typename) {
		this.typename = typename;
	}
	public String getStatename() {
		return statename;
	}
	public void setStatename(String statename) {
		this.statename = statename;
	}
	public String getTablename() {
		return tablename;
	}
	public void setTablename(String tablename) {
		this.tablename = tablename;
	}
	public String getWaitername() {
		return waitername;
	}
	public void setWaitername(String waitername) {
		this.waitername = waitername;
	}
	public String getCashiername() {
		return cashiername;
	}
	public void setCashiername(String cashiername) {
		this.cashiername = cashiername;
	}
	public String getSendname() {
		return sendname;
	}
	public void setSendname(String sendname) {
		this.sendname = sendname;
	}

	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getOrdertime() {
		return ordertime;
	}
	public void setOrdertime(String ordertime) {
		this.ordertime = ordertime;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public int getTableid() {
		return tableid;
	}
	public void setTableid(int tableid) {
		this.tableid = tableid;
	}
	public double getPaymoney() {
		return paymoney;
	}
	public void setPaymoney(double paymoney) {
		this.paymoney = paymoney;
	}
	public int getEatnum() {
		return eatnum;
	}
	public void setEatnum(int eatnum) {
		this.eatnum = eatnum;
	}
	public double getDazhemoney() {
		return dazhemoney;
	}
	public void setDazhemoney(double dazhemoney) {
		this.dazhemoney = dazhemoney;
	}
	public double getRealpay() {
		return realpay;
	}
	public void setRealpay(double realpay) {
		this.realpay = realpay;
	}
	public int getWaiterid() {
		return waiterid;
	}
	public void setWaiterid(int waiterid) {
		this.waiterid = waiterid;
	}
	public int getCashierid() {
		return cashierid;
	}
	public void setCashierid(int cashierid) {
		this.cashierid = cashierid;
	}
	public String getPaytime() {
		return paytime;
	}
	public void setPaytime(String paytime) {
		this.paytime = paytime;
	}
	public int getVip() {
		return vip;
	}
	public void setVip(int vip) {
		this.vip = vip;
	}
	public int getSendman() {
		return sendman;
	}
	public void setSendman(int sendman) {
		this.sendman = sendman;
	}
	public String getSendtime() {
		return sendtime;
	}
	public void setSendtime(String sendtime) {
		this.sendtime = sendtime;
	}
	public String getSendmsg() {
		return sendmsg;
	}
	public void setSendmsg(String sendmsg) {
		this.sendmsg = sendmsg;
	}
	public ZList(String id, String ordertime, int type, int state, int tableid,
			double paymoney, int eatnum, double dazhemoney, double realpay,
			int waiterid, int cashierid, String paytime, int vip, int sendman,
			String sendtime, String sendmsg) {
		super();
		this.id = id;
		this.ordertime = ordertime;
		this.type = type;
		this.state = state;
		this.tableid = tableid;
		this.paymoney = paymoney;
		this.eatnum = eatnum;
		this.dazhemoney = dazhemoney;
		this.realpay = realpay;
		this.waiterid = waiterid;
		this.cashierid = cashierid;
		this.paytime = paytime;
		this.vip = vip;
		this.sendman = sendman;
		this.sendtime = sendtime;
		this.sendmsg = sendmsg;
	}
	public ZList() {
		super();
	}
	
}
