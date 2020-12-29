package com.bs.dabom.model.biz;

import java.util.List;

import com.bs.dabom.model.dto.Board_Dto;
import com.bs.dabom.model.dto.Files_Dto;
import com.bs.dabom.model.dto.Member_Dto;
import com.bs.dabom.model.dto.Reply_Dto;

public interface Board_Biz {

	public List<Board_Dto> selectList();
	public Board_Dto selectOne(int board_no);
	public int insert(Board_Dto dto);
	public int insertFile(Files_Dto dto);
	public int getVal();
	public int update(Board_Dto dto);
	public int delete(int board_no);
	public Member_Dto getNameProp(int member_no);
	public List<Files_Dto> getFileUrl(int board_no);
	public List<Reply_Dto> getReply(int board_no);
	public int insertReply(Reply_Dto dto);
}
