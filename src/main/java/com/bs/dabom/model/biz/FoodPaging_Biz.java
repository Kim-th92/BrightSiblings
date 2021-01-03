package com.bs.dabom.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bs.dabom.model.dao.FoodPaging_Dao;
import com.bs.dabom.model.dto.Dailyfoodrecord_Dto;
import com.bs.dabom.model.dto.Food_Dto;
import com.bs.dabom.model.dto.Paging_Dto;

@Service
public class FoodPaging_Biz {

	@Autowired
	private FoodPaging_Dao dao;
	
	public int countBoard() {
		
		return dao.countBoard();
	}

	public List<Food_Dto> selectFood(Paging_Dto dto){
		return dao.selectFood(dto);
	}

	public Food_Dto foodDetail(int food_no) {
		return dao.foodDetail(food_no);
	}

	public int insertDailyFood(Dailyfoodrecord_Dto dto) {
		return dao.insertDailyFood(dto);
	}

	public int selectDailyRecord(Dailyfoodrecord_Dto dailyFoodDto) {
		return dao.selectDailyRecord(dailyFoodDto);
	}

	public List<Dailyfoodrecord_Dto> selectDailyFoodRecord(Dailyfoodrecord_Dto dailyFoodDto) {
		return dao.selectDailyFoodRecord(dailyFoodDto);
	}
}
