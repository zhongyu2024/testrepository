package com.pinhaha.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.pinhaha.pojo.AppCourse;
import com.pinhaha.pojo.AppTeacher;

import tk.mybatis.mapper.common.Mapper;

public interface AppCourseMapper extends Mapper<AppCourse>{

	public List<AppCourse> getCourseSortList(@Param("size") String size);
	
	public List<AppCourse> selectBYName(@Param("searchName") String searchName);
	
	public List<AppCourse> getAllCourseByParam(Map<String,Object> map);
	
	public List<AppCourse> getAllNoLimit();
	
	List<AppTeacher> getTeacher();
	
	void deleteCourse(int id);
	
	List<AppCourse> getcourse(int id);

	public List<AppCourse> getCourseListByCateId(Long ins_id);
	
}