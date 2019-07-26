package com.zy.dao.mapper;

import java.util.List;

import com.zy.bean.Waitnum;

public interface whCanpaiMapper {
	
	public List<Waitnum> findAllCanPai();
	
	public boolean addCanpai(Waitnum waitnum);
	
	public boolean deleteCanpai(int id);
}
