package com.bs.dabom.model.dao;

import java.util.List;

<<<<<<< HEAD
import com.bs.dabom.model.dto.Calendar_Dto;
=======
import com.bs.dabom.model.dto.Board_Dto;
import com.bs.dabom.model.dto.Files_Dto;
>>>>>>> master
import com.bs.dabom.model.dto.MyPage_Dto;
import com.bs.dabom.model.dto.Reply_Dto;

public interface MyPage_Dao {
	
	String NAMESPACE = "exercise.";
	
	public int distanceInsert(MyPage_Dto dto);
	public List<MyPage_Dto> showList(int member_no);
	public List<MyPage_Dto> total(int member_no);
<<<<<<< HEAD
	public float showTargetKcal(Calendar_Dto dto);
	public List<Calendar_Dto> showTotalDFR(Calendar_Dto dto);
	public List<Calendar_Dto> showTotalDER(Calendar_Dto dto);
=======
	public List<Board_Dto> selectList(int member_no);
	public List<Files_Dto> getFileUrl(int board_no);
	public List<Reply_Dto> getReply(int board_no);
	
>>>>>>> master

}
