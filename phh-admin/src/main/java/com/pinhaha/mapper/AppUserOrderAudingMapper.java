package com.pinhaha.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.pinhaha.pojo.AppUserOrderAuding;

import tk.mybatis.mapper.common.Mapper;

public interface AppUserOrderAudingMapper extends Mapper<AppUserOrderAuding>{
		List<Map<String,Object>> user_order_auding_list(Map<String, Object> map);
		int user_order_auding_list_size();
		int up_user_order_auding(Map<String,Object> map);
		
		AppUserOrderAuding selectOrderAudingByOrderNo(@Param("orderNo")String orderNo);
}