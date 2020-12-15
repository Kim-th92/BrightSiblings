package com.bs.dabom.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bs.dabom.model.dao.Friends_Dao;
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
	public int addFriends(int memberno, int friendsno) {
		return dao.addFriends(memberno, friendsno);
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
	public List<Member_Dto> friendsRequest(int member_no) {
		return dao.friendRequest( member_no);
	}

	


}
