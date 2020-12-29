package com.bs.dabom.model.dao;

import java.util.List;

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

	@Override
	public Member_Dto friendDetail(int member_no) {
		Member_Dto dto = null;
		dto = sqlSession.selectOne(NAMESPACE+"friendDetail",member_no);
		
		return dto;
	}
	
	@Override
	public List<Member_Dto> admin_member_list(){
		List<Member_Dto> list = null;
		
		try {
			list = sqlSession.selectList(NAMESPACE + "admin_member_list");
		} catch (Exception e) {
			System.out.println("[ERROR] admin_member_list");
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public Member_Dto admin_select_list(int member_no) {
		Member_Dto dto = null;
		try {
			dto = sqlSession.selectOne(NAMESPACE + "admin_select_list", member_no);
		} catch (Exception e) {
			System.out.println("[ERROR] admin_select_list");
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public int updateMember(Member_Dto dto) {
		int res = 0;
		
		try {
			res = sqlSession.update(NAMESPACE+"updatemember" ,dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int findpwcheck(Member_Dto dto) {
		int res = 0;
		res = sqlSession.selectOne(NAMESPACE+"findpwcheck",dto);
		
		return res;
	}

}
