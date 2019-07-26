package com.zy.dao.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.zy.bean.Vip;
import com.zy.bean.VipQuery;
import com.zy.bean.VipRecord;
import com.zy.bean.Vlevel;

public interface VipMapper {
	public List<Vip> findAllVip();
	public void addVip(Vip vip);
	public int findLast();
	public Vip findById(int id);
	public Vip findByTel(String Tel);
	public void addRecord(VipRecord vr);//充值表添加记录
	public void updateMoney(@Param("id")int id,@Param("money")double money);//充值后加钱
	public VipRecord findRecord(int id);
	public void stopVip(int id);
	public void delVip(int id);
	public void delVipRecord(int id);
	public void modiVip(Vip vip);
	public List<Vip> findByQuery(VipQuery vq);
	public Vip findVip(int id);
	public int findPagenum();
	public Vlevel findlevelnameByid(int id);
	public double findPayMoney(int id);
	public List<VipRecord> findPayMoneyId(int vipid);
}
