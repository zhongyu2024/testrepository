package com.zy.dao.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.zy.bean.Emp;
import com.zy.bean.Foodtable;
import com.zy.bean.Hetable;
import com.zy.bean.Listinfo;
import com.zy.bean.Opentime;
import com.zy.bean.QueryQingDanFenye;
import com.zy.bean.Vip;
import com.zy.bean.ZList;

public interface QingDanMapper {
 public List<Opentime> findAllOpentime();
 public List<ZList> findAllQingDan();
 public List<ZList> findAlllistFenye(@Param("start") int start,@Param("end") int end);
 public Foodtable findtableByid(int id);
 public Emp findempByid(int id);
 public Vip findvipByid(int id);
 public List<ZList> findlistjuqery(QueryQingDanFenye qqdf);
 public List<ZList> getBylistFenye(QueryQingDanFenye qqdf);
 public ZList findlistByid(String id);
 public List<Listinfo> findListinfo(String id);
 public Hetable findAlljiezhang(String bid);
 public Hetable findhetableByBid(String bid);
}
