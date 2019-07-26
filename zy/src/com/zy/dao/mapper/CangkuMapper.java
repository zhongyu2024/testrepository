package com.zy.dao.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.zy.bean.Cangku;

public interface CangkuMapper {
	/**
	 * 新增
	 */
	public boolean addNew(Cangku ck);
	/**
	 * 修改
	 */
	public boolean updateById(Cangku ck);
	/**
	 * 删除
	 */
	public boolean deleteById(int id);
	/**
	 * 分页查询
	 */
	public List<Cangku> findByPage(@Param(value="page")int page);
	/**
	 * 根据id查询
	 */
	public Cangku findById(int id);
	/**
	 * 查询所有
	 */
	public int findAll();
}
