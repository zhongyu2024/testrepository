package com.pinhaha.enums;

public enum EnumOrdeReturnType {
	waitAuding(0,"待审核"),
	unReturn(1,"未计算"),
	inReturn(2,"计算中"),
	alreadyReturn(3,"结算完毕");
	
	
	private Integer type;
	private String typeDesc;
	
	private EnumOrdeReturnType(Integer type, String typeDesc) {
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
