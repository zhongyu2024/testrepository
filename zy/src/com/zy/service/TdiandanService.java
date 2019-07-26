package com.zy.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.zy.bean.CookBook;
import com.zy.bean.Food;
import com.zy.bean.Foodtable;
import com.zy.bean.Hetable;
import com.zy.bean.Kitchenkucun;
import com.zy.bean.Listinfo;
import com.zy.bean.ListinfoModel;
import com.zy.bean.Mode;
import com.zy.bean.QueryTime;
import com.zy.bean.Vip;
import com.zy.bean.VipRecord;
import com.zy.bean.Waitnum;
import com.zy.bean.ZList;
import com.zy.dao.mapper.TdiandanMapper;

/**
 * 快餐
 * @author Administrator
 *
 */
@Service
public class TdiandanService {

	@Resource
	private TdiandanMapper tm;
	public void setTm(TdiandanMapper tm) {
		this.tm = tm;
	}
	/**
	 * 查询所有的菜品
	 * @return
	 */
	public List<Food> getAllFood(){		
		return tm.getAllFood();
	}
	/**
	 * 根据菜系获取菜品
	 * @param typeid
	 * @return
	 */
	public List<Food> getByType(int typeid){
		return tm.getByType(typeid);
	}
	/**
	 * 根据状态查询牌号
	 */
	public List<Waitnum> getByState(int state){
		return tm.getByState(state);
	}
	/**
	 * 获取所有菜系
	 * @return
	 */
	public List<Mode> getAllCookType(){
		return tm.getAllCookType();
	}
	/**
	 * 获取所有要求
	 * @return
	 */
	public List<Mode> getAllYaoqiu(){
		return tm.getAllYaoqiu();
	}
	/**
	 * 根据菜品编号获取该菜的材料对象集合
	 * @param foodid
	 * @return
	 */
	public List<CookBook> getCaipuByFoodid(int foodid){
		return tm.getCaipuByFoodid(foodid);
	}
	/**
	 * 根据材料编号在厨房库存中查询该材料
	 * @param id
	 * @return
	 */
	public Kitchenkucun getByMaterialsid(int id){
		return tm.getByMaterialsid(id);
	}
	/**
	 * 根据菜名获取菜品对象
	 * @param name
	 * @return
	 */
	public Food getByName(String name){
		return tm.getByName(name);
	}
	/**
	 * 修改厨房库存量
	 * @param num
	 * @param id
	 * @return
	 */
	public boolean updateKucun(double num,int id){
		return tm.updateKucun(num, id);
	}
	/**
	 * 添加一条清单信息
	 * @param zl
	 * @return
	 */
	/*public boolean addList(ZList zl){
		return tm.addList(zl);
	}*/
	/**
	 * 批量添加订单详细信息
	 * @param lists
	 * @return
	 */
	/*public int addlistinfo(List<Listinfo> lists){
		return tm.addlistinfo(lists);
	}*/
	/**
	 * 
	 * 根据清单编号获取清单对象
	 * @param listid
	 * @return
	 */
	public ZList getListByid(String listid){
		return tm.getListByid(listid);
	}
	/**
	 * 根据手机号获取会员对象
	 * @param tel
	 * @return
	 */
	public Vip getvip(String tel){
		return tm.getvip(tel);
	}
	/**
	 * 添加会员消费记录
	 * @param vr
	 * @return
	 */
	public boolean addviprecord(VipRecord vr){
		return tm.addviprecord(vr);
	}
	/**
	 * 修改会员余额
	 * @param id
	 * @param money
	 * @return
	 */
	public boolean editvip(int id,double money){
		return tm.editvip(money,id);
	}
	/**
	 * 结账时修改订单
	 * @param zl
	 * @return
	 */
	public boolean editlist(ZList zl) {
		// TODO Auto-generated method stub
		return tm.editlist(zl);
	}
	/**
	 * 修改快餐牌号状态
	 * @param tableid
	 * @param i
	 */
	/*public boolean updatewaitnum(int tableid, int i) {
		// TODO Auto-generated method stub
		return tm.updatewaitnum(tableid,i);
	}*/
	/**
	 * 保存订单信息
	 * @param zl
	 * @param lists
	 */
	public void subjiezhang(List<Listinfo> lists) {
		// TODO Auto-generated method stub
		/*tm.addList(zl);*/
		tm.addlistinfo(lists);		
		/*tm.updatewaitnum(zl.getTableid(),i);*/
		
	}
	/**
	 * 会员支付
	 * @param vr
	 * @param zl 
	 */
	public void subvippay(VipRecord vr, ZList zl) {
		// TODO Auto-generated method stub
		tm.addviprecord(vr);
		tm.editvip(vr.getMoney(),vr.getVipid());
		tm.editlist(zl);
		tm.edittablestate(zl.getTableid());
	}
	/**
	 * 普通支付
	 * @param zl
	 */
	public void subputongpay(ZList zl) {
		// TODO Auto-generated method stub
		tm.editlist(zl);
		tm.edittablestate(zl.getTableid());
	}
	/**
	 * 根据状态和类型获取对应的所有清单
	 * @param i
	 * @param j
	 * @return
	 */
	public List<ZList> getlistBystateAndType(int state, int type) {
		// TODO Auto-generated method stub
		return tm.getlistBystateAndType(state,type);
	}
	/**
	 * 根据状态和类型分页获取对应的清单
	 * @param state
	 * @param type
	 * @param pageNo
	 * @return
	 */
	public List<ZList> getlistBystateAndTypeAndFenye(int state, int type,int start,int end){
		return tm.getlistBystateAndTypeAndFenye(state,type,start,end);
	}
	/**
	 * 根据清单号获取清单下的菜品信息
	 * @param listid
	 * @return
	 */
	public List<Listinfo> getbylistid(String listid){
		return tm.gtebylistid(listid);
	}
	/**
	 * 取回界面作废订单
	 * @param listid
	 * @return
	 */
	public void edilistzuofei(String listid,int waitnum) {
		// TODO Auto-generated method stub
		tm.editlistzuofei(listid);
		tm.updatewaitnum(waitnum, 0);
	}
	/**
	 * 按牌号搜索订单
	 * @param waitnum
	 * @return
	 */
	public List<ZList> getBywaitnum(int waitnum) {
		// TODO Auto-generated method stub
		
		return tm.getBywaitnum(waitnum);
	}
	/**
	 * 根据时间段显示取回页面中的清单信息
	 * @param qm
	 * @return
	 */
	public List<ZList> getBytimeAll(QueryTime qm) {
		// TODO Auto-generated method stub
		return tm.getBytimeAll(qm);
	}
	public List<ZList> getBytimeFenye(QueryTime qm) {
		// TODO Auto-generated method stub
		return tm.getBytimeFenye(qm);
	}
	public List<Mode> getALLliyou() {
		// TODO Auto-generated method stub
		return tm.getALLliyou();
	}
	public Foodtable getFtByid(int tableid) {
		// TODO Auto-generated method stub
		return tm.Foodtable(tableid);
	}
	/**
	 * 堂食点单界面下单
	 * @param zl
	 * @param list
	 */
	public void subTjiezhang(ZList zl, List<Listinfo> list) {
		// TODO Auto-generated method stub
		tm.editlistT(zl);
		tm.addlistinfo(list);
	}
	public void editlistinfo(int id, String liyou) {
		// TODO Auto-generated method stub
		tm.editlistinfo(id,liyou);
	}
	public Listinfo getlistinfoByid(int id) {
		// TODO Auto-generated method stub
		return tm.getlistinfoByid(id);
	}
	public void editlistxiaofei(Listinfo listinfo) {
		// TODO Auto-generated method stub
		tm.editlistxiaofei(listinfo);
	}
	public List<Hetable> gethtByAid(String id) {
		// TODO Auto-generated method stub
		return tm.gethtByAid(id);
	}
	public List<Hetable> gethtByBid(String id) {
		// TODO Auto-generated method stub
		return tm.gethtByBid(id);
	}
	public void edithetable(String id) {
		// TODO Auto-generated method stub
		tm.edithetable(id);
	}
	public void edittablestate(int tableid) {
		// TODO Auto-generated method stub
		tm.edittablestate(tableid);
	}
	
	
}
