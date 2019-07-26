package com.zy.dao.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.zy.bean.Cailiao;
import com.zy.bean.Cangku;
import com.zy.bean.Cangkucun;
import com.zy.bean.CangkucunSearch;
import com.zy.bean.Emp;
import com.zy.bean.Giver;
import com.zy.bean.InCailiao;
import com.zy.bean.InCangku;

public interface InCangkuMapper {
	/**
	 * 搜索全部员工
	 */
	public List<Emp> findAllEmp();
	
	/**
	 * 搜索全部供应商
	 */
	public List<Giver> findAllGiver();
	
	/**
	 * 搜索全部仓库
	 */
	public List<Cangku> findAllCangku();
	
	/**
	 * 查询流水号是否存在
	 */
	public InCangku findById(String id);
	
	public InCangku findById2(String id);
	
	/**
	 * 查询材料信息
	 */
	public List<Cailiao> findCailiao(@Param(value="page")int page);
	
	/**
	 * 查询材料信息
	 */
	public List<Cailiao> findCailiaoByType(CangkucunSearch ckcs);
	
	/**
	 * 搜索全部入库单(分页)
	 */
	public List<InCangku> findByPage(@Param(value="page")int page);
	
	/**
	 * 新增入库商品明细
	 */
	public boolean addNewCailia(InCailiao incl);
	
	/**
	 * 删除一条入库商品明细
	 */
	public boolean deleteById(int id);
	
	/**
	 * 查找入库商品明细表
	 */
	public List<InCailiao> findByMid(String mid);
	
	
	/**
	 * 删除入库商品明细
	 */
	public boolean deleteByMid(String id);
	
	/**
	 * 新增入库
	 */
	public boolean addNewInck(InCangku ck);
	
	/**
	 * 查询库存表是否存在数据
	 */
	public Cangkucun findCangkucnByType(Cangkucun c);
	
	/**
	 * 插入一条新增的仓库库存数据
	 */
	public boolean addNewCangkucun(Cangkucun c);
	
	/**
	 * 更新一条新增的仓库库存数据
	 */
	public boolean updateNewCangkucun(Cangkucun c);
	
	
	/**
	 * 三种情况查询
	 */
	public List<InCangku> selectTime(CangkucunSearch ckcs);
	
	public List<InCangku> selectType(CangkucunSearch ckcs);
	
	public List<InCangku> selectAll(CangkucunSearch ckcs);
	
	
	/**
	 * 搜索全部入库单
	 */
	public int findP();
	/**
	 * 三种情况查询
	 */
	public int selectT1(CangkucunSearch ckcs);
	
	public int selectT2(CangkucunSearch ckcs);
	
	public int selectT3(CangkucunSearch ckcs);
	
	
	/**
	 * 查询材料信息
	 */
	public int findAll();
	
	/**
	 * 查询材料信息
	 */
	public int findType(CangkucunSearch ckcs);
	
}
