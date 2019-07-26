package com.zy.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.zy.bean.ZInfo;
import com.zy.bean.ZOutinfo;
import com.zy.bean.ZSearch;
import com.zy.dao.mapper.detailMapper;

@Service
public class detailService {
	@Resource
	 private detailMapper detailMapper;

	public void setDetailMapper(detailMapper detailMapper) {
		this.detailMapper = detailMapper;
	}
	//查询所有入库信息
	 public List<ZInfo> ZinDetail(){
		return detailMapper.ZinDetail();
		 
	 }
	//查询所有出库信息
	  public List<ZOutinfo> ZouDtail(){
		return detailMapper.ZouDtail();
		  
	  }
	  public  List<ZInfo> chosein(ZSearch zserch){
		return detailMapper.chosein(zserch);
		  
	  }
	  public  List<ZOutinfo> choseout(ZSearch zserch){
		return detailMapper.choseout(zserch);
		  
	  }
	  public  List<ZInfo> choseinn(ZSearch zserch)
	  {
		return detailMapper.choseinn(zserch);
		  
	  }
	  public  List<ZOutinfo> choseoutt(ZSearch zserch){
		return detailMapper.choseoutt(zserch);
		  
	  }
	  
	
	
}
