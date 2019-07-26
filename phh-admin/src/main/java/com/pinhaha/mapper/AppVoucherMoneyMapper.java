package com.pinhaha.mapper;



import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.pinhaha.pojo.AppVoucherMoney;

import tk.mybatis.mapper.common.Mapper;

public interface AppVoucherMoneyMapper extends Mapper<AppVoucherMoney>{

	List<Map<String,Object>> getVouchermoneyCourseUser(Map<String,Object> map);
	
	//领取记录
	@Select("select * from app_voucher_money where user_id=#{param0} and type=1")
	List<AppVoucherMoney> voucherList(Long id);
	
	@Select("SELECT * FROM app_voucher_money mm WHERE mm.order_sn = #{orderNo}")
	List<AppVoucherMoney> selByOrderNo(String orderNo);
	
	//提现记录    包括所有
	@Select("select * from app_voucher_money where user_id=#{param0} and type=2")
	List<AppVoucherMoney> drawList(Long id);
	
	
	
}