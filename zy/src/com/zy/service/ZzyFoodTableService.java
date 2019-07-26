package com.zy.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.zy.bean.Emp;
import com.zy.bean.Foodtable;
import com.zy.bean.FoodtableQuery;
import com.zy.bean.Hetable;
import com.zy.bean.Listinfo;
import com.zy.bean.Opentime;
import com.zy.bean.Yuding;
import com.zy.bean.ZList;
import com.zy.dao.mapper.ZzyFoodtableMapper;

@Service
public class ZzyFoodTableService {
	@Resource
	private ZzyFoodtableMapper zftMapper;

	public void setZftMapper(ZzyFoodtableMapper zftMapper) {
		this.zftMapper = zftMapper;
	}
	public List<Foodtable> findAllTables()
	{
		System.out.println("进入findAllTables");
		return zftMapper.findAllTables();
	}
	public List<Foodtable> findByQuery(FoodtableQuery ftq)
	{
		System.out.println("进入动态查询");
		return zftMapper.findByQUery(ftq);
	}
	public ZList findZListByFT(int tableid)
	{
		
		return zftMapper.findZListByFT(tableid);
	}
	public Yuding findYudingByFT(int tableid)
	{
		
		return zftMapper.findYudingByFT(tableid);
	}
	public Opentime findNowTime()
	{
		
		return zftMapper.findNowTime();
	}
	public boolean updateFoodtableState(int tableid,int state)
	{

		return zftMapper.updateFoodtableState(tableid, state);
		
	}
	public Foodtable findFTByid(int id)
	{

		return zftMapper.findFTByid(id);
	}
	public List<Listinfo> findListinfo(String listid)
	{

		return zftMapper.findListinfo(listid);
	}
	public List<Emp> findAllFuWu()
	{
		return zftMapper.findAllFuWu();
	}
	public boolean addKaiTai(String id,int tableid,int eatnum,int waiterid,int cashierid)
	{
		System.out.println("新增开台单结果");
		return zftMapper.addKaiTai(id, tableid, eatnum, waiterid, cashierid);
	}
	public boolean qingtai(String qtdingdanid)
	{

		return zftMapper.qingtai(qtdingdanid);
	}
	public List<Foodtable> canhetaitable(int seatsize,int area)
	{
		return zftMapper.canhetaitable(seatsize, area);
	}
	public boolean addhetai(String fulistid,String zilistid)
	{
		return zftMapper.addhetai(fulistid, zilistid);
	}
	public boolean updatefoodtablehetai(int hetaistate,int tableid)
	{
		return zftMapper.updatefoodtablehetai(hetaistate, tableid);
	}
	public List<Hetable> findzilistByfu(String fulistid)
	{
		return zftMapper.findzilistidByfu(fulistid);
	}
	public ZList findZListByid(String id)
	{
		return zftMapper.findZListByid(id);
	}
	public boolean gukedaodian(int i)
	{
		return zftMapper.gukedaodian(i);
	}
	public boolean deletehetable(String aid)
	{
		return zftMapper.deletehetable(aid);
	}
	//根据子台id搜索未结账对象，以获取父is
	public Hetable findhetableByBid(String bid)
	{
		return zftMapper.findhetableByBid(bid);
	}
	//根据订单号查询所属对象
	public ZList findFTBylistid(String id)
	{
		return zftMapper.findFTBylistid(id);
	}
}
