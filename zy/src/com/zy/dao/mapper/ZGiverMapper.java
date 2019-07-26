package com.zy.dao.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.zy.bean.Giver;

public interface ZGiverMapper {
 public List<Giver> findAllgys(@Param("no")int no);
 public List<Giver> gongyschong(@Param("name")String zhiname);
 public List<Giver> tiaojianGysInfoId(@Param("idgy")String id,@Param("no")int no);
 public List<Giver> tiaojianGysInfoName(@Param("namegys")String zhiname,@Param("no")int no);
 public boolean addgys(Giver giverdan);
 public void delegysruku(@Param("id")int id);
 public void delegys(@Param("id")int id);
 public void xiugaigys(Giver giverdan);
 public int findAllg();
 public int tiaojianGysInfoIdcount(@Param("idgy")String id);
 public int tiaojianGysInfoNamecount(@Param("namegys")String zhiname,@Param("no")int no);
}
