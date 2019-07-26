package com.pinhaha.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.pinhaha.pojo.AppCourseChapter;

import tk.mybatis.mapper.common.Mapper;

@org.apache.ibatis.annotations.Mapper
public interface AppCourseChapterMapper extends Mapper<AppCourseChapter>{
	
	List<AppCourseChapter> selectBYCourseId(@Param("courseId")Long courseId);
}