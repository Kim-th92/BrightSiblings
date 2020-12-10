package com.bs.dabom.model.biz;

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
	

}
