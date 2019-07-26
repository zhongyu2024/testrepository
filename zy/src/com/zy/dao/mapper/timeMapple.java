package com.zy.dao.mapper;

import java.util.List;

import com.zy.bean.Opentime;

public interface timeMapple {
	public List<Opentime> findAll();
	
	public List<Opentime> findthis(String name);
	
	public boolean addTime(Opentime opentime);
	
	public boolean deleteTime(int id);
	
	public boolean editTime(Opentime opentime);
}
