package com.zy.service;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import com.zy.bean.CookBook;
import com.zy.bean.Cooktype;
import com.zy.bean.Food;
import com.zy.bean.Materials;
import com.zy.bean.Ycldetaisecond;
import com.zy.bean.ZCaipudetail;
import com.zy.bean.ZcaiLiaoDetail;
import com.zy.dao.mapper.ZCpMapper;

@Service
public class ZCpService {
	@Resource
	private ZCpMapper zcpmapper;

	public void setZcpmapper(ZCpMapper zcpmapper) {
		this.zcpmapper = zcpmapper;
	}
	public List<Cooktype> findcaipustyle(){
		return zcpmapper.findcaipustyle();
		
	}
	public List<Food> findfood(int no){
		return zcpmapper.findfood(no);
		
	}
	public List<ZCaipudetail> findAllcl(String name,int no){
		return zcpmapper.findAllcl(name,no);
	}
	public List<Food> findfoodc(@Param("caipin")String name,@Param("no")int no){
		return zcpmapper.findfoodc(name, no);
		
	}
	public List<ZCaipudetail> findAllcshi(@Param("no")int no){
		return zcpmapper.findAllcshi(no);
	}
	public List<ZcaiLiaoDetail> tiaojiancaipuInfoId(String cmname,String id){
		return zcpmapper.tiaojiancaipuInfoId(cmname,id);
		
	}
	public List<ZcaiLiaoDetail> tiaojiancaipuInfoName(String cmname,String zhiname,int no){
		return zcpmapper.tiaojiancaipuInfoName(cmname,zhiname, no);
		
	}
	public List<Ycldetaisecond> findAllycee(){
		return zcpmapper.findAllycee();
		
	}
	public boolean addcaipushicai(CookBook cookbook){
		return zcpmapper.addcaipushicai(cookbook);
		
	}
	public boolean updatepushi(String addname){
		return zcpmapper.updatepushi(addname);
		 
	}
	public boolean updatepushi2(String addname){
		return zcpmapper.updatepushi2(addname);
		
	}
	public boolean delecaipuycl(int id ){
		return zcpmapper.delecaipuycl(id);
		
	}
	public boolean xiugai(CookBook cookook){
		return zcpmapper.xiugai(cookook);
		
	}
	public List<Ycldetaisecond> dately(int id){
		return zcpmapper.dately(id);
		
	}
}
