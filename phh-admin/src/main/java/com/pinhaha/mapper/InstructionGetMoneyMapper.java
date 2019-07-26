package com.pinhaha.mapper;


import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;

import com.pinhaha.pojo.AppVoucherMoney;
import com.pinhaha.pojo.InstructionGetMoney;
import com.pinhaha.pojo.UserGetMoney;
import com.pinhaha.pojo.UserGetVoucherMoney;

import tk.mybatis.mapper.common.Mapper;

public interface InstructionGetMoneyMapper extends Mapper<InstructionGetMoney>{
	public List<InstructionGetMoney> getVoucherMoneyApply(Map<String,Object> map);
	
	public void updateGetVoucherMoney(Integer is_pay,Integer is_check,String order_sn,Long id);
}