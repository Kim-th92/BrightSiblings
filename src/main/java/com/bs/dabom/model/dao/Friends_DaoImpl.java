package com.bs.dabom.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bs.dabom.model.dto.Member_Dto;

@Repository
public class Friends_DaoImpl implements Friends_Dao {
	
	@Autowired 
	private SqlSessionTemplate sqlSession;

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

	@Override
	public int addFriends(int memberno, int friendsno) {
		return 0;
	}

	@Override
	public int deleteFriends(int memberno, int friendsno) {
		return 0;
	}

	@Override
	public List<Member_Dto> searchFriends(String name) {
		List<Member_Dto> list =new ArrayList<Member_Dto>();
		try {
			list = sqlSession.selectList(NAMESPACE+"searchlist",name);
		} catch (Exception e) {
			System.out.println("error:searchFriends");
			e.printStackTrace();
		}
		return list;
	}

}
