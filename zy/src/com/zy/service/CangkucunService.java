package com.zy.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.zy.bean.Cangkucun;
import com.zy.bean.CangkucunSearch;
import com.zy.dao.mapper.CangkucunMapper;

@Service
public class CangkucunService {
	
	@Resource
	private CangkucunMapper ckcm;

	public void setCkcm(CangkucunMapper ckcm) {
		this.ckcm = ckcm;
	}
	
	
	/**
	 * 库存信息查找(分页查找)
	 */
	public List<Cangkucun> findByPage(int page){
		return ckcm.findByPage(page);
	}
	
	/**
	 * 按要求查找
	 */
	public List<Cangkucun> findByText(CangkucunSearch ckcserch){
		return ckcm.findByText(ckcserch);
	}
	/**
	 * 库存信息查找(分页查找)
	 */
	public int findPAll(){
		return ckcm.findPAll();
	}
	/**
	 * 按要求查找
	 */
	public int findTAll(CangkucunSearch ckcserch){
		return ckcm.findTAll(ckcserch);
	}
}
