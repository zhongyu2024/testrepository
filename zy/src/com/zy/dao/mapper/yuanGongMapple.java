package com.zy.dao.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.zy.bean.Mode;
import com.zy.bean.Yuangong;

public interface yuanGongMapple {
	//员工
	public List<Yuangong> findAll();
	//分类别展示
	public List<Yuangong> findOthers(String name);
	//ajax
	public List<Yuangong> searchthis(String name);
	
	public String findPowerById(int id);
	public boolean addEmp(Yuangong yuangong);
	public boolean editEmp(Yuangong yuangong);
	//删除员工
	public boolean deleteEmp(int id);
	//根据名字查找id
	public int searchIdByName(String name);
	
	public String finds(String name);
	
	
	//职级
	public List<Mode> findAllPower();
	//ajax power
	public List<Mode> searchPower(String name);
	
	public boolean addPower(Mode mode);
	//删除职级
	public boolean deletePower(String name);
	public boolean deleteEmpByPower(int id);
	public boolean editPower(@Param("name")String name,@Param("name1")String name1);
	
}
