package com.zy.dao.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.zy.bean.Yuding;
import com.zy.bean.YudingFoodtable;
import com.zy.bean.YudingQuery;

public interface YudingMapper {
	public List<YudingFoodtable> findByTime(@Param("beginTime") String date1,@Param("endTime") String date2,@Param("seatsize") int seatsize);
	/*≤È—Ø‘§∂©±Ì±‡∫≈*/
	public int findId();
	public List<Yuding> findByQuery(YudingQuery yq);
	public List<Yuding> findByName(@Param("info")String info,@Param("pageno")int pageno);
	public List<Yuding> findByTel(@Param("info")String info,@Param("pageno")int pageno);
	public void updateYuding(Yuding yuding);
	public String findGuoqi();
	public List<YudingFoodtable> findQuery(YudingQuery yq);
	public void insert(Yuding yuding);
	public int findNum();
}
