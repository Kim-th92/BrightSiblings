package com.bs.dabom.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bs.dabom.model.dao.Friends_Dao;
import com.bs.dabom.model.dto.Friends_Dto;
import com.bs.dabom.model.dto.Member_Dto;


@Service
public class Friends_BizImpl implements Friends_Biz {

	@Autowired
	private Friends_Dao dao;
	
	@Override
	public List<Member_Dto> friendsList(int memberno) {
		return dao.friendsList(memberno);
	}


	@Override
	public int deleteFriends(int memberno, int friendsno) {
		return dao.deleteFriends(memberno, friendsno);
	}

	@Override
	public List<Member_Dto> searchFriends(String name,int member_no) {
		return dao.searchFriends(name,member_no);
	}

	@Override
	public List<Member_Dto> friendsRequestList(int member_no) {
		return dao.friendRequestList( member_no);
	}

	@Override
	public int friendAccepted(int friend_no, int myno) {
		Friends_Dto dto = new Friends_Dto();
		dto.setFriend_no(friend_no);
		dto.setMember_no(myno);
		
		return dao.friendAccepted(dto);
	}

	@Override
	public int friendDennied(int friend_no, int myno) {
		Friends_Dto dto = new Friends_Dto();
		dto.setFriend_no(friend_no);
		dto.setMember_no(myno);
		
		return dao.friendDennied(dto);
	}

	@Override
	public List<Member_Dto> friendsRequestingList(int member_no) {
		return dao.friendRequestingList(member_no);
	}

	@Override
	public int friendRequest(Friends_Dto friends_dto) {
		return dao.friendRequest(friends_dto);
	}


	@Override
	public int cancelRequest(Friends_Dto dto) {
		return dao.cancelRequest(dto);
	}

	


}
