package com.bs.dabom.model.dao;

import java.util.List;

import com.bs.dabom.model.dto.Friends_Dto;
import com.bs.dabom.model.dto.Member_Dto;

public interface Friends_Dao {

	String NAMESPACE ="friends.";
	
	public List<Member_Dto> friendsList(int memberno);
	
	
	public int deleteFriends(int memberno,int friendsno);
	
	public List<Member_Dto> searchFriends(String name,int member_no);

	public List<Member_Dto> friendRequestList(int member_no);

	public int friendAccepted(Friends_Dto dto);

	public int friendDennied(Friends_Dto dto);

	public List<Member_Dto> friendRequestingList(int member_no);

	public int friendRequest(Friends_Dto friends_dto);


	public int cancelRequest(Friends_Dto dto);
}
