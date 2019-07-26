package com.pinhaha.mapper;

import org.apache.ibatis.annotations.Param;

import com.pinhaha.pojo.AppUserPartnerNum;

import tk.mybatis.mapper.common.Mapper;

public interface AppUserPartnerNumMapper extends Mapper<AppUserPartnerNum>{
	
	AppUserPartnerNum selectByUserId(@Param("userId")Long userId);
	
	int changeNumByUserId(@Param("num")Integer num,@Param("userId")Long userId);
}