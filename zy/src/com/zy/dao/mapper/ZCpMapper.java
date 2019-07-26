package com.zy.dao.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.zy.bean.CookBook;
import com.zy.bean.Cooktype;
import com.zy.bean.Food;
import com.zy.bean.Materials;
import com.zy.bean.Materialstype;
import com.zy.bean.Unit;
import com.zy.bean.Ycldetaisecond;
import com.zy.bean.ZCaipudetail;
import com.zy.bean.ZcaiLiaoDetail;

public interface ZCpMapper {
	public List<Cooktype> findcaipustyle();
	public List<Food> findfood(@Param("no")int no);
	public List<ZCaipudetail> findAllcshi(@Param("no")int no);
	public List<ZCaipudetail> findAllcl(@Param("name")String name,@Param("no")int no);
	public List<Food> findfoodc(@Param("caipin")String name,@Param("no")int no);
	public List<ZcaiLiaoDetail> tiaojiancaipuInfoId(@Param("caiming")String cmname,@Param("ycliao")String id);
	public List<ZcaiLiaoDetail> tiaojiancaipuInfoName(@Param("caiming")String cmname,@Param("mohul")String zhiname,@Param("no")int no);
	public List<Ycldetaisecond> findAllycee();
	public boolean addcaipushicai(CookBook cookbook);
	public boolean updatepushi(@Param("caipinmin")String addname);
	public boolean updatepushi2(@Param("caipinmin1")String addname);
	public boolean delecaipuycl(@Param("id")int id);
	public boolean xiugai(CookBook cookook);
	public List<Ycldetaisecond> dately(@Param("id")int id);
	
	
	
	public List<Materialstype> findAllscstyle();
	public List<Unit> findAllscdanwei();
	public boolean adddangwei(String name);
	public boolean addleixing(String name);
	 
}
