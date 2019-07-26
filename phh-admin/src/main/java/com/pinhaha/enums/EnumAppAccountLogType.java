package com.pinhaha.enums;



public enum EnumAppAccountLogType {
	oneReturn(1,"基础会员一级收益"),
	twoReturn(2,"基础会员二级收益"),
	poiontReturn(3,"高级会员一级一次性返点"),
	provinceReturn(4,"省级代理基础会员所在省级区域返点"),
	cityReturn(5,"市级代理基础会员所在市级区域返点"),
	forwardAply(6,"提现"),
	refuseForwardAply(7,"提现拒绝返还"),
	highBaseReturn(8,"高级会员本金收益");
	
	
	private Integer type;
	private String typeDesc;
	
	private EnumAppAccountLogType(Integer type, String typeDesc) {
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
