package com.zy.bean;
/**
 * 供应商实体类
 * @author Administrator
 *
 */
public class Giver {

	private int id;
	private String name;
	private String manname;
	private String mantel;
	private String address;
	public Giver(int id, String name, String manname, String mantel,
			String address) {
		super();
		this.id = id;
		this.name = name;
		this.manname = manname;
		this.mantel = mantel;
		this.address = address;
	}
	
	/*public Giver(int i, String name2, String content, String cell,
			String address2) {
		// TODO Auto-generated constructor stub
	}*/
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
	public String getManname() {
		return manname;
	}
	public void setManname(String manname) {
		this.manname = manname;
	}
	public String getMantel() {
		return mantel;
	}
	public void setMantel(String mantel) {
		this.mantel = mantel;
	}
	public String getAddress() {
		return address;
	}
	public Giver() {
		super();
	}
	public void setAddress(String address) {
		this.address = address;
	}
}
