package com.zy.bean;
/**
 * 员工实体类
 * @author Administrator
 *
 */
public class Yuangong {

	private int id;
	private String name;
	private String username;
	private String userpass;
	private int powerid;
	private int sex;
	private String birthday;
	private String hiredate;
	private String tel;
	private Mode mode;
	
	public Yuangong(int id, String name, String username, String userpass,
			int powerid, int sex, String birthday, String hiredate, String tel,
			Mode mode) {
		super();
		this.id = id;
		this.name = name;
		this.username = username;
		this.userpass = userpass;
		this.powerid = powerid;
		this.sex = sex;
		this.birthday = birthday;
		this.hiredate = hiredate;
		this.tel = tel;
		this.mode = mode;
	}
	public Yuangong() {
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
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getUserpass() {
		return userpass;
	}
	public void setUserpass(String userpass) {
		this.userpass = userpass;
	}
	public int getPowerid() {
		return powerid;
	}
	public void setPowerid(int powerid) {
		this.powerid = powerid;
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
	public String getHiredate() {
		return hiredate;
	}
	public void setHiredate(String hiredate) {
		this.hiredate = hiredate;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public Mode getMode() {
		return mode;
	}
	public void setMode(Mode mode) {
		this.mode = mode;
	}
	
}
