package com.pinhaha.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.pinhaha.pojo.AppCategory;

import tk.mybatis.mapper.common.Mapper;

public interface AppCategoryMapper  extends Mapper<AppCategory>{
	
	List<AppCategory> getAllByParam(@Param("name")String name);
	
	List<AppCategory> selectChindrens(@Param("id")Long id);
	
	List<AppCategory> selectParentCa();
	
	int getCatesCourseNum(Long id); 
	
	int getCatesForDel(@Param("id")Long id); 
	
	void deleteCategory(Long id);
	
	void insertCateCourse(Long categoty_id,Long course_id);
	
	void delCateCourse(Long course_id);
	
}	