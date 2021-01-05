package com.bs.dabom.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bs.dabom.model.dao.Member_Dao;
import com.bs.dabom.model.dto.Member_Dto;

@Service
public class Member_BizImpl implements Member_Biz {

	@Autowired
	private Member_Dao dao;
	
	@Override
	public int register(Member_Dto dto) {
		
		return dao.register(dto);
	}

	@Override
	public Member_Dto login(Member_Dto dto) {
		
		return dao.login(dto);
	}

	
	@Override
	public int idChk(String id) {
		
		return dao.idChk(id);
	}

	@Override
	public Member_Dto snsLogin(Member_Dto dto) {
		return dao.snsLogin(dto);
	}

	@Override
	public int snsRegister(Member_Dto dto) {
		return dao.snsRegister(dto);
	}

	@Override
	public int deleteMember(int member_no) {

		return dao.deleteMember(member_no);
	}

	@Override
	public int uploadProfile(Member_Dto dto) {
		return dao.uploadProfile(dto);
	}

	@Override
	public Member_Dto friendDetail(int member_no) {
		return dao.friendDetail(member_no);
	}
	
	@Override
	public List<Member_Dto> admin_member_list(){
		return dao.admin_member_list();
	}

	@Override
	public Member_Dto admin_select_list(int member_no) {
		return dao.admin_select_list(member_no);
	}

	@Override
	public int updateMember(Member_Dto dto) {
		return dao.updateMember(dto);
	}

	@Override
	public int findpwcheck(Member_Dto dto) {
		return dao.findpwcheck(dto);
	}

	@Override
	public Member_Dto selectOneByEmail(String member_email) {
		return dao.selectOneByEmail(member_email);
	}

	@Override
	public int updatePassword(Member_Dto dto) {
		return dao.updatePassword(dto);
	}

	@Override
	public int uploadBgProfile(Member_Dto member_dto) {
		return dao.uploadBgProfile(member_dto);
	}

}
