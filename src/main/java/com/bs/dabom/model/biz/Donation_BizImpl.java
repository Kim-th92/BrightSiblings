package com.bs.dabom.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bs.dabom.model.dao.Donation_Dao;
import com.bs.dabom.model.dto.Donation_Dto;

@Service
public class Donation_BizImpl implements Donation_Biz {

	@Autowired
	private Donation_Dao dao;
	
	@Override
	public List<Donation_Dto> selectList() {
		return dao.selectList();
	}

	@Override
	public Donation_Dto detaildonation(int member_no) {
		return dao.detaildonation(member_no);
	}

	@Override
	public int insertdonation(Donation_Dto dto) {
		return dao.insertdonation(dto);
	}

}
