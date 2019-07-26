package com.zy.dao.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.zy.bean.VipRecord;

public interface VipRecordMapper {
	public double findAllPayMoneyById(int id);//根据会员id查找所有消费金额
	public List<VipRecord> findRecordById(int id);//根据会员id查找充值记录
	public List<VipRecord> findPayRecordById(int id);//根据会员id查找消费记录
}
