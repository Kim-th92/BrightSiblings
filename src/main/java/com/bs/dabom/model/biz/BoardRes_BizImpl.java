package com.bs.dabom.model.biz;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bs.dabom.model.dao.BoardRes_Dao;
import com.bs.dabom.model.dto.BoardRes_Dto;
@Service
public class BoardRes_BizImpl implements BoardRes_Biz {

	@Autowired
	private BoardRes_Dao dao;
	
	@Override
	public List<BoardRes_Dto> selectList(int board_no) {
		return dao.selectList(board_no);
	}

}
