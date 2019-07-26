package com.zy.dao.mapper;

import java.util.List;

import com.zy.bean.Vlevel;

public interface VlevelMapper {
	public List<Vlevel> findAllLevel();
	public void addLevel(Vlevel level); 
	public Vlevel findLevelById(int id);
	public void delLevel(int id);
	public void xiuLevel(Vlevel v);
	public double queryMoney(int id);
}
