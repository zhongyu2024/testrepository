package com.zy.dao.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.zy.bean.Giver;
import com.zy.bean.Materials;
import com.zy.bean.Materialstype;
import com.zy.bean.Unit;
import com.zy.bean.ZcaiLiaoDetail;

public interface ZyclMapper {
	public List<ZcaiLiaoDetail> findAllcl(@Param("no")int no);
	public int findAllc();
	public boolean addYcl(ZcaiLiaoDetail zcailiaodetail);
	public boolean deleYcl(@Param("id")int id);
	public boolean xiugaiclInfo(ZcaiLiaoDetail zcailiaodetail);
	public List<ZcaiLiaoDetail> tiaojianyclInfoId(@Param("ycliao")String id,@Param("no")int no);
	public int tiaojianyclInfoIdCount(@Param("ycliao")String id);
	public int tiaojianyclInfoNameCount(@Param("nameycl")String zhiname);
	public List<ZcaiLiaoDetail> tiaojianyclInfoName(@Param("nameycl")String zhiname,@Param("no")int no);
	public List<Materialstype> findAllscstyle();
	public List<Unit> findAllscdanwei();
	public boolean adddangwei(String name);
	public boolean addleixing(String name);
	public List<Materials> chazhaochongmign(@Param("name")String name);
	public List<Materialstype> chazmetype(@Param("name")String name);
	public List<Unit> chazmdangwei(@Param("name")String name);
}
