package com.bs.dabom.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bs.dabom.model.dto.AddInfo_Dto;

@Repository
public class AddInfo_DaoImpl implements AddInfo_Dao {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<AddInfo_Dto> selectList() {
		
		List<AddInfo_Dto> list = new ArrayList<AddInfo_Dto>();
		
		list = sqlSession.selectList(NAMESPACE + "selectList");
		return list;
	}

	@Override
	public AddInfo_Dto selectOne(int member_no) {
		
		AddInfo_Dto dto = sqlSession.selectOne(NAMESPACE+"selectOne", member_no);
		
		return dto;
	}

	@Override
	public int insert(AddInfo_Dto dto) {
		
		int res = sqlSession.insert(NAMESPACE+"insert",dto);
		return res;
	}

	@Override
	public int update(AddInfo_Dto dto) {
		int res = sqlSession.update(NAMESPACE+"update",dto);
		return res;
	}

	@Override
	public int delete(int member_no) {
		
		int res = sqlSession.delete(NAMESPACE+"delete",member_no);
		
		return res;
	}

}
