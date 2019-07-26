package com.zy.dao.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.zy.bean.Cangkucun;
import com.zy.bean.CangkucunSearch;

public interface CangkucunMapper {
	/**
	 * 库存信息查找(分页查找)
	 */
	public List<Cangkucun> findByPage(@Param(value="page")int page);
	
	/**
	 * 库存信息查找(分页查找)
	 */
	public int findPAll();
	/**
	 * 按要求查找
	 */
	public int findTAll(CangkucunSearch ckcserch);
	
	/**
	 * 按要求查找
	 */
	public List<Cangkucun> findByText(CangkucunSearch ckcserch);
	
	
}
