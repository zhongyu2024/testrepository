package com.pinhaha.mapper;

import org.apache.ibatis.annotations.Param;

import com.pinhaha.pojo.AppAreaAgent;

import tk.mybatis.mapper.common.Mapper;

public interface AppAreaAgentMapper extends Mapper<AppAreaAgent>{
	
	AppAreaAgent seleProvinceAgent(@Param("provinceId")Long provinceId);
	
	AppAreaAgent seleCityAgent(@Param("provinceId")Long provinceId,@Param("cityId")Long cityId);
}