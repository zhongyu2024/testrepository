package com.pinhaha.mapper;

import com.pinhaha.pojo.AdminSendSms;

import tk.mybatis.mapper.common.Mapper;

public interface AdminSendSmsMapper extends Mapper<AdminSendSms>{
	AdminSendSms getTheNewCode();
}