package com.pinhaha.enums;

public enum EnumMemberType {
	baseMember(1,"基础会员"),
	highMember(2,"高级会员"),
	partnerMember(3,"股东合伙"),
	areaMember(4,"区域代理");
	
	
	private Integer type;
	private String typeDesc;
	
	private EnumMemberType(Integer type, String typeDesc) {
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
