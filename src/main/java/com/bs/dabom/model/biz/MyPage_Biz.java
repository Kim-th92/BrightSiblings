package com.bs.dabom.model.biz;

import java.util.List;

import com.bs.dabom.model.dto.MyPage_Dto;

public interface MyPage_Biz {

	public int distanceInsert(MyPage_Dto dto);
	public List<MyPage_Dto> showList(int member_no);
	public List<MyPage_Dto> total(int member_no);

}
