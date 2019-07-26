package com.pinhaha.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.pinhaha.pojo.AppCourseAffline;

import tk.mybatis.mapper.common.Mapper;

public interface AppCourseAfflineMapper extends Mapper<AppCourseAffline>{

	public List<AppCourseAffline> getAffCourseListByInsId(@Param("ins_id") Long ins_id);
	
	public AppCourseAffline getAffCourseById(@Param("id") Long id);
}