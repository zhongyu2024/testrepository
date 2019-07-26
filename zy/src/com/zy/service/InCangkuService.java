package com.zy.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.zy.bean.Cailiao;
import com.zy.bean.Cangku;
import com.zy.bean.Cangkucun;
import com.zy.bean.CangkucunSearch;
import com.zy.bean.Emp;
import com.zy.bean.Giver;
import com.zy.bean.InCailiao;
import com.zy.bean.InCangku;
import com.zy.dao.mapper.InCangkuMapper;

@Service
public class InCangkuService {
	@Resource
	private InCangkuMapper inckm;

	public void setInckm(InCangkuMapper inckm) {
		this.inckm = inckm;
	}
	
	/**
	 * 搜索全部员工
	 */
	public List<Emp> findAllEmp(){
		return inckm.findAllEmp();
	}
	/**
	 * 搜索全部供应商
	 */
	public List<Giver> findAllGiver(){
		return inckm.findAllGiver();
	}
	/**
	 * 搜索全部仓库
	 */
	public List<Cangku> findAllCangku(){
		return inckm.findAllCangku();
	}
	
	
	/**
	 * 查询流水号是否存在
	 */
	public InCangku findById(String id){
		return inckm.findById(id);
	}
	public InCangku findById2(String id){
		return inckm.findById2(id);
	}
	
	/**
	 * 查询材料信息
	 */
	public List<Cailiao> findCailiao(int page){
		return inckm.findCailiao(page);
	}
	
	/**
	 * 查询材料信息
	 */
	public List<Cailiao> findCailiaoByType(CangkucunSearch ckcs){
		return inckm.findCailiaoByType(ckcs);
	}
	
	/**
	 * 搜索全部入库单
	 */
	public List<InCangku> findByPage(int page){
		return inckm.findByPage(page);
	}
	
	/**
	 * 新增入库商品明细表
	 */
	public boolean addNewCailia(InCailiao incl){
		return inckm.addNewCailia(incl);
	}
	
	/**
	 * 删除一条入库商品明细
	 */
	public boolean deleteById(int id){
		return inckm.deleteById(id);
	}
	
	/**
	 * 删除入库商品明细
	 */
	public boolean deleteByMid(String id){
		return inckm.deleteByMid(id);
	}
	
	/**
	 * 查找入库商品明细表
	 */
	public List<InCailiao> findByMid(String mid){
		return inckm.findByMid(mid);
	}
	
	/**
	 * 新增入库
	 */
	public boolean addNewInck(InCangku ck){
		return inckm.addNewInck(ck);
	}
	
	/**
	 * 查询库存表是否存在数据
	 */
	public Cangkucun findCangkucnByType(Cangkucun c){
		return inckm.findCangkucnByType(c);
	}
	
	/**
	 * 插入一条新增的仓库库存数据
	 */
	public boolean addNewCangkucun(Cangkucun c){
		return inckm.addNewCangkucun(c);
	}
	
	/**
	 * 更新一条新增的仓库库存数据
	 */
	public boolean  updateNewCangkucun(Cangkucun c){
		return inckm.updateNewCangkucun(c);
	}
	
	/**
	 * 三种情况查询
	 */
	public List<InCangku> selectTime(CangkucunSearch ckcs){
		return inckm.selectTime(ckcs);
	}
	
	public List<InCangku> selectType(CangkucunSearch ckcs){
		return inckm.selectType(ckcs);
	}
	
	public List<InCangku> selectAll(CangkucunSearch ckcs){
		return inckm.selectAll(ckcs);
	}
	
	/**
	 * 搜索全部入库单
	 */
	public int findP(){
		return inckm.findP();
	}
	/**
	 * 三种情况查询
	 */
	public int selectT1(CangkucunSearch ckcs){
		return inckm.selectT1(ckcs);
	}
	
	public int selectT2(CangkucunSearch ckcs){
		return inckm.selectT2(ckcs);
	}
	
	public int selectT3(CangkucunSearch ckcs){
		return inckm.selectT3(ckcs);
	}
	
	/**
	 * 查询材料信息
	 */
	public int findAll(){
		return inckm.findAll();
	}
	
	/**
	 * 查询材料信息
	 */
	public int findType(CangkucunSearch ckcs){
		return inckm.findType(ckcs);
	}
	
	
}
