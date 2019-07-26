package com.zy.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.zy.bean.Cangku;
import com.zy.dao.mapper.CangkuMapper;

@Service
public class CangkuService {
	
	@Resource
	private CangkuMapper ckm;

	public void setCkm(CangkuMapper ckm) {
		this.ckm = ckm;
	}
	
	/**
	 * 新增
	 */
	public boolean addNew(Cangku ck){
		return ckm.addNew(ck);
	}
	/**
	 * 修改
	 */
	public boolean updateById(Cangku ck){
		return ckm.updateById(ck);
	}
	/**
	 * 删除
	 */
	public boolean deleteById(int id){
		return ckm.deleteById(id);
	}
	/**
	 * 分页查询
	 */
	public List<Cangku> findByPage(int page){
		return ckm.findByPage(page);
	}
	/**
	 * 根据id查询
	 */
	public Cangku findById(int id){
		return ckm.findById(id);
	}
	/**
	 * 查询所有
	 */
	public int findAll(){
		return ckm.findAll();
	}
	
}
