package com.bs.dabom.model.biz;

import java.util.List;

import com.bs.dabom.model.dto.Member_Dto;

public interface Friends_Biz {

	public List<Member_Dto> friendsList(int memberno);
	
	public int addFriends(int memberno,int friendsno);
	
	public int deleteFriends(int memberno,int friendsno);
	
	public List<Member_Dto> searchFriends(String name);
	
	
	
	
}