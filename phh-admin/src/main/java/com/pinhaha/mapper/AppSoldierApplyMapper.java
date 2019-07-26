package com.pinhaha.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.pinhaha.pojo.AppSoldierApply;

import tk.mybatis.mapper.common.Mapper;

public interface AppSoldierApplyMapper extends Mapper<AppSoldierApply>{
	AppSoldierApply selectByUserId(@Param("userId")Long userId);
	
	List<AppSoldierApply> selectAllApply(Map<String,Object> map);
	
	Integer selectAllApplyCount(Map<String,Object> map);
}