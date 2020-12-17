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
	public List<Donation_Dto> detailDonation(int member_no) {
		List<Donation_Dto> selectlist = new ArrayList<Donation_Dto>();
		try {
			selectlist = sqlSession.selectList(NAMESPACE + "selectOne", member_no);
		} catch (Exception e) {
			System.out.println("[ERROR] Donation SelectOne");
			e.printStackTrace();
		}
		System.out.println();
		return selectlist;
	}

	@Override
	public int insertDonation(Donation_Dto dto) {
		int res = 0;
		try {
			res = sqlSession.insert(NAMESPACE + "insert", dto);
		} catch (Exception e) {
			System.out.println("[ERROR] Doantion Insert");
			e.printStackTrace();
		}
		return res;
	}
	
	@Override
	public int donationSum() {
		int sum = 0;
		
		try {
			sum = sqlSession.selectOne(NAMESPACE + "donationSum");
		} catch (Exception e) {
			System.out.println("[ERROR] Donor Donation Sum");
			e.printStackTrace();
		}
		return sum;
	}
	
	@Override
	public int selectDonationSum(int member_no) {
		int sum = 0;
		
		try {
			sum = sqlSession.selectOne(NAMESPACE + "selectDonationSum", member_no);
		} catch (Exception e) {
			System.out.println("[ERROR] Select Donor Donation Sum");
			e.printStackTrace();
		}
		return sum;
	}

}
