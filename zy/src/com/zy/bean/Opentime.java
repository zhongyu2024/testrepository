package com.zy.bean;
/*id int primary key,
name varchar2(50) not null ,
starttime varchar2(100) not null,
endtime varchar2(100) not null*/
public class Opentime {
	private int  id;
	private String name;
	private String starttime;
	private String endtime;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getStarttime() {
		return starttime;
	}
	public void setStarttime(String starttime) {
		this.starttime = starttime;
	}
	public String getEndtime() {
		return endtime;
	}
	public void setEndtime(String endtime) {
		this.endtime = endtime;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Opentime(int id, String starttime, String endtime) {
		super();
		this.id = id;
		this.starttime = starttime;
		this.endtime = endtime;
	}
	public Opentime() {
		super();
	}
	
}
