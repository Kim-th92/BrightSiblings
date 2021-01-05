package com.bs.dabom.model.biz;

import java.util.List;

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
		return dao.distanceInsert(dto);
		
	}
	
	@Override
	public List<MyPage_Dto> showList(int member_no) {
		return dao.showList(member_no);
	}
	
	@Override
	public List<MyPage_Dto> total(int member_no) {
		return dao.total(member_no);
	}
	

}


