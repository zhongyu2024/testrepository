package com.pinhaha.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.pinhaha.pojo.AppCouponLog;

import tk.mybatis.mapper.common.Mapper;

public interface AppCouponLogMapper extends Mapper<AppCouponLog>{
	
	int getTotalNumByUserId(@Param("userId")Long userId);
	
	List<AppCouponLog> getMyCouponBuy(@Param("userId")Long userId);
	
	List<Map<String,Object>> getMyCouponSend(@Param("userId")Long userId);
}