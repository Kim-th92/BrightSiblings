package com.bs.dabom.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bs.dabom.model.dto.Board_Dto;

@Repository
public class Board_DaoImpl implements Board_Dao {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<Board_Dto> selectList(Board_Dto dto) {
		return null;
	}

	@Override
	public Board_Dto selectOne(int board_no) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insert(Board_Dto dto) {
		
		System.out.println(dto.getBoard_content());
		System.out.println(dto.getMember_no());
		
		int res = sqlSession.insert(NAMESPACE + "insert", dto);
		
		return res;
	}

	@Override
	public int update(Board_Dto dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(int board_no) {
		// TODO Auto-generated method stub
		return 0;
	}

}
