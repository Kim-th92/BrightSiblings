package com.bs.dabom.model.biz;

import java.util.List;

import com.bs.dabom.model.dto.Board_Dto;

public interface Board_Biz {

	public List<Board_Dto> selectList(Board_Dto dto);
	public Board_Dto selectOne(int board_no);
	public int insert(Board_Dto dto);
	public int update(Board_Dto dto);
	public int delete(int board_no);
}