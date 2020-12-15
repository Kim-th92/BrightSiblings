package com.bs.dabom.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bs.dabom.model.dto.Donation_Dto;

@Repository
public class Donation_DaoImpl implements Donation_Dao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<Donation_Dto> selectList() {
		List<Donation_Dto> list = new ArrayList<Donation_Dto>();
		try {
			list = sqlSession.selectList(NAMESPACE + "selectList");
		} catch (Exception e) {
			System.out.println("[ERROR] Donation SelectList");
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public Donation_Dto detaildonation(int member_no) {
		Donation_Dto dto = new Donation_Dto(); 
		try {
			dto = sqlSession.selectOne(NAMESPACE + "selectOne", member_no);
		} catch (Exception e) {
			System.out.println("[ERROR] Donation SelectOne");
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public int insertdonation(Donation_Dto dto) {
		int res = 0;
		try {
			res = sqlSession.insert(NAMESPACE + "insert", dto);
		} catch (Exception e) {
			System.out.println("[ERROR] Doantion Payment");
			e.printStackTrace();
		}
		return res;
	}

}
