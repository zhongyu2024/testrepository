package com.zy.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.zy.bean.Cooktype;
import com.zy.bean.Listinfo;
import com.zy.dao.mapper.BaobiaoMapper;
@Service
public class BaobiaoService {
	@Resource
	private BaobiaoMapper baobiaoMapper;
	public void setBaobiaoMapper(BaobiaoMapper baobiaoMapper){
		this.baobiaoMapper=baobiaoMapper;
	}
	public int findTotal(String beginTime,String endTime){
		return baobiaoMapper.findTotal(beginTime, endTime);
	}
	public int findSum(String beginTime,String endTime){
		return baobiaoMapper.findSum(beginTime, endTime);
	}
	public int findHum(String beginTime,String endTime){
		return baobiaoMapper.findHum(beginTime, endTime);
	}
	public int findCaiMoney(String beginTime,String endTime,String cooktypename){
		return baobiaoMapper.findCaiMoney(beginTime, endTime, cooktypename);
	}
	public List<Listinfo> findCaiMoneyId(String beginTime,String endTime,String cooktypename){
		return baobiaoMapper.findCaiMoneyId(beginTime, endTime, cooktypename);
	}
	public int findSumMoney(String beginTime,String endTime){
		return baobiaoMapper.findSumMoney(beginTime, endTime);
	}
	public List<Cooktype> findCaiType(String beginTime,String endTime){
		return baobiaoMapper.findCaiType(beginTime, endTime);
	}
}
