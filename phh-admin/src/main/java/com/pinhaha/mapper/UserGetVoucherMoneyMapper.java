package com.pinhaha.mapper;


import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;

import com.pinhaha.pojo.AppVoucherMoney;
import com.pinhaha.pojo.UserGetMoney;
import com.pinhaha.pojo.UserGetVoucherMoney;

import tk.mybatis.mapper.common.Mapper;

public interface UserGetVoucherMoneyMapper extends Mapper<UserGetVoucherMoney>{
	
	public List<UserGetVoucherMoney> getVoucherMoneyApply(Map<String,Object> map);
	
	public void updateGetVoucherMoney(int is_pay,String order_sn,int id);
	
	@Select("select * from app_voucher_money where order_no=#{param0}")
	public AppVoucherMoney  getVoucherMoneyByOrderNo(String sn);
	
}