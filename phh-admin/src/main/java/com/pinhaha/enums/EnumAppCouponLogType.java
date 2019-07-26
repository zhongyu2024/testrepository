package com.pinhaha.enums;



public enum EnumAppCouponLogType {
	systemBuy(1,"系统购买学习码"),
	sendOther(2,"转赠别人"),
	recevieOther(3,"接受转赠送");
	
	
	private Integer type;
	private String typeDesc;
	
	private EnumAppCouponLogType(Integer type, String typeDesc) {
		this.type = type;
		this.typeDesc = typeDesc;
	}
	
	public Integer getType(){
		return this.type;
	}
	
	public String getTypeDesc(){
		return this.typeDesc;
	}
	
	
}
