package com.zy.service;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import com.zy.bean.Cailiao;
import com.zy.bean.Cangku;
import com.zy.bean.Cangkucun;
import com.zy.bean.CangkucunSearch;
import com.zy.bean.Emp;
import com.zy.bean.OutCailiao;
import com.zy.bean.OutCangku;
import com.zy.dao.mapper.OutCangkuMapper;

@Service
public class OutCangkuService {
	@Resource
	private OutCangkuMapper ockm;

	public void setOckm(OutCangkuMapper ockm) {
		this.ockm = ockm;
	}
	
	/**
	 * 查找所有，(分页)
	 */
	public List<OutCangku> findAllByPage(int page){
		return ockm.findAllByPage(page);
	}
	/**
	 * 判断编码是否存在
	 */
	public OutCangku findById(String id){
		return ockm.findById(id);
	}
	
	public OutCangku findById1(String id){
		return ockm.findById1(id);
	}
	
	/**
	 * 搜索全部员工
	 */
	public List<Emp> findAllEmp(){
		return ockm.findAllEmp();
	}
	

	/**
	 * 搜索全部仓库
	 */
	public List<Cangku> findAllCangku(){
		return ockm.findAllCangku();
	}
	
	/**
	 * 根据选择的仓库查找仓库内材料
	 */
	public List<Cailiao> findcailiao(int page,int ckid){
		return ockm.findcailiao(page, ckid);
	}
	
	/**
	 * 搜索材料
	 */
	public List<Cailiao> findByType(CangkucunSearch cks){
		return ockm.findByType(cks);
	}
	
	/**
	 * 新增一个商品明细
	 */
	public boolean addNewCl(OutCailiao cl){
		return ockm.addNewCl(cl);
	}
	/**
	 * 删除一个商品明细
	 */
	public boolean deleteNewCl(int cl){
		return ockm.deleteNewCl(cl);
	}
	
	/**
	 * 根据出库流水号查找对应明细信息
	 */
	public List<OutCailiao> findByCkid(String cid){
		return ockm.findByCkid(cid);
	}
	/**
	 * 更新材料数量
	 */
	public boolean updateCangkucun(Cangkucun ck){
		return ockm.updateCangkucun(ck);
	}
	
	/**
	 * 新增一个出库信息
	 */
	public boolean addNewCk(OutCangku oc){
		return ockm.addNewCk(oc);
	}
	
	/**
	 * 根据流水号删除出库明细
	 */
	public boolean deleteByCkid(String ckid){
		return ockm.deleteByCkid(ckid);
	}
	
	/**
	 * 按搜索条件
	 */
	public List<OutCangku> selectAll(CangkucunSearch cs){
		return ockm.selectAll(cs);
	}
	
	public List<OutCangku> selectTime(CangkucunSearch cs){
		return ockm.selectTime(cs);
	}

	public List<OutCangku> selectType(CangkucunSearch cs){
		return ockm.selectType(cs);
	}
	
	/**
	 * 查找所有
	 */
	public int findAllOC(){
		return ockm.findAllOC();
	}
	/**
	 * 按搜索条件
	 */
	public int selectAllOC(CangkucunSearch cs){
		return ockm.selectAllOC(cs);
	}
	
	public int selectTimeOC(CangkucunSearch cs){
		return ockm.selectTimeOC(cs);
	}

	public int selectTypOC(CangkucunSearch cs){
		return ockm.selectTypOC(cs);
	}
	
	/**
	 * 根据选择的仓库查找仓库内材料
	 */
	public int findCL(int ckid){
		return ockm.findCL(ckid);
	}
	
	/**
	 * 搜索材料
	 */
	public int findCLT(CangkucunSearch cks){
		return ockm.findCLT(cks);
	}
	/**
	 * 厨房库存更新和判断
	 */
	public int searchKkucun(int mid){
		return ockm.searchKkucun(mid);
	}
	
	public boolean updateKkucun(int mid,float num){
		return ockm.updateKkucun(mid, num);
	}
	
	public boolean addKkucun(int mid,float num){
		return ockm.addKkucun(mid, num);
	}
	
	
}
