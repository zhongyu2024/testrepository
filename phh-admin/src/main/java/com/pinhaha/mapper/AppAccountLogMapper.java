package com.pinhaha.mapper;

import java.util.List;
import java.util.Map;

import com.pinhaha.pojo.AppAccountLog;

import tk.mybatis.mapper.common.Mapper;

public interface AppAccountLogMapper extends Mapper<AppAccountLog>{
		List<AppAccountLog> getAllBill(Map<String,Object> map);
		
		int getAllBillCount(Map<String,Object> map);
}