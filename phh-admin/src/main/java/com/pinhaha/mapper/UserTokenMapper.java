package com.pinhaha.mapper;

import org.apache.ibatis.annotations.Param;

import com.pinhaha.pojo.UserToken;

import tk.mybatis.mapper.common.Mapper;

public interface UserTokenMapper extends Mapper<UserToken>{
	
	UserToken selectByToken(@Param("token")String token);
	
	UserToken selectByUserId(@Param("userId")Long userId);
}