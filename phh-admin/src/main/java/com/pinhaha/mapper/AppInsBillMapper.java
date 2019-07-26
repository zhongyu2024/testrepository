package com.pinhaha.mapper;



import com.pinhaha.pojo.AppInsBill;

import tk.mybatis.mapper.common.Mapper;

/**
 * 
 * Description:
 * This class {phh-seller}  code is all, prohibit other projects that are not the company's project.
 * @author shiquanli
 *    <p>15257129351@163.com</p>
 *    <p>1695446827@qq.com</p>
 *    TITLE ：phh-seller - AppInsBillMapper
 *    DATE ： 2019年4月28日 下午6:38:17
 */
public interface AppInsBillMapper extends Mapper<AppInsBill>{

	public String sumBill(String insId);
	
	public AppInsBill selByGetMId(String mId);
	
}