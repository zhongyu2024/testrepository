package com.pinhaha.enums;

public enum EnumAppOrderAudingType {
	waitAuding(1,"待审核"),
	adminAuding(2,"后台审核发放"),
	upSend(3,"上级已拆分"),
	systemSend(4,"系统自动发放");
	
	
	private Integer type;
	private String typeDesc;
	
	private EnumAppOrderAudingType(Integer type, String typeDesc) {
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
