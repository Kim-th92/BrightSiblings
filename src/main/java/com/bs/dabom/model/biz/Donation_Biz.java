package com.bs.dabom.model.biz;

import java.util.List;

import com.bs.dabom.model.dto.Donation_Dto;

public interface Donation_Biz {

	public List<Donation_Dto> selectList();
	public Donation_Dto detaildonation(int member_no);
	public int insertdonation(Donation_Dto dto);
	
}
