package com.bs.dabom.model.biz;

import com.bs.dabom.model.dto.Member_Dto;

public interface Member_Biz {
	public int register(Member_Dto dto);

	public Member_Dto login(Member_Dto dto);

	public Member_Dto snsLogin(Member_Dto dto);

	public int idChk(String id);

}
