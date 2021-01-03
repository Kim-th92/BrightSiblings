package com.bs.dabom.model.dao;

import com.bs.dabom.model.dto.MyPage_Dto;

public interface MyPage_Dao {
	
	String NAMESPACE = "exercise.";
	
	public int distanceInsert(MyPage_Dto dto);

}
