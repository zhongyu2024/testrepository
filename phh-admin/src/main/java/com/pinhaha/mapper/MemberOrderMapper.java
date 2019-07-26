package com.pinhaha.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.pinhaha.pojo.MemberOrder;

import tk.mybatis.mapper.common.Mapper;

public interface MemberOrderMapper  extends Mapper<MemberOrder>{
	MemberOrder selectByOrderNo(@Param("orderNo")String orderNo);
	
	List<MemberOrder> getOrdersByUserIdAndIsPay(@Param("userId")Long userId,@Param("isPay")Boolean isPay);
	
	int countMemberOrder(@Param("userId")Long userId,@Param("memberId")Long memberId);
	
	int countMemberOrderUserBuy(@Param("userId")Long userId,@Param("memberId")Long memberId);
}