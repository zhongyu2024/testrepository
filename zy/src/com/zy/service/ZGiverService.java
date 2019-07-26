package com.zy.service;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import com.zy.bean.Giver;
import com.zy.dao.mapper.ZGiverMapper;
 
@Service
public class ZGiverService {
 
@Resource
private ZGiverMapper zgivermapper;

public void setZgivermapper(ZGiverMapper zgivermapper) {
	this.zgivermapper = zgivermapper;
}
//供应商
public List<Giver> findAllgys(int no){
	return  zgivermapper.findAllgys(no); 
}

//按条件获取供应商的信息
public List<Giver> tiaojianGysInfoId(String zhi,int no){
	return  zgivermapper.tiaojianGysInfoId(zhi,no); 
}
public List<Giver> tiaojianGysInfoName(String zhiname,int no){
	return  zgivermapper.tiaojianGysInfoName(zhiname,no); 
}
//添加厂商
public boolean addgys(Giver giverdan){
	System.out.println("1");
	  return  zgivermapper.addgys(giverdan); 
}
//删除入库表中的厂商
public void delegysruku(int id){
    zgivermapper.delegys(id); 
}
//删除厂商
public void delegys(int id){
    zgivermapper.delegys(id); 
}
//修改厂商信息
public void xiugaigys(Giver giverxiu){
  zgivermapper.xiugaigys(giverxiu); 
}
public int findAllg(){
	return zgivermapper.findAllg();
	
}
public int tiaojianGysInfoIdcount(String id){
	return zgivermapper.tiaojianGysInfoIdcount(id);
	
}
public int tiaojianGysInfoNamecount(String zhiname,int no){
	return zgivermapper.tiaojianGysInfoNamecount(zhiname, no);
	
}
public List<Giver> gongyschong(@Param("name")String zhiname){
	return zgivermapper.gongyschong(zhiname); 
}
}
