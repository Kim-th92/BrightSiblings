package com.bs.dabom.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bs.dabom.model.dto.Board_Dto;
import com.bs.dabom.model.dto.Files_Dto;
import com.bs.dabom.model.dto.Member_Dto;

@Repository
public class Board_DaoImpl implements Board_Dao {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<Board_Dto> selectList() {
		
		List<Board_Dto> result = new ArrayList<Board_Dto>();
		
		result = sqlSession.selectList(NAMESPACE + "selectList");
		
		return result;
	}

	@Override
	public Board_Dto selectOne(int board_no) {
		
		Board_Dto dto = sqlSession.selectOne(NAMESPACE + "select", board_no);
		
		return dto;
	}

	@Override
	public int insert(Board_Dto dto) {
		
		System.out.println(dto.getBoard_content());
		System.out.println(dto.getMember_no());
		
		int res = sqlSession.insert(NAMESPACE + "insert", dto);
		
		return res;
	}
	
	@Override
	public int insertFile(Files_Dto dto) {
		
		int res = sqlSession.insert(NAMESPACE + "insertFile", dto);
		
		return res;
	}
	
	@Override
	public int getVal() {

		int val = sqlSession.selectOne(NAMESPACE + "getVal");
		
		return val;
	}
	

	@Override
	public int update(Board_Dto dto) {
		
		int res = sqlSession.update(NAMESPACE + "update", dto);
		
		return res;
	}

	@Override
	public int delete(int board_no) {

		int res1 = sqlSession.delete(NAMESPACE + "deleteFile", board_no);
		int res2 = sqlSession.delete(NAMESPACE + "deleteBoard", board_no);
		return res2;
	}

	@Override
	public Member_Dto getNameProp(int member_no) {

		Member_Dto res = sqlSession.selectOne(NAMESPACE + "getNameProp", member_no);
		
		return res;
	}

	@Override
	public List<Files_Dto> getFileUrl(int board_no) {

		List<Files_Dto> res = sqlSession.selectList(NAMESPACE + "getFileUrl", board_no);
		
		return res;
	}

	// admin 관련
	@Override
	public List<Board_Dto> adminboardList(int end_no) {
		
		List<Board_Dto> adminboardlist = new ArrayList<Board_Dto>();
		
		adminboardlist = sqlSession.selectList(NAMESPACE + "adminboardlist", end_no);
		
		return adminboardlist;
	}

	

	



}
