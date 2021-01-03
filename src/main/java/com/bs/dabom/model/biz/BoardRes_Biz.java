package com.bs.dabom.model.biz;

import java.util.List;

import com.bs.dabom.model.dto.BoardRes_Dto;

public interface BoardRes_Biz {

	public List<BoardRes_Dto> selectList(int board_no);
}
