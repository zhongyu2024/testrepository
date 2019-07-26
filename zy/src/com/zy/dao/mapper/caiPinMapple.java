package com.zy.dao.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.zy.bean.Caipin;
import com.zy.bean.Food;
import com.zy.bean.Mode;

public interface caiPinMapple {
	/**
	 * 菜品
	 * @return
	 */
	public List<Caipin> findAllFood();
	public List<Caipin> finds();
	public List<Caipin> showOthers(String name);
	public List<Caipin> searchCai(String name);
	public boolean addFood(@Param("name")String name,@Param("typeid")int id,@Param("price")Double price);
	public int searchthis(String name);//寻找该名字对应的类型ID
	public boolean deleteFood(int id);
	public boolean editFood(@Param("name")String name,@Param("name1")String name1,@Param("price")Double price);
	public boolean deleteAllFood(@Param("typeid")int id);
	public int searchFoodByName(@Param("typeid")int id);
	/**
	 * 菜系
	 */
	public List<Mode> findAllCookType();
	public List<Mode> searchType(String name);
	public boolean addCookType(Mode mode);
	
	public boolean deleteCookType(String name);
	
	public boolean editCookType(@Param("name")String name,@Param("name1")String name1);
	
}
