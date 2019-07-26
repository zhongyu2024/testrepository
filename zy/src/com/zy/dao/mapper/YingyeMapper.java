package com.zy.dao.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.zy.bean.Caipinfenxi;
import com.zy.bean.Cooktype;
import com.zy.bean.Listinfo;
import com.zy.bean.ZList;

public interface YingyeMapper {
	
	public List<ZList> findPayDetail(@Param("txts3b2")String txts3b2,@Param("test17")String test17,@Param("test18")String test18);
	public List<Caipinfenxi> findByCaipin(@Param("s3b1Sel")int s3b1Sel,@Param("test11") String test11,@Param("test12") String test12);
	public List<ZList> findTableDet(@Param("s3b3Sel")int s3b3Sel,@Param("test19")String test19,@Param("test20")String test20);
	public List<Cooktype> getAll();
}
