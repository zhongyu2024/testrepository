package com.zy.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.zy.bean.vipShuChu;
import com.zy.bean.vipShuRu;
import com.zy.dao.mapper.vipSmallMapper;

@Service
public class VipSmallService {
	@Resource
	private vipSmallMapper vsm;

	public void setVsm(vipSmallMapper vsm) {
		this.vsm = vsm;
	}
	
	public List<vipShuChu> findByvip(vipShuRu sr){
		return vsm.findByvip(sr);
	}
}
