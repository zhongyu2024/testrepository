package com.zy.dao.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.zy.bean.Emp;
import com.zy.bean.Foodtable;
import com.zy.bean.FoodtableQuery;
import com.zy.bean.Hetable;
import com.zy.bean.Listinfo;
import com.zy.bean.Opentime;
import com.zy.bean.Yuding;
import com.zy.bean.ZList;

public interface ZzyFoodtableMapper {
	public List<Foodtable> findAllTables();
	public List<Foodtable> findByQUery(FoodtableQuery ftq);
	public ZList findZListByFT(int tableid);
	public Yuding findYudingByFT(int tableid);
	public Opentime findNowTime();
	public boolean updateFoodtableState(@Param("tableid")int tableid,@Param("state")int state);
	public Foodtable findFTByid(int id);
	public List<Listinfo> findListinfo(String listid);
	public List<Emp> findAllFuWu();
	public boolean addKaiTai(@Param("id") String id ,@Param("tableid")int tableid,@Param("eatnum")int eatnum,@Param("waiterid")int waiterid,@Param("cashierid")int cashierid);
	public boolean qingtai(String qtdingdanid);
	public List<Foodtable> canhetaitable(@Param("seatsize") int seatsize,@Param("area") int area);
	public boolean addhetai(@Param("fulistid") String fulistid,@Param("zilistid") String zilistid);
	public boolean updatefoodtablehetai(@Param("hetaistate") int hetaistate,@Param("tableid") int tableid);
	public List<Hetable> findzilistidByfu(String fulistid);
	public ZList findZListByid(String id);
	public boolean gukedaodian(int i);
	public boolean deletehetable(String aid);
	public Hetable findhetableByBid(String bid);
	public ZList findFTBylistid(String id);
}
