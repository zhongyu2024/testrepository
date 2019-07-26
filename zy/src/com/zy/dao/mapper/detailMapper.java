package com.zy.dao.mapper;

import java.util.List;

import com.zy.bean.ZInfo;
import com.zy.bean.ZOutinfo;
import com.zy.bean.ZSearch;

public interface detailMapper {
  public List<ZInfo> ZinDetail();
  public List<ZOutinfo> ZouDtail();
  public  List<ZInfo> chosein(ZSearch zserch);
  public  List<ZOutinfo> choseout(ZSearch zserch);
  public  List<ZInfo> choseinn(ZSearch zserch);
  public  List<ZOutinfo> choseoutt(ZSearch zserch);
  
}
