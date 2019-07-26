package com.zy.dao.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.zy.bean.Foodtable;

public interface canTaiMapper {
	//所有餐台
	public List<Foodtable> findAll();
	public List<Foodtable> findDaTing();
	public List<Foodtable> findBaoXiang();
	//根据名字AJAX查询
	public int findByName(String name);
	
	//新增餐台
	public boolean addCanTai(@Param("name")String name,@Param("area")int area,@Param("seatsize")int seatsize,@Param("minpay")double minpay);
	//编辑餐台
	public boolean editCanTai(@Param("id")int id,@Param("name")String name,@Param("area")int area,@Param("seatsize")int seatsize,@Param("minpay")double minpay);

	//删除
	public boolean deleteCanTai(int id);

}
