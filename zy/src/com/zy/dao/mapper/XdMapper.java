package com.zy.dao.mapper;

import org.apache.ibatis.annotations.Param;

import com.zy.bean.XdBean;
import com.zy.bean.ZList;

public interface XdMapper {
 public XdBean xdsearchAll();
 public XdBean xdsearchA(@Param(value="time1")String time1,@Param(value="time2")String time2);
  
}
