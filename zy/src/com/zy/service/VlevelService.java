package com.zy.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.zy.bean.Vlevel;
import com.zy.dao.mapper.VlevelMapper;

@Service
public class VlevelService {
	@Resource
	private VlevelMapper vlevelMapper;
	public void setVlevelMapper(VlevelMapper vlevelMapper) {
		this.vlevelMapper = vlevelMapper;
	}
	public List<Vlevel> findAllLevel(){
		System.out.println("½øÈëservice");
		return vlevelMapper.findAllLevel();
	}
	public void addLevel(Vlevel level) {
		// TODO Auto-generated method stub
		 vlevelMapper.addLevel(level);
	}
	public Vlevel findLevelById(int id){
		return vlevelMapper.findLevelById(id);
	}
	public void delLevel(int id){
		vlevelMapper.delLevel(id);
	}
	public void xiuLevel(Vlevel v) {
		vlevelMapper.xiuLevel(v);
	}
	public double queryMoney(int id) {
		 return vlevelMapper.queryMoney(id);
	}
	
}
