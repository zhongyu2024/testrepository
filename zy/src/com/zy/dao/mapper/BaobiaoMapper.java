package com.zy.dao.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.zy.bean.Cooktype;
import com.zy.bean.Listinfo;

public interface BaobiaoMapper {
	//查询概况表营业收入
	public int findTotal(@Param("beginTime") String beginTime,@Param("endTime") String endTime);
	//查询概况表总单数
	public int findSum(@Param("beginTime") String beginTime,@Param("endTime") String endTime);
	//查询概况表总消费人数
	public int findHum(@Param("beginTime") String beginTime,@Param("endTime") String endTime);
	//查询销售的菜类名的总额
	public int findCaiMoney(@Param("beginTime") String beginTime,@Param("endTime") String endTime,@Param("cooktypename") String cooktypename);
	public List<Listinfo> findCaiMoneyId(@Param("beginTime") String beginTime,@Param("endTime") String endTime,@Param("cooktypename") String cooktypename);	
	public int findSumMoney(@Param("beginTime") String beginTime,@Param("endTime") String endTime);
	public List<Cooktype> findCaiType(@Param("beginTime") String beginTime,@Param("endTime") String endTime);
}
