package com.bs.dabom.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bs.dabom.model.dto.Dailyfoodrecord_Dto;
import com.bs.dabom.model.dto.Food_Dto;
import com.bs.dabom.model.dto.Paging_Dto;

@Repository
public class FoodPaging_Dao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int countBoard() {
		int res = sqlSession.selectOne("food.countFood");
		return res;
	}

	public List<Food_Dto> selectFood(Paging_Dto dto) {
		
		List<Food_Dto> list = new ArrayList<Food_Dto>();
		list = sqlSession.selectList("food.selectFood",dto);
		
		return list;
	}

	public Food_Dto foodDetail(int food_no) {
		Food_Dto dto = new Food_Dto();
		dto = sqlSession.selectOne("food.foodDetail",food_no);
		return dto;
	}

	public int insertDailyFood(Dailyfoodrecord_Dto dto) {
		int res = 0;
		res = sqlSession.insert("food.insertDailyFoood", dto);
		return res;
	}

	public int selectDailyRecord(Dailyfoodrecord_Dto dto ) {
		int res = 0;
		res = sqlSession.selectOne("food.selectDailyRecord",dto);
		return res;
	}

	public List<Dailyfoodrecord_Dto> selectDailyFoodRecord(Dailyfoodrecord_Dto dailyFoodDto) {
		List<Dailyfoodrecord_Dto> list = new ArrayList<Dailyfoodrecord_Dto>();
		list = sqlSession.selectList("food.selectDailyFoodRecord", dailyFoodDto);
		return list;
	}
	
	

}
