package com.bs.dabom.model.biz;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bs.dabom.model.dao.Food_Dao;
import com.bs.dabom.model.dao.Food_DaoImpl;
import com.bs.dabom.model.dto.Chatmsg_Dto;
import com.bs.dabom.model.dto.Food_Dto;

public class Food_BizImpl implements Food_Biz {

	private Food_Dao dao = new Food_DaoImpl();
	
	@Override
	public int insertFoodDb(List<Food_Dto> map) {
		
		return dao.insertFoodDb(map);
	}

	@Override
	public int insertfoodone(Food_Dto dto) {
		
		return dao.insertfoodone(dto);
	}
	
	public int insertChat(List<Chatmsg_Dto> list){
		return dao.insertChat(list);
	}

}
