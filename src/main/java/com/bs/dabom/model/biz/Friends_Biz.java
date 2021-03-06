package com.bs.dabom.model.biz;

import java.util.List;

import com.bs.dabom.model.dto.Friends_Dto;
import com.bs.dabom.model.dto.Member_Dto;

public interface Friends_Biz {

	public List<Member_Dto> friendsList(int memberno);
	
	public int deleteFriends(int memberno,int friendsno);
	
	public List<Member_Dto> searchFriends(String name,int member_no);

	public List<Member_Dto> friendsRequestList(int member_no);

	public List<Member_Dto> friendsRequestingList(int member_no);

	public int friendAccepted(int friend_no, int myno);
	
	public int friendDennied(int friend_no, int myno);

	public int friendRequest(Friends_Dto friends_dto);

	public int cancelRequest(Friends_Dto dto);
	
	
	
}
