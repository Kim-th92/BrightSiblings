package com.bs.dabom.model.dao;

import com.bs.dabom.model.dto.Member_Dto;

public interface Member_Dao {

	String NAMESPACE = "member.";
	
	public int register(Member_Dto dto);

	public Member_Dto login(Member_Dto dto);

	public Member_Dto snsLogin(Member_Dto dto);

	public int snsRegister(Member_Dto dto);
	
	public int idChk(String id);

}
