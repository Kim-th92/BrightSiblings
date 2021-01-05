package com.bs.dabom.model.biz;

import java.util.List;

import com.bs.dabom.model.dto.Member_Dto;

public interface Member_Biz {
	public int register(Member_Dto dto);

	public Member_Dto login(Member_Dto dto);

	public Member_Dto friendDetail(int member_no);

	public int idChk(String id);
	
	public Member_Dto snsLogin(Member_Dto dto);

	public int snsRegister(Member_Dto dto);

	public int deleteMember(int member_no);
	
	public int uploadProfile(Member_Dto dto);
	
	public int updateMember(Member_Dto dto);
	
	//admin 관련 추가
	public List<Member_Dto> admin_member_list();
	public Member_Dto admin_select_list(int member_no);

	public int findpwcheck(Member_Dto dto);

	public Member_Dto selectOneByEmail(String member_email);

	public int updatePassword(Member_Dto dto);

	public int uploadBgProfile(Member_Dto member_dto);
}
