package com.bs.dabom.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bs.dabom.model.dao.Board_Dao;
import com.bs.dabom.model.dao.Board_DaoImpl;
import com.bs.dabom.model.dto.Board_Dto;
import com.bs.dabom.model.dto.Files_Dto;
import com.bs.dabom.model.dto.Member_Dto;

@Service
public class Board_BizImpl implements Board_Biz {

	@Autowired
	private Board_Dao dao;
	
	@Override
	public List<Board_Dto> selectList() {
		return dao.selectList();
	}

	@Override
	public Board_Dto selectOne(int board_no) {
		return dao.selectOne(board_no);
	}
	

	@Override
	public int insert(Board_Dto dto) {
		return dao.insert(dto);
	}
	
	@Override
	public int insertFile(Files_Dto dto) {
		return dao.insertFile(dto);
	}

	@Override
	public int getVal() {
		return dao.getVal();
	}

	
	@Override
	public int update(Board_Dto dto) {
		return dao.update(dto);
	}

	@Override
	public int delete(int board_no) {
		return dao.delete(board_no);
	}

	@Override
	public Member_Dto getNameProp(int member_no) {
		return dao.getNameProp(member_no);
	}

	@Override
	public List<Files_Dto> getFileUrl(int board_no) {
		return dao.getFileUrl(board_no);
	}

	


	

}
