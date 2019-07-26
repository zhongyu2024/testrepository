package com.zy.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

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
import com.zy.dao.mapper.WaimaiMapper;

/**
 * 外卖
 * @author Administrator
 *
 */
@Service
public class WaimaiService {

	@Resource
	private WaimaiMapper wm;
	public void setWm(WaimaiMapper wm) {
		this.wm = wm;
	}
	/**
	 * 查询所有的菜品
	 * @return
	 */
	public List<Food> getAllFood(){		
		return wm.getAllFood();
	}
	/**
	 * 根据菜系获取菜品
	 * @param typeid
	 * @return
	 */
	public List<Food> getByType(int typeid){
		return wm.getByType(typeid);
	}
	/**
	 * 根据状态查询牌号
	 */
	public List<Waitnum> getByState(int state){
		return wm.getByState(state);
	}
	/**
	 * 获取所有菜系
	 * @return
	 */
	public List<Mode> getAllCookType(){
		return wm.getAllCookType();
	}
	/**
	 * 获取所有要求
	 * @return
	 */
	public List<Mode> getAllYaoqiu(){
		return wm.getAllYaoqiu();
	}
	/**
	 * 根据菜品编号获取该菜的材料对象集合
	 * @param foodid
	 * @return
	 */
	public List<CookBook> getCaipuByFoodid(int foodid){
		return wm.getCaipuByFoodid(foodid);
	}
	/**
	 * 根据材料编号在厨房库存中查询该材料
	 * @param id
	 * @return
	 */
	public Kitchenkucun getByMaterialsid(int id){
		return wm.getByMaterialsid(id);
	}
	/**
	 * 根据菜名获取菜品对象
	 * @param name
	 * @return
	 */
	public Food getByName(String name){
		return wm.getByName(name);
	}
	/**
	 * 修改厨房库存量
	 * @param num
	 * @param id
	 * @return
	 */
	public boolean updateKucun(double num,int id){
		return wm.updateKucun(num, id);
	}
	/**
	 * 添加一条清单信息
	 * @param zl
	 * @return
	 *//*
	public boolean addList(ZList zl){
		return km.addList(zl);
	}
	*//**
	 * 批量添加订单详细信息
	 * @param lists
	 * @return
	 *//*
	public int addlistinfo(List<Listinfo> lists){
		return km.addlistinfo(lists);
	}
	*//**
	 * 
	 * 根据清单编号获取清单对象
	 * @param listid
	 * @return
	 */
	public ZList getListByid(String listid){
		return wm.getListByid(listid);
	}
	/**
	 * 根据手机号获取会员对象
	 * @param tel
	 * @return
	 *//*
	public Vip getvip(String tel){
		return km.getvip(tel);
	}
	*//**
	 * 添加会员消费记录
	 * @param vr
	 * @return
	 *//*
	public boolean addviprecord(VipRecord vr){
		return km.addviprecord(vr);
	}
	*//**
	 * 修改会员余额
	 * @param id
	 * @param money
	 * @return
	 *//*
	public boolean editvip(int id,double money){
		return km.editvip(money,id);
	}
	*//**
	 * 结账时修改订单
	 * @param zl
	 * @return
	 *//*
	public boolean editlist(ZList zl) {
		// TODO Auto-generated method stub
		return km.editlist(zl);
	}
	*//**
	 * 修改快餐牌号状态
	 * @param tableid
	 * @param i
	 *//*
	public boolean updatewaitnum(int tableid, int i) {
		// TODO Auto-generated method stub
		return km.updatewaitnum(tableid,i);
	}
	*//**
	 * 保存订单信息
	 * @param zl
	 * @param lists
	 */
	public void subjiezhang(ZList zl, List<Listinfo> lists) {
		// TODO Auto-generated method stub
		wm.addList(zl);
		wm.addlistinfo(lists);		
		/*wm.updatewaitnum(zl.getTableid(),i);*/
		
	}
	/**
	 * 会员支付
	 * @param vr
	 * @param zl 
	 */
	public void subvippay(VipRecord vr, ZList zl) {
		// TODO Auto-generated method stub
		wm.addviprecord(vr);
		wm.editvip(vr.getMoney(),vr.getVipid());
		wm.editlist(zl);
		wm.editsendrecord(zl.getId());
	}
	/**
	 * 普通支付
	 * @param zl
	 */
	public void subputongpay(ZList zl) {
		// TODO Auto-generated method stub
		wm.editlist(zl);
		wm.editsendrecord(zl.getId());
	}
	/**
	 * 根据状态和类型获取对应的所有清单
	 * @param i
	 * @param j
	 * @return
	 */
	public List<ZList> getlistBystateAndType(int state, int type) {
		// TODO Auto-generated method stub
		return wm.getlistBystateAndType(state,type);
	}
	public List<ZList> getlistBystateAndType1(int state, int type) {
		// TODO Auto-generated method stub
		return wm.getlistBystateAndType1(state,type);
	}
	public List<ZList> getlistBystateAndType2(int state, int type) {
		// TODO Auto-generated method stub
		return wm.getlistBystateAndType2(state,type);
	}
	/**
	 * 根据状态和类型分页获取对应的清单
	 * @param state
	 * @param type
	 * @param pageNo
	 * @return
	 */
	public List<ZList> getlistBystateAndTypeAndFenye(int state, int type,int start,int end){
		return wm.getlistBystateAndTypeAndFenye(state,type,start,end);
	}
	public List<ZList> getlistBystateAndTypeAndFenye1(int state, int type,int start,int end){
		return wm.getlistBystateAndTypeAndFenye1(state,type,start,end);
	}
	public List<ZList> getlistBystateAndTypeAndFenye2(int state, int type,int start,int end){
		return wm.getlistBystateAndTypeAndFenye2(state,type,start,end);
	}
	/**
	 * 根据清单号获取清单下的菜品信息
	 * @param listid
	 * @return
	 */
	public List<Listinfo> getbylistid(String listid){
		return wm.gtebylistid(listid);
	}
	/**
	 * 取回界面作废订单
	 * @param listid
	 * @return
	 */
	public void edilistzuofei(String listid) {
		// TODO Auto-generated method stub
		wm.editlistzuofei(listid);
		
		
	}
	/**
	 * 按牌号搜索订单
	 * @param waitnum
	 * @return
	 *//*
	public List<ZList> getBywaitnum(int waitnum) {
		// TODO Auto-generated method stub
		
		return km.getBywaitnum(waitnum);
	}
	*//**
	 * 根据时间段显示取回页面中的清单信息
	 * @param qm
	 * @return
	 */
	public List<ZList> getBytimeAll(QueryTime qm) {
		// TODO Auto-generated method stub
		return wm.getBytimeAll(qm);
	}
	public List<ZList> getBytimeFenye(QueryTime qm) {
		// TODO Auto-generated method stub
		return wm.getBytimeFenye(qm);
	}
	public List<Emp> getpaisongman() {
		// TODO Auto-generated method stub
		return wm.getpaisongman();
	}
	public int getmannum(String name) {
		// TODO Auto-generated method stub
		return wm.getmannum(name);
	}
	public Emp getByid(int sendman) {
		// TODO Auto-generated method stub
		return wm.getByid(sendman);
	}
	public boolean addSenRecord(SendRecord sr) {
		// TODO Auto-generated method stub
		return wm.addSendRecord(sr);
	}
	public boolean updatelistpaisong(ZList zl) {
		// TODO Auto-generated method stub
		return wm.updatelistpaisong(zl);
	}
	
	
	
}
