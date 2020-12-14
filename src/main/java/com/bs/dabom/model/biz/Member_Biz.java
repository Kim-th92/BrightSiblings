package com.bs.dabom.model.biz;

import com.bs.dabom.model.dto.Member_Dto;

public interface Member_Biz {
	public int register(Member_Dto dto);

	public Member_Dto login(Member_Dto dto);


	public int idChk(String id);
	
	public Member_Dto snsLogin(Member_Dto dto);

	public int snsRegister(Member_Dto dto);

	public int deleteMember(int member_no);
	
	public int uploadProfile(Member_Dto dto);
}
