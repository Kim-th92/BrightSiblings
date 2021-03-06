package com.bs.dabom.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bs.dabom.model.dto.Friends_Dto;
import com.bs.dabom.model.dto.Member_Dto;

@Repository
public class Friends_DaoImpl implements Friends_Dao {
	
	@Autowired 
	private SqlSessionTemplate sqlSession;

	//친구가 된 목록들 
	@Override
	public List<Member_Dto> friendsList(int memberno) {
		List<Member_Dto> list =new ArrayList<Member_Dto>();
		
		try {
			list = sqlSession.selectList(NAMESPACE+"friendslist",memberno);
		} catch (Exception e) {
			System.out.println("error:friendslist");
			e.printStackTrace();
		}
		
		
		return list;
	}

	
	//친구 삭제 (차단)
	@Override
	public int deleteFriends(int memberno, int friendsno) {
		return 0;
	}
	
	//친구 검색
	@Override
	public List<Member_Dto> searchFriends(String name,int member_no) {
		List<Member_Dto> list =new ArrayList<Member_Dto>();
		Map<String,Object> map = new HashMap<String, Object>();
		
		map.put("keyword",name);
		map.put("member_no",member_no);
		try {
			list = sqlSession.selectList(NAMESPACE+"searchlist",map);
		} catch (Exception e) {
			System.out.println("error:searchFriends");
			e.printStackTrace();
		}
		return list;
	}

	//친구 요청된  목록 
	@Override
	public List<Member_Dto> friendRequestList(int member_no) {
			List<Member_Dto> list = new ArrayList<Member_Dto>();
			
			list = sqlSession.selectList(NAMESPACE+"friendsrequested",member_no);
			return list;
		
	}

	//친구요청 수락
	@Override
	public int friendAccepted(Friends_Dto dto) {
		int res = 0;
	    res  = sqlSession.update(NAMESPACE+"friendAccepted",dto);
		
		return res;
	}
	
	//친구 거절
	@Override
	public int friendDennied(Friends_Dto dto) {
		int res = 0;
	    res  = sqlSession.update(NAMESPACE+"friendDennied",dto);
		
		return res;
	}

	//내가 요청하고 수락을 기다림 
	@Override
	public List<Member_Dto> friendRequestingList(int member_no) {
		List<Member_Dto> list = new ArrayList<Member_Dto>();
		
		list = sqlSession.selectList(NAMESPACE+"friendsrequestting",member_no);
		return list;
	}

	//
	@Override
	public int friendRequest(Friends_Dto friends_dto) {
		int res = 0;
		res = sqlSession.insert(NAMESPACE+"friendAdd", friends_dto);
		
		return res;
	}


	@Override
	public int cancelRequest(Friends_Dto dto) {
		int res =0;
		res = sqlSession.delete(NAMESPACE+"cancelRequest", dto);
		return res;
	}
	
}
