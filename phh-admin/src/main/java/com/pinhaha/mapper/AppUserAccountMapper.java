package com.pinhaha.mapper;


import java.math.BigDecimal;

import org.apache.ibatis.annotations.Param;

import com.pinhaha.pojo.AppUserAccount;

import tk.mybatis.mapper.common.Mapper;

public interface AppUserAccountMapper extends Mapper<AppUserAccount>{
	//提现
	int UserAccountGetMoney(BigDecimal ammount,Long id);

	//查找余额
	AppUserAccount getBeforeAmount(Long user_id);
	
	
	AppUserAccount selectByUserId(@Param("userId")Long userId);
	
	int changeAccountByUserAndChangeMoney(@Param("changeMoney")BigDecimal changeMoney,@Param("id")long id);

	
}