package com.bs.dabom.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
	
	

}
