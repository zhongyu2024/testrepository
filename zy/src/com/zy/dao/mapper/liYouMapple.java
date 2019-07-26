package com.zy.dao.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.zy.bean.Mode;

public interface liYouMapple {
	public List<Mode> findAll();
	public List<Mode> findName(String name);
	public boolean addLiYou(@Param("name")String name);
	public boolean editLiYou(@Param("name")String name,@Param("id")int id);
	public boolean deleteLiYou(int id);
}
