package com.pinhaha.enums;

public enum EnumMember {

	putong(1L,"VIP学员"),
	zuanshi(2L,"钻石vip"),
	faqihehuoren(3L,"发起合伙人"),
	gaojihehuoren(4L,"高级合伙人"),
	gudonghehuoren(5L,"股东合伙人"),
	shijidaili(6L,"市级代理"),
	shengjidaili(7L,"省级代理");
	
	
	private Long id;
	private String memberName;
	
	private EnumMember(Long id, String memberName) {
		this.id = id;
		this.memberName = memberName;
	}
	
	public Long getId(){
		return this.id;
	}
	
	public String getMemberName(){
		return this.memberName;
	}
	

}
