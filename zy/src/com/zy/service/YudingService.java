package com.zy.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.zy.bean.Yuding;
import com.zy.bean.YudingFoodtable;
import com.zy.bean.YudingQuery;
import com.zy.dao.mapper.YudingMapper;

@Service
public class YudingService {
	@Resource
	private YudingMapper yudingMapper;
	public void setYudingMapper(YudingMapper yudingMapper){
		this.yudingMapper=yudingMapper;
	}
	public List<YudingFoodtable> findByTime(String beginTime,String endTime,int seatsize){
		return yudingMapper.findByTime(beginTime, endTime,seatsize);
	}
	public int findId(){
		return yudingMapper.findId();
	}
	public List<Yuding> findByQuery(YudingQuery yq){
		return yudingMapper.findByQuery(yq);
	}
	public void updateYuding(Yuding yuding){
		yudingMapper.updateYuding(yuding);
	}
	public String findGuoqi(){
		return yudingMapper.findGuoqi();
	}
	public List<YudingFoodtable> findQuery(YudingQuery yq){
		return yudingMapper.findQuery(yq);
	}
	
	public List<Yuding> findByName(String info,int pageno){
		return yudingMapper.findByName(info,pageno);
	}
	public List<Yuding> findByTel(String info,int pageno){
		return yudingMapper.findByTel(info,pageno);
	}
	public void addYuding(Yuding yuding){
		yudingMapper.insert(yuding);
	}
	public int findNum(){
		return yudingMapper.findNum();
	}
}
