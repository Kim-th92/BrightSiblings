package com.bs.dabom.model.dao;

import java.util.List;

import com.bs.dabom.model.dto.BoardRes_Dto;

	public interface BoardRes_Dao {
		
		String NAMESPACE ="boardres.";
		
		public List<BoardRes_Dto> selectList(int board_no);
}
