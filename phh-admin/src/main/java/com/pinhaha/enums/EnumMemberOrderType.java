package com.pinhaha.enums;

public enum EnumMemberOrderType {

	
	
	ALIPAY(1,"支付宝支付"),
	WECHAT(2,"微信支付"),
	HIGHSEND(3,"上级拆分"),
	UNDERAPLY(4,"下级团购申请"),
	SYSTEMAUDING(5,"系统审核");
	
	
	private Integer type;
	private String typeDesc;
	
	private EnumMemberOrderType(Integer type, String typeDesc) {
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
