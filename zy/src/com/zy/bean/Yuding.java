package com.zy.bean;
/**
 * 
 * 预订表实体类
 *
 */
public class Yuding {
	private int id;
	private String name;
	private int sex;
	private String tel;
	private int mannum;
	private String yutime;
	private float baotime;
	private String info;
	private float money;
	private int tableid;
	private int state;
	private String createtime;
	private int opentimeid;
	public Yuding(){}
	public Yuding(int state,int id){
		super();
		this.id=id;
		this.state=state;
	}
	public Yuding(int id, String name, int sex, String tel, int mannum,
			String yutime, float baotime, String info, float money,
			int tableid, int state, String createtime) {
		super();
		this.id = id;
		this.name = name;
		this.sex = sex;
		this.tel = tel;
		this.mannum = mannum;
		this.yutime = yutime;
		this.baotime = baotime;
		this.info = info;
		this.money = money;
		this.tableid = tableid;
		this.state = state;
		this.createtime = createtime;
	}
	public Yuding(String name, int sex, String tel, int mannum,
			String yutime, float baotime, String info, float money,
			int tableid,  int opentimeid) {
		super();
		
		this.name = name;
		this.sex = sex;
		this.tel = tel;
		this.mannum = mannum;
		this.yutime = yutime;
		this.baotime = baotime;
		this.info = info;
		this.money = money;
		this.tableid = tableid;
		this.opentimeid = opentimeid;
	}
	
	public int getOpentimeid() {
		return opentimeid;
	}
	public void setOpentimeid(int opentimeid) {
		this.opentimeid = opentimeid;
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
	public int getSex() {
		return sex;
	}
	public void setSex(int sex) {
		this.sex = sex;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public int getMannum() {
		return mannum;
	}
	public void setMannum(int mannum) {
		this.mannum = mannum;
	}
	public String getYutime() {
		return yutime;
	}
	public void setYutime(String yutime) {
		this.yutime = yutime;
	}
	public float getBaotime() {
		return baotime;
	}
	public void setBaotime(float baotime) {
		this.baotime = baotime;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	public float getMoney() {
		return money;
	}
	public void setMoney(float money) {
		this.money = money;
	}
	public int getTableid() {
		return tableid;
	}
	public void setTableid(int tableid) {
		this.tableid = tableid;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public String getCreatetime() {
		return createtime;
	}
	public void setCreatetime(String createtime) {
		this.createtime = createtime;
	};
	
}
