package com.zy.dao.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.zy.bean.Cailiao;
import com.zy.bean.Cangku;
import com.zy.bean.Cangkucun;
import com.zy.bean.CangkucunSearch;
import com.zy.bean.Emp;
import com.zy.bean.OutCailiao;
import com.zy.bean.OutCangku;

public interface OutCangkuMapper {
	/**
	 * 查找所有，(分页)
	 */
	public List<OutCangku> findAllByPage(@Param(value="page")int page);
	
	/**
	 * 查找所有
	 */
	public int findAllOC();
	/**
	 * 按搜索条件
	 */
	public int selectAllOC(CangkucunSearch cs);
	
	public int selectTimeOC(CangkucunSearch cs);

	public int selectTypOC(CangkucunSearch cs);
	
	
	/**
	 * 更新厨房库存
	 */
	public int searchKkucun(int mid);
	
	public boolean updateKkucun(@Param(value="mid")int mid,@Param(value="num")float num);
	
	public boolean addKkucun(@Param(value="mid")int mid,@Param(value="num")float num);
	
	
	
	
	
	
	
	
	
	/**
	 * 判断编码是否存在
	 */
	public OutCangku findById(String id);
	
	public OutCangku findById1(String id);
	
	/**
	 * 搜索全部员工
	 */
	public List<Emp> findAllEmp();
	

	/**
	 * 搜索全部仓库
	 */
	public List<Cangku> findAllCangku();
	
	/**
	 * 根据选择的仓库查找仓库内材料
	 */
	public List<Cailiao> findcailiao(@Param(value="page")int page,@Param(value="ckid")int ckid);
	
	/**
	 * 搜索材料
	 */
	public List<Cailiao> findByType(CangkucunSearch cks);
	
	/**
	 * 新增一个商品明细
	 */
	public boolean addNewCl(OutCailiao cl);
	/**
	 * 删除一个商品明细
	 */
	public boolean deleteNewCl(int cl);
	
	/**
	 * 根据出库流水号查找对应明细信息
	 */
	public List<OutCailiao> findByCkid(String cid);
	
	/**
	 * 更新材料数量
	 */
	public boolean updateCangkucun(Cangkucun ck);
	
	/**
	 * 新增一个出库信息
	 */
	public boolean addNewCk(OutCangku oc);
	
	/**
	 * 根据流水号删除出库明细
	 */
	public boolean deleteByCkid(String ckid);
	
	/**
	 * 按搜索条件
	 */
	public List<OutCangku> selectAll(CangkucunSearch cs);
	
	public List<OutCangku> selectTime(CangkucunSearch cs);

	public List<OutCangku> selectType(CangkucunSearch cs);
	
	
	/**
	 * 根据选择的仓库查找仓库内材料
	 */
	public int findCL(@Param(value="ckid")int ckid);
	
	/**
	 * 搜索材料
	 */
	public int findCLT(CangkucunSearch cks);
	
}

