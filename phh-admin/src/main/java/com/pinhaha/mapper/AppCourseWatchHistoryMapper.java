package com.pinhaha.mapper;

import org.apache.ibatis.annotations.Param;

import com.pinhaha.pojo.AppCourseWatchHistory;

import tk.mybatis.mapper.common.Mapper;

public interface AppCourseWatchHistoryMapper extends Mapper<AppCourseWatchHistory>{
	
	AppCourseWatchHistory selectByUserIdAndCourseId(@Param("courseId")Long courseId,@Param("userId")Long userId);
}