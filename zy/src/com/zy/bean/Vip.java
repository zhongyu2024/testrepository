package com.zy.bean;


public class Vip {
	private int id;
	private String name;
	private String tel;
	private int sex;
	private String birthday;
	private String pwd;
	private int state;
	private String createtime;
	private double money;
	private int v_level;
	private String v_levelname;//会员等级类型
	private double v_count;//会员折扣
	private String typename;
	private double count;
	private double allpay;
	
	public String getV_levelname() {
		return v_levelname;
	}
	public void setV_levelname(String v_levelname) {
		this.v_levelname = v_levelname;
	}
	public double getV_count() {
		return v_count;
	}
	public void setV_count(double v_count) {
		this.v_count = v_count;
	}
	public double getAllpay() {
		return allpay;
	}
	public void setAllpay(double allpay) {
		this.allpay = allpay;
	}
	public double getCount() {
		return count;
	}
	public void setCount(double count) {
		this.count = count;
	}
	public String getTypename() {
		return typename;
	}
	public void setTypename(String typename) {
		this.typename = typename;
	}
	public Vip(int id, String name, String tel, int sex, String birthday,
			String pwd, int state, String createtime, double money, int v_level) {
		super();
		this.id = id;
		this.name = name;
		this.tel = tel;
		this.sex = sex;
		this.birthday = birthday;
		this.pwd = pwd;
		this.state = state;
		this.createtime = createtime;
		this.money = money;
		this.v_level = v_level;
	}
	public int getV_level() {
		return v_level;
	}
	public void setV_level(int v_level) {
		this.v_level = v_level;
	}
	public Vip() {
		super();
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
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public int getSex() {
		return sex;
	}
	public void setSex(int sex) {
		this.sex = sex;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
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
	}
	public double getMoney() {
		return money;
	}
	public void setMoney(double money) {
		this.money = money;
	}
	
	
	
}
