package com.zy.service;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import com.zy.bean.Materials;
import com.zy.bean.Materialstype;
import com.zy.bean.Unit;
import com.zy.bean.ZcaiLiaoDetail;
import com.zy.dao.mapper.ZyclMapper;

@Service
public class ZyclService {
	@Resource
	private ZyclMapper zyclmapper;

	public void setZyclmapper(ZyclMapper zyclmapper) {
		this.zyclmapper = zyclmapper;
	}
	public List<ZcaiLiaoDetail> findAllcl(int no){
		return zyclmapper.findAllcl(no);
	}
	public boolean addYcl(ZcaiLiaoDetail zcailiaodetail){
		return zyclmapper.addYcl(zcailiaodetail);	
	}
	public boolean deleYcl(@Param("id")int id){
		return zyclmapper.deleYcl(id);
	}
	public boolean xiugaiclInfo(ZcaiLiaoDetail zcailiaodetail){
		return zyclmapper.xiugaiclInfo(zcailiaodetail);
	}
	public List<ZcaiLiaoDetail> tiaojianyclInfoId(String id,int no){
		//System.out.println(1);
		return zyclmapper.tiaojianyclInfoId(id,no); 	
	}
	public List<ZcaiLiaoDetail> tiaojianyclInfoName(String zhiname,int no){
		//System.out.println(1);
		return zyclmapper.tiaojianyclInfoName(zhiname, no);
		
	}
	public List<Materialstype> findAllscstyle(){
		return zyclmapper.findAllscstyle();
	}
	public List<Unit> findAllscdanwei(){
		return zyclmapper.findAllscdanwei();
		}
	public boolean addleixing(String name){
		 
		return zyclmapper.addleixing(name);
		
	}
	public boolean adddangwei(String name){
		return zyclmapper.adddangwei(name);
		
	}
	public int findAllc(){
		return zyclmapper.findAllc(); 	
	}
	public int tiaojianyclInfoIdCount(String id){
		return zyclmapper.tiaojianyclInfoIdCount(id);
		
	}
	public int tiaojianyclInfoNameCount(String zhiname){
		return zyclmapper.tiaojianyclInfoNameCount(zhiname);
		
	}
	public List<Materials> chazhaochongmign(String name){
		return zyclmapper.chazhaochongmign(name);
		
	}
	public List<Materialstype> chazmetype(String name){
		return zyclmapper.chazmetype(name);
		
	}
	public List<Unit> chazmdangwei(@Param("name")String name){
		return zyclmapper.chazmdangwei(name);
		
	}
}
