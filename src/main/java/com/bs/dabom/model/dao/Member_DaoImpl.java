package com.bs.dabom.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bs.dabom.model.dto.Member_Dto;

@Repository
public class Member_DaoImpl implements Member_Dao {

	@Autowired 
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int register(Member_Dto dto) {
		int res = 0;
		
		try {
			res = sqlSession.insert(NAMESPACE+"register", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public Member_Dto login(Member_Dto dto) {
		Member_Dto login = null;
		try {
			login = sqlSession.selectOne(NAMESPACE+"login",dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return login;
	}

	

	@Override
	public int idChk(String id) {
		int idchk =1;
		String dto = sqlSession.selectOne(NAMESPACE+"idchk", id);
		if(dto == null) {
			idchk =0;
		}
		return idchk;
	}

	@Override
	public Member_Dto snsLogin(Member_Dto dto) {
		Member_Dto res
			= sqlSession.selectOne(NAMESPACE+"snslogin", dto.getMember_id());
		
		return res;
	}

	@Override
	public int snsRegister(Member_Dto dto) {
		int res = 0;
		try {
			res = sqlSession.insert(NAMESPACE+"snsloginregister", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int deleteMember(int member_no) {
		int res = 0;
		res = sqlSession.update(NAMESPACE+"deletemember", member_no);
		
		return res;
	}

	@Override
	public int uploadProfile(Member_Dto dto) {
		int res = 0;
		res = sqlSession.update(NAMESPACE+"uploadProfile",dto);
		
		return res;
	}

}
