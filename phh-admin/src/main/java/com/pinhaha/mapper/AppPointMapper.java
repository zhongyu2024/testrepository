package com.pinhaha.mapper;

import java.util.List;
import java.util.Map;

import com.pinhaha.pojo.AppPoint;

import tk.mybatis.mapper.common.Mapper;

public interface AppPointMapper  extends Mapper<AppPoint>{
	List<Map<String,Object>> getAll(Map<String,Object> map); 
	
	int getAllCount(Map<String,Object> map); 
	
}