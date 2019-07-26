package com.zy.dao.mapper;

import java.util.List;

import com.zy.bean.Foodtable;
import com.zy.bean.YudingFoodtable;

public interface FoodtableMapper {
	public List<YudingFoodtable> findAllSeat();
	public List<YudingFoodtable> findBySeatsize(int seatsize);
	public List<YudingFoodtable> findMoreSeat();
	public void update();
}
