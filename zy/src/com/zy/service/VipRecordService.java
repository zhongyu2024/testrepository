package com.zy.service;


import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.zy.bean.VipRecord;
import com.zy.dao.mapper.VipRecordMapper;

@Service
public class VipRecordService {
	@Resource
	private VipRecordMapper vipRecordMapper;
	public void setVipRecordMapper(VipRecordMapper vipRecordMapper) {
		this.vipRecordMapper = vipRecordMapper;
	}
	
	public double findAllMoneyById(int id){
		return vipRecordMapper.findAllPayMoneyById(id);
	}
	
	public List<VipRecord> findRecordById(int id){
		return vipRecordMapper.findRecordById(id);
	}
	
	public List<VipRecord> findPayRecordById(int id){
		return vipRecordMapper.findPayRecordById(id);
	}
	
}
