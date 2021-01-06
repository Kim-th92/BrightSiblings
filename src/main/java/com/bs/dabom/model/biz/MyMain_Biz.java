package com.bs.dabom.model.biz;

import java.util.List;

import com.bs.dabom.model.dto.Board_Dto;
import com.bs.dabom.model.dto.MyMain_Dto;

public interface MyMain_Biz {
	
	public List<MyMain_Dto> myList(int member_no);

}
