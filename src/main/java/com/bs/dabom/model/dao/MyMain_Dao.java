package com.bs.dabom.model.dao;

import java.util.List;

import com.bs.dabom.model.dto.Board_Dto;
import com.bs.dabom.model.dto.Files_Dto;
import com.bs.dabom.model.dto.Reply_Dto;

public interface MyMain_Dao {
	
	String NAMESPACE = "mymain.";
	
	public List<Board_Dto> myList(int member_no);
	public List<Files_Dto> myUrl();
	public List<Reply_Dto> myReply();

}
