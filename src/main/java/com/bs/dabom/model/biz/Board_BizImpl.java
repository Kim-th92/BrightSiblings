package com.bs.dabom.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bs.dabom.model.dao.Board_Dao;
import com.bs.dabom.model.dao.Board_DaoImpl;
import com.bs.dabom.model.dto.Board_Dto;

@Service
public class Board_BizImpl implements Board_Biz {

	@Autowired
	private Board_Dao dao;
	
	@Override
	public List<Board_Dto> selectList(Board_Dto dto) {
		return null;
	}

	@Override
	public Board_Dto selectOne(int board_no) {
		return null;
	}

	@Override
	public int insert(Board_Dto dto) {
		return dao.insert(dto);
	}

	@Override
	public int update(Board_Dto dto) {
		return 0;
	}

	@Override
	public int delete(int board_no) {
		return 0;
	}

}
