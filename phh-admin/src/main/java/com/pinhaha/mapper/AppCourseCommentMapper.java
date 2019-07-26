package com.pinhaha.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.pinhaha.pojo.AppCourseComment;

import tk.mybatis.mapper.common.Mapper;

public interface AppCourseCommentMapper extends Mapper<AppCourseComment>{
	

	List<AppCourseComment> getCommentByCourseIdAndComId(@Param("courseId")Long courseId,@Param("commentId")Long commentId);
	
}