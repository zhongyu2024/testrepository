package com.zy.dao.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.zy.bean.Mode;

public interface specialMapple {

	public List<Mode> findAll();
	public List<Mode> findName(String name);
	
	public boolean addSpecial(@Param("name")String name);
	
	public boolean editSpecial(@Param("name")String name,@Param("id")int id);
	
	public boolean deleteSpecial(int id);
}
