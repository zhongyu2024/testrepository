package com.pinhaha.mapper;

import org.apache.ibatis.annotations.Param;

import com.pinhaha.pojo.AppUserCoupon;

import tk.mybatis.mapper.common.Mapper;

public interface AppUserCouponMapper extends Mapper<AppUserCoupon>{
	
	int changeCouponByUserAndChangeNum(@Param("changeNum")int changeNum,@Param("id")long id);
	
	AppUserCoupon selectByUserId(@Param("userId")Long userId);
}