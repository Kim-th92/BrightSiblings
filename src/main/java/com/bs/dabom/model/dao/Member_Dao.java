package com.bs.dabom.model.dao;

import java.util.List;

import com.bs.dabom.model.dto.Member_Dto;

public interface Member_Dao {

	String NAMESPACE = "member.";
	
	public int register(Member_Dto dto);

	public Member_Dto login(Member_Dto dto);

	public Member_Dto snsLogin(Member_Dto dto);

	public int snsRegister(Member_Dto dto);
	
	public int idChk(String id);
	public int deleteMember(int member_no);

	public int uploadProfile(Member_Dto dto);

	public Member_Dto friendDetail(int member_no);
	
	//admin 관련 추가
	public List<Member_Dto> admin_member_list();
	public Member_Dto admin_select_list(int member_no);
}
