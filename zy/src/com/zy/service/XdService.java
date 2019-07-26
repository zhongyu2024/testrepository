package com.zy.service;

import javax.annotation.Resource;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import com.zy.bean.XdBean;
import com.zy.bean.ZList;
import com.zy.dao.mapper.XdMapper;

@Service
public class XdService {
	@Resource
  private XdMapper xdmapper;

public void setXdmapper(XdMapper xdmapper) {
	this.xdmapper = xdmapper;
}
public XdBean xdsearchAll(){
	return xdmapper.xdsearchAll();
	
}
public XdBean xdsearchA(String time1,String time2)
{
	return xdmapper.xdsearchA(time1,time2);
	}
	
	
	
}
