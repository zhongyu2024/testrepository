package com.pinhaha.enums;

public enum EnumFieldClassVipPrice {
	VIP(1,407),
	ZUANSHI(2,3500),
	FAQIHEHUOREN(3,17500),
	GAOJIHEHUOREN(4,52500);
	
	private Integer type;
	private Integer price;
	
	private EnumFieldClassVipPrice(Integer type, Integer price) {
		this.type = type;
		this.price = price;
	}
	
	public Integer getType(){
		return this.type;
	}
	
	public Integer getPrice(){
		return this.price;
	}
	
	
	public static EnumFieldClassVipPrice getByType(Integer type){
		EnumFieldClassVipPrice[]  vs=EnumFieldClassVipPrice.values();
		for(EnumFieldClassVipPrice pp:vs){
			if(pp.getType().intValue()==type.intValue()){
				return pp;
			}
		}
		return null;
	}
}
