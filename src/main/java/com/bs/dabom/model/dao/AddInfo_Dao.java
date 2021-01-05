package com.bs.dabom.model.dao;

import java.util.List;

import com.bs.dabom.model.dto.AddInfo_Dto;

public interface AddInfo_Dao {
	
	String NAMESPACE ="addinfo.";
	
	public List<AddInfo_Dto> selectList();
	public AddInfo_Dto selectOne(int member_no);
	public int insert(AddInfo_Dto dto);
	public int update(AddInfo_Dto dto);
	public int delete(int member_no);

}
