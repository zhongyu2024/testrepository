package com.zy.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.zy.bean.Foodtable;
import com.zy.bean.YudingFoodtable;
import com.zy.dao.mapper.FoodtableMapper;

@Service
public class FoodtableService {
	@Resource
	private FoodtableMapper foodtableMapper;
	public void setFoodtableMapper(FoodtableMapper foodtableMapper){
		this.foodtableMapper=foodtableMapper;
	}
	public List<YudingFoodtable> getFoodtable(){
		foodtableMapper.update();
		return foodtableMapper.findAllSeat();
	}
	public List<YudingFoodtable> getSeatBySize(int seatsize){
		return foodtableMapper.findBySeatsize(seatsize);
	}
	public List<YudingFoodtable> getMoreSeat(){
		return foodtableMapper.findMoreSeat();
	}
}
