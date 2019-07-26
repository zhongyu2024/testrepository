package com.zy.dao.mapper;

import org.apache.ibatis.annotations.Param;

public interface MimayzMapper {
	public String huoquPass(String name);
	
	public boolean changePass(@Param("userpass")String userpass,@Param("id")int id);
}
