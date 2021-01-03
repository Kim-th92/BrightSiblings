package com.bs.dabom.model.biz;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bs.dabom.model.dao.MyPage_Dao;
import com.bs.dabom.model.dto.MyPage_Dto;

@Service
public class MyPage_BizImpl implements MyPage_Biz {
	
	@Autowired
	private MyPage_Dao dao;
	
	@Override
	public int distanceInsert(MyPage_Dto dto) {
		System.out.println("bizimpl");
		
		return dao.distanceInsert(dto);
		
	}

}


