package com.pinhaha.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.pinhaha.pojo.AppUserMessage;

import tk.mybatis.mapper.common.Mapper;

public interface AppUserMessageMapper extends Mapper<AppUserMessage> {
	
	List<AppUserMessage> getMessageList(@Param("userId")Long userId);
	
	Integer unReadMessageCout(@Param("userId")Long userId);
}