package com.bs.dabom.model.dao;

import java.util.List;
import java.util.Map;

import com.bs.dabom.model.dto.Chatmsg_Dto;
import com.bs.dabom.model.dto.Food_Dto;

public interface Food_Dao {

	
public int insertFoodDb( List<Food_Dto>map) ;
	
	public int insertfoodone(Food_Dto dto);

	public int insertChat(List<Chatmsg_Dto> list);
}
