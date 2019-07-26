package com.zy.dao.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;



import com.zy.bean.CookBook;
import com.zy.bean.Emp;
import com.zy.bean.Food;
import com.zy.bean.Kitchenkucun;
import com.zy.bean.Listinfo;
import com.zy.bean.Mode;
import com.zy.bean.QueryTime;
import com.zy.bean.SendRecord;
import com.zy.bean.Vip;
import com.zy.bean.VipRecord;
import com.zy.bean.Waitnum;
import com.zy.bean.ZList;

public interface WaimaiMapper {

	/**
	 * 查询所有已审核的菜品
	 * @return
	 */
	List<Food> getAllFood();
	/**
	 * 根据状态查询牌号
	 * @param state
	 * @return
	 */
	List<Waitnum> getByState(int state);
	/**
	 * 获取所有的菜系
	 * @return
	 */
	List<Mode> getAllCookType();
	/**
	 * 获取所有的特殊要求
	 * @return
	 */
	List<Mode> getAllYaoqiu();
	/**
	 * 根据菜系获取菜品
	 * @param typeid
	 * @return
	 */
	List<Food> getByType(int typeid);
	/**
	 * 根据菜品编号获取该菜的材料对象集合
	 * @param foodid
	 * @return
	 */
	List<CookBook> getCaipuByFoodid(int foodid);
	/**
	 * 根据材料编号在厨房库存中查询该材料
	 * @param id
	 * @return
	 */
	Kitchenkucun getByMaterialsid(int id);
	/**
	 * //根据菜名获取菜品对象
	 * @param name
	 * @return
	 */
	Food getByName(String name);
	/**
	 * 更新厨房材料库存
	 * @param num
	 * @param id
	 * @return
	 */
	boolean updateKucun(@Param("num") double num,@Param("id")int id);
	/**
	 * 批量增加清单详细表
	 * @param lists
	 * @return
	 */
	int addlistinfo(List<Listinfo> lists);
	/**
	 * 添加一条清单信息
	 * @param zl
	 * @return
	 */
	boolean addList(ZList zl);
	/**
	 *  根据清单编号获取清单对象
	 * @param listid
	 * @return
	 */
	ZList getListByid(String listid);
	/**
	 * 根据手机号获取会员对象
	 * @param tel
	 * @return
	 */
	
	Vip getvip(String tel);
	/**
	 * 添加会员消费记录
	 * @param vr
	 * @return
	 */
	boolean addviprecord(VipRecord vr);
	/**
	 * 修改会员余额
	 * @param money
	 * @param id
	 * @return
	 */
	boolean editvip(@Param("money") double money,@Param("id") int id);
	/**
	 * 结账时修改订单
	 * @param zl
	 * @return
	 */
	boolean editlist(ZList zl);
	/**
	 * 修改快餐牌号状态
	 * @param tableid
	 * @param i
	 * @return
	 */
	boolean updatewaitnum(@Param("tableid")int tableid,@Param("state") int i);
	/**
	 * 根据状态和类型获取清单
	 * @param state
	 * @param type
	 * @return
	 */
	List<ZList> getlistBystateAndType(@Param("state") int state, @Param("type") int type);
	List<ZList> getlistBystateAndType1(@Param("state") int state, @Param("type") int type);
	List<ZList> getlistBystateAndType2(@Param("state") int state, @Param("type") int type);
	/**
	 * 根据状态和类型分页获取对应的清单
	 * @param state
	 * @param type
	 * @param pageNo
	 * @return
	 */
	List<ZList> getlistBystateAndTypeAndFenye(@Param("state") int state,@Param("type") int type,@Param("start") int start,@Param("end") int end);
	List<ZList> getlistBystateAndTypeAndFenye1(@Param("state") int state,@Param("type") int type,@Param("start") int start,@Param("end") int end);
	List<ZList> getlistBystateAndTypeAndFenye2(@Param("state") int state,@Param("type") int type,@Param("start") int start,@Param("end") int end);
	/**
	 * 根据清单号获取清单下的菜品信息
	 * @param listid
	 * @return
	 */
	List<Listinfo> gtebylistid(String listid);
	/**
	 * 取回界面作废订单
	 * @param listid
	 * @return
	 */
	boolean editlistzuofei(String listid);
	/**
	 * 按牌号搜索订单
	 * @param waitnum
	 * @return
	 */
	List<ZList> getBywaitnum(int waitnum);
	/**
	 * 根据时间段显示取回页面中的清单信息
	 * @param qm
	 * @return
	 */
	List<ZList> getBytimeAll(QueryTime qm);
	List<ZList> getBytimeFenye(QueryTime qm);
	List<Emp> getpaisongman();
	int getmannum(String name);
	Emp getByid(int sendman);
	boolean addSendRecord(SendRecord sr);
	boolean updatelistpaisong(ZList zl);
	void editsendrecord(String listid);
	
}
