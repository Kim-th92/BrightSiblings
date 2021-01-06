package com.bs.dabom.model.dao;

import java.util.List;

import com.bs.dabom.model.dto.Calendar_Dto;
import com.bs.dabom.model.dto.MyPage_Dto;

public interface MyPage_Dao {
	
	String NAMESPACE = "exercise.";
	
	public int distanceInsert(MyPage_Dto dto);
	public List<MyPage_Dto> showList(int member_no);
	public List<MyPage_Dto> total(int member_no);
	public float showTargetKcal(Calendar_Dto dto);
	public List<Calendar_Dto> showTotalDFR(Calendar_Dto dto);
	public List<Calendar_Dto> showTotalDER(Calendar_Dto dto);

}
