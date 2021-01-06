package com.bs.dabom.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bs.dabom.model.dto.Board_Dto;
import com.bs.dabom.model.dto.Files_Dto;
import com.bs.dabom.model.dto.Reply_Dto;

@Repository
public class MyMain_DaoImpl implements MyMain_Dao {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<Board_Dto> myList(int member_no) {
		List<Board_Dto> res = sqlSession.selectList(NAMESPACE + "myList", member_no);
		return res;
	}

	@Override
	public List<Files_Dto> myUrl() {
		List<Files_Dto> res = sqlSession.selectList(NAMESPACE + "myUrl");
		return res;
	}

	@Override
	public List<Reply_Dto> myReply() {
		List<Reply_Dto> res = sqlSession.selectList(NAMESPACE + "myReply");
		return res;
	}

}
