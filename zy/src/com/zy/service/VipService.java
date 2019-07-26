package com.zy.service;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.zy.bean.Vip;
import com.zy.bean.VipQuery;
import com.zy.bean.VipRecord;
import com.zy.bean.Vlevel;
import com.zy.dao.mapper.VipMapper;

@Service
public class VipService {
	@Resource
	private VipMapper vipMapper;
	public void setVipmapper(VipMapper vipmapper) {
		this.vipMapper = vipmapper;
	}
	public List<Vip> findAllVip(){
		System.out.println("½øÈëservice");
		return vipMapper.findAllVip();
	}
	
	public Vip findVip(int id){
		return vipMapper.findVip(id);
	}
	
	public List<Vip> findVips(VipQuery vq){
		return vipMapper.findByQuery(vq);
	}
	public Vip findById(int id){
		return vipMapper.findById(id);
	}
	public Vip findByTel(String tel){
		return vipMapper.findByTel(tel);
	}
	
	public void addVip(Vip vip){
		vipMapper.addVip(vip);
		
	}
	public int findLast() {
		int id=vipMapper.findLast();
		return id;
	}
	
	public void chongzhi(VipRecord vr){
		vipMapper.updateMoney(vr.getVipid(), vr.getMoney());
		vipMapper.addRecord(vr);
	}
	public void stopVip(int id){
		vipMapper.stopVip(id);
	}
	public void delVip(int id){
		
		vipMapper.delVipRecord(id);
		vipMapper.delVip(id);
	}
	public void modiVip(Vip vip) {
		// TODO Auto-generated method stub
		vipMapper.modiVip(vip);
	}
/*	public List<Vip> findByQuery(VipQuery vq){
		return vipMapper.findByQuery(vq);
	}*/
	
	public int findPagenum(){
		return vipMapper.findPagenum();
	}
	public Vlevel findlevelnameByid(int id)
	{
		return vipMapper.findlevelnameByid(id);
	}
	public double findPayMoney(int id){
		
		return vipMapper.findPayMoney(id);
	}
	public List<VipRecord> findPayMoneyId(int vipid)
	{
		return vipMapper.findPayMoneyId(vipid);
	}
}
